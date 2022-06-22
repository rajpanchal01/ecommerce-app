class ProductSerializer < ActiveModel::Serializer
  
  attributes :id ,:name,:description,:price,:sub_category_id,:brand_id,:seller_id,:poster_urls,:created_at,:updated_at,:average_rating,:discount
  belongs_to :brand
  has_many :reviews
  has_one :inventory 

 
  # def discount
  #   object.discount_item
  # end
end
