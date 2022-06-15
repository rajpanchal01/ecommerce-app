class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :total_amount
      t.integer :payment_id

      t.timestamps
    end
  end
end
