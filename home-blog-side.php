
			<ul>
			<?php

				$categories = get_categories(array('orderby' => 'name','order' => 'ASC'));
				foreach ($categories as $category) {
					$category_link = get_category_link( $category->cat_ID );
					$active = ($cat == $category->cat_ID ? 'class="active"' : '' );
					echo "\n\t".'<li><a '.$active.' href="'.$category_link.'">'.$category->cat_name.'</a></li>';
				}
			?>
			
			<?php /*
			<h4>Tags</h4>
			$tags = get_tags();
			$separator = "";
			foreach ( $tags as $tag ) {
				$tag_link = get_tag_link( $tag->term_id ); 
				echo $separator.' <a href="'.$tag_link.'">'.$tag->name.'</a>';
				$separator = ',';
			}*/ ?>
			</ul>