class CreateCatalogSizes < ActiveRecord::Migration
  def change
    create_table :catalog_sizes do |t|
      t.integer :width
      t.integer :height
      t.string :size

      t.timestamps
    end
  end
end
