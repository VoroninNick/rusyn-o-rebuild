# -*- encoding : utf-8 -*-
class GalleryImage < ActiveRecord::Base
  attr_accessible :description, :name, :image, :title, :url, :gallery_album_id, :delete_image, :gallery_album

  attr_accessor :delete_image

  belongs_to :gallery_album

  has_attached_file :image, :styles => { :thumb => '150x150>', :items => '235x190#', big: '1000x1000#' },
                  :url  => '/assets/galleryimages/:id/:style/:basename.:extension',
                  :path => ':rails_root/public/assets/galleryimages/:id/:style/:basename.:extension'
                  #:hash_secret => '3858f62230ac3c915f300c664312c63f'
  


  rails_admin do
    visible false

    label 'Картинка'
    label_plural 'Картинки'

    list do
      field :name
      field :gallery_album
      field :image
    end

    edit do
      field :name
      field :description do
        #ckeditor true
      end
      field :image, :paperclip do
        label 'Image'
      end
      field :gallery_album
    end
  end
end
