class CreatePagesHomePages < ActiveRecord::Migration
  def change
    create_table :pages_home_pages do |t|

      t.timestamps
    end

    change_table :static_page_data do |t|
      t.integer :home_page_id
    end
  end
end
