class AddCategoryIdToCatalogItem < ActiveRecord::Migration
  def change
  	add_column :catalog_category_items, :category_id, :integer
  end
end
