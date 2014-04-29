#encoding: utf-8

class CatalogController < ApplicationController
  def colors
    @breadcrumbs = {
      :index => {:path => '/', :title => 'Головна'},
      :catalog => {:path => catalog_path, :title => 'Продукція' },
      colors: { path: catalog_colors_path, title: 'Кольорова гама', link: false }
    }
    @head_title = 'Продукція -> Кольорова гама - Русин-О - будматеріали '

    @colors = Catalog::CategoryItemColor.all

    @head_title = 'Про компанію - Русин-О - будматеріали '

    @colors_page = Pages::CatalogColorsPage.first
    @content = @colors_page.content
    @static_data = @colors_page.static_page_data
    @meta_keywords = @static_data.meta_keywords
    @meta_description = @static_data.meta_description
    @head_title = @static_data.head_title
    @body_title = @static_data.body_title
    @url = @static_data.url
  end

  def blagoustriy
    @breadcrumbs = {
      :index => {:path => '/', :title => 'Головна'},
      :catalog => {:path => catalog_path, :title => 'Продукція' },
      colors: { path: catalog_blagoustriy_path, title: 'Послуги з благоустрою', link: false }
    }
    @head_title = 'Продукція -> Послуги з благоустрою - Русин-О - будматеріали'

    @head_title = 'Про компанію - Русин-О - будматеріали '

    @service_page = Pages::CatalogServicesPage.first
    @content = @service_page.content
    @static_data = @service_page.static_page_data
    @meta_keywords = @static_data.meta_keywords
    @meta_description = @static_data.meta_description
    @head_title = @static_data.head_title
    @body_title = @static_data.body_title
    @url = @static_data.url
  end

  def index
  	@breadcrumbs = {
  		:index => {:path => '/', :title => 'Головна'},
  		:contact => {:path => '/catalog', :title => 'Продукція', :link => false}
  	}

    @head_title = 'Продукція - Русин-О - будматеріали '

  	@top_categories = Catalog::Category.where('parent_category_id IS NULL').order('display_index asc')

    @head_title = 'Про компанію - Русин-О - будматеріали '
    @static_data = Pages::CatalogPage.first.static_page_data
    @meta_keywords = @static_data.meta_keywords
    @meta_description = @static_data.meta_description
    @head_title = @static_data.head_title
    @body_title = @static_data.body_title
    @url = @static_data.url


    @catalog_pdf = CatalogDownload.find(1)

    @catalog_price = CatalogDownload.find(2)
  end

  def category

    required_category = params[:category]
    
    #}

  	@category_not_found = false
  	@category = Catalog::Category.where('category_url = "'+required_category+'"')
  	if @category.count > 0 
  	#	@category = category
  		@category = @category.first
  	else
  		@category_not_found = true
  	end

    if @category_not_found == true
      @breadcrumbs = {
        :index => {:path => '/', :title => 'Головна'},
        :contact => {:path => '/catalog', :title => 'Продукція', :link => false}
      }

      @head_title = 'Продукція - Русин-О - будматеріали '
    else
      @breadcrumbs = {
        :index => {:path => '/', :title => 'Головна'},
        :contact => {:path => '/catalog', :title => 'Продукція'},
        :category => {:path => '/catalog/'+ @category.category_url, :title => @category.name, :link => false }
      }

      @head_title = 'Продукція -> ' + @category.name + ' - Русин-О - будматеріали '


      @head_title = 'Про компанію - Русин-О - будматеріали '
      @static_data = Pages::CatalogPage.first.static_page_data
      @meta_keywords = @static_data.meta_keywords
      @meta_description = @static_data.meta_description
      @head_title = @static_data.head_title
      @body_title = @static_data.body_title
      @url = @static_data.url

      @dynamic_data = @category.object_metadata

      #render inline: @category.object_metadata.inspect

      if @dynamic_data
        @meta_keywords = @dynamic_data.meta_keywords
        @meta_description = @dynamic_data.meta_description

        @head_title = @dynamic_data.head_title
        @body_title = @dynamic_data.body_title

        url_array = @url.split('/').push( @dynamic_data.url ).join('/').split('/')
        optimized_url_array = []
        url_array.each do |url|
          if url.length && url.length > 0
            optimized_url_array.push(url)
          end
        end

        optimized_url_array.insert(0, '')
        @url = optimized_url_array.join('/')

      end
    end




  end
end
