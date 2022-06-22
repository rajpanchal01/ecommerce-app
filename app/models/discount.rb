class Discount < ApplicationRecord
    has_many :discount_items
    has_one_attached :slider
    validates :offer_type, :inclusion => ["direct","cashback"]
    # def slider_url
    #     Rails.application.routes.url_helpers.url_for(slider) if object.attached? :slider
    # end
end
