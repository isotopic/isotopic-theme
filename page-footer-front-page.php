<div class="page-footer page-footer-frontpage">
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
				    	echo "\n\t\t\t<ul>";
					    foreach($recent_posts as $post){
					    	echo "\n\t\t\t\t";
					    	echo '<li><a href="blog/'.$post['post_name'].'">'.$post['post_title'].'</a></li>';
					    }
					    echo "\n\t\t\t</ul>";
				    }

				?>

			</div>


			<div class="col-sm-6 footer-language hidden">
				<h4>Language</h4>
				<ul>
					<li><span class="glyphicon glyphicon-ok hidden" style="font-size:10px" aria-hidden="true"></span> <a href="#">Português</a></li>
					<li><a href="#">English</a></li>
				</ul>
			</div>

			<hr>

			<div class="col-sm-12 footer-icons">
				<a href="http://br.linkedin.com/in/isotopic" target="_blank"><img src="<?php echo get_template_directory_uri(); ?>/img/linkedin.png"></a>
				<a href="https://github.com/isotopic" target="_blank"><img src="<?php echo get_template_directory_uri(); ?>/img/github.png"></a>
			</div>


		</div>
	</div>
</div>