

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
			$separator = "";
			foreach ( $tags as $tag ) {
				$tag_link = get_tag_link( $tag->term_id ); 
				echo $separator.' <a href="'.$tag_link.'" class="tag-pill">'.$tag->name.'</a>';
				//$separator = ',';
			}
			?>
			</ul>