class CartItemSerializer < ActiveModel::Serializer
  attributes :id,:item_quantity,:cart_id,:product_id,:created_at,:updated_at
  has_many :product
end
