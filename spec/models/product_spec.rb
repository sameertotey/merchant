require 'spec_helper'
require 'shoulda/matchers'

describe Product do

  let(:product) { FactoryGirl::create(:product) }

  it 'is valid' do
    expect(product).to be_valid
  end

  it 'has an array of order items' do
    expect(product.order_items).to eq([])
  end

  it { should validate_numericality_of(:price) }
  it { should validate_numericality_of(:stock).only_integer.is_greater_than_or_equal_to(0) }
end