class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :destroy]
  before_action :load_order, only: [:create]

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items
  # POST /order_items.json
  def create
    @order_item = @order.order_items.find_or_initialize_by(product_id: params[:product_id])
    @order_item.quantity += 1

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to @order, notice: 'Order item was successfully created.' }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { redirect_to :back, notice: 'Order item could not be created.' }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    @order_item = OrderItem.find_by(id: params[:id])
    if params[:order_item][:quantity].to_i == 0
      @order_item.destroy
      respond_to do |format|
        format.html { redirect_to @order_item.order, notice: 'Order item was successfully removed.'}
        format.json { head :no_content }
      end
    elsif @order_item.update(order_item_params)
      respond_to do |format|
        format.html { redirect_to @order_item.order, notice: 'Order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_item }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # load the order to which the new item will be added
    def load_order
      @order = Order.find_or_initialize_by(id: session[:order_id])
      if @order.new_record?
        @order.status = "unsubmitted"
        @order.save!
        session[:order_id] = @order.id
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:product_id, :order_id, :quantity)
    end
end
