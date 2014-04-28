class TrafficHistory < ActiveRecord::Base
  attr_accessible :url
  attr_accessible :user_agent
  attr_accessible :ip

  rails_admin do
    visible false
  end
end
