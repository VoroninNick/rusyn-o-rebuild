class CreateContactPages < ActiveRecord::Migration
  def change
    create_table :contact_pages do |t|
      t.text :address
      t.text :working_hours
      t.text :contacts
      t.string :map_coordinates

      t.timestamps
    end
  end
end
