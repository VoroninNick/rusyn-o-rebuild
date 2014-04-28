class Banner < ActiveRecord::Base
  attr_accessible :banner_image,:banner_image_content_type, :banner_image_file_name, :banner_image_file_size, :banner_image_updated_at, :description, :name, :position, :title, :link_to


  has_attached_file :banner_image, 
    :styles => { 
      #:thumb => '180x115>', 
      #:article_item_page => '390x250>',
      #:grayscale_thumb => '180x115>',
      #:bw_thumb => '180x115>',
      :home_banner => '1290x500>',
      :bw_home_banner => '1290x500>' 

    },
    :processor => 'mini_magick',
    :convert_options => {
      #:grayscale_thumb => '-threshold 50%',
      #:bw_thumb => '-colorspace Gray'
      :bw_home_banner => '-colorspace Gray'
    },
    :url  => '/assets/banners/:id/:style/:basename.:extension',
    :path => ':rails_root/public/assets/banners/:id/:style/:basename.:extension'
                  #:hash_secret => '3858f62230ac3c915f300c664312c63f'





    rails_admin do
      label 'Banner'
      label_plural 'Banners'

      list do
      	field :position
      	field :name
        field :title
        field :link_to
        field :description
        #field :gallery_album
        field :banner_image
      end

      edit do
        field :position
      	field :name
        field :title
        field :link_to
        field :description
        #field :gallery_album

        field :banner_image, :paperclip do
          label 'Image'
        end
        #field :gallery_album
      end
    end
end
