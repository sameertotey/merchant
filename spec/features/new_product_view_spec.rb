require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

feature 'New product view' do

  before(:each) do
    visit(new_product_path)
  end

  context 'when there is no content' do
    it 'has the heading (Create a New Product)' do
      expect(page).to have_text("Create a New Product")
    end
  end
end