#encoding: utf-8
class HomeController < ApplicationController
  def index
  	@new_articles = Article.order('release_date DESC').limit(4)

  	@banners = Banner.order('position ASC') 

  	@catalog_categories = Catalog::Category.where('parent_category_id is null').limit(5).order('display_index asc')

  	@head_title = 'Головна - Русин-О - будматеріали '

    @catalog_pdf = CatalogDownload.find(1)

    @catalog_price = CatalogDownload.find(2)




    @head_title = 'Про компанію - Русин-О - будматеріали '
    @static_data = Pages::HomePage.first.static_page_data
    @meta_keywords = @static_data.meta_keywords
    @meta_description = @static_data.meta_description
    @head_title = @static_data.head_title
    @body_title = @static_data.body_title
    @url = @static_data.url

    @about_content = Pages::HomePage.first.about_content

  end

  def footer_contact_data
	footer_contact_info=FooterContactInfo.first
	return footer_contact_info
  end

  def analize_home_page
    self.index
    str = render_to_string template: 'home/index'
    optimized_string = str.gsub(/\s+/, " ").strip
    output_string = optimized_string

    render inline: output_string
  end




end
