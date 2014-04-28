class CreateCatalogColorsPages < ActiveRecord::Migration
  def change
    create_table :catalog_colors_pages do |t|
      t.text :content

      t.timestamps
    end
  end
end
