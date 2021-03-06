require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ProductsHelper. For example:
#
# describe ProductsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe ProductsHelper do
  describe "#print_price" do
    it "properly formats the product prices" do
      expect(print_price(2.0)).to eq("$2.00")
    end
  end

  describe "#print_stock" do
    it "properly creates stock content" do
      expect(print_stock(0)).to eq('<span class="out_stock">Out of Stock</span>')
      expect(print_stock(5)).to eq('<span class="in_stock">In Stock (5)</span>')
    end
  end
end
