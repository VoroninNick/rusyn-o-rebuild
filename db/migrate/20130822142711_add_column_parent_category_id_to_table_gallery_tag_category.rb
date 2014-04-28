class AddColumnParentCategoryIdToTableGalleryTagCategory < ActiveRecord::Migration
  def change
  	add_column :gallery_tag_categories, :parent_category_id, :integer
  end
end
