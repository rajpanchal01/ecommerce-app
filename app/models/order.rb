class Order < ApplicationRecord
    has_and_belongs_to_many :products
    ha_many :order_iteam
end
