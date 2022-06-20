class AddRelationToDiscountItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :discount_items, :product, null: false, foreign_key: true
    add_reference :discount_items, :discount, null: false, foreign_key: true
  end
end
