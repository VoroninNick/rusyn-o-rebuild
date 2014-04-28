class AddImageIdToGalleryTags < ActiveRecord::Migration
  def change
  	add_column :gallery_tags, :image_id, :integer
  end
end
