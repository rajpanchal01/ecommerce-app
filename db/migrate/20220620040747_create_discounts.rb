class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.string :offer_type
      t.integer :offer_dicount
      t.timestamps
    end
  end
end
