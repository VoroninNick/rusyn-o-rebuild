#encoding: utf-8
class PublicationsController < ApplicationController
  def index
  	#@articles


  	@breadcrumbs = {
  		:index => {:path => '/', :title => 'Головна'},
  		:contact => {:path => '/articles', :title => 'Публікації', :link => false}
  	}
  	
    #@max_items_in_first_page = 8
  	@max_items_per_page = 8
    @total = Article.count

  	if params.has_key?('page_number')
  		@page_number = params['page_number'].to_i
  	else
  		@page_number = 1
  	end

    if @page_number <1
      @page_number = 1
    elsif (@page_number * (@max_items_per_page) - @max_items_per_page +1) > @total
      @page_number = (@total / 10).ceil 
    end

  	@start_number = @page_number * (@max_items_per_page) - @max_items_per_page +1
    @start_index = @start_number - 1
    @end_number = @start_number + @max_items_per_page - 1
    if(@end_number > @total)
      @end_number = @total
    end
    @end_index = @end_number - 1 
  	@articles = Article.order('created_at DESC')
    @required_articles = @articles[@start_index..5]
  	@prev_page = 0
  	@next_page = 0
  	#if @articles.count >= 10
  		# check if exist next entries for next page
  		if @start_number > @max_items_per_page
  			@prev_page = @page_number - 1
  		end

  		#if Article.where('id>' + (@start_number-1).to_s + ' and id = ' + (@start_number-1).to_s).limit(1).count == 1
  		#	@enable_prev = true
  		#end
      if @end_number < @total
        @next_page = @page_number + 1
      end
  	#end

    @head_title = 'Публікації - Русин-О - будматеріали '

    @head_title = 'Про компанію - Русин-О - будматеріали '
    @static_data = Pages::ArticlesPage.first.static_page_data
    @meta_keywords = @static_data.meta_keywords
    @meta_description = @static_data.meta_description
    @head_title = @static_data.head_title
    @body_title = @static_data.body_title
    @url = @static_data.url
  end



  def item
  	@article = Article.find_by_article_url!(params[:item_name])
    @last_articles = Article.where(id: Article.pluck(:id).sample(2))
  	@breadcrumbs = {
  		:index => {:path => '/', :title => 'Головна'},
  		:contact => {:path => '/articles', :title => 'Публікації'},
  		:article_item => {:path => '/article', :title => @article.article_title,:link=>false}
  	}
    @head_title = 'Публікації -> ' + @article.article_title + ' - Русин-О - будматеріали '





    @head_title = 'Про компанію - Русин-О - будматеріали '
    @static_data = Pages::ArticlesPage.first.static_page_data
    @meta_keywords = @static_data.meta_keywords
    @meta_description = @static_data.meta_description
    @head_title = @static_data.head_title
    @body_title = @static_data.body_title
    @url = @static_data.url

    @dynamic_data = @article.object_metadata

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