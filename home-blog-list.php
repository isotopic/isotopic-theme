<?php // Listagem de posts


	if (have_posts()){ 

		$separator = "";

	    while (have_posts()){ 

			the_post();

			//Post vars
			$permalink = get_permalink();
			$title = get_the_title();
			$content = get_the_content("Open full");
			$date = get_the_date( $d );

			//image
			$img_url = wp_get_attachment_image_src( get_post_thumbnail_id( $ID ), 'full' );

			
			//Render

			echo $separator;

			if($img_url!=false){
				echo '<img src="'.$img_url[0].'" class="img-responsive custom-post-image">';
			}

			echo '<h2><a href="'.$permalink.'">'.$title.'</a> </h2>';


			//<span>'.$date.'</span>



			echo the_excerpt();
			/*
			echo "\n\t".'Comments: [<a href="'.$permalink.'"> ';
			comments_number('0','1','%');
			echo ' </a>]';
			*/

			$separator = "<hr>";

	    }

	}

?>