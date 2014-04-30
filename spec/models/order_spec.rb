require 'spec_helper'
require 'shoulda/matchers'

describe Order do

  let(:order) { FactoryGirl::create(:order)}

  it 'is valid' do
    expect(order).to be_valid
  end

  it 'has an array of order items' do
    expect(order.order_items).to eq([])
  end

  it 'responds with its created order items' do
    order.order_items.build(quantity: 2)
    expect(order.order_items.map(&:quantity)).to eq([2])
  end

  it 'calculates the total' do
    product1 = FactoryGirl::build(:product)
    product1.price = "1.99"
    product1.save
    product2 = FactoryGirl::build(:product)
    product2.price = "2.99"
    product2.save
    order.order_items.create(product_id: product1.id, quantity: 5)
    order.order_items.create(product_id: product2.id, quantity: 2)
    expect(order.total.to_s).to eq("15.93")
  end

end