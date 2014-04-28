class AddTagSlugToTags < ActiveRecord::Migration
  def change
  	add_column :gallery_tags, :slug, :string
  end
end
