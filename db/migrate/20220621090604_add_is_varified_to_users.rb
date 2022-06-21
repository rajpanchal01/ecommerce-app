class AddIsVarifiedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_varified, :integer, :null => false, :default => 0
  end
end
