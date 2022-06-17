class PaymentSerializer < ActiveModel::Serializer
  attributes :id,:amount,:status,:order_id,user_id,:created_at,:updated_at
end
