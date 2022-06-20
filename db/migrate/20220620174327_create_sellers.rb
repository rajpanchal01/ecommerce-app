class CreateSellers < ActiveRecord::Migration[7.0]
  def change
    create_table :sellers do |t|
      t.bigint :gst_id, :null => false
      t.bigint :pan_id,:null => false
      t.string :seller_location

      t.timestamps
    end
  end
end
