class CreateObjectMetadata < ActiveRecord::Migration
  def change
    create_table :object_metadata do |t|
      t.string :url
      t.string :final_url
      t.string :head_title
      t.string :final_head_title
      t.string :body_title
      t.string :final_body_title
      t.text :metatags
      t.text :final_metatags
      t.text :meta_keywords
      t.text :final_meta_keywords
      t.text :meta_description
      t.text :final_meta_description

      t.integer :album_id
      t.integer :catalog4_category_id
      t.integer :article_id

      t.timestamps
    end

    change_table :gallery_albums do |t|
      t.integer :object_metadata_id
    end

    change_table :catalog4_categories do |t|
      t.integer :object_metadata_id
    end

    change_table :articles do |t|
      t.integer :object_metadata_id
    end
  end
end
