class AddFieldUsedToGalleryTags < ActiveRecord::Migration
  def change
  	add_column :gallery_tags, :used, :boolean
  end
end
