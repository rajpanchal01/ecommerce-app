class AddCategoryToSubCategory < ActiveRecord::Migration[7.0]
  def change
    add_reference :sub_categories, :main_category, foreign_key: true
  end
end
