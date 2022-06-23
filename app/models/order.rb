class Order < ApplicationRecord
    belongs_to :user
    has_many :order_items
    has_one :payment
    belongs_to :user_address
    def orders
        self.order_items.map{|a| Product.find(a.product_id).name  }
    end
end
