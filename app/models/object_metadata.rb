class ObjectMetadata < ActiveRecord::Base
  attr_accessible :url
  attr_accessible :final_url
  attr_accessible :head_title
  attr_accessible :final_head_title
  attr_accessible :body_title
  attr_accessible :final_body_title
  attr_accessible :metatags
  attr_accessible :final_metatags
  attr_accessible :meta_keywords
  attr_accessible :final_meta_keywords
  attr_accessible :meta_description
  attr_accessible :final_meta_description
  attr_accessible :next_page_link

  belongs_to :album
  attr_accessible :album, :album_id

  belongs_to :article
  attr_accessible :article, :article_id

  rails_admin do
    visible false
    nested do
      field :head_title
      field :body_title
      field :url
      field :meta_keywords
      field :meta_description
      field :next_page_link, :ck_editor
    end
  end
end
