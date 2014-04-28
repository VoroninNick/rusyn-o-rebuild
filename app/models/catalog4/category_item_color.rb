# coding: utf-8

class Catalog4::CategoryItemColor < ActiveRecord::Base
  attr_accessible :image_content_type, :image_file_name, :image_file_size, :image_updated_at, :name, :rgb, :short_description

  #belongs_to :category, :inverse_of => :category_item_colors

  #has_and_belongs_to_many :catalog4_category_items
  #attr_accessible :catalog4_category_items, :catalog4_category_item_ids

  attr_accessible :image, :delete_image

  attr_accessor :delete_image

  has_attached_file :image, :styles => { :thumb => '150x150#', :fancybox => '800x800>'},
                  :url  => '/assets/catalog/colors/:id/:style/:basename.:extension',
                  :path => ':rails_root/public/assets/catalog/colors/:id/:style/:basename.:extension'
                  #:hash_secret => '3858f62230ac3c915f300c664312c63f'



  rails_admin do
    label 'Цвет для продуктов'
    label_plural 'Цвета для Продуктов'
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
      field :name
      field :rgb
      #field :parent_category
      #field :category_items
      #field :category_images
    end
  end
end
