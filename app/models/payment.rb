class Payment < ApplicationRecord
    belongs_to :order_item
end
