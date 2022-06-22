class DiscountSerializer < ActiveModel::Serializer
  attributes :id,:name,:start_date,:end_date,:offer_type,:offer_dicount#,:image_url
  has_many :discount_items
end
