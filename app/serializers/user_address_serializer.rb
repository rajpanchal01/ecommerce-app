class UserAddressSerializer < ActiveModel::Serializer
  attributes :id,:user_id,:mobile_no,:address_line1,:address_line2,:city,:country,:postal_code,:created_at,:updated_at
end
