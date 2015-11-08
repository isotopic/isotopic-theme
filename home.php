<?php 
get_header(); 
get_template_part( 'page', 'header' ); 
?>




<div class="toolbar">
	<div class="container">
		<div class="row">

			<div class="col-xs-4 text-left" >
				<a href="<?php echo home_url();?>">
					<div class="toolbar-pill">
						<svg style="margin:0 0 -1px 0;" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"  width="10" height="16">
						    <path d="M6,5 L2,10 L6,15" style="stroke:#999; fill:none;" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="3"/>
						</svg>
					  home</div>
				</a>
			</div>

			<div class="col-xs-8 text-right" >
				<!--<h3>Blog</h3>-->
			</div>


		</div><!-- /row -->
	</div><!-- /container -->
</div><!-- /toolbar -->






<?php
/*
<h4>cats</h4>
			<ul>
			<?php
			$categories = get_categories(array('orderby' => 'name','order' => 'ASC'));
			foreach ($categories as $category) {
				$category_link = get_category_link( $category->cat_ID );
				echo "\n\t".'<li><a href="'.$category_link.'">'.$category->cat_name.'</a></li>';
			}
			?>
			</ul>
*/
?>











<div class="content-panel blog-content">
	<div class="container">


		<div class="row">

			<div class="col-sm-7 blog-list">

			<?php

			if (have_posts()){ 

			    while (have_posts()){ 

			     	//Iterator
				the_post();

				//Post vars
				$permalink = get_permalink();
				$title = get_the_title();
				$content = get_the_content("Open full");
				$date = get_the_date( $d );
				
				//Render
				echo '<h2><a href="'.$permalink.'">'.$title.'</a> </h2>';

				//<span>'.$date.'</span>

				echo "\n\t".'<p>'.$content.'</p>';
				/*
				echo "\n\t".'Comments: [<a href="'.$permalink.'"> ';
				comments_number('0','1','%');
				echo ' </a>]';
				*/



			    }

			}

			?>

			</div>





			<div class="col-sm-5 blog-side text-right">

				<h2>Tags</h2>
				<?php 
				$tags = get_tags();
				foreach ( $tags as $tag ) { $tag_link = get_tag_link( $tag->term_id ); ?>
							
					<a class="tag-pill" href="<?php echo $tag_link;?>"><?php echo  $tag->name;?></a>

				<?php } ?> 
			</div>




		</div><!-- row -->





		<div class="row">
			<div class="col-sm-12">
				<?php
				echo get_previous_posts_link( "Previous posts" )."  ";
				echo get_next_posts_link( "More posts" );
				?>
			</div>
		</div>


	</div>

</div>








<?php

get_template_part( 'page', 'footer' ); 
get_footer(); 

?>