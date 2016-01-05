<?php

/* 
* Show or hide specific meta boxes accordingly to the content being edited 
*/

add_action( 'add_meta_boxes', 'remove_post_meta_boxes' );

function remove_post_meta_boxes() {

	if(isset($_GET['post'])) {
		$ID = $_GET['post'];
	}else{
		return false;
	}

	$post_type = get_post_type($ID);

	// Home
	if( $ID == get_option('page_on_front') ){
		metaboxes_page_home();

	// About
	}else if( $ID == getIdBySlug('about') ) {
		metaboxes_page_about();

	}else{

		if($post_type=="page"){
			metaboxes_page();
		}else if($post_type=="project"){
			metaboxes_project();
		}else if($post_type=="post"){
			metaboxes_post_common_remove();
		}

	}
}



function metaboxes_project(){
    remove_meta_box('commentstatusdiv', 'project', 'side');
	remove_meta_box('commentstatusdiv', 'project', 'normal');
	remove_meta_box('commentsdiv', 'project', 'side');
	remove_meta_box('commentsdiv', 'project', 'normal');
    remove_meta_box('slugdiv', 'project', 'side');
    remove_meta_box('slugdiv', 'project', 'normal');
    remove_meta_box('authordiv', 'project', 'side');
    remove_meta_box('authordiv', 'project', 'normal');
    remove_meta_box('revisionsdiv', 'project', 'side');
    remove_meta_box('revisionsdiv', 'project', 'normal'); 
    remove_meta_box('postcustom', 'project', 'side');
    remove_meta_box('postcustom', 'project', 'normal');
    remove_meta_box('trackbacksdiv', 'project', 'side');
	remove_meta_box('trackbacksdiv', 'project', 'normal'); 
}


function metaboxes_page_home(){
	metaboxes_page_common_remove();
    remove_meta_box('about_content-about-content', 'page', 'side');
    remove_meta_box('about_content-about-content', 'page', 'normal');
}

function metaboxes_page_about(){
	metaboxes_page_common_remove();
    remove_meta_box('home_links-home-links', 'page', 'normal');
    remove_meta_box('home_links-home-links', 'page', 'normal');
}

function metaboxes_page(){
	metaboxes_page_common_remove();
    remove_meta_box('home_links-home-links', 'page', 'normal');
    remove_meta_box('home_links-home-links', 'page', 'normal');
    remove_meta_box('about_content-about-content', 'page', 'side');
    remove_meta_box('about_content-about-content', 'page', 'normal');
}

function metaboxes_page_common_remove(){
	remove_meta_box('tagsdiv-type', 'page', 'side');
    remove_meta_box('tagsdiv-type', 'page', 'normal');
    remove_meta_box('tagsdiv-client', 'page', 'side');
    remove_meta_box('tagsdiv-client', 'page', 'normal');
    remove_meta_box('tagsdiv-service', 'page', 'side');
    remove_meta_box('tagsdiv-service', 'page', 'normal');  
    remove_meta_box('commentstatusdiv', 'page', 'side');
	remove_meta_box('commentstatusdiv', 'page', 'normal');
	remove_meta_box('commentsdiv', 'page', 'side');
	remove_meta_box('commentsdiv', 'page', 'normal');
    remove_meta_box('slugdiv', 'page', 'side');
    remove_meta_box('slugdiv', 'page', 'normal');
    remove_meta_box('authordiv', 'page', 'side');
    remove_meta_box('authordiv', 'page', 'normal');
    remove_meta_box('revisionsdiv', 'page', 'side');
    remove_meta_box('revisionsdiv', 'page', 'normal'); 
    remove_meta_box('postcustom', 'page', 'side');
    remove_meta_box('postcustom', 'page', 'normal');
    remove_meta_box('postimagediv', 'page', 'side');
	remove_meta_box('postimagediv', 'page', 'normal'); 
}


function metaboxes_post_common_remove(){
	remove_meta_box('tagsdiv-type', 'post', 'side');
    remove_meta_box('tagsdiv-type', 'post', 'normal');
    remove_meta_box('tagsdiv-client', 'post', 'side');
    remove_meta_box('tagsdiv-client', 'post', 'normal');
    remove_meta_box('tagsdiv-service', 'post', 'side');
    remove_meta_box('tagsdiv-service', 'post', 'normal');  
    remove_meta_box('commentstatusdiv', 'post', 'side');
	remove_meta_box('commentstatusdiv', 'post', 'normal');
	remove_meta_box('commentsdiv', 'post', 'side');
	remove_meta_box('commentsdiv', 'post', 'normal');
    remove_meta_box('slugdiv', 'post', 'side');
    remove_meta_box('slugdiv', 'post', 'normal');
    remove_meta_box('authordiv', 'post', 'side');
    remove_meta_box('authordiv', 'post', 'normal');
    remove_meta_box('revisionsdiv', 'post', 'side');
    remove_meta_box('revisionsdiv', 'post', 'normal'); 
    remove_meta_box('postcustom', 'post', 'side');
    remove_meta_box('postcustom', 'post', 'normal');
    remove_meta_box('trackbacksdiv', 'post', 'side');
	remove_meta_box('trackbacksdiv', 'post', 'normal'); 
}



function getIdBySlug($_slug){
	$the_slug = $_slug;
	$args=array(
	  'name' => $the_slug,
	  'post_type' => 'page',
	  'post_status' => 'publish',
	  'numberposts' => 1
	);
	$my_posts = get_posts($args);
	if( count($my_posts)>0 ) {
		return $my_posts[0]->ID;
	}else{
		return false;
	}
}


?>