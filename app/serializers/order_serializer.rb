class OrderSerializer < ActiveModel::Serializer
  attributes :id,:total_amount,:user_id,:user_address,:created_at,:updated_at,:status,:orders
  has_many :order_items
  
end
