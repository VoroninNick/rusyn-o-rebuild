class AddPropertyLabelToCategory < ActiveRecord::Migration
  def change
  	add_column :catalog4_categories, :property_weight_label, :string
  	add_column :catalog4_categories, :property_quantity_label, :string
  	add_column :catalog4_categories, :property_size_label, :string
  end
end
