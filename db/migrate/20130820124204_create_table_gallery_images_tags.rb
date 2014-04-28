class CreateTableGalleryImagesTags < ActiveRecord::Migration
  def change
  	create_table :images_tags do |t|
      t.belongs_to :tag
      t.belongs_to :image
    end
  end
end
