# -*- encoding : utf-8 -*-

class ImagesTag < ActiveRecord::Base
  # attr_accessible :title, :body
  #attr_accessible :name, :parent_category_id

  #has_many :child_categories, class_name: "TagCategory",
  #                        foreign_key: "parent_category_id"

  #belongs_to :parent_category, class_name: "TagCategory"


  #has_many :tags

  #attr_accessible :tags, :tag_ids

  after_commit :after_commit_handler

  def after_commit_handler
    query = 'SELECT * from gallery_tags gi, gallery_images gi, images_tags it where gt.id = it.tag_id and gi.id = it.image_id and '

    #result = ActiveRecord::Base.connection.execute(query)
    #if result.count > 0
    #end

    tag = Gallery::Tag.find(self.tag_id)
    if !tag.used
      tag.used = true
      tag.save
    end 
  end


  
  rails_admin do
    visible false
  	#field :name
  #	field :tags
  end
end
