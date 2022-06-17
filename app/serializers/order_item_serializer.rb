class OrderItemSerializer < ActiveModel::Serializer
  attributes :id,:quantity,:order_id,:product_id,:created_at,:updated_at
end
