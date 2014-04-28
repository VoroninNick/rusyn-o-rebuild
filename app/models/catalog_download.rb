class CatalogDownload < ActiveRecord::Base
  attr_accessible :data,:data_content_type, :data_file_name, :data_file_size, :data_updated_at, :name

  has_attached_file :data,
   :url  => '/assets/:basename.:extension',
   :path => ':rails_root/public/assets/:basename.:extension'
end
