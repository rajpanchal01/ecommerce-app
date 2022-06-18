class Review < ApplicationRecord
    belongs_to :product
    belongs_to :user
    validates :rating, :inclusion => 1..5
    has_many_attached :review_images
    def image_urls
        review_images.map{|p| Rails.application.routes.url_helpers.url_for(p) }
    end
end
