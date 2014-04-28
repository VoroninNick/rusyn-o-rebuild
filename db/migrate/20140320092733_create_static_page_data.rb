class CreateStaticPageData < ActiveRecord::Migration
  def change
    create_table :static_page_data do |t|
      t.text :metatags
      t.text :meta_keywords
      t.text :meta_description
      t.string :head_title
      t.string :body_title
      t.string :url

      t.timestamps
    end
  end
end
