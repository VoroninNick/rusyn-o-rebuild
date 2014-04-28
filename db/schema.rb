# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140426152248) do

  create_table "albums_tags", force: true do |t|
    t.integer "tag_id"
    t.integer "album_id"
  end

  create_table "articles", force: true do |t|
    t.text     "article_content"
    t.string   "article_title"
    t.string   "article_url"
    t.string   "article_image_file_name"
    t.string   "article_image_content_type"
    t.integer  "article_image_file_size"
    t.datetime "article_image_updated_at"
    t.text     "article_short_description"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.datetime "release_date"
    t.integer  "object_metadata_id"
    t.string   "article_image_alt"
  end

  create_table "banners", force: true do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "title"
    t.text     "description"
    t.string   "banner_image_file_name"
    t.string   "banner_image_content_type"
    t.integer  "banner_image_file_size"
    t.datetime "banner_image_updated_at"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "link_to"
  end

  create_table "catalog4_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "parent_category_id"
    t.text     "description"
    t.string   "category_url"
    t.integer  "display_index",           default: 0
    t.string   "property_weight_label"
    t.string   "property_quantity_label"
    t.string   "property_size_label"
  end

  create_table "catalog4_category_images", force: true do |t|
    t.string   "image_content_type"
    t.string   "image_file_name"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "short_description"
    t.integer  "category_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_alt"
  end

  create_table "catalog4_category_item_colors", force: true do |t|
    t.string   "image_content_type"
    t.string   "image_file_name"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "short_description"
    t.string   "rgb"
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "catalog4_category_item_colors_category_items", force: true do |t|
    t.integer  "category_item_color_id"
    t.integer  "category_item_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "catalog4_category_item_colors_items", force: true do |t|
    t.integer "category_item_id"
    t.integer "category_item_color_id"
  end

  create_table "catalog4_category_item_images", force: true do |t|
    t.string   "image_content_type"
    t.string   "image_file_name"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "short_description"
    t.integer  "category_item_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "image_width"
    t.integer  "image_height"
    t.float    "image_ratio"
    t.string   "image_alt"
  end

  create_table "catalog4_category_items", force: true do |t|
    t.text     "size",        limit: 255
    t.string   "quantity"
    t.string   "weight"
    t.string   "name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "category_id"
  end

  create_table "catalog_colors_pages", force: true do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catalog_downloads", force: true do |t|
    t.string   "name"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "catalog_item_colors", force: true do |t|
    t.string   "rgb"
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "category_item_colors_category_items", force: true do |t|
    t.integer "category_item_id"
    t.integer "category_item_color_id"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "editor_tests", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "footer_contact_infos", force: true do |t|
    t.text     "address"
    t.text     "working_hours"
    t.text     "contacts"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "gallery_albums", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "images_count",       default: 0, null: false
    t.integer  "object_metadata_id"
  end

  create_table "gallery_albums_tags", force: true do |t|
    t.integer "album_id"
    t.integer "tag_id"
  end

  create_table "gallery_images", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "description"
    t.string   "url"
    t.integer  "album_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "gallery_album_id"
    t.integer  "tag_id"
    t.string   "image_alt"
    t.string   "custom_image_file_name"
  end

  create_table "gallery_images_tags", force: true do |t|
    t.integer "image_id"
    t.integer "tag_id"
  end

  create_table "gallery_tag_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "parent_category_id"
  end

  create_table "gallery_tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "tag_category_id"
    t.string   "slug"
    t.integer  "image_id"
    t.boolean  "used"
  end

  create_table "home_page_gallery_images", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "short_description"
    t.string   "image_alt"
    t.integer  "home_page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images_tags", force: true do |t|
    t.integer "tag_id"
    t.integer "image_id"
  end

  create_table "object_metadata", force: true do |t|
    t.string   "url"
    t.string   "final_url"
    t.string   "head_title"
    t.string   "final_head_title"
    t.string   "body_title"
    t.string   "final_body_title"
    t.text     "metatags"
    t.text     "final_metatags"
    t.text     "meta_keywords"
    t.text     "final_meta_keywords"
    t.text     "meta_description"
    t.text     "final_meta_description"
    t.integer  "album_id"
    t.integer  "catalog4_category_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.text     "next_page_link"
  end

  create_table "orders", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "page_infos", force: true do |t|
    t.string   "url"
    t.string   "breadcrumbs"
    t.string   "page_title"
    t.string   "page_browser_title"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "pages_about_pages", force: true do |t|
    t.string   "content"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "static_page_data_id"
  end

  create_table "pages_article_item_pages", force: true do |t|
    t.integer "static_page_data_id"
  end

  create_table "pages_articles_pages", force: true do |t|
    t.integer "static_page_data_id"
  end

  create_table "pages_catalog_category_pages", force: true do |t|
    t.integer "static_page_data_id"
  end

  create_table "pages_catalog_colors_pages", force: true do |t|
    t.integer "static_page_data_id"
    t.text    "content"
  end

  create_table "pages_catalog_pages", force: true do |t|
    t.integer  "static_page_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages_catalog_services_pages", force: true do |t|
    t.integer "static_page_data_id"
    t.text    "content"
  end

  create_table "pages_contact_pages", force: true do |t|
    t.text     "address"
    t.text     "working_hours"
    t.text     "contacts"
    t.string   "map_coordinates"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "static_page_data_id"
  end

  create_table "pages_gallery_albums_pages", force: true do |t|
    t.integer "static_page_data_id"
  end

  create_table "pages_gallery_images_pages", force: true do |t|
    t.integer "static_page_data_id"
  end

  create_table "pages_home_pages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "about_content"
  end

  create_table "static_page_data", force: true do |t|
    t.text     "metatags"
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.string   "head_title"
    t.string   "body_title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "about_page_id"
    t.integer  "contact_page_id"
    t.integer  "catalog_page_id"
    t.integer  "catalog_category_page_id"
    t.integer  "catalog_services_page_id"
    t.integer  "catalog_colors_page_id"
    t.integer  "gallery_images_page_id"
    t.integer  "gallery_albums_page_id"
    t.integer  "articles_page_id"
    t.integer  "article_item_page_id"
    t.string   "breadcrumbs"
    t.integer  "home_page_id"
    t.text     "next_page_link"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
