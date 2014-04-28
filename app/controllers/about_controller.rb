#encoding: utf-8
class AboutController < ApplicationController
  def index
  	#@page_content = AboutPage.first.content
  	@breadcrumbs = {
  		:index => {:path => '/', :title => 'Головна'},
  		:contact => {:path => about_path, :title => 'Про компанію', :link => false}
  	}

  	@head_title = 'Про компанію - Русин-О - будматеріали '
    @about_page = Pages::AboutPage.first
    @static_data = @about_page.static_page_data
    @meta_keywords = @static_data.meta_keywords
    @meta_description = @static_data.meta_description
    @head_title = @static_data.head_title
    @body_title = @static_data.body_title
    @url = @static_data.url
  end
end
