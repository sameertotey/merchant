require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

feature 'the products view' do

  let(:product) { FactoryGirl::build(:product) }

  it 'displays saved products' do
    product.save
    visit(products_path)
    expect(page).to have_text("#{product.description}")
  end
end