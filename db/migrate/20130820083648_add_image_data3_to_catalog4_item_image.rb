class AddImageData3ToCatalog4ItemImage < ActiveRecord::Migration
  def change
  	change_column :catalog4_category_item_images, :image_ratio, :float
  end
end
