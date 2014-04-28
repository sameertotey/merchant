require 'spec_helper'

describe Product do

  let(:product) { Product.new(title: "apples", description: "fresh apples", price: 1.49) }

  it 'is valid' do
    expect(product).to be_valid
  end
end