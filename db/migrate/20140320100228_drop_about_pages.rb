class DropAboutPages < ActiveRecord::Migration
  def change
    rename_table :about_pages, :pages_about_pages
    rename_table :contact_pages, :pages_contact_pages


    change_table :static_page_data do |t|
      t.integer :about_page_id
      t.integer :contact_page_id
      t.integer :catalog_page_id
      t.integer :catalog_category_page_id
      t.integer :catalog_services_page_id
      t.integer :catalog_colors_page_id
      t.integer :gallery_images_page_id
      t.integer :gallery_albums_page_id
      t.integer :articles_page_id
      t.integer :article_item_page_id

      t.string :breadcrumbs

    end
    change_table :pages_about_pages do |t|
      t.integer :static_page_data_id
    end

    change_table :pages_contact_pages do |t|
      t.integer :static_page_data_id
    end

    change_table :pages_catalog_pages do |t|

    end

    create_table :pages_catalog_category_pages do |t|
      t.integer :static_page_data_id
    end

    create_table :pages_catalog_services_pages do |t|
      t.integer :static_page_data_id
      t.text :content
    end

    create_table :pages_catalog_colors_pages do |t|
      t.integer :static_page_data_id
      t.text :content
    end

    create_table :pages_gallery_images_pages do |t|
      t.integer :static_page_data_id
    end

    create_table :pages_gallery_albums_pages do |t|
      t.integer :static_page_data_id
    end

    create_table :pages_articles_pages do |t|
      t.integer :static_page_data_id
    end

    create_table :pages_article_item_pages do |t|
      t.integer :static_page_data_id
    end


  end
end
