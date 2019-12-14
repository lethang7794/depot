atom_feed do |feed|
  feed.title "Who bought #{@product.title}"
  feed.updated @lasted_order.try(:updated_at)

  @product.orders.each do |order|
    feed.entry(order) do |entry|
      entry.title "Order #{order.id}"
      entry.summary "Summary for this order"
      entry.author do |author|
        author.name order.name
        author.email order.email
      end
    end
  end
end
