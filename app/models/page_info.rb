class PageInfo < ActiveRecord::Base
  attr_accessible :breadcrumbs, :page_browser_title, :page_title, :url
end
