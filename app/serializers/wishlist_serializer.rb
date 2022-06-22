class WishlistSerializer < ActiveModel::Serializer
  attributes :id,:user_id,:created_at,:updated_at
  has_many :wishlist_items
end
