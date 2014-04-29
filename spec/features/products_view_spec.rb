require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

feature 'the products view' do

  before(:each) do
    visit(products_path)
  end

  context 'display when no products present' do
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

  context 'display when products present' do
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

    context 'links and navigation' do
      it 'displays the show product link' do
        expect(page).to have_link("Create a New Product", href: new_product_path)
      end

      it 'displays the create product link' do
        expect(page).to have_link("Show")
      end

      it 'navigates to create new product link' do
        click_link('Create a New Product')
        expect(page).to have_text("Create a New Product")
      end
    end

    context 'proper formatting' do
      it 'properly displays the product price' do
        product.price = "2.25"
        product.save
        visit(products_path)
        expect(page).to have_text("$2.25")
      end
      it 'properly displays the product out of stock' do
        product.stock = "0"
        product.save
        visit(products_path)
        expect(page).to have_text("Out of Stock")
      end
      it 'properly displays the product stock' do
        product.stock = "500"
        product.save
        visit(products_path)
        expect(page).to have_text("In Stock (500)")
      end
    end
    context 'Ordering' do
      it 'displays link to buy products' do
        expect(page).to have_button("Add to Cart")
      end
      it 'add a product to cart' do
        page.click_button('Add to Cart')
        expect(page).to have_text("Order item was successfully created.")
      end
    end
  end
  context 'performimg CRUD actions on product' do
    it 'adds a new product' do
      page.click_link('Create a New Product')
      page.fill_in('Title', with: 'new product')
      page.fill_in('Price (like 2.99)', with: '3.50')
      page.fill_in('Description', with: 'new product description')
      page.fill_in('Stock', with: '72')
      page.fill_in('Image url', with: 'product/default.jpg')
      page.click_button('Save')
      # expect(current_path).to eq(product_path(person))
      expect(page).to have_content('Product was successfully created.')
    end
  end
end