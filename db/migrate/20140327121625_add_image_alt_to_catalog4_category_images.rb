class AddImageAltToCatalog4CategoryImages < ActiveRecord::Migration
  def change
    add_column :catalog4_category_images, :image_alt, :string
  end
end
