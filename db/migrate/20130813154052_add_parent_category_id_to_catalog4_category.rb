class AddParentCategoryIdToCatalog4Category < ActiveRecord::Migration
  def change
  	add_column :catalog4_categories, :parent_category_id, :integer
  end
end
