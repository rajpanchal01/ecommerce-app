class CreateUserAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :user_addresses do |t|
      t.integer :user_id
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :country
      t.string :postal_code
      t.string :mobile_no

      t.timestamps
    end
  end
end
