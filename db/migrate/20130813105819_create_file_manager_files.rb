class CreateFileManagerFiles < ActiveRecord::Migration
  def change
    create_table :file_manager_files do |t|
      t.string :name
      t.integer :size

      t.timestamps
    end
  end
end
