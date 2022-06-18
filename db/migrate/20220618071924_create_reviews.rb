class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :review_header
      t.text :review_content
      t.timestamps
    end
  end
end
