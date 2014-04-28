class AddCategoryIdToObjectMetadata < ActiveRecord::Migration
  def change
    add_column :object_metadata, :category_id, :integer
  end
end
