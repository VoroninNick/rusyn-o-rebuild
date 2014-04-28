# -*- encoding : utf-8 -*-
class Gallery::Image < ActiveRecord::Base
  attr_accessible :description, :name, :image, :image_alt, :image_file_name, :title, :url, :album_id, :delete_image, :album

  attr_accessible :delete_image

  has_and_belongs_to_many :tags,
    :after_add => :added_tag, 
    :after_remove => :removed_tag

  attr_accessible :tags, :tag_ids

  belongs_to :album, :inverse_of => :images

  has_attached_file :image, :styles => { :thumb => '150x150>', :items => '235x190#', big: '1000x1000>' },
                  :url  => '/assets/gallery/images/:id/:style/:basename.:extension',
                  :path => ':rails_root/public/assets/gallery/images/:id/:style/:basename.:extension'
                  #:hash_secret => '3858f62230ac3c915f300c664312c63f'

  before_validation :analize_image

  validates :name, :image_file_name, :image, presence: true
  #after_save :handle_save

  before_update :check_rename_image

  before_validation :check_file_name

  attr_accessible :custom_image_file_name

  def check_file_name
    fname = custom_image_file_name
    fname ||= image_file_name

    if !fname.nil? && fname.length > 0 && fname.parameterize.length > 0 && image_file_name != fname
      image_file_name = fname
    end

    self.custom_image_file_name ||= image_file_name
  end

  def check_rename_image
    if image_file_name_changed?
      new_name = image_file_name || ''
      if new_name.nil?
        new_name = ''
      end
      old_name = image_file_name_was 
      if old_name.nil?
        old_name = ''
      end

      if old_name != '' && new_name != '' && old_name != new_name

        image.styles.keys.each do | key |
          file_path = image.path(key)
          folder = File.dirname(file_path)

          new_path = folder + '/' + new_name
          old_path = folder + '/' + old_name
          FileUtils.mv old_path, new_path
        end
      end
    end
  end



  def added_tag(tag)
    if !tag.used
      tag.used = true
      tag.save
    end
  end

  def removed_tag(tag)
    if tag.images.size == 0
      tag.used = false
      tag.save
    end
  end

  #def handle_save
  #  if name_changed?field :custom_image_file_name do
      #  label 'Image file name with extension'
      #  help ''
      #end
  #    tags_was.each do |tag|
#
 #     end
  #  end
  #end

  def analize_image
    if !self.album_id.nil?
      album = Gallery::Album.find(self.album_id)
      if album
        album.images_count = album.images.count
        album.save
      end
    end

    #tags = Gallery::Image.find_allowed_tags_for_images

  end



  def self.find_allowed_tags_for_images
      #query = 'SELECT '
      #imgs = Gallery::Image.all
      #tag_ids = []
      #imgs.each do |image|
      #    image.tags.each do |tag|
      #      if tag_ids.index(tag.id).nil?
      #        tag_ids[tag_ids.count] = tag.id 
      #      end
      #    end  
      #end

      #tags = Gallery::Tag.find(tag_ids)

      query = 'SELECT distinct gt.*,gtc.name as category_name from gallery_tags gt, gallery_images_tags it, gallery_images gi, gallery_tag_categories gtc where gt.used = "t" and gt.id = it.tag_id and it.image_id = gi.id and gt.tag_category_id = gtc.id'
      tags = ActiveRecord::Base.connection.execute(query)

      distinct_tags = []
      tags.each_with_index do |tag, index|
        exists = false
        distinct_tags.each do |tag_compare|
          if !exists
            if tag_compare['id'] == tag['id']
              exists = true
            end
          end

        end

        if !exists
          distinct_tags.push( tag )
        end

      end
      #tags = Gallery::Tag.where(:used => true)
      return distinct_tags
    end
  
  def get_image_ratio
    geo = Paperclip::Geometry.from_file(Paperclip.io_adapters.for(self.image))

    #self.image_height = geo.height
    #self.image_width = geo.width
    #self.image_ratio = geo.width / geo.height

    return geo.width / geo.height
  end

  def width
    geo = Paperclip::Geometry.from_file(Paperclip.io_adapters.for(self.image))

    #self.image_height = geo.height
    #self.image_width = geo.width
    #self.image_ratio = geo.width / geo.height

    return geo.width
  end

  def height
    geo = Paperclip::Geometry.from_file(Paperclip.io_adapters.for(self.image))

    #self.image_height = geo.height
    #self.image_width = geo.width
    #self.image_ratio = geo.width / geo.height

    return geo.height
  end

  #def self.find_by_filter(tags)
  #  images = []
  #  obj_images = []

    #if tagnames
  #    all_tags = Gallery::Tag.all
  #    tags.each do |tagname|
  #      all_tags.each do |tag|
  #        if 
  #      end
  #    end
  #  end
      #where_string = ''
      #tags.each_with_index do |tag, index|
        #if index > 0
        #  where_string += ' and '
        #end
        #where_string += ''+tag.slug

        #Gallery::Image.find(:all, 
        #  :include => [:gallery_tags], 
        #  :select => "gallery_images.*", 
        #  :conditions => { "gallery_tags.image_id = gallery_images.id " })

      #end
    #  tags = []
    #  tagnames.each do |tagname|
    #    tag = Gallery::Tag.find_by_slug(tagname[0])
    #    tags[tags.count] = tag
    #  end
      
    #  Gallery::Image.all.each do |image|
    #    image.tags.each do |tag|

    #    end
    #  end

   #   images = Gallery::Image.find(:all, 
   #       :include => 'gallery_tags gt,images_tags it', 
   #       :select => "gallery_images.*", 
   #       :conditions =>  "gt.id = it.image_id " )      
    #end
     # images = Gallery::Image.where('id > 2 and id < 4')
     #images = Gallery::Image.

     #images = Gallery::Image.includes([{:player_matches => :player_one}, :players]).first()
       #tags = Gallery::Tag.find_by_slug()
       #tags = []

      

    #  tags_string = ''
      #tags.each_with_index do |x,index|
     #   if index > 0
       #   tags_string += ','
       # end
       # x.each_with_index do |tag|
        
        #  tags_string += '"'+tag.name.parameterize+'"'
       # end
      #end
      #if tags_string.length > 0
      #  images = ActiveRecord::Base.connection
      #  .execute("select gi.* from gallery_images gi, gallery_tags gt, images_tags it where gt.id = it.tag_id and gi.id = it.image_id and gt.slug in("+tags_string+")")

        
       # images.each do |row|
        #  obj_images[obj_images.count] = Gallery::Image.find(row['id'])
        #end
      #end
    #return obj_images
  #end

  def self.find_images_by_tags(mytags)
      tags_string = ''
      mytags.each_with_index do |tagname,index|
        if index > 0
          tags_string += ','
        end
        tags_string += '"'+tagname+'"'
      end

      #tags_string = '"stare-misto"'
      query = 'SELECT gi.id from gallery_images gi, gallery_tags gt, gallery_images_tags it where gi.id = it.image_id and gt.id = it.tag_id and gt.slug in ('+tags_string+')'
      result = ActiveRecord::Base.connection.execute(query);
      arr = []
      result.each do |row|
        arr[arr.count] = row['id']
      end
      albums = Gallery::Image.find(arr)
      return albums
    end

    def self.find_images_by_tags_in_album(mytags,album_id)
      tags_string = ''
      mytags.each_with_index do |tagname,index|
        if index > 0
          tags_string += ','
        end
        tags_string += '"'+tagname+'"'
      end
      #tags_string = '"stare-misto"'
      query = 'SELECT gi.id from gallery_images gi, gallery_tags gt, gallery_images_tags it, gallery_albums ga where gi.id = it.image_id and gt.id = it.tag_id and gt.slug in ('+tags_string+') and ga.id = gi.album_id and ga.id ='+album_id.to_s
      result = ActiveRecord::Base.connection.execute(query);
      arr = []
      result.each do |row|
        arr[arr.count] = row['id']
      end
      albums = Gallery::Image.find(arr)
      return albums
    end


  rails_admin do
    label 'Картинка'
    label_plural 'Картинки'

    list do
      field :name
      field :album
      field :image
      field :tags
    end

    edit do
      field :name
      field :description do
        #ckeditor true
      end
      field :image, :paperclip do
        label 'Image'
      end

      field :image_file_name do
        hide
      end

      field :custom_image_file_name do
        label 'Имя файла включая расширение'
        help 'Например: my_image.png'
      end

      field :image_alt
      field :album

      field :tags
    end

    create do

      field :name
      field :description do
        #ckeditor true
      end
      field :image, :paperclip do
        label 'Image'
      end

      field :image_file_name do
        hide
      end

      field :custom_image_file_name do
        label 'Имя файла включая расширение'
        help 'Например: my_image.png'
      end

      field :image_alt
      field :album

      field :tags
    end

    nested do
      field :name
      field :description do
        #ckeditor true
      end
      field :image, :paperclip do
        label 'Image'
      end

      field :custom_image_file_name do
        label 'Имя файла включая расширение'
        help 'Например: my_image.png'
      end

      #field :image_file_name

      field :image_alt
      field :album

      field :tags
    end
  end
end
