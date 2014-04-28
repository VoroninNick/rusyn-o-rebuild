class CreateCatalogItemImages < ActiveRecord::Migration
  def change
    create_table :catalog_item_images do |t|
      t.string :short_description

      t.timestamps
    end
  end
end
