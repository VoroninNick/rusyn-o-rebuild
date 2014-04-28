#encoding: utf-8
class OrderController < ApplicationController
  def index
  	@order = Order.new
  	process_request
  end

  def process_request
  	if request.post?
  		#@params = params
  		if params[:order]
  			@order_data = params[:order]
        if(params[:mode] == 'ajax')
          render :text => '<h2>Дякуємо за ваш лист</h2>'
        end

        #self.create
        @message = Message.new(params[:order])

         if @message.valid?
          OrderMailer.new_message(@message).deliver
        end

  		end

  	elsif request.get?
  		@params = params
  	end
  end

  def validate
    return true
  end

  def new
    @message = Message.new
  end

  def create
    order_data = params[:order]
    @message = Message.new(params[:order])

    if @message.valid?
      OrderMailer.new_message(@message).deliver
      redirect_to contact_path, status: 302
    else
      flash.now.alert = "Please fill all fields."
      render :index
    end
  end
  
end
