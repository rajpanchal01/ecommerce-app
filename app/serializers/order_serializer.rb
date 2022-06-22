class OrderSerializer < ActiveModel::Serializer
  attributes :id,:total_amount,:user_id,:user_address,:created_at,:updated_at,:status
end
