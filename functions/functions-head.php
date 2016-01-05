<?php


/*
Changing the site url from the php
define('WP_HOME','http://www.isotopic.com.br');
define('WP_SITEURL','http://www.isotopic.com.br/wordpress');
*/


// Head enqueues
function isotopic_enqueue_style() {
    wp_enqueue_style( 'bootstrap', get_template_directory_uri().'/css/bootstrap.min.css', false, null );
    wp_enqueue_style( 'fonts', '//fonts.googleapis.com/css?family=Dosis:300,400,500,600', false, null );
    wp_enqueue_style( 'core', get_stylesheet_uri(), array('bootstrap','fonts'), null );
    if(is_singular('post')){
    	wp_enqueue_style( 'prism', get_template_directory_uri().'/css/prism.css', false, null );
    }
}
add_action( 'wp_enqueue_scripts', 'isotopic_enqueue_style' );


// No thanks
remove_action( 'wp_head', 'rsd_link');
remove_action( 'wp_head', 'wlwmanifest_link');
remove_action( 'wp_head', 'wp_generator');
remove_action( 'wp_head', 'print_emoji_detection_script', 7 );
remove_action( 'admin_print_scripts', 'print_emoji_detection_script' );
remove_action( 'wp_print_styles', 'print_emoji_styles' );
remove_action( 'admin_print_styles', 'print_emoji_styles' );


// Menu
function register_menus() {
  register_nav_menu('mainMenu', 'Menu Principal');
  register_nav_menu('footerMenu', 'Menu Footer');
}
add_action('init', 'register_menus');


?>