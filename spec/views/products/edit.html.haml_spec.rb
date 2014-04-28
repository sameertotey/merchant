require 'spec_helper'

describe "products/edit" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :title => "MyString",
      :price => "9.99",
      :description => "MyText",
      :image_url => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_path(@product), "post" do
      assert_select "input#product_title[name=?]", "product[title]"
      assert_select "input#product_price[name=?]", "product[price]"
      assert_select "textarea#product_description[name=?]", "product[description]"
      assert_select "input#product_image_url[name=?]", "product[image_url]"
    end
  end
end
