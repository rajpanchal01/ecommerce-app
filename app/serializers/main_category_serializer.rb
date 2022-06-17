class MainCategorySerializer < ActiveModel::Serializer
  attributes :id,:name,:img_url,:about,:created_at,:updated_at
end
