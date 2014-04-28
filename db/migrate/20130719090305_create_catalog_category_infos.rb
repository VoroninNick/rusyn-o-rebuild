class CreateCatalogCategoryInfos < ActiveRecord::Migration
  def change
    create_table :catalog_category_infos do |t|
      t.integer :parent
      t.integer :weight
      t.float :count
      t.string :name

      t.timestamps
    end
  end
end
