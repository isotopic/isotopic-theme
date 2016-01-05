<?php

/*
* Customize the dashboard screem with some shortcuts and instructions.
*
*/

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
	#isotopic_widget_content h4{
		font-size: 18px;
		color:#888;
	}		
	#isotopic_widget_content h5{
		font-size: 13px;
		margin-bottom:10px;
	}	
	#isotopic_widget_content p{
		margin-top:5px;
		margin-bottom:5px;
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
			<li><span class="clone-icon clone-icon-menu"></span> <a href="nav-menus.php">Menu</a></li>
		</ul>
		<ul>
			<li><span class="clone-icon clone-icon-edit"></span> <a href="post.php?post=<?php echo $home_id;?>&action=edit">Home</a></li>
			<li><span class="clone-icon clone-icon-edit"></span> <a href="post.php?post=<?php echo $about_id;?>&action=edit">About</a></li>
		</ul>
		<ul>
			<li><span class="clone-icon clone-icon-add"></span> <a href="post-new.php">Blog post</a></li>
			<li><span class="clone-icon clone-icon-add"></span> <a href="post-new.php?post_type=project">Project</a></li>
			<li><span class="clone-icon clone-icon-add"></span> <a href="media-new.php">Media</a></li>
		</ul>
		
		<div>
			<h4>Basic guide</h4>

			<h5>MAIN MENU and HOME links</h5>
			<p>The main menu (header and footer) is edited like a regular nav menu, <a href="nav-menus.php">here</a>.<Br>
				Home links are managed from the home page <a href="post.php?post=<?php echo $home_id;?>&action=edit">itself</a>. <Br>
				Any link can be assigned to the icons as long as they are like this:<br>
				<small>&lt;a href="slug"&gt;&lt;p&gt;Title &lt;span&gt;Description&lt;/span&gt;&lt;/p&gt;&lt;/a&gt;&lt;/p&gt;</small>
			</p>

			<h5>PROJECT items</h5>
			<p> All <a href="edit.php?post_type=project">projects</a> must include a 700×500 featured image.<br>
				Project images must be attached from the media library. <Br>
				Dimensions are 700×500 for desktop samples and 360×640 for mobile samples.<br>
				Mobile images must contain the string “_mobile” in the filename.<br>
			</p>

			<h5>BLOG posts</h5>
			<p> The <a href="edit.php?post_type=project">posts</a> must include the excerpt and a featured image with at least 1200px width.<br>
				Code examples must follow the prismjs syntax highlighting.
			</p>
		</div>

	</div>

 
<?php }
 

function add_widgets() {
    wp_add_dashboard_widget( 'shortcuts_widget_box', 'Shortcuts', 'shortcuts_widget_function' );
}
add_action( 'wp_dashboard_setup', 'add_widgets' );





?>