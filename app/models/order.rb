class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  enum pay_type: {
    "Credit Cart" => 1,
    "Debit Cart" => 2,
    "Cash" => 3,
  }

  validates :name, :email, :address, presence: true
  validates :pay_type, inclusion: pay_types.keys


  def add_line_items_from_cart(cart)
    cart.line_items.each do |line_item|
      line_item.cart_id = nil
      line_items << line_item
    end
  end
end
