class CreateCatalogFirstTemplateItems < ActiveRecord::Migration
  def change
    create_table :catalog_first_template_items do |t|
      t.string :size
      t.float :quantity
      t.float :weight

      t.timestamps
    end
  end
end
