<?php get_header(); ?>


<div id="scroller"></div>


<div id="holder">


	<div id="home_intro">
		
<?php while ( have_posts() ) : the_post(); ?>
			<?php the_content(); ?>
		<?php endwhile; ?>

		<svg id="throbber" width="44" height="44" viewBox="0 0 44 44" xmlns="http://www.w3.org/2000/svg" stroke="#fff"><g fill="none" fill-rule="evenodd" stroke-width="2"><circle cx="22" cy="22" r="1"><animate attributeName="r" begin="0s" dur="1.8s" values="1; 20" calcMode="spline" keyTimes="0; 1" keySplines="0.165, 0.84, 0.44, 1" repeatCount="indefinite" /><animate attributeName="stroke-opacity" begin="0s" dur="1.8s" values="1; 0" calcMode="spline" keyTimes="0; 1" keySplines="0.3, 0.61, 0.355, 1" repeatCount="indefinite" /></circle><circle cx="22" cy="22" r="1"><animate attributeName="r" begin="-0.9s" dur="1.8s" values="1; 20" calcMode="spline" keyTimes="0; 1" keySplines="0.165, 0.84, 0.44, 1" repeatCount="indefinite" /><animate attributeName="stroke-opacity" begin="-0.9s" dur="1.8s" values="1; 0" calcMode="spline" keyTimes="0; 1" keySplines="0.3, 0.61, 0.355, 1" repeatCount="indefinite" /></circle></g></svg>
	</div>


	<div class="home-item" id="item_airplane">
		<svg xmlns="http://www.w3.org/2000/svg"  class="home-item-icon" width="60" height="60"  xmlns:xlink="http://www.w3.org/1999/xlink">
			<path   id="baseicon" fill-rule="evenodd" clip-rule="evenodd" fill="#EFEFEF" d="M23.75,0c6.533,0,12.117,2.3,16.75,6.9 c4.667,4.667,7,10.283,7,16.85c0,5.6-1.7,10.483-5.1,14.65c-0.367,0.433-0.75,0.883-1.15,1.35l-13.8,16.1 c-1.034,1.034-2.267,1.55-3.7,1.55s-2.667-0.517-3.7-1.55l-13.8-16.1c-0.4-0.467-0.8-0.917-1.2-1.35C1.683,34.233,0,29.35,0,23.75 C0,17.183,2.333,11.566,7,6.9C11.6,2.3,17.183,0,23.75,0z"/>
			<g id="airplane">
				<path display="inline" fill-rule="evenodd" clip-rule="evenodd" fill="#2B3A42" d="M37.509,9.85c3.867,3.867,5.8,8.534,5.8,14 c0,5.434-1.933,10.067-5.8,13.9c-3.867,3.867-8.517,5.8-13.95,5.8s-10.083-1.933-13.95-5.8c-3.833-3.833-5.75-8.467-5.75-13.9 c0-5.466,1.917-10.133,5.75-14c3.867-3.833,8.517-5.75,13.95-5.75S33.642,6.017,37.509,9.85z M25.108,11.15 c0-0.5-0.167-0.9-0.5-1.2c-0.267-0.233-0.617-0.35-1.05-0.35c-0.433-0.033-0.783,0.083-1.05,0.35c-0.367,0.267-0.55,0.65-0.55,1.15 v8.6l-11.75,7.2v3.15l11.9-3.9v6.35l-2.75,2.2v2.55l4.3-1.35l4.25,1.35V34.7l-2.75-2.2v-6.35l11.95,3.9V26.9l-12-7.2V11.15z"/>
			</g>
		</svg>
		<?php  echo home_links_get_meta( 'home_links_airplane' ); ?>
	</div>
	<div class="home-item " id="item_bus">
		<svg xmlns="http://www.w3.org/2000/svg"  class="home-item-icon" width="60" height="60"  xmlns:xlink="http://www.w3.org/1999/xlink">
			<path id="baseicon" fill-rule="evenodd" clip-rule="evenodd" fill="#EFEFEF" d="M23.75,0c6.533,0,12.117,2.3,16.75,6.9 c4.667,4.667,7,10.283,7,16.85c0,5.6-1.7,10.483-5.1,14.65c-0.367,0.433-0.75,0.883-1.15,1.35l-13.8,16.1 c-1.034,1.034-2.267,1.55-3.7,1.55s-2.667-0.517-3.7-1.55l-13.8-16.1c-0.4-0.467-0.8-0.917-1.2-1.35C1.683,34.233,0,29.35,0,23.75 C0,17.183,2.333,11.566,7,6.9C11.6,2.3,17.183,0,23.75,0z"/>
			<g id="bus">
				<path fill-rule="evenodd" clip-rule="evenodd" fill="#2B3A42" d="M14.75,14.5l-0.95,7.4v10.2h1.65v1.6c0,0.467,0.15,0.833,0.45,1.1 c0.267,0.267,0.6,0.4,1,0.4c0.367,0,0.684-0.133,0.95-0.4c0.3-0.267,0.45-0.633,0.45-1.1v-1.6h10.75v1.6 c0,0.467,0.15,0.833,0.45,1.1c0.267,0.267,0.6,0.4,1,0.4s0.733-0.133,1-0.4c0.3-0.267,0.45-0.633,0.45-1.1v-1.6h1.65V21.9l-1-7.4 c-0.1-0.6-0.367-1.1-0.8-1.5c-0.333-0.3-0.867-0.6-1.6-0.9c-0.667-0.267-1.65-0.533-2.95-0.8c-1.3-0.233-2.45-0.35-3.45-0.35 c-0.033,0-0.066,0-0.1,0h-0.1c-1.033,0-2.2,0.117-3.5,0.35c-1.267,0.267-2.25,0.533-2.95,0.8c-0.7,0.3-1.217,0.6-1.55,0.9 C15.167,13.4,14.883,13.9,14.75,14.5z M19.15,13c0.133-0.133,0.283-0.2,0.45-0.2h8.15c0.2,0,0.35,0.067,0.45,0.2 c0.1,0.1,0.15,0.233,0.15,0.4c0,0.167-0.05,0.3-0.15,0.4c-0.1,0.133-0.25,0.2-0.45,0.2H19.6c-0.167,0-0.317-0.067-0.45-0.2 c-0.1-0.1-0.15-0.233-0.15-0.4C19,13.233,19.05,13.1,19.15,13z M23.85,4.1c5.433,0,10.083,1.917,13.95,5.75 c2.833,2.833,4.65,6.117,5.45,9.85c0.233,1.233,0.35,2.517,0.35,3.85c0,0.1,0,0.2,0,0.3l-0.35,3.85c-0.7,3.8-2.517,7.15-5.45,10.05 c-3.867,3.867-8.517,5.8-13.95,5.8c-5.434,0-10.083-1.933-13.95-5.8C7,34.85,5.217,31.5,4.55,27.7c-0.267-1.233-0.4-2.517-0.4-3.85 c0-0.1,0-0.2,0-0.3l0.4-3.85c0.733-3.733,2.517-7.017,5.35-9.85C13.767,6.017,18.417,4.1,23.85,4.1z M16.3,16.3 c0.034-0.367,0.133-0.633,0.3-0.8c0.167-0.2,0.45-0.3,0.85-0.3H29.9c0.4,0,0.7,0.1,0.9,0.3c0.133,0.167,0.233,0.433,0.3,0.8 l0.75,5.35c0.033,0.3,0,0.55-0.1,0.75c-0.133,0.2-0.367,0.3-0.7,0.3h-14.7c-0.333,0-0.567-0.1-0.7-0.3 c-0.1-0.2-0.133-0.45-0.1-0.75L16.3,16.3z M16.9,26.2c0.367,0,0.684,0.133,0.95,0.4c0.267,0.267,0.4,0.583,0.4,0.95 s-0.133,0.683-0.4,0.95c-0.267,0.267-0.583,0.4-0.95,0.4c-0.4,0-0.733-0.133-1-0.4c-0.267-0.267-0.4-0.583-0.4-0.95 s0.133-0.683,0.4-0.95C16.167,26.333,16.5,26.2,16.9,26.2z M29.55,26.6c0.267-0.267,0.583-0.4,0.95-0.4s0.683,0.133,0.95,0.4 c0.267,0.267,0.4,0.583,0.4,0.95s-0.133,0.683-0.4,0.95c-0.267,0.267-0.583,0.4-0.95,0.4s-0.683-0.133-0.95-0.4 c-0.267-0.267-0.4-0.583-0.4-0.95S29.283,26.867,29.55,26.6z"/>
			</g>
		</svg>
		<?php  echo home_links_get_meta( 'home_links_bus' ); ?>
	</div>
	<div class="home-item " id="item_ship">
		<svg xmlns="http://www.w3.org/2000/svg"  class="home-item-icon" width="60" height="60"  xmlns:xlink="http://www.w3.org/1999/xlink">
			<path id="baseicon" fill-rule="evenodd" clip-rule="evenodd" fill="#EFEFEF" d="M23.75,0c6.533,0,12.117,2.3,16.75,6.9 c4.667,4.667,7,10.283,7,16.85c0,5.6-1.7,10.483-5.1,14.65c-0.367,0.433-0.75,0.883-1.15,1.35l-13.8,16.1 c-1.034,1.034-2.267,1.55-3.7,1.55s-2.667-0.517-3.7-1.55l-13.8-16.1c-0.4-0.467-0.8-0.917-1.2-1.35C1.683,34.233,0,29.35,0,23.75 C0,17.183,2.333,11.566,7,6.9C11.6,2.3,17.183,0,23.75,0z"/>
			<g id="ship" >
				<path display="inline" fill-rule="evenodd" clip-rule="evenodd" fill="#2B3A42" d="M22.025,9.1v2.5h-2.899v1.9h-2.101V17l-1.1,0.45 c-0.3,0.133-0.517,0.333-0.65,0.6c-0.133,0.267-0.116,0.566,0.05,0.9l1.75,4.1v5.7c-0.233,0-0.517-0.066-0.85-0.2 c-0.566-0.233-0.866-0.35-0.9-0.35c-0.8-0.267-1.616-0.167-2.449,0.3c-0.101,0.066-0.25,0.116-0.45,0.149 c-0.334,0.134-0.7,0.2-1.101,0.2v2.45c0.367-0.033,0.667-0.083,0.9-0.15c0.2-0.066,0.434-0.166,0.7-0.3 c0.366-0.2,0.767-0.316,1.2-0.35c0.566-0.066,1.116,0.05,1.649,0.35c0.634,0.3,1.217,0.45,1.75,0.45 c0.533,0.033,1.066-0.1,1.601-0.4c0.533-0.267,1.033-0.399,1.5-0.399c0.466-0.033,0.949,0.083,1.449,0.35 c0.634,0.3,1.2,0.45,1.7,0.45c0.533,0,1.117-0.15,1.75-0.45c0.5-0.267,0.983-0.383,1.45-0.35c0.5,0,1,0.133,1.5,0.399 c0.533,0.301,1.066,0.434,1.6,0.4c0.567,0,1.15-0.15,1.75-0.45c0.567-0.3,1.134-0.416,1.7-0.35c0.4,0.033,0.783,0.149,1.15,0.35 c0.267,0.134,0.5,0.233,0.7,0.3c0.267,0.067,0.566,0.117,0.899,0.15v-2.45c-0.399-0.033-0.767-0.1-1.1-0.2l-0.4-0.149 c-0.866-0.467-1.7-0.584-2.5-0.351c-0.033,0.034-0.333,0.167-0.899,0.4c-0.334,0.134-0.617,0.2-0.851,0.2v-5.7l1.8-4.1 c0.134-0.334,0.134-0.634,0-0.9c-0.1-0.267-0.316-0.467-0.649-0.6L30.575,17v-3.5h-2.05v-1.9h-2.899V9.1H22.025z M20.625,13.1h6.35 v1.851h2.1v1.399l-5.25-2.149l-5.25,2.149V14.95h2.051V13.1z M15.825,34.6c0.601,0.3,1.167,0.45,1.7,0.45 c0.533,0.033,1.066-0.1,1.601-0.4c0.566-0.267,1.033-0.416,1.399-0.449c0.4-0.034,0.9,0.083,1.5,0.35 c0.634,0.333,1.25,0.5,1.851,0.5c0.566-0.033,1.133-0.184,1.699-0.45c0.601-0.267,1.117-0.399,1.551-0.399 c0.366,0.033,0.816,0.183,1.35,0.449c0.533,0.301,1.066,0.434,1.6,0.4c0.534,0,1.117-0.15,1.75-0.45 c0.534-0.3,1.084-0.416,1.65-0.35c0.4,0.033,0.783,0.166,1.15,0.399c0.233,0.134,0.483,0.233,0.75,0.301 c0.233,0.066,0.533,0.1,0.899,0.1V32.5c-0.467,0.033-0.85-0.017-1.149-0.15c-0.101-0.033-0.2-0.083-0.301-0.149l-0.05-0.051 c-0.533-0.3-1.083-0.433-1.649-0.399c-0.5,0.033-1.117,0.233-1.851,0.6c-0.366,0.2-0.833,0.283-1.399,0.25 c-0.534-0.033-1.034-0.166-1.5-0.399c-0.567-0.301-1.084-0.434-1.551-0.4c-0.399,0-0.933,0.15-1.6,0.45 c-0.5,0.233-0.983,0.35-1.45,0.35c-0.434,0-0.899-0.116-1.399-0.35c-0.7-0.3-1.233-0.45-1.601-0.45 c-0.467-0.033-0.983,0.1-1.55,0.4c-0.434,0.233-0.934,0.366-1.5,0.399s-1.033-0.05-1.4-0.25c-0.733-0.366-1.35-0.566-1.85-0.6 c-0.533-0.033-1.066,0.1-1.6,0.399c-0.101,0.067-0.233,0.134-0.4,0.2c-0.3,0.101-0.667,0.15-1.1,0.15v2.55 c0.3,0,0.583-0.033,0.85-0.1c0.267-0.067,0.517-0.167,0.75-0.301c0.333-0.233,0.717-0.366,1.15-0.399 C14.692,34.184,15.258,34.3,15.825,34.6z M43.475,23.8c0,5.467-1.934,10.134-5.8,14c-3.867,3.833-8.517,5.75-13.95,5.75 s-10.083-1.917-13.95-5.75c-3.833-3.866-5.75-8.533-5.75-14c0-5.434,1.917-10.066,5.75-13.9c3.867-3.866,8.517-5.8,13.95-5.8 s10.083,1.934,13.95,5.8C41.542,13.733,43.475,18.366,43.475,23.8z"/>
			</g>
		</svg>
		<?php  echo home_links_get_meta( 'home_links_ship' ); ?>
	</div>
	<div class="home-item" id="item_train">
		<svg style="" xmlns="http://www.w3.org/2000/svg"  class="home-item-icon" width="60" height="60"  xmlns:xlink="http://www.w3.org/1999/xlink">
			<path  transform=""  id="baseicon" fill-rule="evenodd" clip-rule="evenodd" fill="#EFEFEF" d="M23.75,0c6.533,0,12.117,2.3,16.75,6.9 c4.667,4.667,7,10.283,7,16.85c0,5.6-1.7,10.483-5.1,14.65c-0.367,0.433-0.75,0.883-1.15,1.35l-13.8,16.1 c-1.034,1.034-2.267,1.55-3.7,1.55s-2.667-0.517-3.7-1.55l-13.8-16.1c-0.4-0.467-0.8-0.917-1.2-1.35C1.683,34.233,0,29.35,0,23.75 C0,17.183,2.333,11.566,7,6.9C11.6,2.3,17.183,0,23.75,0z"/>
			<g id="train">
				<path display="inline" fill-rule="evenodd" clip-rule="evenodd" fill="#2B3A42" d="M22.35,9.45c-0.267,0-0.5,0.1-0.7,0.3 c-0.167,0.166-0.25,0.383-0.25,0.649s0.083,0.5,0.25,0.7c0.2,0.167,0.433,0.25,0.7,0.25c0.267,0,0.5-0.083,0.7-0.25 c0.167-0.2,0.25-0.434,0.25-0.7s-0.083-0.483-0.25-0.649C22.85,9.55,22.617,9.45,22.35,9.45z M15.85,15.1v12.4 c0,0.8,0.283,1.533,0.85,2.2c0.534,0.633,1.15,1,1.85,1.1l-4,6h2.3l2.85-4.2h7.85l2.85,4.2h2.3l-4-6c0.7-0.1,1.317-0.467,1.85-1.1 c0.567-0.667,0.85-1.4,0.85-2.2V15.1c0-0.899-0.333-1.684-1-2.35c-0.7-0.667-1.533-1-2.5-1h-8.55c-0.967,0-1.8,0.333-2.5,1 C16.183,13.416,15.85,14.2,15.85,15.1z M18.2,15.75c0.3-0.334,0.717-0.5,1.25-0.5h8.35c0.533,0,0.967,0.166,1.3,0.5 c0.267,0.333,0.4,0.733,0.4,1.2v2.25c0.033,0.533-0.133,0.949-0.5,1.25c-0.3,0.333-0.7,0.5-1.2,0.5h-8.35c-0.5,0-0.9-0.167-1.2-0.5 c-0.333-0.301-0.5-0.717-0.5-1.25v-2.25C17.75,16.483,17.9,16.083,18.2,15.75z M21.35,13c0-0.134,0.066-0.267,0.2-0.4 c0.1-0.1,0.233-0.149,0.4-0.149h3.35c0.167,0,0.3,0.05,0.4,0.149c0.133,0.134,0.2,0.267,0.2,0.4v1c0,0.166-0.067,0.3-0.2,0.399 c-0.1,0.101-0.233,0.15-0.4,0.15h-3.35c-0.167,0-0.3-0.05-0.4-0.15c-0.133-0.1-0.2-0.233-0.2-0.399V13z M20.8,27.45 c0,0.433-0.15,0.8-0.45,1.1C20.05,28.85,19.7,29,19.3,29c-0.433,0-0.8-0.15-1.1-0.45c-0.3-0.3-0.45-0.667-0.45-1.1 c0-0.4,0.15-0.75,0.45-1.051c0.3-0.3,0.667-0.449,1.1-0.449c0.4,0,0.75,0.149,1.05,0.449C20.65,26.7,20.8,27.05,20.8,27.45z  M4.15,23.8c0-5.434,1.917-10.066,5.75-13.9c3.867-3.866,8.517-5.8,13.95-5.8c5.433,0,10.083,1.934,13.95,5.8 c3.867,3.834,5.8,8.467,5.8,13.9c0,5.467-1.934,10.133-5.8,14c-3.867,3.833-8.517,5.75-13.95,5.75 c-5.434,0-10.083-1.917-13.95-5.75C6.066,33.933,4.15,29.267,4.15,23.8z M24.9,9.45c-0.267,0-0.5,0.1-0.7,0.3 c-0.167,0.166-0.25,0.383-0.25,0.649s0.083,0.5,0.25,0.7c0.2,0.167,0.434,0.25,0.7,0.25s0.5-0.083,0.7-0.25 c0.167-0.2,0.25-0.434,0.25-0.7S25.767,9.916,25.6,9.75C25.4,9.55,25.167,9.45,24.9,9.45z M27.95,25.95 c0.434,0,0.784,0.149,1.05,0.449c0.3,0.301,0.45,0.65,0.45,1.051c0,0.433-0.15,0.8-0.45,1.1c-0.267,0.3-0.617,0.45-1.05,0.45 c-0.433,0-0.8-0.15-1.1-0.45c-0.3-0.3-0.45-0.667-0.45-1.1c0-0.4,0.15-0.75,0.45-1.051C27.15,26.1,27.517,25.95,27.95,25.95z"/>
			</g>
		</svg>
		<?php  echo home_links_get_meta( 'home_links_train' ); ?>
	</div>


</div>




<script>window.isotopic_template_path = "<?php echo get_template_directory_uri();?>";</script>
<?php /* //O arquivo Home.js contem todos esses minificados.
<script src="<?php echo get_template_directory_uri(); ?>/src/js/jquery-1.11.2.min.js"></script>
<script src="<?php echo get_template_directory_uri(); ?>/src/js/pixi.js"></script>
<script src="<?php echo get_template_directory_uri(); ?>/src/js/MobileScroll.js"></script>
<script src="<?php echo get_template_directory_uri(); ?>/src/js/Home.js"></script>-->*/ ?>
<script src="<?php echo get_template_directory_uri(); ?>/js/isotopic-home.js"></script>

<?php get_template_part( 'page', 'footer-front-page' ); ?>
<?php get_footer(); ?>