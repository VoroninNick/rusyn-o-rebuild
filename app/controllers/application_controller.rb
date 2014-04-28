#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  #render inline: 'hello'


  before_filter :save_to_traffic_history

  def save_to_traffic_history

    path_arr = request.path.to_s.split('/')
    location = path_arr[1].to_s
    if location != 'admin'
      TrafficHistory.create!(url: request.path, user_agent: request.headers[:HTTP_USER_AGENT], ip: request.headers[:REMOTE_ADDR])
      #render inline: location
    end

  end

  # for allow devise send email
  before_filter :mailer_set_url_options

  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
  
  helper_method :footer_contact_data

  def footer_contact_data
	footer_contact_data=FooterContactInfo.first
	return footer_contact_data
  end

  helper_method :get_catalog_links

  def get_catalog_links
  	return Catalog4::Category.where('parent_category_id is null').order('display_index asc').select('name,category_url')
  end

  #helper_method :get_page_info
  #def get_page_info
    #pi = PageInfo.where('url = ' + request.path)
    #return pi
  #end
end
