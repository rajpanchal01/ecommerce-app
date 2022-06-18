class Product < ApplicationRecord
    belongs_to :brand
    belongs_to :sub_category
    has_one :inventory
    has_many_attached :posters
    has_many :reviews

    def poster_urls
     #   poster_urls=[]
      #  posters.each do |p|
       #     poster_urls<<Rails.application.routes.url_helpers.url_for(p) 
        #end
        #Rails.application.routes.url_helpers.url_for(poster) if poster.attached?
        posters.map{|p| Rails.application.routes.url_helpers.url_for(p) }
    end
end
