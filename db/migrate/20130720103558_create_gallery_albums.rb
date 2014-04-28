class CreateGalleryAlbums < ActiveRecord::Migration
  def change
    create_table :gallery_albums do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
