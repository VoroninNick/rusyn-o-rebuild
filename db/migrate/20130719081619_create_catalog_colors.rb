class CreateCatalogColors < ActiveRecord::Migration
  def change
    create_table :catalog_colors do |t|
      t.string :name
      t.string :color_rgb
      t.binary :color_image

      t.timestamps
    end
  end
end
