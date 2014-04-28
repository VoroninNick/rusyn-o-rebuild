class RemoveTableGalleryAlbumsTags < ActiveRecord::Migration
  def change
  	drop_table :albums_tags
  end
end
