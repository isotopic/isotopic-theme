<?php

/* 
* Custom meta boxes for specific pages: about, home and project
*
* http://jeremyhixon.com/tool/wordpress-meta-box-generator
*/



/* ABOUT PAGE  */
function about_content_get_meta($value) {
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
		<label for="about_content_info" style="font-weight:bold"><?php _e( 'Info', 'about_content' ); ?></label><br>
		<textarea name="about_content_info" id="about_content_info" style="width:100%;min-height:150px"><?php echo about_content_get_meta( 'about_content_info' ); ?></textarea>

	</p>	<p>
		<label for="about_content_skills1" style="font-weight:bold"><?php _e( 'Skills: Interaction Design', 'about_content' ); ?> </label><br>
		<textarea name="about_content_skills1" id="about_content_skills1" style="width:100%;min-height:150px"><?php echo about_content_get_meta( 'about_content_skills1' ); ?></textarea>

	</p>	<p>
		<label for="about_content_skills2" style="font-weight:bold"><?php _e( 'Skills: Front-end', 'about_content' ); ?> </label><br>
		<textarea name="about_content_skills2" id="about_content_skills2" style="width:100%;min-height:150px"><?php echo about_content_get_meta( 'about_content_skills2' ); ?></textarea>

	</p>	<p>
		<label for="about_content_skills3" style="font-weight:bold"><?php _e( 'Skills: Back-end', 'about_content' ); ?> </label><br>
		<textarea name="about_content_skills3" id="about_content_skills3" style="width:100%;min-height:150px"><?php echo about_content_get_meta( 'about_content_skills3' ); ?></textarea>

	</p>	<p>
		<label for="about_content_timeline"><?php _e( 'Timeline', 'about_content' ); ?></label><br>
		<textarea name="about_content_timeline" id="about_content_timeline" style="width:100%;min-height:350px"><?php echo about_content_get_meta( 'about_content_timeline' ); ?></textarea>

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
//about_content_get_meta( 'about_content_info' )










/* HOME PAGE */
function home_links_get_meta( $value ) {
	global $post;

	$field = get_post_meta( $post->ID, $value, true );
	if ( ! empty( $field ) ) {
		return is_array( $field ) ? stripslashes_deep( $field ) : stripslashes( wp_kses_decode_entities( $field ) );
	} else {
		return false;
	}
}

function home_links_add_meta_box() {
	add_meta_box(
		'home_links-home-links',
		__( 'Home Links', 'home_links' ),
		'home_links_html',
		'page',
		'normal',
		'high'
	);
}
add_action( 'add_meta_boxes', 'home_links_add_meta_box' );

function home_links_html( $post) {
	wp_nonce_field( '_home_links_nonce', 'home_links_nonce' ); ?>

	<p>The links for each transportation icon. They must follow the html format: <br>

		<pre style="color:#888">&lt;a href="slug_or_url"&gt; &lt;p&gt; Title &lt;span&gt;Description&lt;/span&gt; &lt;/p&gt; &lt;/a&gt;</pre>

	<p>
		<label for="home_links_airplane"><?php _e( 'Airplane', 'home_links' ); ?></label><br>
		<input type="text" name="home_links_airplane" id="home_links_airplane" style="width:100%" value="<?php echo  esc_attr( home_links_get_meta( 'home_links_airplane' )); ?>">
	</p>	
	<p>
		<label for="home_links_bus"><?php _e( 'Bus', 'home_links' ); ?></label><br>
		<input type="text" name="home_links_bus" id="home_links_bus" style="width:100%" value="<?php echo  esc_attr( home_links_get_meta( 'home_links_bus' )); ?>">
	</p>	
	<p>
		<label for="home_links_ship"><?php _e( 'Ship', 'home_links' ); ?></label><br>
		<input type="text" name="home_links_ship" id="home_links_ship" style="width:100%" value="<?php echo  esc_attr( home_links_get_meta( 'home_links_ship' )); ?>">
	</p>	
	<p>
		<label for="home_links_train"><?php _e( 'Train', 'home_links' ); ?></label><br>
		<input type="text" name="home_links_train" id="home_links_train" style="width:100%" value="<?php echo  esc_attr( home_links_get_meta( 'home_links_train' )); ?>">
	</p><?php
}

function home_links_save( $post_id ) {
	if ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) return;
	if ( ! isset( $_POST['home_links_nonce'] ) || ! wp_verify_nonce( $_POST['home_links_nonce'], '_home_links_nonce' ) ) return;
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
	if ( isset( $_POST['home_links_airplane'] ) )
		update_post_meta( $post_id, 'home_links_airplane', wp_kses( $_POST['home_links_airplane'], $allowed_html ) );
	if ( isset( $_POST['home_links_bus'] ) )
		update_post_meta( $post_id, 'home_links_bus', wp_kses( $_POST['home_links_bus'], $allowed_html ) );
	if ( isset( $_POST['home_links_ship'] ) )
		update_post_meta( $post_id, 'home_links_ship', wp_kses( $_POST['home_links_ship'], $allowed_html ) );
	if ( isset( $_POST['home_links_train'] ) )
		update_post_meta( $post_id, 'home_links_train', wp_kses( $_POST['home_links_train'], $allowed_html ) );
}
add_action( 'save_post', 'home_links_save' );











/* PROJECT PAGE (custom post type) */

function project_url_get_meta( $value ) {
	global $post;

	$field = get_post_meta( $post->ID, $value, true );
	if ( ! empty( $field ) ) {
		return is_array( $field ) ? stripslashes_deep( $field ) : stripslashes( wp_kses_decode_entities( $field ) );
	} else {
		return false;
	}
}

function project_url_add_meta_box() {
	add_meta_box(
		'project_url-project-url',
		__( 'Project URL', 'project_url' ),
		'project_url_html',
		'project',
		'normal',
		'default'
	);
}
add_action( 'add_meta_boxes', 'project_url_add_meta_box' );

function project_url_html( $post) {
	wp_nonce_field( '_project_url_nonce', 'project_url_nonce' ); ?>

	<p>The absolute project's url. If left blank, the button will say "offline".</p>

	<p>
		<input type="text" placeholder="http://www..." name="project_url_project_url" id="project_url_project_url"  style="width:100%" value="<?php echo project_url_get_meta( 'project_url_project_url' ); ?>">
	</p><?php
}

function project_url_save( $post_id ) {
	if ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) return;
	if ( ! isset( $_POST['project_url_nonce'] ) || ! wp_verify_nonce( $_POST['project_url_nonce'], '_project_url_nonce' ) ) return;
	if ( ! current_user_can( 'edit_post', $post_id ) ) return;

	if ( isset( $_POST['project_url_project_url'] ) )
		update_post_meta( $post_id, 'project_url_project_url', esc_attr( $_POST['project_url_project_url'] ) );
}
add_action( 'save_post', 'project_url_save' );

//project_url_get_meta( 'project_url_project_url' )


?>