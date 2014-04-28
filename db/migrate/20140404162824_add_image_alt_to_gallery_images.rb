class AddImageAltToGalleryImages < ActiveRecord::Migration
  def change
    add_column :gallery_images, :image_alt, :string
  end
end
