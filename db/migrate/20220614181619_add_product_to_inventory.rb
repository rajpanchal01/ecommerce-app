class AddProductToInventory < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventories, :product, foreign_key: true
  end
end
