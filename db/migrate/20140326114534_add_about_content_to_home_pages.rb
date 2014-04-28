class AddAboutContentToHomePages < ActiveRecord::Migration
  def change
    add_column(:pages_home_pages, :about_content, :text)
  end
end
