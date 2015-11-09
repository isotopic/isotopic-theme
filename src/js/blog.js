

$(document).ready(function(){

	$('.toolbar-filter').click(function(event){
		$('.toolbar-filters > .container').stop().slideToggle();
	})
	$('.toolbar-filters span').click(function(event){
		var tax = $(this).attr('data-tax');
		var term = $(this).attr('data-term');
		var counter = 0;
		$('.project-item').stop().hide();
		$('.project-item').each(function(){
			var term_array = $(this).attr('data-'+tax).split(",");
			if( term_array.indexOf(term)>=0 ){
				$(this).stop().delay(500+(120*(counter++))).fadeIn();	
			}
		});
		if(counter>0){
			$('.toolbar-filters > .container').stop().slideUp(500);
			$('.toolbar-filter').hide();
			$('.toolbar-filter-selected > span.holder').text(tax+": "+term);
			$('.toolbar-filter-selected').show();
		}
		return false;
	})

	$('.toolbar-filter-selected').click(function(event){
		$('.project-item').stop().show();
		$('.toolbar-filter').show();
		$('.toolbar-filter-selected').hide();
	})

});


