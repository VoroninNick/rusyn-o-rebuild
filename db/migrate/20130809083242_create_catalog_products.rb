class CreateCatalogProducts < ActiveRecord::Migration
  def change
    create_table :catalog_products do |t|
      t.string :name

      t.timestamps
    end
  end
end
