require 'spec_helper'

describe "order_items/edit" do
  before(:each) do
    @order_item = assign(:order_item, stub_model(OrderItem,
      :product_id => 1,
      :order_id => 1,
      :quantity => 1
    ))
  end

  it "renders the edit order_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", order_item_path(@order_item), "post" do
      assert_select "input#order_item_product_id[name=?]", "order_item[product_id]"
      assert_select "input#order_item_order_id[name=?]", "order_item[order_id]"
      assert_select "input#order_item_quantity[name=?]", "order_item[quantity]"
    end
  end
end
