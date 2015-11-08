<?php
get_header(); 
get_template_part( 'page', 'header' ); 
?>




<div class="container ">
	<div role="col-6-sm">
		<?php while ( have_posts() ) : the_post(); ?>
			<?php  the_content(); ?>
		<?php endwhile; ?>
	</div>
</div>




<?php get_footer(); ?>