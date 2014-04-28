class DropFolders < ActiveRecord::Migration
  def up
  	drop_table :folders
  end

  def down
  end
end
