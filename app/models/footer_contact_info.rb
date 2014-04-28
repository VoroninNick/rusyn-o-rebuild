class FooterContactInfo < ActiveRecord::Base
  attr_accessible :address, :contacts, :working_hours

  attr_accessible do
    edit do
      field :address, :ck_editor do
      end
      field :working_hours, :ck_editor do
      end
      field :contacts, :ck_editor do
      end
    end
  end
end
