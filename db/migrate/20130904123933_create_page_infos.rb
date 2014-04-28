class CreatePageInfos < ActiveRecord::Migration
  def change
    create_table :page_infos do |t|
      t.string :url
      t.string :breadcrumbs
      t.string :page_title
      t.string :page_browser_title

      t.timestamps
    end
  end
end
