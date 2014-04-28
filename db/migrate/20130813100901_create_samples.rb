class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.string :related_info
      t.string :name

      t.timestamps
    end
  end
end
