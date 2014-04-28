class CreateGalleryTagCategories < ActiveRecord::Migration
  def change
    create_table :gallery_tag_categories do |t|
    	t.string :name
      t.timestamps
    end
  end
end
