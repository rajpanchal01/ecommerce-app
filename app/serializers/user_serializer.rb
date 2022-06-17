class UserSerializer < ActiveModel::Serializer
  attributes :id,:name,:mobile_number,:email,:password_digest,:created_at,:updated_at
end
