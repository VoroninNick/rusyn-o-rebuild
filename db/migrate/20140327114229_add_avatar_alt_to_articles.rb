class AddAvatarAltToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :article_image_alt, :string
  end
end
