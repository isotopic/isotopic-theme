<?php

$title = strtolower(get_the_title( $ID )); 

?>


<div class="page-top">
	<div class="container">
		<h2><?php 

			 if(is_home()){
				echo "blog";
			} else if (is_tag()){
				echo  single_tag_title('tagged: ');
			}else if (is_category()){
				echo  single_cat_title('category: ');
			}else if (is_404()){
				echo  "404";
			}else if (is_singular('post')){
				echo "blog";//echo $title;
			}else{
				echo $title;
			}

		?></h2>
	</div>
</div>