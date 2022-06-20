class CreateDiscountItems < ActiveRecord::Migration[7.0]
  def change
    create_table :discount_items do |t|

      t.timestamps
    end
  end
end
