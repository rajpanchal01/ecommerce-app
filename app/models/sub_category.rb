class SubCategory < ApplicationRecord
    belongs_to :main_category
    has_many :products
end
