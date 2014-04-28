class CreateCatalog4CategoryItemImages < ActiveRecord::Migration
  def change
    create_table :catalog4_category_item_images do |t|
      t.string :image_content_type
      t.string :image_file_name
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.string :short_description
      t.integer :category_item_id

      t.timestamps
    end
  end
end
