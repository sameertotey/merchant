require 'spec_helper'
require 'shoulda/matchers'

describe OrderItem do
 let(:order_item) { FactoryGirl::create(:order_item) }

  it 'is valid' do
    expect(order_item).to be_valid
  end

  it 'is invalid without a order_id' do
    order_item1 = FactoryGirl::build(:order_item)
    order_item1.order_id = nil
    expect(order_item1).to_not be_valid
  end

  it 'is invalid without a product_id' do
    order_item1 = FactoryGirl::build(:order_item)
    order_item1.product_id = nil
    expect(order_item1).to_not be_valid
  end

  it 'is a child of product' do
    expect(order_item.product).to be_instance_of(Product)
  end

  it 'is a child of order' do
    expect(order_item.order).to be_instance_of(Order)
  end

end
