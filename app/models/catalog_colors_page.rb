class CatalogColorsPage < ActiveRecord::Base
  attr_accessible :content

  rails_admin do
    visible false
  end
end
