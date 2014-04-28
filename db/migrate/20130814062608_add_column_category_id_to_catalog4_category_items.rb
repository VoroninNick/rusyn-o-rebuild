class AddColumnCategoryIdToCatalog4CategoryItems < ActiveRecord::Migration
  def change
  	add_column :catalog4_category_items, :category_id, :integer
  end
end
