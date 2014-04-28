class AddPaperclipToCatalogColors < ActiveRecord::Migration
  def change
  	add_column :catalog_item_colors,:image_file_name, :string
    add_column :catalog_item_colors, :image_content_type, :string
    add_column :catalog_item_colors,:image_file_size, :integer
    add_column :catalog_item_colors,:image_updated_at, :datetime
  end
end
