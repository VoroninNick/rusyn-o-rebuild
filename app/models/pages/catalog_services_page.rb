class Pages::CatalogServicesPage < ActiveRecord::Base
  attr_accessible :content

  has_one :static_page_data
  attr_accessible :static_page_data

  accepts_nested_attributes_for :static_page_data
  attr_accessible :static_page_data_attributes

  rails_admin do
    edit do
      field :content, :ck_editor do
      end

      field :static_page_data
    end
  end
end
