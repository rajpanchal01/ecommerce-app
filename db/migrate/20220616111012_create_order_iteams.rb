class CreateOrderIteams < ActiveRecord::Migration[7.0]
  def change
    create_table :order_iteams do |t|
      t.string :quantity

      t.timestamps
    end
  end
end
