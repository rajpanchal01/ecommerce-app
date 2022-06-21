class SellerSerializer < ActiveModel::Serializer
    attributes :id,:user_id,:seller_location
   # belongs_to :user
    has_many :products
  end