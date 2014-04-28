# -*- encoding : utf-8 -*-

class Gallery::TagCategory < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :parent_category_id

  has_many :child_categories, class_name: "TagCategory",
                          foreign_key: "parent_category_id"

  belongs_to :parent_category, class_name: "TagCategory"


  has_many :tags

  attr_accessible :tags, :tag_ids

  
  rails_admin do 
  	field :name
  	field :tags
  end
end
