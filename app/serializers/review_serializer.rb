class ReviewSerializer < ActiveModel::Serializer
  attributes :id,:product_id,:user_id,:review_header,:review_content,:rating,:image_urls
 # belongs_to :user
  belongs_to :product
end
