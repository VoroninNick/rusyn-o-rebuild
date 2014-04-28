class CreateTrafficHistories < ActiveRecord::Migration
  def change
    create_table :traffic_histories do |t|
      t.string :url
      t.string :user_agent
      t.string :ip

      t.timestamps
    end
  end
end
