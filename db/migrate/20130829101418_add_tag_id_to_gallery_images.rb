class AddTagIdToGalleryImages < ActiveRecord::Migration
  def change
    add_column :gallery_images, :tag_id, :integer
  end
end


# select gallery_images.* 
# from gallery_images gi, gallery_tags gt
# where gt.image_id = gi.id and gt.slug in()
