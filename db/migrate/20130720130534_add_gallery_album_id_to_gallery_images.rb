class AddGalleryAlbumIdToGalleryImages < ActiveRecord::Migration
  def change
    add_column :gallery_images, :gallery_album_id, :integer
  end
end
