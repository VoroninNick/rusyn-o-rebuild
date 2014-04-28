class CreateFooterContactInfos < ActiveRecord::Migration
  def change
    create_table :footer_contact_infos do |t|
      t.text :address
      t.text :working_hours
      t.text :contacts

      t.timestamps
    end
  end
end
