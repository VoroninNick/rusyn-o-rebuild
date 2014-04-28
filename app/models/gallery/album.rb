# coding: utf-8

class Gallery::Album < ActiveRecord::Base
  attr_accessible  :name, :url, :images_count, :image_file_name

  has_one :object_metadata
  attr_accessible :object_metadata

  accepts_nested_attributes_for :object_metadata
  attr_accessible :object_metadata_attributes

  has_and_belongs_to_many :tags,
    :after_add => :added_tag, 
    :after_remove => :removed_tag

  attr_accessible :tags, :tag_ids

  has_many :images
  attr_accessible :images, :image_ids

  accepts_nested_attributes_for :images, :allow_destroy => true
  attr_accessible :images_attributes#, :allow_destroy => true

  validates :name, presence: true
  validates :url, presence: true, uniqueness: true
  before_validation :generate_url






  def added_tag(tag)
    if !tag.used
      tag.used = true
      tag.save
    end
  end

  def removed_tag(tag)
    if tag.images.size == 0 && tag.albums.size == 0 
      tag.used = false
      tag.save
    end
  end


    def to_param
      #:images_count
      url
    end

    def generate_url
      if !object_metadata
        #object_metadata = ObjectMetadata.create!(article_id: (Article.last.id + 1) )
        build_object_metadata
      end

      object_metadata.url ||= name.parameterize
      object_metadata.head_title ||= name
      object_metadata.body_title ||= name

      #self.article_url = object_metadata.url
      self.url = name.parameterize
    end

    def self.find_albums_by_tags(mytags)
      tags_string = ''
      mytags.each_with_index do |tagname,index|
        if index > 0
          tags_string += ','
        end
        tags_string += '"'+tagname+'"'
      end

      #tags_string = '"stare-misto"'
      query = 'SELECT ga.* from gallery_albums ga, gallery_tags gt, gallery_albums_tags at where ga.id = at.album_id and gt.id = at.tag_id and gt.slug in ('+tags_string+')'
      result = ActiveRecord::Base.connection.execute(query);
      arr = []
      result.each do |row|
        arr[arr.count] = row['id']
      end
      albums = Gallery::Album.find(arr)
      return albums
    end

    def find_allowed_tags_for_album_images
      #query = 'SELECT '
      #album_images = self.images
      #tag_ids = []
      #album_images.each do |image|
      #    image.tags.each do |tag|
      #      if tag_ids.index(tag.id).nil?
      #        tag_ids[tag_ids.count] = tag.id 
      #      end
      #    end  
      #end

      #tags = Gallery::Tag.find(tag_ids)

      query = 'SELECT gt.*,gtc.name as category_name from gallery_tags gt, gallery_images_tags it, gallery_images gi, gallery_tag_categories gtc, gallery_albums ga where gt.used = "t" and gt.id = it.tag_id and it.image_id = gi.id and gt.tag_category_id = gtc.id and ga.id = gi.album_id and ga.id = '+self.id.to_s
      tags = ActiveRecord::Base.connection.execute(query)

      return tags
    end

    def self.find_allowed_tags_for_albums
      #query = 'SELECT '
      #imgs = Gallery::Album.all
      #tag_ids = []
      #imgs.each do |image|
      #    image.tags.each do |tag|
      #      if tag_ids.index(tag.id).nil?
      #        tag_ids[tag_ids.count] = tag.id 
      #      end
      #    end  
      #end

      #tags = Gallery::Tag.find(tag_ids)

      query = 'SELECT distinct gt.*,gtc.name as category_name from gallery_tags gt, gallery_albums_tags at, gallery_albums ga, gallery_tag_categories gtc where gt.id = at.tag_id and at.album_id = ga.id and gt.tag_category_id = gtc.id'
      tags = ActiveRecord::Base.connection.execute(query)

      return tags
    end



  rails_admin do
    label 'Альбом'
    label_plural 'Альбомы'

    list do
      field :name
      #field :gallery_album
      #field :image
      field :tags
    end

    edit do
      field :name
      #field :url
      #field :description do
        #ckeditor true
      #end
      field :images
     # field :gallery_images, :paperclip
      #field :gallery_album

      field :tags

      field :object_metadata
    end
  end
end
