class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def total_price
    line_items.to_a.sum { |item| item.total_price}
  end

  def add_product(product)
    current_line_item = line_items.find_by(product_id: product.id)
    if current_line_item
      current_line_item.quantity += 1
    else
      current_line_item = line_items.build(product_id: product.id, price: product.price)
    end
    current_line_item
  end
end
