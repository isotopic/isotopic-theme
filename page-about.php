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

		</div>
	</div>
</div>






<div class="content-panel about-content">
	<div class="container">
		<div class="row">

			<div class="col-md-6 no-padding no-margin">

				<div class="about-item col-sm-12">
					<div class="about-item-wrapper about-info">

						<h3>Info</h3>


						<div class="about-info-header">
							<img src="<?php echo get_template_directory_uri(); ?>/img/about-avatar.png" class="img-circle">
							<h4>Guilherme Cruz <span>Web Developer</span></h4>
						</div>


						<div class="about-info-content">


							<?php echo about_content_get_meta( 'about_content_info' ); ?>


							<div class="about-info-social">
								<a href="mailto:guilhermecruz@gmail.com"><img src="<?php echo get_template_directory_uri(); ?>/img/email.png"></a>
								<a href="http://br.linkedin.com/in/isotopic" target="_blank"><img src="<?php echo get_template_directory_uri(); ?>/img/linkedin.png"></a>
								<a href="https://github.com/isotopic" target="_blank"><img src="<?php echo get_template_directory_uri(); ?>/img/github.png"></a>
							</div>


						</div>

					</div>
				</div>




				<div class="about-item col-sm-12">
					<div class="about-item-wrapper about-skills">

						<h3>Skills</h3>

						<h4><img src="<?php echo get_template_directory_uri(); ?>/img/about1.png"> Interaction Design</h4>

						<?php echo about_content_get_meta( 'about_content_skills1' ); ?>

						<h4><img src="<?php echo get_template_directory_uri(); ?>/img/about2.png"> Frontend Development</h4>

						<?php echo about_content_get_meta( 'about_content_skills2' ); ?>

						<h4><img src="<?php echo get_template_directory_uri(); ?>/img/about3.png"> Backend Development</h4>

						<?php echo about_content_get_meta( 'about_content_skills3' ); ?>

					</div>
				</div>


			</div>













			<div class="col-md-6  no-padding no-margin">

				<div class="about-item col-sm-12">
					<div class="about-item-wrapper">
						<h3>Timeline</h3>


						<div class="about-timeline" style="">

								<?php echo about_content_get_meta( 'about_content_timeline' ); ?>

						</div>


					</div>
				</div>




				<div class="about-item col-sm-12 ">
					<div class="about-item-wrapper about-contact">

						<h3>Contact</h3>

						<img src="<?php echo get_template_directory_uri(); ?>/img/dotmap.png" class="img-responsive" >
						
						<h5>Guilherme Cruz <span>São Paulo, Brasil</span></h5>
						<p><a href="mailto:guilhermecruz@gmail.com">guilhermecruz@gmail.com</a></p>

						<div class="clearfix"></div>

					</div>
				</div>


				<div class="about-item col-sm-12  hidden">
					<div class="about-item-wrapper about-personal">

						<h3>Personal</h3>
						<div class="about-item col-xs-2">
							<p> <img src="<?php echo get_template_directory_uri(); ?>/img/about1.png" class="img-responsive"></p>
						</div>
						<div class="about-item col-xs-2">
							<p> <img src="<?php echo get_template_directory_uri(); ?>/img/about1.png" class="img-responsive"></p>
						</div>
						<div class="about-item col-xs-2">
							<p> <img src="<?php echo get_template_directory_uri(); ?>/img/about1.png" class="img-responsive"></p>
						</div>
						<div class="about-item col-xs-2">
							<p> <img src="<?php echo get_template_directory_uri(); ?>/img/about1.png" class="img-responsive"></p>
						</div>
						<div class="about-item col-xs-2">
							<p> <img src="<?php echo get_template_directory_uri(); ?>/img/about1.png" class="img-responsive"></p>
						</div>
						<div class="about-item col-xs-2">
							<p> <img src="<?php echo get_template_directory_uri(); ?>/img/about1.png" class="img-responsive"></p>
						</div>
						<div class="clearfix"></div>

					</div>
				</div>




				<div class="about-item col-sm-12 hidden">
					<div class="about-item-wrapper about-pdf">

						<h3>PDF version</h3>
						<div class="about-item col-xs-2">
							<p> <img src="<?php echo get_template_directory_uri(); ?>/img/about1.png" class="img-responsive"></p>
						</div>
						<div class="clearfix"></div>

					</div>
				</div>





			</div>

		</div>

	</div>

</div>









<?php
get_template_part( 'page', 'footer' );
get_footer();
?>
