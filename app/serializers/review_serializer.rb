class ReviewSerializer < ActiveModel::Serializer
  attributes :id,:product_id,:user_id,:review_header,:review_content
  belongs_to :user
end
