class ProductSerializer < ActiveModel::Serializer
  attributes :id ,:description,:price,:created_at,:updated_at,:sub_category_id,:brand_id,:poster_urls
  # def url
  #   Rails.application.routes.url_helpers.url_for(product_url(object))
  # end
end
