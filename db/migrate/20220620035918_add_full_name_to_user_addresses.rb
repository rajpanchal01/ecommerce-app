class AddFullNameToUserAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :user_addresses, :full_name ,:string
  end
end
