# coding: utf-8

class Catalog4::CategoryImage < ActiveRecord::Base
  attr_accessible :category_id, :image_alt, :image_content_type, :image_file_name, :image_file_size, :image_updated_at, :short_description

  belongs_to :category, :inverse_of => :category_images

  attr_accessible :image, :delete_image

  attr_accessor :delete_image

  has_attached_file :image, :styles => { :thumb => '150x150>' },
                  :url  => '/assets/catalog/category_images/:id/:style/:basename.:extension',
                  :path => ':rails_root/public/assets/catalog/category_images/:id/:style/:basename.:extension'
                  #:hash_secret => '3858f62230ac3c915f300c664312c63f'



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
    label 'Картинка для категорий'
    label_plural 'Картинки для категорий'
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

      field :image_file_name

      field :image_alt
      #field :parent_category
      #field :category_items
      #field :category_images
    end
  end
end



