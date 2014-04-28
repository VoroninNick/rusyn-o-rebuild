class AddImagesCountToGalleryAlbums < ActiveRecord::Migration
  def change
  	add_column :gallery_albums, :images_count, :integer, :null => false, :default => 0
  end
end
