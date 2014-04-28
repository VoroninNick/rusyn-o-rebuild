class AddAttachmentColorImageToCatalogColors < ActiveRecord::Migration
  def self.up
    change_table :catalog_colors do |t|
      t.attachment :color_image
    end
  end

  def self.down
    drop_attached_file :catalog_colors, :color_image
  end
end
