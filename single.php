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

			<div class="col-sm-9 blog-post">


	<?php

	if (have_posts()){ 

	    while (have_posts()){ 

	     	//Iterator
			the_post();

			//Post vars
			$id = get_the_ID();
			$permalink = get_permalink();
			$title = get_the_title();
			$content = get_the_content();
			$date = get_the_date( $d );

			?>
			
			<header>
			<h2><?php echo $title; ?></h2>
			<p><?php echo $date; ?></p>
			</header>

			<article>
			<p><?php echo $content; ?></p>
			</article>
			
			<?php

			//----- Exibir comentários

			/*

			$params = array(
				'author_email' => '',
				'ID' => '',
				'karma' => '',
				'number' => '',
				'offset' => '',
				'orderby' => '',
				'order' => 'DESC',
				'parent' => '',
				'post_id' => $id,
				'post_author' => '',
				'post_name' => '',
				'post_parent' => '',
				'post_status' => '',
				'post_type' => '',
				'status' => '',
				'type' => '',
				'user_id' => '',
				'search' => '',
				'count' => false,
				'meta_key' => '',
				'meta_value' => '',
				'meta_query' => '',
			);
			$comments = get_comments($params);

			foreach ($comments as $comment) {


				//var_dump($comment);

				echo "\n\t".'<br/><br/><small>"';
				echo $comment->comment_content;
				echo "\" - <b>".$comment->comment_author."</b>";
				echo " em  <b>".date("d/m/Y", strtotime($comment->comment_date))."</b>";
				echo '</small>';
			}

			echo "\n\n\n\n\n";



			//=========================== COMMENTS FORM

			$params_form = array(
			  'id_form'           => 'commentform',
			  'id_submit'         => 'submit',
			  'title_reply'       => '',
			  'title_reply_to'    => '',
			  'cancel_reply_link' => '',
			  'label_submit'      => __( 'Post' ),
			  'comment_field' =>  '<p class="comment-form-comment"><label for="comment">Comment</label><br><textarea id="comment" name="comment" cols="40" rows="2" aria-required="true"></textarea></p>',
			  'must_log_in' => '',
			  'logged_in_as' => '',
			  'comment_notes_before' => '',
			  'comment_notes_after' => '',
			  'fields' => apply_filters( 'comment_form_default_fields', array(

			    'author' =>
			      '<p class="comment-form-author">' .
			      '<label for="author">' . __( 'Name', 'domainreference' ) . '</label>' .
			      ( $req ? '<span class="required">*</span>' : '' ) .
			      '<input id="author" name="author" type="text" value="' . esc_attr( $commenter['comment_author'] ) .
			      '" size="30"' . $aria_req . ' /></p>',

			    'email' =>
			      '<p class="comment-form-email"><label for="email">' . __( 'Email', 'domainreference' ) . '</label>' .
			      ( $req ? '<span class="required">*</span>' : '' ) .
			      '<input id="email" name="email" type="text" value="' . esc_attr(  $commenter['comment_author_email'] ) .
			      '" size="30"' . $aria_req . ' /></p>',

			    'url' =>
			      '<p class="comment-form-url"><label for="url">' .
			      __( 'Website', 'domainreference' ) . '</label>' .
			      '<input id="url" name="url" type="text" value="' . esc_attr( $commenter['comment_author_url'] ) .
			      '" size="30" /></p>'
			    )
			  )
			);
			comment_form($params_form);
			*/



	    }//-endwhile have_posts

	}//-endif have_posts


	?>

			</div>






			<div class="col-sm-3 blog-side">
				<?php get_template_part( 'home', 'blog-side'); ?>
			</div>







		</div>

	</div>

</div>




<?php

get_template_part( 'page', 'footer' ); 
get_footer(); 

?>






















