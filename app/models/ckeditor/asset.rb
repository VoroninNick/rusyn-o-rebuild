class Ckeditor::Asset < ActiveRecord::Base
  include Ckeditor::Orm::ActiveRecord::AssetBase

  delegate :url, :current_path, :content_type, :to => :data

  validates_presence_of :data

  rails_admin do
    visible false
  end
end
