class CreatePagesCatalogPages < ActiveRecord::Migration
  def change
    create_table :pages_catalog_pages do |t|
      t.integer :static_page_data_id

      t.timestamps
    end
  end
end
