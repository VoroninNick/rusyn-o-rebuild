class Gallery::Tag < ActiveRecord::Base
  attr_accessible :name, :tag_category, :tag_category_id, :slug, :images, :id, :used

  has_and_belongs_to_many :albums

  has_and_belongs_to_many :images,
    :after_add => :added_image, 
    :after_remove => :removed_image

  belongs_to :tag_category

  before_validation :generate_slug

  def added_image
    if !self.used
      self.used = true
      self.save
    end
  end

  def removed_image(data)
    if self.images.size == 0 && self.albums.size == 0
      self.used = false
      self.save
    end
  end

   def generate_slug
    self.slug ||= self.name.parameterize
   end

   def self.find_by_slug(slug)
   	return Gallery::Tag.where('slug = "'+slug+'"')
   end

   def self.id
   	return id
   end

   def self.slug
     return slug	 
   end


  rails_admin do 
  	field :name
  	field :tag_category
    #field :used
  end
end
