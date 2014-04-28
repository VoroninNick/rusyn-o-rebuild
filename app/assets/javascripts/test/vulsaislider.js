(function( $ ){
	var options = {
		A:5
	   ,B:7
	}
	var local_variables = {
		a:1,
		b:2,
		carousel : this,
		items : [],
		navigation : false,
		leftArrow : false,
		rightArrow : false
	}
    var methods = {
        init : function(_options) {
        	options = $.extend({}, options, _options);
        	console.log('init');

        	local_variables.carousel = this;
        	//console.log(local_variables.carousel.length);
        	local_variables.items = local_variables.carousel.find('.carousel-item');
        	
        	methods.initNavigation();
        },
        initNavigation : function(){
        	if(local_variables.items.length > 2){
        		var itemsWrapper=local_variables.carousel.append('<div id="items-wrapper"></div>').find('#items-wrapper');
        		local_variables.items.appendTo(itemsWrapper);
        		local_variables.carousel.append('<div class="clearfix"></div>');
        		local_variables.carousel.prepend('<div class="carousel-navigation-arrows" ></div>');
        		methods.displayRightArrow(true);
        		methods.displayLeftArrow(true);
        	}
        },
        displayLeftArrow : function(display){
        	if(display != local_variables.leftArrow){
        		if(display == true){
        			var left_arrow=$('<div class="carousel-navigation-left-arrow"></div>');
        			local_variables.carousel.find('div.carousel-navigation-arrows').prepend(left_arrow);
        			
        			left_arrow.mouseover(function(){
        				$(this).css('background-color', 'blue');
        			});
        			left_arrow.mouseout(function(){
        				$(this).css('background-color', 'lightblue');
        			});
        		}
        		else{
        			
        		}
        	}
        },
        displayRightArrow : function(display){
        	if(display != local_variables.rightArrow){
        		if(display == true){
        			var right_arrow = $('<div class="carousel-navigation-right-arrow"></div>');
        			//right_arrow.insertAfter;
        			//if(local_variables.carousel.find('div'))
        			
        			right_arrow.appendTo('div.carousel-navigation-arrows');
        			//arr_height = right_arrow.css('height');
        			//carousel_height=local_variables.carousel.fastHeight();
        			//right_arrow.margin({top: (carousel_height - arr_height)/2 });

        			right_arrow.mouseover(function(){
        				$(this).css('background-color', 'blue');
        			});
        			right_arrow.mouseout(function(){
        				$(this).css('background-color', 'lightblue');
        			});
        		}
        	}
        },
        show : function( ) {    },// IS
        hide : function( ) {  },// GOOD
        update : function( content ) {  }// !!!
       ,getSum : function(){return options.A + options.B}
       ,getLocalSum : function(){return local_variables.a + local_variables.b}
       ,sum : function(obj){return obj.a+obj.b}
    };

    $.fn.carousel = function(methodOrOptions) {
        if ( methods[methodOrOptions] ) {
            return methods[ methodOrOptions ].apply( this, Array.prototype.slice.call( arguments, 1 )) || this;
        } else if ( typeof methodOrOptions === 'object' || ! methodOrOptions ) {
            // Default to "init"
            if(typeof this.data('carousel') == 'undefined'){
            	
            	res = methods.init.apply( this, arguments ) ;
            	this.data('carousel','obj');
            	return res || this;
            }
        } else {
            $.error( 'Method ' +  method + ' does not exist on jQuery.tooltip' );
        }

        return this;    
    };


})( jQuery );