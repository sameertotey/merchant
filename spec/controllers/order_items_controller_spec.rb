require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe OrderItemsController do

  # This should return the minimal set of attributes required to create a valid
  # OrderItem. As you add validations to OrderItem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { product_id: "1", order_id: "1", quantity: 1 } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OrderItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET show" do
    it "assigns the requested order_item as @order_item" do
      order_item = OrderItem.create! valid_attributes
      get :show, {:id => order_item.to_param}, valid_session
      assigns(:order_item).should eq(order_item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new OrderItem" do
        expect {
          post :create, {product_id: "1"}, valid_session
        }.to change(OrderItem, :count).by(1)
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested order_item" do
      request.env["HTTP_REFERER"] = orders_path
      order_item = OrderItem.create! valid_attributes
      expect {
        delete :destroy, {:id => order_item.to_param}, valid_session
      }.to change(OrderItem, :count).by(-1)
    end

    it "redirects to the order_items list" do
      request.env["HTTP_REFERER"] = orders_path
      order_item = OrderItem.create! valid_attributes
      delete :destroy, {:id => order_item.to_param}, valid_session
      response.should redirect_to(orders_path)
    end
  end

end
