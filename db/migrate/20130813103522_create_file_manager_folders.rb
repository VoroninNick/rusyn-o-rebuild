class CreateFileManagerFolders < ActiveRecord::Migration
  def change
    create_table :file_manager_folders do |t|
      t.string :name

      t.timestamps
    end
  end
end
