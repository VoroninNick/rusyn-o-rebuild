class CreateCatalogCategorySizes < ActiveRecord::Migration
  def change
    create_table :catalog_category_sizes do |t|
      t.integer :category_id
      t.integer :size_id

      t.timestamps
    end
  end
end
