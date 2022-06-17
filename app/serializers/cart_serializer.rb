class CartSerializer < ActiveModel::Serializer
  attributes :id,:user_id,:created_at,:updated_at
end
