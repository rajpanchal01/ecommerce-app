class DiscountItem < ApplicationRecord
    belongs_to :discount
    belongs_to :product
end
