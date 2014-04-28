class CreateProductPropertyValues < ActiveRecord::Migration
  def change
    create_table :product_property_values do |t|

      t.timestamps
    end
  end
end
