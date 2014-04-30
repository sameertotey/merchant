class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  belongs_to :user

  def total
    total = 0 
    self.order_items.each{|item| total += item.subtotal}
    total
  end
end
