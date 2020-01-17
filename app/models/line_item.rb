class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product
  belongs_to :cart
  validates :quantity, numericality: {greater_than: 0}

  def total_price
      product.try(:price) * quantity
  end
end
