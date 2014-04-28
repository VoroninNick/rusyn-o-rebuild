class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :article_content
      t.string :article_title
      t.string :article_url
      t.string :article_image_file_name
      t.string :article_image_content_type
      t.integer :article_image_file_size
      t.datetime :article_image_updated_at
      t.text :article_short_description

      t.timestamps
    end
  end
end
