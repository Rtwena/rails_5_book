class CombineItemsInCart < ActiveRecord::Migration[5.1]
  def up
    # replacing multiple items in a cart with a single item
    Cart.all.each do |cart|
      # count the number of products in the cart
      sums = cart.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        next unless quantity > 1
        cart.line_items.where(product_id: product_id).delete_all

        item = cart.line_items.build(product_id: product_id)
        item.quantity = quantity
        item.save!
      end
    end
  end

  def down
    LineItem.where('quantity>1').each do |line_item|
      line_item.quantity.times do
        line_item.cart.line_items.create(product_id: line_item.product_id, quantity: 1)
      end
      line_item.destroy
    end
  end
end