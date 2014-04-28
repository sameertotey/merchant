require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

feature 'the products view' do

  let(:product) { FactoryGirl::build(:product) }
  before(:each) do
    visit(products_path)
  end

  it 'has heading of (All Products)' do
    expect(page).to have_text("All Products")
  end

  it 'has a link to (Create a New Product)' do
    expect(page).to have_link("Create a New Product")
  end

  it 'has a link with the id (new_product)' do
    expect(page).to have_selector(:css, "p a#new_product")
  end

  it 'displays saved products' do
    product.save
    visit(products_path)
    expect(page).to have_text("#{product.description}")
  end
end