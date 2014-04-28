class CreateCatalogTemplateProperties < ActiveRecord::Migration
  def change
    create_table :catalog_template_properties do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
