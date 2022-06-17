class InventorySerializer < ActiveModel::Serializer
  attributes :id,:quantity,:product_id,:created_at,:updated_at
end
