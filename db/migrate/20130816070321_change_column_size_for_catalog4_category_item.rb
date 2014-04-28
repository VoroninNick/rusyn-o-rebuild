class ChangeColumnSizeForCatalog4CategoryItem < ActiveRecord::Migration
	def change
		change_column :catalog4_category_items, :size, :text
	end
end
