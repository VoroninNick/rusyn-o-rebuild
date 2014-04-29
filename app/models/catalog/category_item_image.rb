# coding: utf-8

class Catalog::CategoryItemImage < ActiveRecord::Base
  attr_accessible :category_item_id, :image_alt, :image_content_type, :image_file_name, :image_file_size, :image_updated_at, :short_description, :image_height, :image_width, :image_ratio

  belongs_to :catalog_category_item, :inverse_of => :category_item_images




  attr_accessible :image, :delete_image

  attr_accessor :delete_image

  has_attached_file :image, :styles => { small: '100x100>',
                                         middle: '250x250>',
                                         fancybox: '1000x1000>'
                                       },
                            :url  => '/assets/catalog/item_images/:id/:style/:basename.:extension',
                            :path => ':rails_root/public/assets/catalog/item_images/:id/:style/:basename.:extension'


  before_save :check_rename_image

  def check_rename_image
    if image_file_name_changed?
      new_name = image_file_name
      old_name = image_file_name_was

      image.styles.keys.each do | key |
        file_path = image.path(key)
        folder = File.dirname(file_path)

        new_path = folder + '/' + new_name
        old_path = folder + '/' + old_name
        FileUtils.mv old_path, new_path
      end
    end
  end



  rails_admin do

        label 'Картинка для продуктов'
        label_plural 'Картинки для продуктов'
   # label 'Картинка'
   # label_plural 'Картинки'

  #  list do
  #    field :name
  #    field :album
  #    field :image
  #  end

    edit do
      field :short_description
      field :image, :paperclip do
      	#label :image
      end

      #field :image_file_name

      field :image_width do
        hide
      end

      field :image_height do
        hide
      end

      field :image_ratio do
        hide
      end

      field :image_alt
      #field :parent_category
      #field :category_items
      #field :category_images
    end
  end
end
