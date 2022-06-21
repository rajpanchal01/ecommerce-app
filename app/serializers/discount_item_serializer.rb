class DiscountItemSerializer < ActiveModel::Serializer
  attributes :id,:discount_id,:product_id
  belongs_to :product

end
