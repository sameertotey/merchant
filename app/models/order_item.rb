class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  validates :quantity, numericality: {only_integer: true, greater_than: 0}

  validates :order_id, presence: true
  validates :product_id, presence: true

  def subtotal
    quantity * product.price
  end
end
