class AddReleaseDateToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :release_date, :datetime
  end
end
