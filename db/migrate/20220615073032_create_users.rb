class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :first_name
      t.string :lastname
      t.integer :mobile_num

      t.timestamps
    end
  end
end
