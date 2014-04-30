require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

feature 'Order view' do

  let(:order)        { FactoryGirl::create(:order) }
  let(:product1)     { FactoryGirl::create(:product)}
  let (:product2)    { FactoryGirl::build(:product) }
  let (:order_item1) { FactoryGirl::build(:order_item) }
  let (:order_item2) { FactoryGirl::build(:order_item) }
  before(:each) do
    visit(order_path(order))
  end

  context 'when there is no content' do
    it 'has the heading (Your Order)' do
      expect(page).to have_text("Your Order")
    end

    it 'has a link to continue shopping' do
      expect(page).to have_link("Continue Shoping", href: products_path)
    end

    it 'does not have a link to remove a order item' do
      expect(page).to_not have_link("Remove")
    end
  end

  context 'when there is content' do
    it 'has a link to continue shopping' do
      expect(page).to have_link("Continue Shoping", href: products_path)
    end

    it 'has the link to empty cart' do
      expect(page).to have_link("Empty Cart", href: order_path(order))
    end

    it 'empty the cart and deletes order' do
      visit(order_path(order))
      click_link('Empty Cart')
      expect(current_path).to eq (products_path)
      expect(Order.count).to eq(0)
    end

    it 'has a link to remove a order item' do
      order_item1.order = order
      order_item1.save
      visit(order_path(order))
      expect(page).to have_link("Remove")
    end

    it 'removes a order item' do
      order_item1.order = order
      order_item1.save
      visit(order_path(order))
      click_link("Remove")
      expect(order.order_items.count).to eq(0)
    end
  end
end