#encoding: utf-8
class ContactController < ApplicationController

  def get_info
    db=Pages::ContactPage.first

    @head_title = 'Контакти - Русин-О - будматеріали '

    #

    @static_data = Pages::ContactPage.first.static_page_data
    @meta_keywords = @static_data.meta_keywords
    @meta_description = @static_data.meta_description
    @head_title = @static_data.head_title
    @body_title = @static_data.body_title
    @url = @static_data.url
    @address = db.address
    @working_hours = db.working_hours
    @contacts = db.contacts
    @map_coordinates = db.map_coordinates
  end

  def index

    @head_title = 'Про компанію - Русин-О - будматеріали '



  	#add_breadcrumb "index", '/', :title => "Back to the Index"
  	#add_breadcrumb "Contacts", '/', :title => "Back to the Index"
  	#s='привет'
  	
  	@breadcrumbs = {
  		:index => {:path => '/', :title => 'Головна'},
  		:contact => {:path => '/contact', :title => 'Контакти', :link => false}
  	}

    get_info

    @order = Order.new

  end

  def new


    #add_breadcrumb "index", '/', :title => "Back to the Index"
    #add_breadcrumb "Contacts", '/', :title => "Back to the Index"
    #s='привет'

    @breadcrumbs = {
        :index => {:path => '/', :title => 'Головна'},
        :contact => {:path => '/contact', :title => 'Контакти', :link => false}
    }

    get_info

    @order = Order.new

  end

  def create
    @order = Order.new(params[:order])

    if @order.valid?
      OrderMailer.order_form(@order).deliver
      redirect_to contact_path
    else
      redirect_to contact_path
    end

    @head_title = 'Контакти - Русин-О - будматеріали '

    @static_data = Pages::ContactPage.first.static_page_data
    @meta_keywords = @static_data.meta_keywords
    @meta_description = @static_data.meta_description
    @head_title = @static_data.head_title
    @body_title = @static_data.body_title
    @url = @static_data.url
    @address = db.address
    @working_hours = db.working_hours
    @contacts = db.contacts
    @map_coordinates = db.map_coordinates
  end
end
