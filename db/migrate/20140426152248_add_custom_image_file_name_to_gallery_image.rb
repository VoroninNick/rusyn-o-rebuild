class AddCustomImageFileNameToGalleryImage < ActiveRecord::Migration
  def change
  	add_column :gallery_images, :custom_image_file_name, :string
  end
end
