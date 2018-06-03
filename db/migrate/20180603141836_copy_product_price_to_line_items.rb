class CopyProductPriceToLineItems < ActiveRecord::Migration[5.1]
  def up
    LineItem.where(product_price: nil).each do |line_item|
      line_item.product_price = line_item.product.price
      line_item.save!
    end
  end

  def down
    LineItem.all.each do |line_item|
      line_item.product_price = nil
      line_item.save!
    end
  end
end
