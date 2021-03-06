class CreateCatalogDownloads < ActiveRecord::Migration
  def change
    create_table :catalog_downloads do |t|
      t.string :name
      t.string :data_file_name
      t.string :data_content_type
      t.integer :data_file_size
      t.datetime :data_updated_at

      t.timestamps
    end
  end
end
