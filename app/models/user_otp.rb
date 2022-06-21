class UserOtp < ApplicationRecord
    validates :otp ,uniqueness: true
end
