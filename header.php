<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" />
<title><?php wp_title( ' | ', true, 'right' ); echo get_bloginfo( 'name' ); ?></title>
<?php wp_head(); ?>


<?php
$og_image = get_template_directory_uri().'/img/isotopic_share.jpg';
if ( has_post_thumbnail() ) {
	$og_image = wp_get_attachment_image_src( get_post_thumbnail_id( $ID ), 'large' );
	$og_image = $og_image[0];
} ?>
<meta property="og:site_name" content="Isotopic"/>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<meta property="og:url" content="<?php echo the_permalink(); ?>" />
<?php if(is_single()){ ?>
<meta property="og:title" content="<?php echo the_title(); ?>" />
<meta property="og:description" content="<?php echo the_excerpt(); ?>" />
<meta property="og:type" content="article" />
<?php }?>


<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-32903129-1', 'auto');
  ga('send', 'pageview');
</script>
</head>

<body <?php body_class(); ?>>


<header id="main">
	<div class="container">

		<h1 id="logo"><?php echo '<a href="'.home_url().'"><img src="'.get_template_directory_uri().'/img/logo_wide.svg" alt="'.get_bloginfo( 'name' ).'"></a>'; ?></h1>

		<?php 

			$menuConfig = array(
				'theme_location'  => 'mainMenu',
				'menu'            => 'mainMenu',
				'container'       => 'nav',
				'container_class' => 'main-menu',
				'container_id'    => '',
				'menu_class'      => '',
				'menu_id'         => 'main-nav',
				'echo'            => true,
				'items_wrap'      => '<ul>%3$s</ul>',
				'depth'           => 0,
				'walker'          => new Walker_Custom()
			);

			//Usando walker as tags saem mais limpas
			class Walker_Custom extends Walker_Nav_Menu {

			    function start_lvl(&$output, $depth=0, $args=array()) {
			        $output .= "\n\t<ul>\n";
			    }

			    function end_lvl(&$output, $depth=0, $args=array()) {
			        $output .= "\n\t\t</ul>\n";
			    }

			    function start_el(&$output, $item, $depth=0, $args=array()) {
			        $output .= "\n\t\t<li class='".implode($item->classes, ' ')."'><a href='".$item->url."'>".$item->title."</a>";
			    }

			    function end_el(&$output, $item, $depth=0, $args=array()) {
			        $output .= "</li>";
			    }
			}

			wp_nav_menu( $menuConfig );

		?>


	</div>
</header>