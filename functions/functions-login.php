<?php

//Custom login screen
function login_isotopic() { 

	$logo =  'wp-content/themes/isotopic/img/logo.svg';
	
	echo  '<style type="text/css">
        .login #login h1 a {
            background-image: url( '.$logo.' );
        }

        .wp-core-ui .button-primary{
        	border:none !important;
        	background-color:#272F32;
        }

        .login form{
        	box-shadow:none;
        	-webkit-border-radius: 4px;
			-moz-border-radius: 4px;
			border-radius: 4px;
        }
        input[type="text"],input[type="password"] {
        	border:none !important;
        	box-shadow:none;
        	background-color:#f0f0f0 !important;
        	-webkit-border-radius: 3px;
			-moz-border-radius: 3px;
			border-radius: 3px;
        }
        input[type="checkbox"]{
        	border-color:#fff !important;
        	background-color:#f0f0f0;
        }
    </style>';
}

add_action( 'login_enqueue_scripts', 'login_isotopic' );

?>