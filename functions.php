<?php
/*
* functions.php
*
*/

// General
add_theme_support( 'post-thumbnails' );
require_once('functions/functions-head.php');
require_once('functions/functions-custom-types.php');
require_once('functions/functions-filters.php');

// Admin related
require_once('functions/functions-meta-boxes.php');
require_once('functions/functions-meta-boxes-visibility.php');
require_once('functions/functions-admin-dashboard.php');
require_once('functions/functions-login.php');


?>
