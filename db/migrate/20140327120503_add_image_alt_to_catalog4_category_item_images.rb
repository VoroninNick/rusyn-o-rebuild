class AddImageAltToCatalog4CategoryItemImages < ActiveRecord::Migration
  def change
    add_column :catalog4_category_item_images, :image_alt, :string
  end
end
