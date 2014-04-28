class DropOldCatalog < ActiveRecord::Migration
  def up
  	drop_table :catalog_category_sizes
  	drop_table :catalog_category_infos
  	drop_table :catalog_category_colors
  	drop_table :catalog_colors
  	drop_table :catalog_sizes
  	drop_table :catalog_categories

  end

  def down
  end
end
