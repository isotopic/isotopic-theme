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

				<div class="toolbar-pill  toolbar-filter pointer">
					<svg  style="margin:0 0 -3px 0;" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"  width="20" height="15">
						<line x1="0" y1="3"    x2="16" y2="3"    style="stroke:#999;"  stroke-width="1" />
						<line x1="0" y1="8"    x2="16" y2="8"    style="stroke:#999;"  stroke-width="1"/>
						<line x1="0" y1="13"    x2="16" y2="13"    style="stroke:#999;"  stroke-width="1"/>
						 <rect x="3" y="1" height="4" width="2" style="stroke:none; fill: #999"/>
						 <rect x="11" y="6" height="4" width="2" style="stroke:none; fill: #999"/>
						 <rect x="3" y="11" height="4" width="2" style="stroke:none; fill: #999"/>
					</svg>
					  filter
				</div>

				<div class="toolbar-pill toolbar-filter-selected" style="display:none">
					 <span class="holder"></span>
					 <svg style="margin:0;" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"  width="10" height="12">
						<line x1="5" y1="5"    x2="9" y2="9"    style="stroke:#999;"  stroke-width="2" stroke-linecap="square"/>
						<line x1="5" y1="9"    x2="9" y2="5"    style="stroke:#999;"  stroke-width="2" stroke-linecap="square"/>
					</svg>
				</div>
			</div>

		</div><!-- /row -->
	</div><!-- /container -->
</div><!-- /toolbar -->







<div class="toolbar-filters ">
	<div class="container" style="display:none"><!-- to hidden -->
		<div class="row ">

			<?php
			$args = array(
			    'orderby'           => 'id', //id, count, slug
			    'order'             => 'ASC',
			    'hide_empty'        => true,
			    'exclude'           => array(),
			    'exclude_tree'      => array(),
			    'include'           => array(),
			    'number'            => '',
			    'fields'            => 'all',
			    'slug'              => '',
			    'parent'            => '',
			    'hierarchical'      => true,
			    'child_of'          => 0,
			    'childless'         => false,
			    'get'               => '',
			    'name__like'        => '',
			    'description__like' => '',
			    'pad_counts'        => false,
			    'offset'            => '',
			    'search'            => '',
			    'cache_domain'      => 'core'
			);

			$type = get_terms('type', $args);
			$service = get_terms('service', $args);
			$client = get_terms('client', $args);

			//var_dump($service);
			?>

			<div class="col-xs-4 col-sm-3  text-left" ><h4>Type</h4><?php
				foreach($type as $item){
					echo '<span data-tax="type" data-term="'.$item->slug . '">'.$item->name . '</span><br>';
				};
			?></div>

			<div class="col-xs-4 col-sm-3 text-left" ><h4>Service</h4><?php
				foreach($service as $item){
					echo '<span data-tax="service" data-term="'.$item->slug . '">'.$item->name  . '</span><br>';
				};
			?></div>

			<div class="col-xs-4 col-sm-3 text-left" ><h4>Client</h4><?php
				foreach($client as $item){
					echo '<span data-tax="client" data-term="'.$item->slug . '">'.$item->name . '</span><br>';
				};
			?></div>

		</div><!-- /row -->
	</div><!-- /container -->
</div><!-- /toolbar -->




























<div class="content-panel">
	<div class="container">
		<div class="row">


		<?php

		$args = array('post_parent' => get_the_ID(),'post_type'   => 'page', 'posts_per_page' => -1,'post_status' => 'publish' );

		$children = get_children( $args);

		foreach($children as $project){

			$title = get_the_title($project->ID);
			$link = get_page_link( $project->ID);
			$img_url = wp_get_attachment_image_src( get_post_thumbnail_id( $project->ID ), 'large' );
			//if (!file_exists($img_url[0])) { $img_url[0] = get_template_directory_uri().'/img/default/700x500.jpg'; }
			$type_name = "&nbsp;";        $type_slug = "";
			$service_name = "&nbsp;";  $service_slug = "";
			$client_name = "&nbsp;";     $client_slug = "";

			//taxonomies
			$types = get_the_terms($project->ID, 'type');
			$services = get_the_terms($project->ID, 'service');
			$clients = get_the_terms($project->ID, 'client');

			if ( $types){
				foreach($types as $type){
					$type_name =  $type->name;
					$type_slug =  $type->slug;
				 }
			 }
			if ( $services){
				foreach($services as $service){
					$service_name =  $service->name;
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
		?>

			<div class="project-item col-xs-12 col-sm-6 col-md-3" data-type="<?php echo $type_slug;?>"  data-service="<?php echo $service_slug;?>"  data-client="<?php echo $client_slug;?>">
				<div class="project-item-wrapper"><a href="<?php echo $link;?>">
					<img src="<?php echo $img_url[0];?>" class="img-responsive">
					<div class="project-item-txt">
						<h4><?php echo $client_name;?></h4>
						<p><span><?php echo $title;?></span><Br><?php echo $type_name;?></p>
						<?php //echo '<br>'.$service_name;?>
					</div></a>
				</div>
			</div>


		<?php } //end foreach $project?>



		</div><!-- /row -->
	</div><!-- /container -->
</div><!-- /projects-panel -->




<script src="<?php echo get_template_directory_uri(); ?>/src/js/jquery-1.11.2.min.js"></script>
<script src="<?php echo get_template_directory_uri(); ?>/src/js/projects.js"></script>



<?php

get_template_part( 'page', 'footer' );
get_footer();

?>
