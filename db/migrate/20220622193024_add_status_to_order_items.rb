class AddStatusToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :status, :string, :null => false, :default => "created"
  end
end
