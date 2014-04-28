class CreateAboutPages < ActiveRecord::Migration
  def change
    create_table :about_pages do |t|
      t.string :content

      t.timestamps
    end
  end
end
