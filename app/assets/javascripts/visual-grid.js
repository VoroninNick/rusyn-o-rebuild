$(document).ready(function(){
	var document_height=$(document).height();
	var $body=$('body');
	var $grid=$('<div class="visual-grid container"></div>');
	for(var i=1;i<=12;i++){
		var $column=$('<div class="g1"></div>');
		if(i==1){
			$column.addClass('alpha');
		}
		if(i==12){
			$column.addClass('omega');
		}

		$grid.append($column);
		$column.css({
			'height':'100%',
			'background-color':'rgba(0, 160, 198, 0.55)',
            'border':'1px solid rgba(0, 160, 198, 1)'
		});
	}
	$body.append($grid);
	$grid.css({
		'display':'none',
		'position':'absolute',
		'left':'5%',
        'right': '5%',
		'top':0,
		'z-index':100000,
		'height':document_height,
		'width':'90%',
		'background-color':'rgba(0, 160, 198, 0.15)'

	});
	$body.keypress(function(event){
		var e=event;
		if( e.which === 103 && ( e.target.tagName === 'BODY' || e.altKey === true || e.ctrlKey === true) ){
			var display=$grid.css('display');
			if(display === 'none'){
				$grid.css('display','block');
			}
			else{
				$grid.css('display','none');
			}
		}
	});
});
