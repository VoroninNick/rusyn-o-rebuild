class DropCatalogCategories < ActiveRecord::Migration
  def up
  	drop_table :catalog_categories
  end

  def down
  end
end
