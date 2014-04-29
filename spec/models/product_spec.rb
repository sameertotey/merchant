require 'spec_helper'
require 'shoulda/matchers'

describe Product do

  let(:product) { Product.new(title: "apples", description: "fresh apples", price: "1.49") }

  it 'is valid' do
    expect(product).to be_valid
  end

  it { should validate_numericality_of(:price) }
end