class CombineLineItemsInCart < ActiveRecord::Migration[5.2]
  def up
    #select all carts, pass each cart to block
    Cart.all.each do |cart|
      #group the line items, then sum quantity for each group, assign the hash of sum to sums
      sums = cart.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        if quantity > 1
          #remove inviduals line items
          cart.line_items.where(product_id: product_id).delete_all

          #replace with new line item
          new_line_item = cart.line_items.build(product_id: product_id)
          new_line_item.quantity = quantity
          new_line_item.save!
        end
      end
    end
  end

  def down
    LineItem.where("quantity > 1").each do |line_item|
      line_item.quantity.times do
        LineItem.create(
          product_id: line_item.product_id,
          quantity: 1,
          cart_id: line_item.cart_id,
        )
      end
      line_item.destroy!
    end
  end
end
