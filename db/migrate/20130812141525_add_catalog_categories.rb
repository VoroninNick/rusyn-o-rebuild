class AddCatalogCategories < ActiveRecord::Migration
  def up
  	
    create_table :catalog_categories do |t|
      t.string :name

      t.timestamps

  	
    end
  end

  def down
  end
end
