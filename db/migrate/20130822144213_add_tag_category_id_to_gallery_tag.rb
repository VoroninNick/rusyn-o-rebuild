class AddTagCategoryIdToGalleryTag < ActiveRecord::Migration
  def change
  	add_column :gallery_tags, :tag_category_id, :integer
  end
end
