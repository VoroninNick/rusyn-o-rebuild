class CreateGalleryTags < ActiveRecord::Migration
  def change
    create_table :gallery_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
