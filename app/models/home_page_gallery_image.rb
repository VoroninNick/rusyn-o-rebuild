class HomePageGalleryImage < ActiveRecord::Base

  attr_accessible :image, :image_alt, :image_file_name, :short_description

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

  has_attached_file :image,
                    styles: {
                        home_gallery: '200x125#'
                    }

  rails_admin do
    edit do
      field :image
      field :image_file_name
      field :short_description
      field :image_alt
    end
  end


end
