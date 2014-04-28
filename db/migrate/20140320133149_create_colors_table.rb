class CreateColorsTable < ActiveRecord::Migration
  def change
    create_table :catalog4_category_item_colors_items do |t|
      t.integer :category_item_id
      t.integer :category_item_color_id
    end
  end
end
