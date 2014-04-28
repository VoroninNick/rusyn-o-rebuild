#encoding: utf-8

class GalleryController < ApplicationController
  def index
  	@images = GalleryImage.all
    
  	
  	@breadcrumbs = {
  		:index => {:path => '/', :title => 'Головна'},
  		:contact => {:path => '/gallery', :title => 'Галерея', :link => false}
  	}

    @head_title = 'Про компанію - Русин-О - будматеріали '
    @static_data = Pages::GalleryImagesPage.first.static_page_data
    @meta_keywords = @static_data.meta_keywords
    @meta_description = @static_data.meta_description
    @head_title = @static_data.head_title
    @body_title = @static_data.body_title
    @url = @static_data.url
  end

  def images
  	#@images = GalleryImage.all
  	
  	@breadcrumbs = {
  		:index => {:path => '/', :title => 'Головна'},
  		:gallery => {:path => '/gallery', :title => 'Галерея', :link => false},
      :images => {:path => '/gallery/images', :title => 'Фотографії', :link => false}
  	}
  	@images = []
    @sidebar_tag_categories = Gallery::TagCategory.all


  	
   
    
    



    if params['filter']
      tags = []
      params[:filter].each do |param|
        tags[tags.count] = param[0]

      end
      @images = Gallery::Image.find_images_by_tags(tags)
      #render inline: tags.inspect
   	else
      @images = Gallery::Image.all
      @images = Gallery::Image.limit(@count)
      @sidebar_tag_categories = Gallery::TagCategory.all
  	end



    @total = @images.count
    @start = 1
    @count = 8
    @end = 8
    @total = @images.count
    
    if params[:start] && params[:start].to_i > 0
      @start = params[:start].to_i
    end

    if params[:count] && params[:count].to_i > 0
      @count = params[:count].to_i
    end
    
    if @start == 1
      @count = 20  
    end
    
    if @start > @images.count
      @start = @images.count
    end

    if @start + @count > @images.count
      @count = @images.count - @start + 1 
    end

    @end = @start + @count -1

    start_index = @start - 1
    end_index = @end - 1

    #@images = @images.values_at(start_index..end_index)
   # temp = start_index+1
   #render inline: @images.count.to_s
   if @images.count > 0 && start_index >= 0 && end_index >= 0
    @images = @images.values_at(start_index..end_index)
  end
    @images.reverse!
    
    @type = 'html'
    if params[:type] == 'xml'
      @type='xml'
    end

    @head_title = 'Галерея - Русин-О - будматеріали '
    @sidebar_allowed_tag_categories = allowed_tag_categories_and_tags(Gallery::Image.find_allowed_tags_for_images)


    @head_title = 'Про компанію - Русин-О - будматеріали '
    @static_data = Pages::GalleryImagesPage.first.static_page_data
    @meta_keywords = @static_data.meta_keywords
    @meta_description = @static_data.meta_description
    @head_title = @static_data.head_title
    @body_title = @static_data.body_title
    @url = @static_data.url
  end


  def albums

  	@albums = []
  	@breadcrumbs = {
  		:index => {:path => '/', :title => 'Головна'},
  		:gallery => {:path => '/gallery', :title => 'Галерея', :link => false},
      :albums => {:path => '/gallery/albums', :title => 'Альбоми', :link => false}
  	}


  	if params[:filter]
  		#@albums =
      tags = []
      params[:filter].each do |param|
        tags[tags.count] = param[0]
      end
      @tags = tags
      result = Gallery::Album.find_albums_by_tags(tags)
      @albums = result
      
  	else
  		@albums = Gallery::Album.all
      
  		sidebar_tag_categories = Gallery::TagCategory.all
  	end


    @albums.reverse!

    @head_title = 'Галерея -> Альбоми - Русин-О - будматеріали '

    @sidebar_allowed_tag_categories = allowed_tag_categories_and_tags(Gallery::Album.find_allowed_tags_for_albums)

    #render inline: Gallery::Album.find_allowed_tags_for_albums.inspect


    @head_title = 'Про компанію - Русин-О - будматеріали '
    @static_data = Pages::GalleryAlbumsPage.first.static_page_data
    @meta_keywords = @static_data.meta_keywords
    @meta_description = @static_data.meta_description
    @head_title = @static_data.head_title
    @body_title = @static_data.body_title
    @url = @static_data.url
  end

  def album
    #@albums = false



    #if params[:filter]
      #@albums =
    #else
    @album_not_found = false
      @album = Gallery::Album.find_by_url(params[:album_name])
      
      if !@album
        @album_not_found = true

        redirect_to :action => 'albums', :status => 404

      else
        @breadcrumbs = {
          :index => {:path => '/', :title => 'Головна'},
          :contact => {:path => '/gallery', :title => 'Галерея' },
          :albums => { :path => '/gallery/albums', :title => 'Всі альбоми' },
          :album => { :title => @album.name, :link => false}
        }

       

        if params['filter']
            tags = []
            params[:filter].each do |param|
              tags[tags.count] = param[0]
            end
            
            @images = Gallery::Image.find_images_by_tags_in_album(tags,@album.id);

        else
            #@images = Gallery::Image.all
            #@images = Gallery::Image.limit(@count)
            #@sidebar_tag_categories = Gallery::TagCategory.all

            @images = @album.images
            
        end

        @total = @album.images.count
        @sidebar_tag_categories = Gallery::TagCategory.all
        @sidebar_allowed_tag_categories = allowed_tag_categories_and_tags(@album.find_allowed_tags_for_album_images)

        @head_title = 'Про компанію - Русин-О - будматеріали '
        @static_data = Pages::GalleryAlbumsPage.first.static_page_data
        @meta_keywords = @static_data.meta_keywords
        @meta_description = @static_data.meta_description
        @head_title = @static_data.head_title
        @body_title = @static_data.body_title
        @url = @static_data.url

        @images = @images.reverse

        #render inline: @images.inspect

        @dynamic_data = @album.object_metadata

        #render inline: @dynamic_data.inspect

        if @dynamic_data
          @meta_keywords = @dynamic_data.meta_keywords
          @meta_description = @dynamic_data.meta_description

          @head_title = @dynamic_data.head_title
          @body_title = @dynamic_data.body_title

          @url.split('/').push( @dynamic_data.url )


        end
      end

      

    #end
  end

  def allowed_tag_categories_and_tags(sidebar_tags)
          sidebar_allowed_tag_categories = []
      sidebar_tags.each do |tag|

        i = 0
        category_index = -1
        while i< sidebar_allowed_tag_categories.count 
          if sidebar_allowed_tag_categories[i][:name] == tag['category_name']
            #i+=1
            category_index = i
          end
          i+=1
        end
        if category_index == -1
          sidebar_allowed_tag_categories[i] = {}
          sidebar_allowed_tag_categories[i][:name] = tag['category_name']
          sidebar_allowed_tag_categories[i][:tags] = []
          sidebar_allowed_tag_categories[i][:tags][0] = {:name => tag['name'], :slug => tag['slug'] }
        else
          sidebar_allowed_tag_categories[category_index][:tags][sidebar_allowed_tag_categories[category_index][:tags].count] = {:name => tag['name'], :slug => tag['slug'] }
        end
      end

      return sidebar_allowed_tag_categories
  end

  # Vik Ewoods
  def index_filter
    @images = GalleryImage.all

    @breadcrumbs = {
        :index => {:path => '/', :title => 'Головна'},
        :contact => {:path => '/gallery', :title => 'Галерея', :link => false}
    }
  end

  def images_filter

    @images = Gallery::Image.all
    @sidebar_tag_categories = Gallery::TagCategory.all
    @query_string = false
    if params[:filter]
      @query_string = params[:filter]
    end
    all_tags = Gallery::Tag.all
    @tags = []

    #params.each  do |param|  
  end

  def albums_filter

  end

  def image_proxy
    query = params[:image]
    #image_url = (query) # returns an absolute local file path or a URL

    image = Gallery::Image.find_by_name(params[:image])
    if image != nil

      response.headers['Cache-Control'] = "public, max-age=#{12.hours.to_i}"
      response.headers['Content-Type'] = 'image/jpeg'
      response.headers['Content-Disposition'] = 'inline'
      render :text => open(image.image.path).read
    else
      render text: 'file not found'
    end
  end
end
