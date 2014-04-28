class CreateGalleryImages < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.string :name
      t.string :title
      t.string :description
      t.string :url

      t.integer :album_id

      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      
    


      t.timestamps
    end
  end
end
