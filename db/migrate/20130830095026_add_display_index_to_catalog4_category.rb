class AddDisplayIndexToCatalog4Category < ActiveRecord::Migration
  def change
  	add_column :catalog4_categories, :display_index, :integer, :default => 0
  end
end
