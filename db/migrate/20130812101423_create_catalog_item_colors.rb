class CreateCatalogItemColors < ActiveRecord::Migration
  def change
    create_table :catalog_item_colors do |t|
      t.string :rgb
      t.string :name

      t.timestamps
    end
  end
end
