

			<h3>Tags</h3>
			<ul class='taglist'>
			<?php
			$tags = get_tags();
			$separator = "";
			foreach ( $tags as $tag ) {
				$tag_link = get_tag_link( $tag->term_id ); 
				echo $separator.' <a href="'.$tag_link.'">'.$tag->name.'</a>';
				$separator = ',';
			}
			?>
			</ul>