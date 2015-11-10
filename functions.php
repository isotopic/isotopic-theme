<?php

/*
define('WP_HOME','http://www.isotopic.com.br');
define('WP_SITEURL','http://www.isotopic.com.br/wordpress');
*/
/* 
============================================================================================================
==================================================================================================== WP_HEAD
============================================================================================================
*/




function isotopic_get_styles(){
	echo '<link rel="stylesheet" href="'.get_template_directory_uri().'/css/bootstrap.min.css" type="text/css" media="all">';
	echo "\n";
	//echo '<link href="http://fonts.googleapis.com/css?family=Dosis:400,500,700,600,800,300" rel="stylesheet" type="text/css">';	
	echo '<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Dosis:300,400,500,600" type="text/css">';	
	echo "\n";
	echo '<link rel="stylesheet" href="'.get_template_directory_uri().'/style.css" type="text/css" media="all">';
}
add_action('wp_head', 'isotopic_get_styles');

//Algumas páginas não exigem nem jquery, então cada dependência é inserida diretamente em cada template e não através de enqueue script.


//Remove bloatcode
remove_action( 'wp_head', 'rsd_link');
remove_action( 'wp_head', 'wlwmanifest_link');
remove_action( 'wp_head', 'wp_generator');
//
remove_action( 'wp_head', 'print_emoji_detection_script', 7 );
remove_action( 'admin_print_scripts', 'print_emoji_detection_script' );
remove_action( 'wp_print_styles', 'print_emoji_styles' );
remove_action( 'admin_print_styles', 'print_emoji_styles' );


//MENU
function register_menus() {
  register_nav_menu('mainMenu', 'Menu Principal');
  register_nav_menu('footerMenu', 'Menu Footer');
}
add_action('init', 'register_menus');


/* 
============================================================================================================
============================================================================================   THEME SUPPORT
============================================================================================================
*/

add_theme_support( 'post-thumbnails' );











/* 
============================================================================================================
===================================================================================================TAXONOMY
============================================================================================================
*/


add_action( 'init', 'project_taxonomies' );

function project_taxonomies() {

	register_taxonomy(
		'type',
		'page',
		array(
			'label' => __( 'Type' ),
			'rewrite' => array( 'slug' => 'type' ),
			'hierarchical' => false,
			'show_admin_column' => true
		)
	);

	register_taxonomy(
		'service',
		'page',
		array(
			'label' => __( 'Service' ),
			'rewrite' => array( 'slug' => 'service' ),
			'hierarchical' => false,
			'show_admin_column' => true
		)
	);

	register_taxonomy(
		'client',
		'page',
		array(
			'label' => __( 'Client' ),
			'rewrite' => array( 'slug' => 'client' ),
			'hierarchical' => false,
			'show_admin_column' => true
		)
	);

}




/* 
============================================================================================================
==================================================================================================== FILTERS
============================================================================================================
*/



//Link "leia mais" sem âncora
function remove_more_link_scroll( $link ) {
	$link = preg_replace( '|#more-[0-9]+|', '', $link );
	return $link;
}
add_filter( 'the_content_more_link', 'remove_more_link_scroll' );


//Remove tags p
remove_filter( 'the_content', 'wpautop' );
remove_filter( 'the_excerpt', 'wpautop' );


//Remove styles da barra de edição pra usuários logados
add_filter('show_admin_bar', '__return_false');












function my_password_form() {
    global $post;
    $label = 'pwbox-'.( empty( $post->ID ) ? rand() : $post->ID );
    $o = '<form action="' . esc_url( site_url( 'wp-login.php?action=postpass', 'login_post' ) ) . '" method="post">
    ' . __( "To view this protected post, enter the password below:" ) . '
    <label for="' . $label . '">' . __( "Password:" ) . ' </label><input name="post_password" id="' . $label . '" type="password" size="20" maxlength="20" /><input type="submit" name="Submit" value="' . esc_attr__( "Submit" ) . '" />
    </form>
    ';
    return $o;
}
add_filter( 'the_password_form', 'my_password_form' );















/*
UTILS
*/


//gera links na front-page
function getPostBasic($_id){
	$about = get_post($_id);
	$title = $about->post_title;
	$slug = $about->post_name;
	$subtitle = get_post_meta($_id, 'post_subtitle', true);
	echo '<a href="'.$slug.'"><p>'. $title . '<span>' . $subtitle. '</span></p></a>';
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
	if( $my_posts ) {
	  return $my_posts[0]->ID;
	}
}






?>