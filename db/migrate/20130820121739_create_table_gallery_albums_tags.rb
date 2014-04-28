class CreateTableGalleryAlbumsTags < ActiveRecord::Migration
  def change
  	create_table :albums_tags do |t|
      t.belongs_to :tag
      t.belongs_to :album
    end
  end
end
