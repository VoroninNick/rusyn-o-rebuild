class CreateCatalogTemplates < ActiveRecord::Migration
  def change
    create_table :catalog_templates do |t|
      t.string :name

      t.timestamps
    end
  end
end
