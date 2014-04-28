class CreateHomePageGalleryImages < ActiveRecord::Migration
  def change
    create_table :home_page_gallery_images do |t|
      t.has_attached_file :color_image
      t.has_attached_file :black_and_white_image
      t.string :short_description
      t.string :image_alt

      t.integer :home_page_id

      t.timestamps
    end
  end
end
