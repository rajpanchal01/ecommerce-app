class MainCategory < ApplicationRecord
    has_many :sub_categories
    has_one_attached :image
    def img_url
        Rails.application.routes.url_helpers.url_for(image)
    end
end
