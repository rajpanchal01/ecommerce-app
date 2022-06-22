class AddRelationToWishlistItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :wishlist_items, :wishlist, null: false, foreign_key: true
    add_reference :wishlist_items, :product, null: false, foreign_key: true

  end
end
