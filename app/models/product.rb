class Product < ApplicationRecord
    attr_accessor :average_rating
    # attr_accessor :discount
    belongs_to :brand
    belongs_to :sub_category
    has_one :inventory
    has_many_attached :posters
    has_many :reviews
    belongs_to :seller
    has_one :discount_item
    include PgSearch::Model
    pg_search_scope :search_by_query, against: [:name, :description]
    
    # def discount
    #     self.discount_item    
    # end
    
    def average_rating
        reviews.average(:rating)
    end
    def poster_urls
     #   poster_urls=[]
      #  posters.each do |p|
       #     poster_urls<<Rails.application.routes.url_helpers.url_for(p) 
        #end
        #Rails.application.routes.url_helpers.url_for(poster) if poster.attached?
        posters.map{|p| Rails.application.routes.url_helpers.url_for(p) }
    end
    def discount_per
        discount_item.discount.offer_dicount if discount_item
    end
end
