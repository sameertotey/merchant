class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # load the order to which the new item will be added
  def load_order
    @order = Order.find_or_initialize_by(id: session[:order_id])
    if @order.new_record?
      @order.status = "unsubmitted"
      @order.user_id = session[:user_id]
      @order.save!
      session[:order_id] = @order.id
    end
  end  
end
