<div class="page-footer">
	<div class="container">
		<div class="row">


			<div class="col-sm-6 footer-posts">

				<h4>Latest blog posts</h4>
				
				<?php $args = array(
				    'numberposts' => 4,
				    'offset' => 0,
				    'category' => 0,
				    'orderby' => 'post_date',
				    'order' => 'DESC',
				    //'include' => ,
				    //'exclude' => ,
				    //'meta_key' => ,
				    //'meta_value' =>,
				    'post_type' => 'post',
				    'post_status' => 'publish',
				    'suppress_filters' => true );

				    $recent_posts = wp_get_recent_posts( $args, ARRAY_A );

				    if (count($recent_posts) ){
				    	echo "\n<ul>";
					    foreach($recent_posts as $post){
					    	echo "\n";
					    	echo '<li><a href="'.home_url().'/blog/'.$post['post_name'].'">'.$post['post_title'].'</a></li>';
					    }
					    echo "\n</ul>";
				    }

				?>

			</div>


			<div class="col-sm-6 footer-language hidden">
				<h4>Language</h4>
				<ul>
					<li><span class="glyphicon glyphicon-ok" style="font-size:10px" aria-hidden="true"></span> <a href="#">Português</a></li>
					<li><a href="#">English</a></li>
				</ul>
			</div>

			<hr>
			
			<div class="col-md-6">
				<?php 
				$footerMenuConfig = array(
					'theme_location'  => 'footerMenu',
					'menu'            => 'mainMenu',
					'container'       => 'nav',
					'container_class' => 'footer-menu',
					'container_id'    => '',
					'menu_class'      => '',
					'menu_id'         => 'footer-nav',
					'echo'            => true,
					'items_wrap'      => '<ul>%3$s</ul>',
					'depth'           => 0,
					'walker'          => new Walker_Custom_Footer()
				);

				//Usando walker as tags saem mais limpas
				class Walker_Custom_Footer extends Walker_Nav_Menu {

				    function start_lvl(&$output, $depth=0, $args=array()) {
				        $output .= "\n\t<ul>\n";
				    }

				    function end_lvl(&$output, $depth=0, $args=array()) {
				        $output .= "\n\t\t</ul>\n";
				    }

				    function start_el(&$output, $item, $depth=0, $args=array()) {
				        $output .= "\n\t\t<li class='".implode($item->classes, ' ')."'><a href='".$item->url."'>".$item->title."</a>";
				    }

				    function end_el(&$output, $item, $depth=0, $args=array()) {
				        $output .= "</li>";
				    }
				}

				wp_nav_menu( $footerMenuConfig );
				?>

			</div>



			<div class="col-md-6 footer-icons">
				<a href="http://br.linkedin.com/in/isotopic" target="_blank"><img src="<?php echo get_template_directory_uri(); ?>/img/linkedin.png"></a>
				<a href="https://github.com/isotopic" target="_blank"><img src="<?php echo get_template_directory_uri(); ?>/img/github.png"></a>
			</div>




		</div>
	</div>
</div>