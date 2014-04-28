class AddCategoryIdToSubcategory < ActiveRecord::Migration
  def change
  	add_column :catalog_subcategories, :category_id, :integer
  end
end
