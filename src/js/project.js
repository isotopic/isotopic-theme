$(document).ready(function(){
	// Wordpress shows custom posts as children of 'blog'. This hask fixes it.
	$('nav.main-menu li').removeClass('current_page_parent');
	$('nav.footer-menu li').removeClass('current_page_parent');	

	$('nav.main-menu li a:contains("Projects")').parent().addClass('current_page_parent');
	$('nav.footer-menu li a:contains("Projects")').parent().addClass('current_page_parent');
});