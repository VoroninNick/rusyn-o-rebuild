class Article < ActiveRecord::Base
  attr_accessible :id,:article_image, :article_image_alt,:article_content, :article_image_content_type, :article_image_file_name, :article_image_file_size, :article_image_updated_at, :article_short_description, :article_title, :article_url, :release_date

  # attr_accessible :description, :name, :image, :title, :url, :gallery_album_id, :delete_image, :gallery_album

  #attr_accessor :delete_article_image

  #belongs_to :gallery_album


  validates :article_title, :length => 1..67, presence: true
  validates :article_url, :uniqueness => true, presence: true
  validates :article_short_description, :length => 1..161, :presence => true

  before_validation :generate_article_url

  before_validation :default_release_date
  def default_release_date
    self.release_date ||= Time.now
  end

  before_validation :generate_image_alt

  def generate_image_alt
    self.article_image_alt ||= article_title
  end

  before_save :check_rename_article_image

  def check_rename_article_image
    if article_image_file_name_changed?
      new_name = article_image_file_name
      old_name = article_image_file_name_was

      article_image.styles.keys.each do | key |
        file_path = article_image.path(key)
        folder = File.dirname(file_path)

        new_path = folder + '/' + new_name
        old_path = folder + '/' + old_name
        FileUtils.mv old_path, new_path
      end
    end
  end

  def generate_article_url
    if !object_metadata
      #object_metadata = ObjectMetadata.create!(article_id: (Article.last.id + 1) )
      build_object_metadata
    end

    object_metadata.url ||= article_title.parameterize
    object_metadata.head_title ||= article_title
    object_metadata.body_title ||= article_title

    self.article_url = object_metadata.url
  end


  has_attached_file :article_image,
                    :styles => {
                        :thumb => '200x155>',
                        :article_item_page => '390x250>',
                        :bw_thumb => '200x155>'
                    },
                    :processor => 'mini_magick',
                    :convert_options => {
                        #:grayscale_thumb => '-threshold 50%',
                        :bw_thumb => '-colorspace Gray'
                    },
                    :url  => '/assets/article_images/:id/:style/:basename.:extension',
                    :path => ':rails_root/public/assets/article_images/:id/:style/:basename.:extension'
  #:hash_secret => '3858f62230ac3c915f300c664312c63f'




  has_one :object_metadata
  attr_accessible :object_metadata

  accepts_nested_attributes_for :object_metadata
  attr_accessible :object_metadata_attributes


  def image_width
    geo = Paperclip::Geometry.from_file(Paperclip.io_adapters.for(self.article_image))

    #self.image_height = geo.height
    #self.image_width = geo.width
    #self.image_ratio = geo.width / geo.height

    return geo.width
  end

  def image_height
    geo = Paperclip::Geometry.from_file(Paperclip.io_adapters.for(self.article_image))

    #self.image_height = geo.height
    #self.image_width = geo.width
    #self.image_ratio = geo.width / geo.height

    return geo.height
  end



  rails_admin do
    label 'Статья'
    label_plural 'Статьи'

    list do
      field :article_title
      #field :gallery_album
      field :article_image
    end

    edit do
      field :article_title
      field :release_date
      #field :article_url
      field :article_short_description
      field :article_content, :ck_editor do
      end
      field :article_image, :paperclip do
        label 'Image'
      end

      field :article_image_file_name
      field :article_image_alt
      #field :gallery_album

      field :object_metadata
    end
  end



end
