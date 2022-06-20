class SubCategorySerializer < ActiveModel::Serializer
  attributes :id,:name,:main_category_id,:created_at,:updated_at
  belongs_to :main_category
end
