class CreateSupportTableCategoryItemColorsCategoryItems < ActiveRecord::Migration
  def change
  	create_table :category_item_colors_category_items do |t|
      t.belongs_to :category_item
      t.belongs_to :category_item_color
    end
  end
end
