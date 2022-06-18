class User < ApplicationRecord
    has_secure_password
    has_many :orders
    has_one :cart
    has_many :user_addresses
    has_many :payments
    has_many :reviews
end
