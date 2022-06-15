class ProductSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :description, :price, :sub_category_id, :brand_id, :created_at, :updated_at,:poster_urls
end
