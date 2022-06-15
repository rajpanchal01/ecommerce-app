class CombineCartItems < ActiveRecord::Migration[7.0]
  def change
  end

  def up
    Cart.all.each do |cart|
      sums = cart.order_items.group(:product_id).sum(:quantity)
      sums.each do |product_id, quantity|
        if quantity > 1
          cart.order_items.where(product_id: product_id).delete_all

          item = cart.order_items.build(productt_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    #split items with a quantity of 1 or more into multiple items
    OrderItem.where("quantity>1").each do |order_item|
      order_item.quantity.times do
        OrderItem.create(
          cart_id: order_item.cart_id,
          productt_id: order_item.productt_id,
          quantity: 1
        )
      end
      # remove original line item
      order_item.destroy
    end
  end
end
