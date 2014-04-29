class Catalog::ItemColor < ActiveRecord::Base
  has_and_belongs_to_many :catalog_category_items
  attr_accessible :catalog_category_items#, :catalog_category_items_ids

  attr_accessible :image, :image_file_name, :image_file_size, :image_updated_at
  attr_accessible :name
  attr_accessible :rgb
  attr_accessible :short_description

  has_attached_file :image
end
