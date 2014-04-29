class CreateCatalogItemColors < ActiveRecord::Migration
  def up
    #drop_table :catalog_item_colors

    create_table :catalog4_item_colors do |t|
      t.has_attached_file :image
      t.string :name
      t.string :rgb
      t.string :short_description

      t.timestamps
    end
  end
end
