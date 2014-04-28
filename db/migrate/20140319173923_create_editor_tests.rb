class CreateEditorTests < ActiveRecord::Migration
  def change
    create_table :editor_tests do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
