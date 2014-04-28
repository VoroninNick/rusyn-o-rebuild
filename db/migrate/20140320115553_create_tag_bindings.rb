class CreateTagBindings < ActiveRecord::Migration
  def change
    create_table :gallery_images_tags do |t|
      t.integer :image_id
      t.integer :tag_id
    end

    create_table :gallery_albums_tags do |t|
      t.integer :album_id
      t.integer :tag_id
    end
  end
end
