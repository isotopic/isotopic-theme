<?php 
get_header(); 
get_template_part( 'page', 'header' ); 
?>




<div class="toolbar">
	<div class="container">
		<div class="row">

			<div class="col-xs-4 text-left" >
				<a href="<?php echo home_url();?>/blog">
					<div class="toolbar-pill">
						<svg style="margin:0 0 -1px 0;" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"  width="10" height="16">
						    <path d="M6,5 L2,10 L6,15" style="stroke:#999; fill:none;" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="3"/>
						</svg>
					  blog</div>
				</a>
			</div>

			<div class="col-xs-8 text-right" >
				<!--<h3>Blog</h3>-->
			</div>


		</div><!-- /row -->
	</div><!-- /container -->
</div><!-- /toolbar -->









<div class="content-panel blog-content">
	<div class="container">

		<div class="row">

			<div class="col-sm-7 blog-list">

				<?php get_template_part( 'home', 'blog-list'); ?>


				<div class="col-sm-12 blog-pagination">
					<div class="col-sm-6 text-left">
						<?php echo get_previous_posts_link( "Previous posts" ); ?>
					</div>			
					<div class="col-sm-6 text-right">
						<?php echo get_next_posts_link( "More posts" );?>
					</div>
				</div>


			</div>


			
			<div class="col-sm-5 blog-side">
				<?php get_template_part( 'home', 'blog-side-tags'); ?>
			</div>
			


		</div><!-- row -->



	</div>
</div>








<?php

get_template_part( 'page', 'footer' ); 
get_footer(); 

?>