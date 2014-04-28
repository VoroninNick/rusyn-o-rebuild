class StaticPageData < ActiveRecord::Base
  belongs_to :pages_about_page
  belongs_to :pages_home_page

  attr_accessible :metatags
  attr_accessible :meta_keywords
  attr_accessible :meta_description
  attr_accessible :head_title
  attr_accessible :body_title
  attr_accessible :url
  attr_accessible :next_page_link

  rails_admin do
    visible false

    nested do
      field :body_title
      field :head_title
      field :url

      field :meta_keywords
      field :meta_description
      #field :metatags

      field :next_page_link, :ck_editor



    end
  end


end
