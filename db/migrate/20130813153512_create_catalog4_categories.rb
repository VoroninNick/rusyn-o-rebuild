class CreateCatalog4Categories < ActiveRecord::Migration
  def change
    create_table :catalog4_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
