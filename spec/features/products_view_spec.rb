require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

feature 'the products view' do

  before(:each) do
    visit(products_path)
  end

  context 'when there are no products present' do
    it 'has heading of (All Products)' do
      expect(page).to have_text("All Products")
    end

    it 'has a link to (Create a New Product)' do
      expect(page).to have_link("Create a New Product")
    end

    it 'has a link with the id (new_product)' do
      expect(page).to have_selector(:css, "p a#new_product")
    end
  end

  context 'when there are products present' do
    let(:product) { FactoryGirl::build(:product) }
    before(:each) do
      FactoryGirl::create(:product)
      visit(products_path)
    end

    it 'has a image of each product' do
      expect(page).to have_selector(:css, "table td>img")
    end

    it 'displays saved products title' do
      expect(page).to have_selector(:css, "td>span.product_title")
    end

    it 'displays saved products' do
      expect(page).to have_text("#{product.description}")
    end

    it 'displays the show product link' do
      expect(page).to have_link("Show")
    end

    it 'navigates to create new product link' do
      click_link('Create a New Product')
      expect(page).to have_text("Create a New Product")
    end

    it 'properly displays the product price' do
      product.price = "2.25"
      product.save
      visit(products_path)
      expect(page).to have_text("$2.25")
    end
  end
end