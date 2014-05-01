class Address < ActiveRecord::Base
  belongs_to :user
  has_many :orders
  validates :line1, :city, :state, :zip, presence: true
  validates_format_of :state, with: /\A[A-Z]{2}\z/, message: "should be a two letter state abbreveation" 
  validates_format_of :zip, with: /\A\d{5}(-\d{4})?\z/, message: "should be in the form 12345 or 12345-1234"

  def to_s
    %W(#{line1} #{city} #{state} #{zip}).compact.join(", ")
  end
end
