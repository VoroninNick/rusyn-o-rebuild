class Pages::HomePage < ActiveRecord::Base
  attr_accessible :about_content

  has_one :static_page_data
  attr_accessible :static_page_data, :static_page_data_id

  accepts_nested_attributes_for :static_page_data
  attr_accessible :static_page_data_attributes



  has_many :home_page_gallery_images

  accepts_nested_attributes_for :home_page_gallery_images#, :allow_destroy => true
  attr_accessible :home_page_gallery_images_attributes#, :allow_destroy => true

  rails_admin do
    edit do
      # field :about_content, :ck_editor
      field :home_page_gallery_images
      field :static_page_data
    end
  end
end
