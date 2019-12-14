class AddPriceToLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :price, :decimal

    Product.all.each do |product|
      product.line_items.each do |line_item|
        line_item.price ||= product.price
      end
    end
  end
end
