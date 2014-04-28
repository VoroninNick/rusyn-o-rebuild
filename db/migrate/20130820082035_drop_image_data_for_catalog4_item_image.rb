class DropImageDataForCatalog4ItemImage < ActiveRecord::Migration
	def change
		remove_column :catalog4_category_item_images, :image_width
  		remove_column :catalog4_category_item_images, :image_height
  		remove_column :catalog4_category_item_images, :image_ratio
	end
end
