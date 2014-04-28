class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.integer :position
      t.string :name
      t.string :title
      t.text :description
      t.string :banner_image_file_name
      t.string :banner_image_content_type
      t.integer :banner_image_file_size
      t.datetime :banner_image_updated_at

      t.timestamps
    end
  end
end
