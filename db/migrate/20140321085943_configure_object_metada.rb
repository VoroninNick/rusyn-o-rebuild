class ConfigureObjectMetada < ActiveRecord::Migration
  def change
    remove_column :catalog4_categories, :object_metadata_id

    change_table :catalog4_categories do |t|

    end
  end
end
