class CreateCatalogCategoryItems < ActiveRecord::Migration
  def change
    create_table :catalog_category_items do |t|
      t.string :name
      t.string :size
      t.float :weight

      t.timestamps
    end
  end
end
