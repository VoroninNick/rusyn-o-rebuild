class AddImageData2ToCatalog4ItemImage < ActiveRecord::Migration
  def change
  	add_column :catalog4_category_item_images, :image_width, :integer
  	add_column :catalog4_category_item_images, :image_height, :integer
  	add_column :catalog4_category_item_images, :image_ratio, :integer
  end
end
