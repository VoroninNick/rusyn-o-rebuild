class EditorTest < ActiveRecord::Base
  attr_accessible :title
  attr_accessible :content

  rails_admin do
    visible false

    edit do
      field :title
      field :content, :ck_editor
    end
  end
end
