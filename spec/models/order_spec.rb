require 'spec_helper'
require 'shoulda/matchers'

describe Order do

  let(:order) { Order.new(user_id: 1, status: "inprogress") }

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
end