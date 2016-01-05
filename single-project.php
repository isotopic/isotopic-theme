<?php
/**
 * Detalhe de um projeto (child page of projects)
 */
get_header();
get_template_part( 'page', 'header' );


//ALL INFO

$ID = get_the_ID();




$title = get_the_title( );


$content =  apply_filters('the_content', get_post_field('post_content', $ID));

$link = get_page_link( );

$project_url = project_url_get_meta( 'project_url_project_url' );



$img_url = wp_get_attachment_image_src( get_post_thumbnail_id( ), 'large' );

$type_name = "&nbsp;";        $type_slug = "";
$service_name = array();  $service_slug = "";
$client_name = "&nbsp;";     $client_slug = "";

$types = get_the_terms($ID, 'type');
$services = get_the_terms($ID, 'service');
$clients = get_the_terms($ID, 'client');

if ( $types){
	foreach($types as $type){
		$type_name =  $type->name;
		$type_slug =  $type->slug;
	 }
 }


if ( $services){
	foreach($services as $service){
		array_push( $service_name, $service->name);
		//apenas o services permite mais de um
		$service_slug .= ( $service_slug!=""?",":''). $service->slug;
	 }
 }

if ( $clients){
	 foreach($clients as $client){
		 $client_name =  $client->name;
		 $client_slug =   $client->slug;
	}
 }


//IMAGES
$images_src = Array();
$images =& get_children( array (
	'post_parent' => $post->ID,
	'post_type' => 'attachment',
	'post_mime_type' => 'image',
	'orderby' => 'post_name',
	'order' => 'ASC'
));

if ( !empty($images) ){
	foreach ( $images as $attachment_id => $attachment ) {
		$img =  wp_get_attachment_image_src( $attachment_id, 'large' );
		$default_error_image = get_template_directory_uri().'/img/default/700x500.jpg';
		array_push($images_src, $img[0]);
	}
}

 ?>






<div class="toolbar toolbar-detail">
	<div class="container">
		<div class="row">

			<div class="col-xs-4 text-left" >
				<a href="<?php echo home_url();?>/projects">
					<div class="toolbar-pill">
					<svg style="margin:0 0 -1px 0;" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"  width="10" height="16">
					    <path d="M6,5 L2,10 L6,15" style="stroke:#999; fill:none;" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="3"/>
					</svg>
					 projects</div>
				</a>
			</div>

			<div class="col-xs-8 text-right" >
				<h3><?php echo $client_name; ?></h3>
			</div>


		</div><!-- /row -->
	</div><!-- /container -->
</div><!-- /toolbar -->







<div class="project-detail">
	<div class="container">
		<div class="row">

			<div class="col-sm-5 project-detail-desc"><div class="row">


				<div class="col-xs-12">
					<h2><?php echo $title;?></h2>
				</div>

				<div class="col-xs-4">
					<p class="project-detail-specs"><span>Type</span> <?php echo $type_name;?></p>
				</div>

				<div class="col-xs-4">
					<p class="project-detail-specs"><span>Service</span> <?php  echo implode("<br>", $service_name); ?></p>
				</div>

				<div class="col-xs-4">
					<p class="project-detail-specs"><span>Client</span> <?php echo $client_name;?></p>
				</div>

				<div class="col-xs-12">
					<p class="project-detail-description"><?php echo $content;?></p>


					<?php if ($project_url != ""){?>

						<a href="<?php echo $project_url;?>" target="_blank">
							<div class="top15 toolbar-pill pill-red"> <span class="glyphicon glyphicon-new-window" aria-hidden="true"></span> view project </div>
						</a>

					<?php }else{ ?>

						<div class="top15 toolbar-pill"> <span class="glyphicon glyphicon-ban-circle" aria-hidden="true"></span> offline</div>

					<?php } ?>
				</div>



			</div></div>


			<div class="col-sm-7  text-right ">
				<div class="row">
				<?php
				foreach($images_src as $img){

				 if (strpos($img, '_mobile')!==false){
				 	echo '<div class="col-xs-6">';
				 }else{
				 	echo '<div class="col-xs-12">';
				 }

				?>

					<div class="project-detail-window ">

					    <svg class="mac-bts" xmlns="http://www.w3.org/2000/svg"  width="60" height="20" xmlns:xlink="http://www.w3.org/1999/xlink">
					    	<symbol id="bt-bolinha">
					        	<circle r="4" cx="10" cy="10" style="stroke: #none; fill:#888;"/>
						</symbol>
						        <use xlink:href="#bt-bolinha" x="0" y="0" />
						        <use xlink:href="#bt-bolinha" x="13" y="0" />
						        <use xlink:href="#bt-bolinha" x="26" y="0" />
					    </svg>

					<img src="<?php echo $img;?>" class=""   onerror="this.onerror=null;this.src='<?php echo $default_error_image; ?>'">
					</div>
				</div>
				<?php } ?>
			</div></div>

		</div><!-- /row -->
	</div><!-- /container -->

</div><!-- /projects-detail -->




<script src="<?php echo get_template_directory_uri(); ?>/src/js/jquery-1.11.2.min.js"></script>
<!--<script src="<?php echo get_template_directory_uri(); ?>/src/js/projects.js"></script>-->




<?php

get_template_part( 'page', 'footer' );
get_footer();

?>
