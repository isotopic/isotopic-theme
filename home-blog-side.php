

			<h3>Categories</h3>
			<ul>
			<?php

				$categories = get_categories(array('orderby' => 'name','order' => 'ASC'));
				foreach ($categories as $category) {
					$category_link = get_category_link( $category->cat_ID );
					$active = ($cat == $category->cat_ID ? 'class="active"' : '' );
					echo "\n\t".'<li><a '.$active.' href="'.$category_link.'">'.$category->cat_name.'</a></li>';
				}
			?>
			</ul>



			<h3>Tags</h3>
			<ul class='taglist'>
			<?php
			$tags = get_tags();
			$current_tag = ( is_tag() ? single_tag_title('',false) : 'n');
			foreach ( $tags as $tag ) {
				$tag_link = get_tag_link( $tag->term_id ); 
				$active_class = ($current_tag == $tag->slug ? 'active' : '' );
				echo '<li><a href="'.$tag_link.'" class="tag-pill '.$active_class.'">'.$tag->name.'</a></li>';
			}
			?>
			</ul>