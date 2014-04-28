class CreateCatalogCategoryColors < ActiveRecord::Migration
  def change
    create_table :catalog_category_colors do |t|
      t.integer :category_id
      t.integer :color_id

      t.timestamps
    end
  end
end
