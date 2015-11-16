<?php
/*

1. HEAD
2. THEME SUPPORT
3. TAXONOMIES
4. FILTERS
5. ADMIN

*/



/*
Changing site url
define('WP_HOME','http://www.isotopic.com.br');
define('WP_SITEURL','http://www.isotopic.com.br/wordpress');
*/



/*
====================================================================================================
==================================================================================================== 1. WP_HEAD
====================================================================================================
*/


//Insere estilos
function isotopic_enqueue_style() {
    wp_enqueue_style( 'bootstrap', get_template_directory_uri().'/css/bootstrap.min.css', false, null );
    wp_enqueue_style( 'fonts', '//fonts.googleapis.com/css?family=Dosis:300,400,500,600', false, null );
    wp_enqueue_style( 'core', get_stylesheet_uri(), array('bootstrap','fonts'), null );
}
add_action( 'wp_enqueue_scripts', 'isotopic_enqueue_style' );



//No thanks
remove_action( 'wp_head', 'rsd_link');
remove_action( 'wp_head', 'wlwmanifest_link');
remove_action( 'wp_head', 'wp_generator');
remove_action( 'wp_head', 'print_emoji_detection_script', 7 );
remove_action( 'admin_print_scripts', 'print_emoji_detection_script' );
remove_action( 'wp_print_styles', 'print_emoji_styles' );
remove_action( 'admin_print_styles', 'print_emoji_styles' );


//Menu
function register_menus() {
  register_nav_menu('mainMenu', 'Menu Principal');
  register_nav_menu('footerMenu', 'Menu Footer');
}
add_action('init', 'register_menus');









/*
====================================================================================================
==================================================================================================== 2. THEME SUPPORT
====================================================================================================
*/

add_theme_support( 'post-thumbnails' );











/*
====================================================================================================
==================================================================================================== 3. TAXONOMIES
====================================================================================================
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
====================================================================================================
==================================================================================================== 4. FILTERS
====================================================================================================
*/

function remove_more_link_scroll( $link ) {
	$link = preg_replace( '|#more-[0-9]+|', '', $link );
	return $link;
}
add_filter( 'the_content_more_link', 'remove_more_link_scroll' );


//Remove tags p
remove_filter( 'the_content', 'wpautop' );
remove_filter( 'the_excerpt', 'wpautop' );


//Remove admin bar styles
add_filter('show_admin_bar', '__return_false');
















/*
====================================================================================================
==================================================================================================== 5. ADMIN
====================================================================================================
*/


//Big thanks to http://jeremyhixon.com/tool/wordpress-meta-box-generator


/* ABOUT PAGE - CUSTOM META BOXES */

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






/* HOME PAGE - CUSTOM META BOXES */
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
	</p>	<p>
		<label for="home_links_bus"><?php _e( 'Bus', 'home_links' ); ?></label><br>
		<input type="text" name="home_links_bus" id="home_links_bus" style="width:100%" value="<?php echo  esc_attr( home_links_get_meta( 'home_links_bus' )); ?>">
	</p>	<p>
		<label for="home_links_ship"><?php _e( 'Ship', 'home_links' ); ?></label><br>
		<input type="text" name="home_links_ship" id="home_links_ship" style="width:100%" value="<?php echo  esc_attr( home_links_get_meta( 'home_links_ship' )); ?>">
	</p>	<p>
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


//"home_links_get_meta( 'home_links_airplane' )



































/* Show/hide specific meta boxes accordingly to the content being edited */


function remove_post_meta_boxes() {

	if(isset($_GET['post'])) {
		$ID = $_GET['post'];
	}else{
		return false;
	}

	$is_page = is_page($ID);


	//Set HOME edit screen
	if(get_option('page_on_front') != $ID){
		remove_meta_box('home_links-home-links', 'post', 'normal');
        remove_meta_box('home_links-home-links', 'page', 'normal');
	}else{
		remove_meta_box('tagsdiv-type', 'post', 'side');
        remove_meta_box('tagsdiv-type', 'page', 'side');
        remove_meta_box('tagsdiv-client', 'post', 'side');
        remove_meta_box('tagsdiv-client', 'page', 'side');
        remove_meta_box('tagsdiv-service', 'post', 'side');
        remove_meta_box('tagsdiv-service', 'page', 'side');
	}


	//Set ABOUT edit screen
    if( $ID != getIdBySlug('about') ) {
        remove_meta_box('about_content-about-content', 'post', 'normal');
        remove_meta_box('about_content-about-content', 'page', 'normal');
    }


    //Set the PROJECT ITEM edit screen
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
			remove_meta_box('postimagediv', 'post', 'advanced');
	        remove_meta_box('postimagediv', 'page', 'advanced');    
		}
	}


	//Not used anywhere
	remove_meta_box('commentstatusdiv', 'post', 'normal');
	remove_meta_box('commentstatusdiv', 'page', 'normal');

    remove_meta_box('slugdiv', 'post', 'normal');
    remove_meta_box('slugdiv', 'page', 'normal');

    remove_meta_box('authordiv', 'post', 'normal');
    remove_meta_box('authordiv', 'page', 'normal');

    remove_meta_box('revisionsdiv', 'post', 'normal');
    remove_meta_box('revisionsdiv', 'page', 'normal');

    remove_meta_box('postcustom', 'post', 'normal');
    remove_meta_box('postcustom', 'page', 'normal');

}

add_action( 'add_meta_boxes', 'remove_post_meta_boxes' );




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








//DASHBOARD shortcuts meta box

function shortcuts_widget_function(){ 

	$home_id = get_option('page_on_front');
	$about_id = getIdBySlug('about');
	$projects_id = getIdBySlug('projects');

	?>

	<style>
	#isotopic_widget_content h2{
		text-align: center;
		border-bottom:1px solid #f0f0f0;
		margin-top:20px !important;
		padding-bottom: 20px !important;
	}	
	#isotopic_widget_content h5{
		margin-bottom:5px;
	}	
	#isotopic_widget_content p{
		margin-top:5px;
		color:#888;
	}
	.clone-icon-menu::before{
		content: "";
	}
	.clone-icon-edit::before{
		content: "";
	}
	.clone-icon-add::before{
		content: "";
	}
	.clone-icon{
	    color: #82878C;
	    font: 400 20px/1 dashicons;
	    display: inline-block;
	    padding: 0px 0px 0px 0px;
	    top: -1px;
	    position: relative;
	    -moz-osx-font-smoothing: grayscale;
	    text-decoration: none !important;
	    vertical-align: top;
	}
	#isotopic_widget_content ul{
		padding:12px;
		width:33%;
		float:left;
		box-sizing: border-box;
	}
	#isotopic_widget_content > div{
		clear:both;
		border-top:1px solid #f0f0f0;
		padding-top:20px;
	}
	</style>

	<div id="isotopic_widget_content">
	 
		<h2><img src="../wp-content/themes/isotopic/img/logo_wide.svg" alt="Isotopic"></h2>

		<ul>
			<li><span class="clone-icon clone-icon-menu"></span> <a href="nav-menus.php">Manage Menu</a></li>
		</ul>
		<ul>
			<li><span class="clone-icon clone-icon-edit"></span> <a href="post.php?post=<?php echo $home_id;?>&action=edit">Edit Home</a></li>
			<li><span class="clone-icon clone-icon-edit"></span> <a href="post.php?post=<?php echo $about_id;?>&action=edit">Edit About</a></li>
		</ul>
		<ul>
			<li><span class="clone-icon clone-icon-add"></span> <a href="post-new.php">Blog post</a></li>
			<li><span class="clone-icon clone-icon-add"></span> <a href="post-new.php?post_type=page&page_parent=<?php echo $projects_id;?>action=edit">Project</a></li><!-- predefined page_parent is a hack! -->
			<li><span class="clone-icon clone-icon-add"></span> <a href="media-new.php">Media</a></li>
		</ul>
		
		<div>
			<h4>General guides</h4>

			<h5>HOME LINKS</h5>
			<p>
				Any link can be assigned to the icons but they must be in this form:<br>
				<small>&lt;a href="slug"&gt;&lt;p&gt;Title &lt;span&gt;Description&lt;/span&gt;&lt;/p&gt;&lt;/a&gt;&lt;/p&gt;</small>
			</p>

			<h5>PROJECT ITEM</h5>
			<p>
				Images must be 700×500 and mobile images 360×640.<br>Mobile images must contain the string “_mobile” in the filename.<br>
				All projects must include a 700x500 featured image.
			</p>
		</div>

	</div>

 
<?php }
 

function add_widgets() {
    wp_add_dashboard_widget( 'shortcuts_widget_box', 'Shortcuts', 'shortcuts_widget_function' );
}
add_action( 'wp_dashboard_setup', 'add_widgets' );








/* 
This allows new-post.php url to accept a get parameter, 'page_parent', so the parent dropdown gets automatically selected 
*/
class Add_Child_Page {
    static function on_load() {
        add_action( 'init', array( __CLASS__, 'init' ) );
        add_action( 'admin_init', array( __CLASS__, 'admin_init' ) );
    }

    static function init() {
        add_action( 'admin_bar_menu', array( __CLASS__, 'admin_bar_menu' ), 90 );
    }

    static function admin_bar_menu( $wp_admin_bar ) {
        if( is_page() ) {
            $wp_admin_bar->add_node( array(
                'id'    => 'add_child_page',
                'title' => 'Add Child Page',
                'href'  => add_query_arg( array( 'post_type'   => 'page', 'page_parent' => get_the_ID() ), admin_url( 'post-new.php' ) ),
            ) );
        }
    }

    static function admin_init() {
        add_filter( 'page_attributes_dropdown_pages_args', array( __CLASS__, 'page_attributes_dropdown_pages_args' ) );
    }

    static function page_attributes_dropdown_pages_args( $dropdown_args ) {
        if ( ! empty($_REQUEST['page_parent']) )
            $dropdown_args['selected'] = (int) $_REQUEST['page_parent'];
        return $dropdown_args;
    }
}
Add_Child_Page::on_load();























//Custom admin login screen
function login_isotopic() { 

	$logo =  'wp-content/themes/isotopic/img/logo.svg';
	
	echo  '<style type="text/css">
        .login #login h1 a {
            background-image: url( '.$logo.' );
        }

        .wp-core-ui .button-primary{
        	border:none !important;
        	background-color:#272F32;
        }

        .login form{
        	box-shadow:none;
        	-webkit-border-radius: 4px;
			-moz-border-radius: 4px;
			border-radius: 4px;
        }
        input[type="text"],input[type="password"] {
        	border:none !important;
        	box-shadow:none;
        	background-color:#f0f0f0 !important;
        	-webkit-border-radius: 3px;
			-moz-border-radius: 3px;
			border-radius: 3px;
        }
        input[type="checkbox"]{
        	border-color:#fff !important;
        	background-color:#f0f0f0;
        }
    </style>';
}
add_action( 'login_enqueue_scripts', 'login_isotopic' );






//I know when to update
function remove_core_updates(){
    global $wp_version;return(object) array('last_checked'=> time(),'version_checked'=> $wp_version,);
}
add_filter('pre_site_transient_update_core','remove_core_updates');
add_filter('pre_site_transient_update_plugins','remove_core_updates');
add_filter('pre_site_transient_update_themes','remove_core_updates');




?>
