class AddNameToSubcategory < ActiveRecord::Migration
  def change
  	add_column :catalog_subcategories, :name, :string
  end
end
