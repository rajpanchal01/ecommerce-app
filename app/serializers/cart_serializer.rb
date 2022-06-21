class CartSerializer < ActiveModel::Serializer
  attributes :id,:user_id,:created_at,:updated_at,:products_details
  has_many :cart_items
  # has_many :cart_items do
  #   belongs: product
end
