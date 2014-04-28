class Pages::ContactPage < ActiveRecord::Base
  attr_accessible :address, :contacts, :map_coordinates, :working_hours

  has_one :static_page_data
  attr_accessible :static_page_data

  accepts_nested_attributes_for :static_page_data
  attr_accessible :static_page_data_attributes


  rails_admin do
    edit do
      field :address, :ck_editor do
      end
      field :working_hours, :ck_editor do
      end
      field :contacts, :ck_editor do
      end
      field :map_coordinates, :string

      field :static_page_data
    end
  end
end
