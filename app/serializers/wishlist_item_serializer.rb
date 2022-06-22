class WishlistItemSerializer < ActiveModel::Serializer
  attributes :id,:wishlist_id,:product_id,:created_at,:updated_at
  belongs_to :wishlist
end
