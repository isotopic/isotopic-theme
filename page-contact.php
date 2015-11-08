<?php
get_header(); 
get_template_part( 'page', 'header' ); 
 ?>


<div class="toolbar">
	<div class="container">
		<div class="row">

			<div class="col-xs-6 text-left" >
				<a href="<?php echo home_url();?>">
					<div class="toolbar-pill">
						<svg style="margin:0 0 -1px 0;" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"  width="10" height="16">
						    <path d="M6,5 L2,10 L6,15" style="stroke:#999; fill:none;" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="3"/>
						</svg>
					  home</div>
				</a>
			</div>	

			<div class="col-xs-6 text-right" > 

				
			</div>

		</div><!-- /row -->
	</div><!-- /container -->
</div><!-- /toolbar -->






<div class="content-panel contact-content">
	<div class="container">
		<div class="row">


			<div class="col-sm-6 text-center" >
			</div>

			<div class="col-sm-6 text-right" >
				<img src="<?php echo get_template_directory_uri(); ?>/img/dotmap.png" class="img-responsive" >
				<h3>Guilherme Cruz</h3>
				<h4>São Paulo, Brasil</h4>
				<p><a href="mailto:guilhermecruz@gmail.com">guilhermecruz@gmail.com</a></p>
				<p><a href="https://br.linkedin.com/in/isotopic" target="_blank">linkedin</a></p>
				<p><a href="https://github.com/isotopic" target="_blank">github</a></p>
			</div>

			

		</div>
	</div>
</div>



























<?php
get_template_part( 'page', 'footer' ); 
get_footer(); 
?>