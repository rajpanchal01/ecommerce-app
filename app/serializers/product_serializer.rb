class ProductSerializer < ActiveModel::Serializer
  attributes :id ,:name,:description,:price,:sub_category_id,:brand_id,:poster_urls,:created_at,:updated_at
  # def url
  #   Rails.application.routes.url_helpers.url_for(product_url(object))
  # end
end
