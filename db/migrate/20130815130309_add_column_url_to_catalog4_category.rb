class AddColumnUrlToCatalog4Category < ActiveRecord::Migration
  def change
  	add_column :catalog4_categories, :category_url, :string
  end
end
