require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

feature 'the merchant app' do

  it 'displays the correct title' do
    visit(products_path)
    expect(page).to have_title('FoodWorks - Products:')
  end
  
end