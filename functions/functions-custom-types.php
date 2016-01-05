<?php

/*
* Custom post types 
* (currently just one: projects) and the custom taxonomies for it.
*/


add_action( 'init', 'create_post_type' );

function create_post_type() {

  register_post_type( 'project',
    array(
      'labels' => array(
        'name' => __( 'Projects' ),
        'singular_name' => __( 'Project' )
      ),
      'menu_position' => 20,
      'public' => true,
      'show_ui' => true,
      'menu_icon' => 'dashicons-portfolio',
      'supports' => array('title','editor','custom-fields', 'thumbnail'),
      'rewrite' => array('slug' => 'projects','with_front' => false),
      'has_archive' => false
    )
  );

}


add_action( 'init', 'project_taxonomies' );

function project_taxonomies() {

	register_taxonomy(
		'type',
		'project',
		array(
			'label' => __( 'Type' ),
			'rewrite' => array( 'slug' => 'type' ),
			'hierarchical' => false,
			'show_admin_column' => true
		)
	);

	register_taxonomy(
		'service',
		'project',
		array(
			'label' => __( 'Service' ),
			'rewrite' => array( 'slug' => 'service' ),
			'hierarchical' => false,
			'show_admin_column' => true
		)
	);

	register_taxonomy(
		'client',
		'project',
		array(
			'label' => __( 'Client' ),
			'rewrite' => array( 'slug' => 'client' ),
			'hierarchical' => false,
			'show_admin_column' => true
		)
	);

}

?>