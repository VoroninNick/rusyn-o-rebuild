class CreateCatalog4CategoryItems < ActiveRecord::Migration
  def change
    create_table :catalog4_category_items do |t|
      t.string :size
      t.string :quantity
      t.string :weight
      t.string :name

      t.timestamps
    end
  end
end
