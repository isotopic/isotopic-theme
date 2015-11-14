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
	echo '<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Dosis:300,400,500,600" type="text/css">';
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








































/**
 * Generated by the WordPress Meta Box generator
 * at http://jeremyhixon.com/tool/wordpress-meta-box-generator/
 */

function about_content_get_meta( $value ) {
	global $post;

	$field = get_post_meta( $post->ID, $value, true );
	if ( ! empty( $field ) ) {
		return is_array( $field ) ? stripslashes_deep( $field ) : stripslashes( wp_kses_decode_entities( $field ) );
	} else {
		return false;
	}
}

function about_content_add_meta_box() {
	add_meta_box(
		'about_content-about-content',
		__( 'About content', 'about_content' ),
		'about_content_html',
		'page',
		'normal',
		'high'
	);
}
add_action( 'add_meta_boxes', 'about_content_add_meta_box' );

function about_content_html( $post) {
	wp_nonce_field( '_about_content_nonce', 'about_content_nonce' ); ?>

	<p>Html content inside the cards</p>

	<p>
		<label for="about_content_info"><?php _e( 'info', 'about_content' ); ?></label><br>
		<textarea name="about_content_info" id="about_content_info" style="width:100%;min-height:150px"><?php echo about_content_get_meta( 'about_content_info' ); ?></textarea>

	</p>	<p>
		<label for="about_content_skills1"><?php _e( 'skills1', 'about_content' ); ?></label><br>
		<textarea name="about_content_skills1" id="about_content_skills1" style="width:100%;min-height:150px"><?php echo about_content_get_meta( 'about_content_skills1' ); ?></textarea>

	</p>	<p>
		<label for="about_content_skills2"><?php _e( 'skills2', 'about_content' ); ?></label><br>
		<textarea name="about_content_skills2" id="about_content_skills2" style="width:100%;min-height:150px"><?php echo about_content_get_meta( 'about_content_skills2' ); ?></textarea>

	</p>	<p>
		<label for="about_content_skills3"><?php _e( 'skills3', 'about_content' ); ?></label><br>
		<textarea name="about_content_skills3" id="about_content_skills3" style="width:100%;min-height:150px"><?php echo about_content_get_meta( 'about_content_skills3' ); ?></textarea>

	</p>	<p>
		<label for="about_content_timeline"><?php _e( 'timeline', 'about_content' ); ?></label><br>
		<textarea name="about_content_timeline" id="about_content_timeline" style="width:100%;min-height:150px"><?php echo about_content_get_meta( 'about_content_timeline' ); ?></textarea>

	</p><?php
}

function about_content_save( $post_id ) {
	if ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) return;
	if ( ! isset( $_POST['about_content_nonce'] ) || ! wp_verify_nonce( $_POST['about_content_nonce'], '_about_content_nonce' ) ) return;
	if ( ! current_user_can( 'edit_post', $post_id ) ) return;



	$allowed_html = array(
	    'div' => array(
	        'class' => array(),
	        'id' => array()
	    ),
	    'a' => array(
	        'href' => array(),
	        'target' => array()
	    ),
	    'h3' => array(),
	    'h4' => array(),
	    'h5' => array(),
	    'span' => array(),
	    'p' => array(),
	);

	if ( isset( $_POST['about_content_info'] ) )
		update_post_meta( $post_id, 'about_content_info', wp_kses( $_POST['about_content_info'], $allowed_html ) );
	if ( isset( $_POST['about_content_skills1'] ) )
		update_post_meta( $post_id, 'about_content_skills1', wp_kses( $_POST['about_content_skills1'], $allowed_html ) );
	if ( isset( $_POST['about_content_skills2'] ) )
		update_post_meta( $post_id, 'about_content_skills2', wp_kses( $_POST['about_content_skills2'], $allowed_html ) );
	if ( isset( $_POST['about_content_skills3'] ) )
		update_post_meta( $post_id, 'about_content_skills3', wp_kses( $_POST['about_content_skills3'], $allowed_html ) );
	if ( isset( $_POST['about_content_timeline'] ) )
		update_post_meta( $post_id, 'about_content_timeline', wp_kses( $_POST['about_content_timeline'], $allowed_html ) );
}
add_action( 'save_post', 'about_content_save' );

/*
	Usage: about_content_get_meta( 'about_content_info' )
	Usage: about_content_get_meta( 'about_content_skills1' )
	Usage: about_content_get_meta( 'about_content_skills2' )
	Usage: about_content_get_meta( 'about_content_skills3' )
	Usage: about_content_get_meta( 'about_content_timeline' )
*/
























/* Mostrar meta boxes apropriados de acordo com o conteúdo sendo editado */
add_action( 'add_meta_boxes', 'remove_post_meta_boxes' );



function remove_post_meta_boxes() {


	if(isset($_GET['post'])) {
		$ID = $_GET['post'];
	}else{
		return false;
	}

	$is_page = is_page($ID);


	//Home
	if(get_option('page_on_front') == $ID){
        remove_meta_box('postcustom', 'post', 'normal');
        remove_meta_box('postcustom', 'page', 'normal');
        remove_meta_box('postimagediv', 'post', 'normal');
        remove_meta_box('postimagediv', 'page', 'normal');        
        remove_meta_box('pageparentdiv', 'post', 'normal');
        remove_meta_box('pageparentdiv', 'page', 'normal');
	}


	//ABOUT
    if( $ID != getIdBySlug('about') ) {
        remove_meta_box('about_content-about-content', 'post', 'normal');
        remove_meta_box('about_content-about-content', 'page', 'normal');
    }else{
        remove_meta_box('postcustom', 'post', 'normal');
        remove_meta_box('postcustom', 'page', 'normal');
    }



    //ITENS DE PROJETOS
    $projects_id = getIdBySlug('projects');
	$ancestors =  get_post_ancestors( $ID );
	if( count($ancestors)>0 && $ancestors[0]==$projects_id ){
		remove_meta_box('postcustom', 'post', 'normal');
        remove_meta_box('postcustom', 'page', 'normal');
	}else{
		remove_meta_box('tagsdiv-type', 'post', 'normal');
        remove_meta_box('tagsdiv-type', 'page', 'normal');
        remove_meta_box('tagsdiv-client', 'post', 'normal');
        remove_meta_box('tagsdiv-client', 'page', 'normal');
        remove_meta_box('tagsdiv-service', 'post', 'normal');
        remove_meta_box('tagsdiv-service', 'page', 'normal');

        if(!$is_post){
			remove_meta_box('postimagediv', 'post', 'normal');
	        remove_meta_box('postimagediv', 'page', 'normal');    
		}

	}








	//Remover de tudo
	remove_meta_box('commentstatusdiv', 'post', 'normal');
	remove_meta_box('commentstatusdiv', 'page', 'normal');

    remove_meta_box('slugdiv', 'post', 'normal');
    remove_meta_box('slugdiv', 'page', 'normal');

    remove_meta_box('authordiv', 'post', 'normal');
    remove_meta_box('authordiv', 'page', 'normal');



/*

        remove_meta_box('tagsdiv-post_tag', 'post', 'normal');
        remove_meta_box('categorydiv', 'post', 'normal');
        remove_meta_box('postimagediv', 'post', 'normal');
        remove_meta_box('authordiv', 'post', 'normal');
        remove_meta_box('authordiv', 'page', 'normal');
        remove_meta_box('postexcerpt', 'post', 'normal');
        remove_meta_box('trackbacksdiv', 'post', 'normal');
        remove_meta_box('commentstatusdiv', 'post', 'normal');
        remove_meta_box('commentstatusdiv', 'page', 'normal');
        remove_meta_box('postcustom', 'post', 'normal');
        remove_meta_box('postcustom', 'page', 'normal');
        remove_meta_box('revisionsdiv', 'post', 'normal');

        remove_meta_box('postimagediv', 'post', 'normal');
        remove_meta_box('postimagediv', 'page', 'normal');

    */

}



















/*
UTILS
*/


//gera links na front-page
function getPostBasic($_id){
	if ($_id==false){
		return '<a href="#"><p>Title<span>Subtitle</span></p></a>';
	}
	$about = get_post($_id);
	$title = $about->post_title;
	$slug = $about->post_name;
	$subtitle = get_post_meta($_id, 'post_subtitle', true);
	return '<a href="'.$slug.'"><p>'. $title . '<span>' . $subtitle. '</span></p></a>';
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
