class CreateCatalog3Categories < ActiveRecord::Migration
  def change
    create_table :catalog3_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
