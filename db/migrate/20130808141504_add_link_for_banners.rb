class AddLinkForBanners < ActiveRecord::Migration
  def up
  	add_column :banners, :link_to, :string
  end

  def down
  	remove_coumn :banners, :link_to
  end
end
