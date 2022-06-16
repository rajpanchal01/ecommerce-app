class AddFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :mobile_number, :bigint
    add_index :users, :mobile_number, unique: true
    add_index :users, :email, unique: true
  end
end
