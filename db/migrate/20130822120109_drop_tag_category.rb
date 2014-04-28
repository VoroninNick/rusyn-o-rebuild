class DropTagCategory < ActiveRecord::Migration
  def change
  	drop_table :gallery_tag_categories
  end
end
