class AddColumnDescriptionToCatalog4Category < ActiveRecord::Migration
  def change
  	add_column :catalog4_categories, :description, :text
  end
end
