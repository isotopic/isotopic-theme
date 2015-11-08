-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 
-- Versão do Servidor: 5.5.24-log
-- Versão do PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `wordpressed`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'https://wordpress.org/', '', '2014-12-11 17:20:18', '2014-12-11 17:20:18', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, '1', '', '', 0, 0),
(2, 1, 'master', 'guilhermecruz@gmail.com', '', '::1', '2014-12-12 16:36:11', '2014-12-12 16:36:11', 'I''m just a lurker.', 0, '1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=649 ;

--
-- Extraindo dados da tabela `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://192.168.0.23/isotopic/wordpress', 'yes'),
(2, 'home', 'http://192.168.0.23/isotopic', 'yes'),
(3, 'blogname', 'Isotopic', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'guilhermecruz@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/blog/%postname%/', 'yes'),
(29, 'gzipcompression', '0', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:0:{}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'advanced_edit', '0', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '-3', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', 'a:3:{i:0;s:67:"C:\\wamp\\www\\isotopic\\wordpress/wp-content/themes/isotopic/style.css";i:1;s:90:"/Users/PC8297/Desktop/Projetos/www/isotopic/wordpress/wp-content/themes/isotopic/style.css";i:2;s:0:"";}', 'no'),
(41, 'template', 'isotopic', 'yes'),
(42, 'stylesheet', 'isotopic', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '0', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'subscriber', 'yes'),
(49, 'db_version', '30133', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '1', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'page', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', 'file', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '0', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '0', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_text', 'a:0:{}', 'yes'),
(81, 'widget_rss', 'a:0:{}', 'yes'),
(82, 'uninstall_plugins', 'a:0:{}', 'no'),
(83, 'timezone_string', '', 'yes'),
(85, 'page_on_front', '22', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'initial_db_version', '29630', 'yes'),
(89, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(90, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(91, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(92, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'sidebars_widgets', 'a:3:{s:19:"wp_inactive_widgets";a:0:{}s:18:"orphaned_widgets_1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes'),
(96, 'cron', 'a:5:{i:1430112021;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1430118480;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1430155239;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1430156895;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(105, '_transient_random_seed', '78c2554520b3e2d4268f4d212af234bc', 'yes'),
(106, 'auth_key', 'z-8%X:6HPr%6o~^HLt$gB1[BMX{T`+a]Dv%4tlP~My})t_boT$j*9{C7rAzMqI1N', 'yes'),
(107, 'auth_salt', '[/F`N`Fd3PZ}t%hfim_L(kk]_!lgE*x}TUEhtX0J&^RVLuS`GBLJj^-pV49/(&)j', 'yes'),
(108, 'logged_in_key', 'e_hq9KTi^gVFr5~w}UWts;SSX~pTg&IX6(N+KBP/2[FF/$hwD!1-6yEXK{CPm}0n', 'yes'),
(109, 'logged_in_salt', 'w;[EVJzY7N*/n~x>@bw8_D|9x;F`:B-`,xe]3m&-)j54&//u&CsawRS|1X7Ue3r,', 'yes'),
(110, 'nonce_key', 'fNu4Xk?mUWR/`**^ks)xD~VHMv{YNU,Jiv!PKoem]^5}c7-/V(cQ-0?Gz-FmSFYE', 'yes'),
(111, 'nonce_salt', 'Ufv6c9,tEU|1LMZh~1)Du^<sA&Dx->Gb3Z2FBNN?%%YIH>ytlD0r@OJ4TQXM([<a', 'yes'),
(134, '_transient_twentyfourteen_category_count', '1', 'yes'),
(137, 'WPLANG', '', 'yes'),
(141, 'theme_mods_twentyfourteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1418319879;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(142, 'current_theme', 'Isotopic Blog', 'yes'),
(143, 'theme_mods_isotopic', 'a:2:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:8:"mainMenu";i:8;}}', 'yes'),
(144, 'theme_switched', '', 'yes'),
(153, 'category_children', 'a:0:{}', 'yes'),
(168, 'theme_mods_twentytwelve', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1418327210;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";N;s:9:"sidebar-3";N;}}}', 'yes'),
(171, 'page_for_posts', '18', 'yes'),
(250, 'db_upgraded', '', 'yes'),
(253, '_site_transient_timeout_browser_c917cbcbdbc2b619466b4aeb270ad980', '1427549826', 'yes'),
(254, '_site_transient_browser_c917cbcbdbc2b619466b4aeb270ad980', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"36.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(255, 'can_compress_scripts', '1', 'yes'),
(330, 'recently_activated', 'a:0:{}', 'yes'),
(372, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(405, '_site_transient_timeout_browser_d0b8260dbc35575e21ce3cad867b73d8', '1429412145', 'yes'),
(406, '_site_transient_browser_d0b8260dbc35575e21ce3cad867b73d8', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"41.0.2272.118";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(485, '_site_transient_timeout_available_translations', '1429382874', 'yes'),
(486, '_site_transient_available_translations', 'a:54:{s:2:"ar";a:8:{s:8:"language";s:2:"ar";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-04-01 13:21:43";s:12:"english_name";s:6:"Arabic";s:11:"native_name";s:14:"العربية";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/ar.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:2;s:3:"ara";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:2:"az";a:8:{s:8:"language";s:2:"az";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:15:41";s:12:"english_name";s:11:"Azerbaijani";s:11:"native_name";s:16:"Azərbaycan dili";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/az.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:2;s:3:"aze";}s:7:"strings";a:1:{s:8:"continue";s:5:"Davam";}}s:5:"bg_BG";a:8:{s:8:"language";s:5:"bg_BG";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:19:26";s:12:"english_name";s:9:"Bulgarian";s:11:"native_name";s:18:"Български";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/bg_BG.zip";s:3:"iso";a:2:{i:1;s:2:"bg";i:2;s:3:"bul";}s:7:"strings";a:1:{s:8:"continue";s:22:"Продължение";}}s:5:"bs_BA";a:8:{s:8:"language";s:5:"bs_BA";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:22:49";s:12:"english_name";s:7:"Bosnian";s:11:"native_name";s:8:"Bosanski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/bs_BA.zip";s:3:"iso";a:2:{i:1;s:2:"bs";i:2;s:3:"bos";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:2:"ca";a:8:{s:8:"language";s:2:"ca";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:24:48";s:12:"english_name";s:7:"Catalan";s:11:"native_name";s:7:"Català";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/ca.zip";s:3:"iso";a:2:{i:1;s:2:"ca";i:2;s:3:"cat";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"cy";a:8:{s:8:"language";s:2:"cy";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:30:22";s:12:"english_name";s:5:"Welsh";s:11:"native_name";s:7:"Cymraeg";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/cy.zip";s:3:"iso";a:2:{i:1;s:2:"cy";i:2;s:3:"cym";}s:7:"strings";a:1:{s:8:"continue";s:6:"Parhau";}}s:5:"da_DK";a:8:{s:8:"language";s:5:"da_DK";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:32:23";s:12:"english_name";s:6:"Danish";s:11:"native_name";s:5:"Dansk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/da_DK.zip";s:3:"iso";a:2:{i:1;s:2:"da";i:2;s:3:"dan";}s:7:"strings";a:1:{s:8:"continue";s:12:"Forts&#230;t";}}s:5:"de_DE";a:8:{s:8:"language";s:5:"de_DE";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:34:24";s:12:"english_name";s:6:"German";s:11:"native_name";s:7:"Deutsch";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/de_DE.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:5:"de_CH";a:8:{s:8:"language";s:5:"de_CH";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:38:25";s:12:"english_name";s:20:"German (Switzerland)";s:11:"native_name";s:17:"Deutsch (Schweiz)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/de_CH.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:2:"el";a:8:{s:8:"language";s:2:"el";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-04-15 12:48:44";s:12:"english_name";s:5:"Greek";s:11:"native_name";s:16:"Ελληνικά";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/el.zip";s:3:"iso";a:2:{i:1;s:2:"el";i:2;s:3:"ell";}s:7:"strings";a:1:{s:8:"continue";s:16:"Συνέχεια";}}s:5:"en_CA";a:8:{s:8:"language";s:5:"en_CA";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:44:26";s:12:"english_name";s:16:"English (Canada)";s:11:"native_name";s:16:"English (Canada)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/en_CA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_GB";a:8:{s:8:"language";s:5:"en_GB";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:46:15";s:12:"english_name";s:12:"English (UK)";s:11:"native_name";s:12:"English (UK)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/en_GB.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_AU";a:8:{s:8:"language";s:5:"en_AU";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:42:35";s:12:"english_name";s:19:"English (Australia)";s:11:"native_name";s:19:"English (Australia)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/en_AU.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"eo";a:8:{s:8:"language";s:2:"eo";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:48:12";s:12:"english_name";s:9:"Esperanto";s:11:"native_name";s:9:"Esperanto";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/eo.zip";s:3:"iso";a:2:{i:1;s:2:"eo";i:2;s:3:"epo";}s:7:"strings";a:1:{s:8:"continue";s:8:"Daŭrigi";}}s:5:"es_MX";a:8:{s:8:"language";s:5:"es_MX";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:54:32";s:12:"english_name";s:16:"Spanish (Mexico)";s:11:"native_name";s:19:"Español de México";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/es_MX.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_PE";a:8:{s:8:"language";s:5:"es_PE";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:56:31";s:12:"english_name";s:14:"Spanish (Peru)";s:11:"native_name";s:17:"Español de Perú";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/es_PE.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_ES";a:8:{s:8:"language";s:5:"es_ES";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:50:12";s:12:"english_name";s:15:"Spanish (Spain)";s:11:"native_name";s:8:"Español";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/es_ES.zip";s:3:"iso";a:1:{i:1;s:2:"es";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CL";a:8:{s:8:"language";s:5:"es_CL";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 19:47:01";s:12:"english_name";s:15:"Spanish (Chile)";s:11:"native_name";s:17:"Español de Chile";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/es_CL.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"eu";a:8:{s:8:"language";s:2:"eu";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-27 08:55:29";s:12:"english_name";s:6:"Basque";s:11:"native_name";s:7:"Euskara";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/eu.zip";s:3:"iso";a:2:{i:1;s:2:"eu";i:2;s:3:"eus";}s:7:"strings";a:1:{s:8:"continue";s:8:"Jarraitu";}}s:5:"fa_IR";a:8:{s:8:"language";s:5:"fa_IR";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:03:17";s:12:"english_name";s:7:"Persian";s:11:"native_name";s:10:"فارسی";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/fa_IR.zip";s:3:"iso";a:2:{i:1;s:2:"fa";i:2;s:3:"fas";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:2:"fi";a:8:{s:8:"language";s:2:"fi";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-18 08:12:21";s:12:"english_name";s:7:"Finnish";s:11:"native_name";s:5:"Suomi";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/fi.zip";s:3:"iso";a:2:{i:1;s:2:"fi";i:2;s:3:"fin";}s:7:"strings";a:1:{s:8:"continue";s:5:"Jatka";}}s:5:"fr_FR";a:8:{s:8:"language";s:5:"fr_FR";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:08:29";s:12:"english_name";s:15:"French (France)";s:11:"native_name";s:9:"Français";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/fr_FR.zip";s:3:"iso";a:1:{i:1;s:2:"fr";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:2:"gd";a:8:{s:8:"language";s:2:"gd";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-05 17:37:43";s:12:"english_name";s:15:"Scottish Gaelic";s:11:"native_name";s:9:"Gàidhlig";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.0/gd.zip";s:3:"iso";a:3:{i:1;s:2:"gd";i:2;s:3:"gla";i:3;s:3:"gla";}s:7:"strings";a:1:{s:8:"continue";s:15:"Lean air adhart";}}s:5:"gl_ES";a:8:{s:8:"language";s:5:"gl_ES";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:14:57";s:12:"english_name";s:8:"Galician";s:11:"native_name";s:6:"Galego";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/gl_ES.zip";s:3:"iso";a:2:{i:1;s:2:"gl";i:2;s:3:"glg";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:3:"haz";a:8:{s:8:"language";s:3:"haz";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:20:27";s:12:"english_name";s:8:"Hazaragi";s:11:"native_name";s:15:"هزاره گی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1.1/haz.zip";s:3:"iso";a:2:{i:1;s:3:"haz";i:2;s:3:"haz";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:5:"he_IL";a:8:{s:8:"language";s:5:"he_IL";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-04-08 22:28:26";s:12:"english_name";s:6:"Hebrew";s:11:"native_name";s:16:"עִבְרִית";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/he_IL.zip";s:3:"iso";a:1:{i:1;s:2:"he";}s:7:"strings";a:1:{s:8:"continue";s:12:"להמשיך";}}s:2:"hr";a:8:{s:8:"language";s:2:"hr";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:25:25";s:12:"english_name";s:8:"Croatian";s:11:"native_name";s:8:"Hrvatski";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/hr.zip";s:3:"iso";a:2:{i:1;s:2:"hr";i:2;s:3:"hrv";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:5:"hu_HU";a:8:{s:8:"language";s:5:"hu_HU";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:27:28";s:12:"english_name";s:9:"Hungarian";s:11:"native_name";s:6:"Magyar";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/hu_HU.zip";s:3:"iso";a:2:{i:1;s:2:"hu";i:2;s:3:"hun";}s:7:"strings";a:1:{s:8:"continue";s:7:"Tovább";}}s:5:"id_ID";a:8:{s:8:"language";s:5:"id_ID";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:29:34";s:12:"english_name";s:10:"Indonesian";s:11:"native_name";s:16:"Bahasa Indonesia";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/id_ID.zip";s:3:"iso";a:2:{i:1;s:2:"id";i:2;s:3:"ind";}s:7:"strings";a:1:{s:8:"continue";s:9:"Lanjutkan";}}s:5:"is_IS";a:8:{s:8:"language";s:5:"is_IS";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-15 22:23:37";s:12:"english_name";s:9:"Icelandic";s:11:"native_name";s:9:"Íslenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/is_IS.zip";s:3:"iso";a:2:{i:1;s:2:"is";i:2;s:3:"isl";}s:7:"strings";a:1:{s:8:"continue";s:6:"Áfram";}}s:5:"it_IT";a:8:{s:8:"language";s:5:"it_IT";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:33:39";s:12:"english_name";s:7:"Italian";s:11:"native_name";s:8:"Italiano";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/it_IT.zip";s:3:"iso";a:2:{i:1;s:2:"it";i:2;s:3:"ita";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"ja";a:8:{s:8:"language";s:2:"ja";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:35:42";s:12:"english_name";s:8:"Japanese";s:11:"native_name";s:9:"日本語";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/ja.zip";s:3:"iso";a:1:{i:1;s:2:"ja";}s:7:"strings";a:1:{s:8:"continue";s:9:"続ける";}}s:5:"ko_KR";a:8:{s:8:"language";s:5:"ko_KR";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:43:18";s:12:"english_name";s:6:"Korean";s:11:"native_name";s:9:"한국어";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/ko_KR.zip";s:3:"iso";a:2:{i:1;s:2:"ko";i:2;s:3:"kor";}s:7:"strings";a:1:{s:8:"continue";s:6:"계속";}}s:5:"lt_LT";a:8:{s:8:"language";s:5:"lt_LT";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:47:56";s:12:"english_name";s:10:"Lithuanian";s:11:"native_name";s:15:"Lietuvių kalba";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/lt_LT.zip";s:3:"iso";a:2:{i:1;s:2:"lt";i:2;s:3:"lit";}s:7:"strings";a:1:{s:8:"continue";s:6:"Tęsti";}}s:5:"my_MM";a:8:{s:8:"language";s:5:"my_MM";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:57:42";s:12:"english_name";s:7:"Burmese";s:11:"native_name";s:15:"ဗမာစာ";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/my_MM.zip";s:3:"iso";a:2:{i:1;s:2:"my";i:2;s:3:"mya";}s:7:"strings";a:1:{s:8:"continue";s:54:"ဆက်လက်လုပ်ေဆာင်ပါ။";}}s:5:"nb_NO";a:8:{s:8:"language";s:5:"nb_NO";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:59:41";s:12:"english_name";s:19:"Norwegian (Bokmål)";s:11:"native_name";s:13:"Norsk bokmål";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/nb_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nb";i:2;s:3:"nob";}s:7:"strings";a:1:{s:8:"continue";s:8:"Fortsett";}}s:5:"nl_NL";a:8:{s:8:"language";s:5:"nl_NL";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:02:30";s:12:"english_name";s:5:"Dutch";s:11:"native_name";s:10:"Nederlands";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/nl_NL.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nn_NO";a:8:{s:8:"language";s:5:"nn_NO";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-04-16 06:38:46";s:12:"english_name";s:19:"Norwegian (Nynorsk)";s:11:"native_name";s:13:"Norsk nynorsk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/nn_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nn";i:2;s:3:"nno";}s:7:"strings";a:1:{s:8:"continue";s:9:"Hald fram";}}s:5:"pl_PL";a:8:{s:8:"language";s:5:"pl_PL";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:07:08";s:12:"english_name";s:6:"Polish";s:11:"native_name";s:6:"Polski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/pl_PL.zip";s:3:"iso";a:2:{i:1;s:2:"pl";i:2;s:3:"pol";}s:7:"strings";a:1:{s:8:"continue";s:9:"Kontynuuj";}}s:2:"ps";a:8:{s:8:"language";s:2:"ps";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-29 22:19:48";s:12:"english_name";s:6:"Pashto";s:11:"native_name";s:8:"پښتو";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/ps.zip";s:3:"iso";a:1:{i:1;s:2:"ps";}s:7:"strings";a:1:{s:8:"continue";s:8:"دوام";}}s:5:"pt_PT";a:8:{s:8:"language";s:5:"pt_PT";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:11:07";s:12:"english_name";s:21:"Portuguese (Portugal)";s:11:"native_name";s:10:"Português";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/pt_PT.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_BR";a:8:{s:8:"language";s:5:"pt_BR";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:14:41";s:12:"english_name";s:19:"Portuguese (Brazil)";s:11:"native_name";s:20:"Português do Brasil";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/pt_BR.zip";s:3:"iso";a:2:{i:1;s:2:"pt";i:2;s:3:"por";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"ro_RO";a:8:{s:8:"language";s:5:"ro_RO";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-27 14:48:56";s:12:"english_name";s:8:"Romanian";s:11:"native_name";s:8:"Română";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/ro_RO.zip";s:3:"iso";a:2:{i:1;s:2:"ro";i:2;s:3:"ron";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuă";}}s:5:"ru_RU";a:8:{s:8:"language";s:5:"ru_RU";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:19:48";s:12:"english_name";s:7:"Russian";s:11:"native_name";s:14:"Русский";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/ru_RU.zip";s:3:"iso";a:2:{i:1;s:2:"ru";i:2;s:3:"rus";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:5:"sk_SK";a:8:{s:8:"language";s:5:"sk_SK";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:23:44";s:12:"english_name";s:6:"Slovak";s:11:"native_name";s:11:"Slovenčina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/sk_SK.zip";s:3:"iso";a:2:{i:1;s:2:"sk";i:2;s:3:"slk";}s:7:"strings";a:1:{s:8:"continue";s:12:"Pokračovať";}}s:5:"sl_SI";a:8:{s:8:"language";s:5:"sl_SI";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:25:46";s:12:"english_name";s:9:"Slovenian";s:11:"native_name";s:13:"Slovenščina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/sl_SI.zip";s:3:"iso";a:2:{i:1;s:2:"sl";i:2;s:3:"slv";}s:7:"strings";a:1:{s:8:"continue";s:10:"Nadaljujte";}}s:5:"sr_RS";a:8:{s:8:"language";s:5:"sr_RS";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:30:35";s:12:"english_name";s:7:"Serbian";s:11:"native_name";s:23:"Српски језик";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/sr_RS.zip";s:3:"iso";a:2:{i:1;s:2:"sr";i:2;s:3:"srp";}s:7:"strings";a:1:{s:8:"continue";s:14:"Настави";}}s:5:"sv_SE";a:8:{s:8:"language";s:5:"sv_SE";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:33:33";s:12:"english_name";s:7:"Swedish";s:11:"native_name";s:7:"Svenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/sv_SE.zip";s:3:"iso";a:2:{i:1;s:2:"sv";i:2;s:3:"swe";}s:7:"strings";a:1:{s:8:"continue";s:9:"Fortsätt";}}s:2:"th";a:8:{s:8:"language";s:2:"th";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-27 00:00:51";s:12:"english_name";s:4:"Thai";s:11:"native_name";s:9:"ไทย";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/th.zip";s:3:"iso";a:2:{i:1;s:2:"th";i:2;s:3:"tha";}s:7:"strings";a:1:{s:8:"continue";s:15:"ต่อไป";}}s:5:"tr_TR";a:8:{s:8:"language";s:5:"tr_TR";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:43:10";s:12:"english_name";s:7:"Turkish";s:11:"native_name";s:8:"Türkçe";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/tr_TR.zip";s:3:"iso";a:2:{i:1;s:2:"tr";i:2;s:3:"tur";}s:7:"strings";a:1:{s:8:"continue";s:5:"Devam";}}s:5:"ug_CN";a:8:{s:8:"language";s:5:"ug_CN";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:45:38";s:12:"english_name";s:6:"Uighur";s:11:"native_name";s:9:"Uyƣurqə";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/ug_CN.zip";s:3:"iso";a:2:{i:1;s:2:"ug";i:2;s:3:"uig";}s:7:"strings";a:1:{s:8:"continue";s:26:"داۋاملاشتۇرۇش";}}s:2:"uk";a:8:{s:8:"language";s:2:"uk";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-04-10 12:55:55";s:12:"english_name";s:9:"Ukrainian";s:11:"native_name";s:20:"Українська";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/uk.zip";s:3:"iso";a:2:{i:1;s:2:"uk";i:2;s:3:"ukr";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продовжити";}}s:5:"zh_TW";a:8:{s:8:"language";s:5:"zh_TW";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:55:15";s:12:"english_name";s:16:"Chinese (Taiwan)";s:11:"native_name";s:12:"繁體中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/zh_TW.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}s:5:"zh_CN";a:8:{s:8:"language";s:5:"zh_CN";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2014-12-26 02:21:02";s:12:"english_name";s:15:"Chinese (China)";s:11:"native_name";s:12:"简体中文";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/zh_CN.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"继续";}}}', 'yes'),
(496, 'rewrite_rules', 'a:68:{s:52:"blog/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:47:"blog/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:40:"blog/category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:22:"blog/category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:49:"blog/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:44:"blog/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:37:"blog/tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:19:"blog/tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:50:"blog/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:45:"blog/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:38:"blog/type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:20:"blog/type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:27:"comment-page-([0-9]{1,})/?$";s:39:"index.php?&page_id=22&cpage=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:52:"blog/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:47:"blog/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:40:"blog/author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:22:"blog/author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:74:"blog/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:69:"blog/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:62:"blog/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:44:"blog/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:61:"blog/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:56:"blog/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:49:"blog/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:31:"blog/([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:48:"blog/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:43:"blog/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:36:"blog/([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:18:"blog/([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:32:"blog/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:42:"blog/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:62:"blog/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:"blog/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:"blog/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:25:"blog/([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:45:"blog/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:40:"blog/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:33:"blog/([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:40:"blog/([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:25:"blog/([^/]+)(/[0-9]+)?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:21:"blog/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:31:"blog/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:51:"blog/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:46:"blog/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:46:"blog/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";}', 'yes'),
(497, '_transient_timeout_settings_errors', '1429372126', 'no'),
(498, '_transient_settings_errors', 'a:1:{i:0;a:4:{s:7:"setting";s:7:"general";s:4:"code";s:16:"settings_updated";s:7:"message";s:15:"Settings saved.";s:4:"type";s:7:"updated";}}', 'no'),
(510, '_site_transient_timeout_browser_48ce97d67f5c394f5ce1d5ccaf049307', '1430019124', 'yes'),
(511, '_site_transient_browser_48ce97d67f5c394f5ce1d5ccaf049307', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"37.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(536, 'auto_core_update_notified', 'a:4:{s:4:"type";s:7:"success";s:5:"email";s:23:"guilhermecruz@gmail.com";s:7:"version";s:5:"4.1.3";s:9:"timestamp";i:1429968457;}', 'yes'),
(580, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:2:{i:0;O:8:"stdClass":10:{s:8:"response";s:7:"upgrade";s:8:"download";s:57:"https://downloads.wordpress.org/release/wordpress-4.2.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:57:"https://downloads.wordpress.org/release/wordpress-4.2.zip";s:10:"no_content";s:68:"https://downloads.wordpress.org/release/wordpress-4.2-no-content.zip";s:11:"new_bundled";s:69:"https://downloads.wordpress.org/release/wordpress-4.2-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:3:"4.2";s:7:"version";s:3:"4.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}i:1;O:8:"stdClass":12:{s:8:"response";s:10:"autoupdate";s:8:"download";s:57:"https://downloads.wordpress.org/release/wordpress-4.2.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:57:"https://downloads.wordpress.org/release/wordpress-4.2.zip";s:10:"no_content";s:68:"https://downloads.wordpress.org/release/wordpress-4.2-no-content.zip";s:11:"new_bundled";s:69:"https://downloads.wordpress.org/release/wordpress-4.2-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:3:"4.2";s:7:"version";s:3:"4.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";s:13:"support_email";s:26:"updatehelp41@wordpress.org";s:9:"new_files";s:1:"1";}}s:12:"last_checked";i:1430075313;s:15:"version_checked";s:5:"4.1.3";s:12:"translations";a:0:{}}', 'yes'),
(605, '_transient_timeout_plugin_slugs', '1430078825', 'no'),
(606, '_transient_plugin_slugs', 'a:2:{i:0;s:19:"akismet/akismet.php";i:1;s:9:"hello.php";}', 'no'),
(622, '_site_transient_timeout_browser_d7bfebab08f0e875ec525b36fe2598e7', '1430664854', 'yes'),
(623, '_site_transient_browser_d7bfebab08f0e875ec525b36fe2598e7', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"42.0.2311.90";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(624, '_transient_timeout_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1430103259', 'no'),
(625, '_transient_timeout_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1430103259', 'no'),
(626, '_transient_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1430060059', 'no'),
(627, '_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9', '1430103265', 'no'),
(628, '_transient_timeout_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1430103265', 'no'),
(629, '_transient_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1430060065', 'no'),
(630, '_transient_timeout_feed_b9388c83948825c1edaef0d856b7b109', '1430103266', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(631, '_transient_feed_b9388c83948825c1edaef0d856b7b109', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:117:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins » View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"https://wordpress.org/plugins/browse/popular/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins » View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 26 Apr 2015 14:50:16 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:30:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Jetpack by WordPress.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://wordpress.org/plugins/jetpack/#post-23862";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Jan 2011 02:21:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"23862@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:28:"Your WordPress, Streamlined.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Tim Moore";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"WordPress SEO by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"https://wordpress.org/plugins/wordpress-seo/#post-8321";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 Jan 2009 20:34:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"8321@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:131:"Improve your WordPress SEO: Write better content and have a fully optimized WordPress site using Yoast&#039;s WordPress SEO plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Contact Form 7";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/contact-form-7/#post-2141";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 02 Aug 2007 12:45:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"2141@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:54:"Just another contact form plugin. Simple but flexible.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Akismet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"https://wordpress.org/plugins/akismet/#post-15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:11:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"15@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:98:"Akismet checks your comments against the Akismet Web service to see if they look like spam or not.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Wordfence Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wordfence/#post-29832";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 04 Sep 2011 03:13:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"29832@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:137:"Wordfence Security is a free enterprise class security and performance plugin that makes your site up to 50 times faster and more secure.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Wordfence";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"Google Analytics by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"https://wordpress.org/plugins/google-analytics-for-wordpress/#post-2316";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 14 Sep 2007 12:15:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"2316@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:124:"Track your WordPress site easily with the latest tracking codes and lots added data for search result pages and error pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"All in One SEO Pack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/all-in-one-seo-pack/#post-753";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 30 Mar 2007 20:08:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"753@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:126:"All in One SEO Pack is a WordPress SEO plugin to automatically optimize your WordPress blog for Search Engines such as Google.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"uberdose";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WooCommerce - excelling eCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/woocommerce/#post-29860";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Sep 2011 08:13:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"29860@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:97:"WooCommerce is a powerful, extendable eCommerce plugin that helps you sell anything. Beautifully.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"WooThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Broken Link Checker";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/broken-link-checker/#post-2441";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 08 Oct 2007 21:35:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"2441@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:131:"This plugin will check your posts, comments and other content for broken links and missing images, and notify you if any are found.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Janis Elsts";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"TinyMCE Advanced";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"https://wordpress.org/plugins/tinymce-advanced/#post-2082";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 27 Jun 2007 15:00:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"2082@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Enables the advanced features of TinyMCE, the WordPress WYSIWYG editor.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Andrew Ozz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"UpdraftPlus Backup and Restoration";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/updraftplus/#post-38058";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 21 May 2012 15:14:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"38058@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:148:"Backup and restoration made easy. Complete backups; manual or scheduled (backup to S3, Dropbox, Google Drive, Rackspace, FTP, SFTP, email + others).";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"David Anderson";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"WPtouch Mobile Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"https://wordpress.org/plugins/wptouch/#post-5468";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 May 2008 04:58:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"5468@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:67:"Make your WordPress website mobile-friendly with just a few clicks.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"BraveNewCode Inc.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:32:"P3 (Plugin Performance Profiler)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/p3-profiler/#post-32894";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 12 Dec 2011 23:11:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"32894@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:102:"See which plugins are slowing down your site.  This plugin creates a performance report for your site.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"GoDaddy.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WordPress Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wordpress-importer/#post-18101";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 May 2010 17:42:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"18101@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:101:"Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Brian Colinger";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Page Builder by SiteOrigin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/siteorigin-panels/#post-51888";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 11 Apr 2013 10:36:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"51888@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:111:"Build responsive page layouts using the widgets you know and love using this simple drag and drop page builder.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Greg Priday";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WP Multibyte Patch";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wp-multibyte-patch/#post-28395";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Jul 2011 12:22:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"28395@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Multibyte functionality enhancement for the WordPress Japanese package.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"plugin-master";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"bbPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://wordpress.org/plugins/bbpress/#post-14709";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 13 Dec 2009 00:05:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"14709@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:50:"bbPress is forum software, made the WordPress way.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"John James Jacoby";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Meta Slider";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/ml-slider/#post-49521";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Feb 2013 16:56:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"49521@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:145:"Easy to use WordPress slider plugin. Create SEO optimised responsive slideshows with Nivo Slider, Flex Slider, Coin Slider and Responsive Slides.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Matcha Labs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"The Events Calendar";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:61:"https://wordpress.org/plugins/the-events-calendar/#post-14790";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 16 Dec 2009 21:58:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"14790@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:128:"The Events Calendar is a carefully crafted, extensible plugin that lets you easily share your events. Beautiful. Solid. Awesome.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Peter Chester";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"ManageWP Worker";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"https://wordpress.org/plugins/worker/#post-24528";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 18 Feb 2011 13:06:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"24528@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:103:"ManageWP is the ultimate WordPress productivity tool, allowing you to efficiently manage your websites.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Vladimir Prelovac";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WP Super Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/wp-super-cache/#post-2572";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Nov 2007 11:40:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"2572@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:73:"A very fast caching engine for WordPress that produces static html files.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Donncha O Caoimh";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Google XML Sitemaps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/google-sitemap-generator/#post-132";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:31:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"132@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:105:"This plugin will generate a special XML sitemap which will help search engines to better index your blog.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Arne Brachhold";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"Google Analytics Dashboard for WP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"https://wordpress.org/plugins/google-analytics-dashboard-for-wp/#post-50539";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 10 Mar 2013 17:07:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"50539@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:148:"Displays Google Analytics reports and real-time statistics in your WordPress Dashboard. Inserts the latest tracking code in every page of your site.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Alin Marcu";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"NextGEN Gallery";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/nextgen-gallery/#post-1169";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Apr 2007 20:08:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"1169@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:121:"The most popular WordPress gallery plugin and one of the most popular plugins of all time with over 12 million downloads.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Alex Rabe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:8:"WP Smush";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wp-smushit/#post-7936";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 04 Dec 2008 00:00:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"7936@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:108:"Reduce image file sizes, improve performance and boost your SEO using the free WPMU DEV WordPress Smush API.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Alex Dunae";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:10:"BuddyPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/buddypress/#post-10314";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 23 Apr 2009 17:48:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"10314@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:144:"BuddyPress helps you run any kind of social network on your WordPress, with member profiles, activity streams, user groups, messaging, and more.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Andy Peatling";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Redirection";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/redirection/#post-2286";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 10 Sep 2007 04:45:08 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"2286@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:144:"Redirection is a WordPress plugin to manage 301 redirections and keep track of 404 errors without requiring knowledge of Apache .htaccess files.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"John Godley";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:13:"Photo Gallery";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/photo-gallery/#post-63299";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 27 Jan 2014 15:58:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"63299@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:143:"Photo Gallery is an advanced plugin with a list of tools and options for adding and editing images for different views. It is fully responsive.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"webdorado";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Ninja Forms";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/ninja-forms/#post-33147";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 20 Dec 2011 18:11:48 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"33147@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:142:"Forms created with a simple drag and drop interface. Contact forms, Email collection forms, or any other form you want on your WordPress site.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:7:"kstover";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:37:"All In One WP Security &amp; Firewall";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:77:"https://wordpress.org/plugins/all-in-one-wp-security-and-firewall/#post-54002";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 31 May 2013 23:50:15 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"54002@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:96:"A comprehensive, user-friendly, all in one WordPress security and firewall plugin for your site.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"mra13";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:46:"https://wordpress.org/plugins/rss/view/popular";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:9:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Sun, 26 Apr 2015 14:54:30 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:25:"strict-transport-security";s:11:"max-age=360";s:13:"last-modified";s:29:"Thu, 20 Jan 2011 02:21:38 GMT";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 250";}s:5:"build";s:14:"20150321132934";}', 'no'),
(632, '_transient_timeout_feed_mod_b9388c83948825c1edaef0d856b7b109', '1430103266', 'no'),
(633, '_transient_feed_mod_b9388c83948825c1edaef0d856b7b109', '1430060066', 'no'),
(634, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1430103266', 'no'),
(635, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><ul><li><a class=''rsswidget'' href=''https://wordpress.org/news/2015/04/powell/''>WordPress 4.2 “Powell”</a> <span class="rss-date">April 23, 2015</span><div class="rssSummary">Version 4.2 of WordPress, named “Powell” in honor of jazz pianist Bud Powell, is available for download or update in your WordPress dashboard. New features in 4.2 help you communicate and share, globally. An easier way to share content Clip it, edit it, publish it. Get familiar with the new and improved Press This. From [&hellip;]</div></li></ul></div><div class="rss-widget"><ul><li><a class=''rsswidget'' href=''http://ma.tt/2015/04/100-books/''>Matt: 100 Books</a></li><li><a class=''rsswidget'' href=''http://ma.tt/2015/04/atlantic-earth-day-pictures/''>Matt: Atlantic Earth Day Pictures</a></li><li><a class=''rsswidget'' href=''http://wptavern.com/automattics-dave-martin-publishes-his-5-step-remote-hiring-process''>WPTavern: Automattic’s Dave Martin Publishes His 5 Step Remote Hiring Process</a></li></ul></div><div class="rss-widget"><ul><li class=''dashboard-news-plugin''><span>Popular Plugin:</span> <a href=''https://wordpress.org/plugins/photo-gallery/'' class=''dashboard-news-plugin-link''>Photo Gallery</a>&nbsp;<span>(<a href=''plugin-install.php?tab=plugin-information&amp;plugin=photo-gallery&amp;_wpnonce=9e0718efc0&amp;TB_iframe=true&amp;width=600&amp;height=800'' class=''thickbox'' title=''Photo Gallery''>Install</a>)</span></li></ul></div>', 'no'),
(645, '_site_transient_timeout_theme_roots', '1430077111', 'yes'),
(646, '_site_transient_theme_roots', 'a:4:{s:8:"isotopic";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";}', 'yes'),
(647, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1430075314;s:7:"checked";a:4:{s:8:"isotopic";s:0:"";s:13:"twentyfifteen";s:3:"1.0";s:14:"twentyfourteen";s:3:"1.3";s:14:"twentythirteen";s:3:"1.4";}s:8:"response";a:3:{s:13:"twentyfifteen";a:4:{s:5:"theme";s:13:"twentyfifteen";s:11:"new_version";s:3:"1.1";s:3:"url";s:43:"https://wordpress.org/themes/twentyfifteen/";s:7:"package";s:59:"https://downloads.wordpress.org/theme/twentyfifteen.1.1.zip";}s:14:"twentyfourteen";a:4:{s:5:"theme";s:14:"twentyfourteen";s:11:"new_version";s:3:"1.4";s:3:"url";s:44:"https://wordpress.org/themes/twentyfourteen/";s:7:"package";s:60:"https://downloads.wordpress.org/theme/twentyfourteen.1.4.zip";}s:14:"twentythirteen";a:4:{s:5:"theme";s:14:"twentythirteen";s:11:"new_version";s:3:"1.5";s:3:"url";s:44:"https://wordpress.org/themes/twentythirteen/";s:7:"package";s:60:"https://downloads.wordpress.org/theme/twentythirteen.1.5.zip";}}s:12:"translations";a:0:{}}', 'yes'),
(648, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1430075314;s:8:"response";a:1:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"3.1.1";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.3.1.1.zip";}}s:12:"translations";a:0:{}s:9:"no_update";a:1:{s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}}}', 'yes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=261 ;

--
-- Extraindo dados da tabela `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'page-templates/front-page.php'),
(2, 1, '_edit_lock', '1418324057:1'),
(3, 1, '_edit_last', '1'),
(8, 7, '_edit_last', '1'),
(9, 7, '_edit_lock', '1418325681:1'),
(20, 2, '_edit_lock', '1429663509:1'),
(21, 2, '_edit_last', '1'),
(22, 10, '_edit_last', '1'),
(23, 10, '_edit_lock', '1429665239:1'),
(24, 12, '_edit_last', '1'),
(25, 12, '_edit_lock', '1429663534:1'),
(26, 14, '_edit_last', '1'),
(27, 14, '_edit_lock', '1430086699:1'),
(28, 16, '_edit_last', '1'),
(29, 16, '_edit_lock', '1430086960:1'),
(30, 18, '_edit_last', '1'),
(31, 18, '_edit_lock', '1429663560:1'),
(32, 22, '_edit_last', '1'),
(33, 22, '_edit_lock', '1429662268:1'),
(34, 2, 'post_subtitle', 'Right to the point'),
(35, 12, 'post_subtitle', 'Many routes available'),
(36, 18, 'post_subtitle', 'Heavy load of content'),
(37, 10, 'post_subtitle', 'A fast and reliable line'),
(38, 27, '_menu_item_type', 'post_type'),
(39, 27, '_menu_item_menu_item_parent', '0'),
(40, 27, '_menu_item_object_id', '22'),
(41, 27, '_menu_item_object', 'page'),
(42, 27, '_menu_item_target', ''),
(43, 27, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(44, 27, '_menu_item_xfn', ''),
(45, 27, '_menu_item_url', ''),
(46, 27, '_menu_item_orphaned', '1428455569'),
(47, 28, '_menu_item_type', 'post_type'),
(48, 28, '_menu_item_menu_item_parent', '0'),
(49, 28, '_menu_item_object_id', '22'),
(50, 28, '_menu_item_object', 'page'),
(51, 28, '_menu_item_target', ''),
(52, 28, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(53, 28, '_menu_item_xfn', ''),
(54, 28, '_menu_item_url', ''),
(55, 28, '_menu_item_orphaned', '1428455569'),
(56, 29, '_menu_item_type', 'post_type'),
(57, 29, '_menu_item_menu_item_parent', '0'),
(58, 29, '_menu_item_object_id', '2'),
(59, 29, '_menu_item_object', 'page'),
(60, 29, '_menu_item_target', ''),
(61, 29, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(62, 29, '_menu_item_xfn', ''),
(63, 29, '_menu_item_url', ''),
(64, 29, '_menu_item_orphaned', '1428455570'),
(65, 30, '_menu_item_type', 'post_type'),
(66, 30, '_menu_item_menu_item_parent', '0'),
(67, 30, '_menu_item_object_id', '12'),
(68, 30, '_menu_item_object', 'page'),
(69, 30, '_menu_item_target', ''),
(70, 30, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(71, 30, '_menu_item_xfn', ''),
(72, 30, '_menu_item_url', ''),
(73, 30, '_menu_item_orphaned', '1428455570'),
(74, 31, '_menu_item_type', 'post_type'),
(75, 31, '_menu_item_menu_item_parent', '0'),
(76, 31, '_menu_item_object_id', '16'),
(77, 31, '_menu_item_object', 'page'),
(78, 31, '_menu_item_target', ''),
(79, 31, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(80, 31, '_menu_item_xfn', ''),
(81, 31, '_menu_item_url', ''),
(82, 31, '_menu_item_orphaned', '1428455570'),
(83, 32, '_menu_item_type', 'post_type'),
(84, 32, '_menu_item_menu_item_parent', '0'),
(85, 32, '_menu_item_object_id', '14'),
(86, 32, '_menu_item_object', 'page'),
(87, 32, '_menu_item_target', ''),
(88, 32, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(89, 32, '_menu_item_xfn', ''),
(90, 32, '_menu_item_url', ''),
(91, 32, '_menu_item_orphaned', '1428455570'),
(92, 33, '_menu_item_type', 'post_type'),
(93, 33, '_menu_item_menu_item_parent', '0'),
(94, 33, '_menu_item_object_id', '18'),
(95, 33, '_menu_item_object', 'page'),
(96, 33, '_menu_item_target', ''),
(97, 33, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(98, 33, '_menu_item_xfn', ''),
(99, 33, '_menu_item_url', ''),
(100, 33, '_menu_item_orphaned', '1428455570'),
(101, 34, '_menu_item_type', 'post_type'),
(102, 34, '_menu_item_menu_item_parent', '0'),
(103, 34, '_menu_item_object_id', '10'),
(104, 34, '_menu_item_object', 'page'),
(105, 34, '_menu_item_target', ''),
(106, 34, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(107, 34, '_menu_item_xfn', ''),
(108, 34, '_menu_item_url', ''),
(109, 34, '_menu_item_orphaned', '1428455570'),
(110, 35, '_menu_item_type', 'post_type'),
(111, 35, '_menu_item_menu_item_parent', '0'),
(112, 35, '_menu_item_object_id', '18'),
(113, 35, '_menu_item_object', 'page'),
(114, 35, '_menu_item_target', ''),
(115, 35, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(116, 35, '_menu_item_xfn', ''),
(117, 35, '_menu_item_url', ''),
(118, 35, '_menu_item_orphaned', '1428455602'),
(119, 36, '_menu_item_type', 'post_type'),
(120, 36, '_menu_item_menu_item_parent', '0'),
(121, 36, '_menu_item_object_id', '12'),
(122, 36, '_menu_item_object', 'page'),
(123, 36, '_menu_item_target', ''),
(124, 36, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(125, 36, '_menu_item_xfn', ''),
(126, 36, '_menu_item_url', ''),
(127, 36, '_menu_item_orphaned', '1428455602'),
(128, 37, '_menu_item_type', 'post_type'),
(129, 37, '_menu_item_menu_item_parent', '0'),
(130, 37, '_menu_item_object_id', '10'),
(131, 37, '_menu_item_object', 'page'),
(132, 37, '_menu_item_target', ''),
(133, 37, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(134, 37, '_menu_item_xfn', ''),
(135, 37, '_menu_item_url', ''),
(136, 37, '_menu_item_orphaned', '1428455602'),
(137, 38, '_menu_item_type', 'post_type'),
(138, 38, '_menu_item_menu_item_parent', '0'),
(139, 38, '_menu_item_object_id', '2'),
(140, 38, '_menu_item_object', 'page'),
(141, 38, '_menu_item_target', ''),
(142, 38, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(143, 38, '_menu_item_xfn', ''),
(144, 38, '_menu_item_url', ''),
(145, 38, '_menu_item_orphaned', '1428455602'),
(146, 39, '_menu_item_type', 'post_type'),
(147, 39, '_menu_item_menu_item_parent', '0'),
(148, 39, '_menu_item_object_id', '18'),
(149, 39, '_menu_item_object', 'page'),
(150, 39, '_menu_item_target', ''),
(151, 39, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(152, 39, '_menu_item_xfn', ''),
(153, 39, '_menu_item_url', ''),
(155, 40, '_menu_item_type', 'post_type'),
(156, 40, '_menu_item_menu_item_parent', '0'),
(157, 40, '_menu_item_object_id', '12'),
(158, 40, '_menu_item_object', 'page'),
(159, 40, '_menu_item_target', ''),
(160, 40, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(161, 40, '_menu_item_xfn', ''),
(162, 40, '_menu_item_url', ''),
(164, 41, '_menu_item_type', 'post_type'),
(165, 41, '_menu_item_menu_item_parent', '0'),
(166, 41, '_menu_item_object_id', '10'),
(167, 41, '_menu_item_object', 'page'),
(168, 41, '_menu_item_target', ''),
(169, 41, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(170, 41, '_menu_item_xfn', ''),
(171, 41, '_menu_item_url', ''),
(173, 42, '_menu_item_type', 'post_type'),
(174, 42, '_menu_item_menu_item_parent', '0'),
(175, 42, '_menu_item_object_id', '2'),
(176, 42, '_menu_item_object', 'page'),
(177, 42, '_menu_item_target', ''),
(178, 42, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(179, 42, '_menu_item_xfn', ''),
(180, 42, '_menu_item_url', ''),
(185, 66, '_wp_attached_file', '2014/12/run_a.jpg'),
(186, 66, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:17:"2014/12/run_a.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:17:"run_a-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:17:"run_a-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(187, 67, '_wp_attached_file', '2014/12/run_c.jpg'),
(188, 67, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:17:"2014/12/run_c.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:17:"run_c-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:17:"run_c-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(189, 70, '_wp_attached_file', '2014/12/toros_a.jpg'),
(190, 70, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:19:"2014/12/toros_a.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"toros_a-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:19:"toros_a-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(191, 71, '_wp_attached_file', '2014/12/toros_c.jpg'),
(192, 71, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:19:"2014/12/toros_c.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"toros_c-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:19:"toros_c-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(194, 16, '_thumbnail_id', '66'),
(195, 14, '_thumbnail_id', '70'),
(196, 73, '_wp_attached_file', '2015/04/cacaushow_a.jpg'),
(197, 73, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:23:"2015/04/cacaushow_a.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:23:"cacaushow_a-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:23:"cacaushow_a-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(198, 74, '_wp_attached_file', '2015/04/cafeque_0.jpg'),
(199, 74, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:21:"2015/04/cafeque_0.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"cafeque_0-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"cafeque_0-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(200, 75, '_wp_attached_file', '2015/04/chocobichos_a.jpg'),
(201, 75, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:25:"2015/04/chocobichos_a.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:25:"chocobichos_a-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:25:"chocobichos_a-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(202, 76, '_wp_attached_file', '2015/04/jornada_b.jpg'),
(203, 76, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:21:"2015/04/jornada_b.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"jornada_b-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"jornada_b-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(204, 77, '_wp_attached_file', '2015/04/natal2010_a.jpg'),
(205, 77, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:23:"2015/04/natal2010_a.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:23:"natal2010_a-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:23:"natal2010_a-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(206, 72, '_edit_last', '1'),
(207, 72, '_edit_lock', '1430086922:1'),
(208, 78, '_wp_attached_file', '2015/04/cafeque_a.jpg'),
(209, 78, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:21:"2015/04/cafeque_a.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"cafeque_a-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"cafeque_a-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(210, 79, '_wp_attached_file', '2015/04/cafeque_b.jpg'),
(211, 79, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:21:"2015/04/cafeque_b.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"cafeque_b-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"cafeque_b-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(212, 80, '_wp_attached_file', '2015/04/cappuccino_a.jpg'),
(213, 80, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:24:"2015/04/cappuccino_a.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:24:"cappuccino_a-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:24:"cappuccino_a-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(214, 81, '_wp_attached_file', '2015/04/cappuccino_b.jpg'),
(215, 81, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:24:"2015/04/cappuccino_b.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:24:"cappuccino_b-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:24:"cappuccino_b-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(216, 82, '_wp_attached_file', '2015/04/cappuccino_c.jpg'),
(217, 82, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:24:"2015/04/cappuccino_c.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:24:"cappuccino_c-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:24:"cappuccino_c-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(218, 83, '_wp_attached_file', '2015/04/chocobichos_a1.jpg'),
(219, 83, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:26:"2015/04/chocobichos_a1.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:26:"chocobichos_a1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:26:"chocobichos_a1-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(220, 84, '_wp_attached_file', '2015/04/chocobichos_b.jpg'),
(221, 84, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:25:"2015/04/chocobichos_b.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:25:"chocobichos_b-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:25:"chocobichos_b-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(222, 85, '_wp_attached_file', '2015/04/chocobichos_c.jpg'),
(223, 85, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:25:"2015/04/chocobichos_c.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:25:"chocobichos_c-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:25:"chocobichos_c-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(224, 86, '_wp_attached_file', '2015/04/levis_a.jpg'),
(225, 86, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:19:"2015/04/levis_a.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"levis_a-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:19:"levis_a-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(226, 87, '_wp_attached_file', '2015/04/levis_b.jpg'),
(227, 87, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:19:"2015/04/levis_b.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"levis_b-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:19:"levis_b-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(228, 88, '_wp_attached_file', '2015/04/levis_c.jpg'),
(229, 88, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:19:"2015/04/levis_c.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"levis_c-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:19:"levis_c-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(230, 89, '_wp_attached_file', '2015/04/trufas_0.jpg'),
(231, 89, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:20:"2015/04/trufas_0.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"trufas_0-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:20:"trufas_0-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(232, 90, '_wp_attached_file', '2015/04/trufas_a.jpg'),
(233, 90, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:20:"2015/04/trufas_a.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"trufas_a-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:20:"trufas_a-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(234, 91, '_wp_attached_file', '2015/04/trufas_c.jpg'),
(235, 91, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:20:"2015/04/trufas_c.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"trufas_c-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:20:"trufas_c-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(236, 72, '_thumbnail_id', '89'),
(237, 90, '_edit_lock', '1429994182:1'),
(238, 94, '_edit_last', '1'),
(239, 94, '_edit_lock', '1430086928:1'),
(240, 94, '_thumbnail_id', '74'),
(241, 96, '_thumbnail_id', '75'),
(242, 96, '_edit_last', '1'),
(243, 96, '_edit_lock', '1430062722:1'),
(244, 98, '_edit_last', '1'),
(245, 98, '_edit_lock', '1430086949:1'),
(246, 98, '_thumbnail_id', '87'),
(247, 100, '_edit_last', '1'),
(248, 100, '_edit_lock', '1430094176:1'),
(249, 101, '_wp_attached_file', '2015/04/levismusic_0.jpg'),
(250, 101, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:24:"2015/04/levismusic_0.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:24:"levismusic_0-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:24:"levismusic_0-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(251, 102, '_wp_attached_file', '2015/04/levismusic_a.jpg'),
(252, 102, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:520;s:6:"height";i:350;s:4:"file";s:24:"2015/04/levismusic_a.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:24:"levismusic_a-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:24:"levismusic_a-300x202.jpg";s:5:"width";i:300;s:6:"height";i:202;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(253, 100, '_thumbnail_id', '101'),
(254, 104, '_edit_last', '1'),
(255, 104, '_edit_lock', '1430086942:1'),
(256, 104, '_thumbnail_id', '80'),
(257, 106, '_wp_trash_meta_status', 'auto-draft'),
(258, 106, '_wp_trash_meta_time', '1430011565'),
(259, 94, 'project_url', 'http://www.cafe3coracoes.com.br'),
(260, 94, 'ano', '2008');

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=113 ;

--
-- Extraindo dados da tabela `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2014-12-11 17:20:18', '2014-12-11 17:20:18', 'This is the content of the post.', 'This is some post.', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2014-12-11 18:56:40', '2014-12-11 18:56:40', '', 0, 'http://localhost/isotopic/wordpress/?p=1', 0, 'post', '', 2),
(2, 1, '2014-12-11 17:20:18', '2014-12-11 17:20:18', 'This is the About page.', 'About', '', 'publish', 'open', 'closed', '', 'about', '', '', '2015-04-21 21:47:32', '2015-04-22 00:47:32', '', 0, 'http://localhost/isotopic/wordpress/?page_id=2', 1, 'page', '', 0),
(5, 1, '2014-12-11 18:53:37', '2014-12-11 18:53:37', 'This is the about content.', 'About', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2014-12-11 18:53:37', '2014-12-11 18:53:37', '', 1, 'http://localhost/isotopic/1-revision-v1/', 0, 'revision', '', 0),
(6, 1, '2014-12-11 18:54:24', '2014-12-11 18:54:24', 'This is the content of the post.', 'This is some post.', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2014-12-11 18:54:24', '2014-12-11 18:54:24', '', 1, 'http://localhost/isotopic/1-revision-v1/', 0, 'revision', '', 0),
(7, 1, '2014-12-11 18:55:00', '2014-12-11 18:55:00', 'Second post''s content.', 'And this one is a second post.', '', 'publish', 'open', 'open', '', 'and-this-one-is-a-second-post', '', '', '2014-12-11 18:57:02', '2014-12-11 18:57:02', '', 0, 'http://localhost/isotopic/?p=7', 0, 'post', '', 0),
(8, 1, '2014-12-11 18:55:00', '2014-12-11 18:55:00', 'Second post''s content.', 'And this one is a second post.', '', 'inherit', 'open', 'open', '', '7-revision-v1', '', '', '2014-12-11 18:55:00', '2014-12-11 18:55:00', '', 7, 'http://localhost/isotopic/7-revision-v1/', 0, 'revision', '', 0),
(9, 1, '2014-12-11 18:57:46', '2014-12-11 18:57:46', 'What I am about.', 'About', '', 'inherit', 'open', 'open', '', '2-revision-v1', '', '', '2014-12-11 18:57:46', '2014-12-11 18:57:46', '', 2, 'http://localhost/isotopic/2-revision-v1/', 0, 'revision', '', 0),
(10, 1, '2014-12-11 18:58:05', '2014-12-11 18:58:05', 'This is the contact page.', 'Contact', '', 'publish', 'open', 'closed', '', 'contact', '', '', '2015-04-21 21:48:42', '2015-04-22 00:48:42', '', 0, 'http://localhost/isotopic/?page_id=10', 4, 'page', '', 0),
(11, 1, '2014-12-11 18:58:05', '2014-12-11 18:58:05', 'This is the contact page.', 'Contact', '', 'inherit', 'open', 'open', '', '10-revision-v1', '', '', '2014-12-11 18:58:05', '2014-12-11 18:58:05', '', 10, 'http://localhost/isotopic/10-revision-v1/', 0, 'revision', '', 0),
(12, 1, '2014-12-11 18:59:04', '2014-12-11 18:59:04', 'Parent page for all sample works.', 'Projects', '', 'publish', 'open', 'closed', '', 'projects', '', '', '2015-04-21 21:47:57', '2015-04-22 00:47:57', '', 0, 'http://localhost/isotopic/?page_id=12', 2, 'page', '', 0),
(13, 1, '2014-12-11 18:59:04', '2014-12-11 18:59:04', 'Parent page for all sample works.', 'Work', '', 'inherit', 'open', 'open', '', '12-revision-v1', '', '', '2014-12-11 18:59:04', '2014-12-11 18:59:04', '', 12, 'http://localhost/isotopic/12-revision-v1/', 0, 'revision', '', 0),
(14, 1, '2014-12-11 19:02:50', '2014-12-11 22:02:50', 'Descrição da camiseta corrida de toros.', 'Corrida de Toros', '', 'publish', 'open', 'closed', '', 'corrida-de-toros', '', '', '2015-04-26 19:18:19', '2015-04-26 22:18:19', '', 12, 'http://localhost/isotopic/?page_id=14', 0, 'page', '', 0),
(15, 1, '2014-12-11 19:02:50', '2014-12-11 19:02:50', 'Details of some job.', 'Some job', '', 'inherit', 'open', 'open', '', '14-revision-v1', '', '', '2014-12-11 19:02:50', '2014-12-11 19:02:50', '', 14, 'http://localhost/isotopic/14-revision-v1/', 0, 'revision', '', 0),
(16, 1, '2014-12-11 19:03:28', '2014-12-11 19:03:28', 'Descrição do projeto da camiseta.', 'Run Forest Run', '', 'publish', 'open', 'open', '', 'run-forest-run', '', '', '2015-04-26 12:48:11', '2015-04-26 15:48:11', '', 12, 'http://localhost/isotopic/?page_id=16', 0, 'page', '', 0),
(17, 1, '2014-12-11 19:03:28', '2014-12-11 19:03:28', 'And more descriptions here.', 'Another awesome job', '', 'inherit', 'open', 'open', '', '16-revision-v1', '', '', '2014-12-11 19:03:28', '2014-12-11 19:03:28', '', 16, 'http://localhost/isotopic/16-revision-v1/', 0, 'revision', '', 0),
(18, 1, '2014-12-11 19:14:56', '2014-12-11 19:14:56', 'This is the blog home.', 'Blog', '', 'publish', 'open', 'closed', '', 'blog', '', '', '2015-04-21 21:48:23', '2015-04-22 00:48:23', '', 0, 'http://localhost/isotopic/?page_id=18', 3, 'page', '', 0),
(19, 1, '2014-12-11 19:14:56', '2014-12-11 19:14:56', 'This is the blog home.', 'Blog', '', 'inherit', 'open', 'open', '', '18-revision-v1', '', '', '2014-12-11 19:14:56', '2014-12-11 19:14:56', '', 18, 'http://localhost/isotopic/18-revision-v1/', 0, 'revision', '', 0),
(22, 1, '2015-03-22 17:52:11', '2015-03-22 17:52:11', '<h2>Guilherme Cruz <span>Web Developer</span></h2>\r\n\r\n', 'Home', '', 'publish', 'open', 'open', '', 'home', '', '', '2015-04-21 21:08:57', '2015-04-22 00:08:57', '', 0, 'http://localhost/isotopic/?page_id=22', 0, 'page', '', 0),
(23, 1, '2015-03-22 17:52:11', '2015-03-22 17:52:11', 'text inserted inside the Home page.', 'Home', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-03-22 17:52:11', '2015-03-22 17:52:11', '', 22, 'http://localhost/isotopic/blog/22-revision-v1/', 0, 'revision', '', 0),
(24, 1, '2015-03-22 18:52:17', '2015-03-22 18:52:17', 'Parent page for all sample works.', 'Works', '', 'inherit', 'open', 'open', '', '12-revision-v1', '', '', '2015-03-22 18:52:17', '2015-03-22 18:52:17', '', 12, 'http://localhost/isotopic/blog/12-revision-v1/', 0, 'revision', '', 0),
(25, 1, '2015-03-22 18:57:35', '2015-03-22 18:57:35', 'Parent page for all sample works.', 'Projects', '', 'inherit', 'open', 'open', '', '12-autosave-v1', '', '', '2015-03-22 18:57:35', '2015-03-22 18:57:35', '', 12, 'http://localhost/isotopic/blog/12-autosave-v1/', 0, 'revision', '', 0),
(26, 1, '2015-03-22 18:57:41', '2015-03-22 18:57:41', 'Parent page for all sample works.', 'Projects', '', 'inherit', 'open', 'open', '', '12-revision-v1', '', '', '2015-03-22 18:57:41', '2015-03-22 18:57:41', '', 12, 'http://localhost/isotopic/blog/12-revision-v1/', 0, 'revision', '', 0),
(27, 1, '2015-04-07 22:12:49', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-07 22:12:49', '0000-00-00 00:00:00', '', 0, 'http://localhost/isotopic/?p=27', 1, 'nav_menu_item', '', 0),
(28, 1, '2015-04-07 22:12:49', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-07 22:12:49', '0000-00-00 00:00:00', '', 0, 'http://localhost/isotopic/?p=28', 1, 'nav_menu_item', '', 0),
(29, 1, '2015-04-07 22:12:49', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-07 22:12:49', '0000-00-00 00:00:00', '', 0, 'http://localhost/isotopic/?p=29', 1, 'nav_menu_item', '', 0),
(30, 1, '2015-04-07 22:12:50', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-07 22:12:50', '0000-00-00 00:00:00', '', 0, 'http://localhost/isotopic/?p=30', 1, 'nav_menu_item', '', 0),
(31, 1, '2015-04-07 22:12:50', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-07 22:12:50', '0000-00-00 00:00:00', '', 12, 'http://localhost/isotopic/?p=31', 1, 'nav_menu_item', '', 0),
(32, 1, '2015-04-07 22:12:50', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-07 22:12:50', '0000-00-00 00:00:00', '', 12, 'http://localhost/isotopic/?p=32', 1, 'nav_menu_item', '', 0),
(33, 1, '2015-04-07 22:12:50', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-07 22:12:50', '0000-00-00 00:00:00', '', 0, 'http://localhost/isotopic/?p=33', 1, 'nav_menu_item', '', 0),
(34, 1, '2015-04-07 22:12:50', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-07 22:12:50', '0000-00-00 00:00:00', '', 0, 'http://localhost/isotopic/?p=34', 1, 'nav_menu_item', '', 0),
(35, 1, '2015-04-07 22:13:22', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-07 22:13:22', '0000-00-00 00:00:00', '', 0, 'http://localhost/isotopic/?p=35', 1, 'nav_menu_item', '', 0),
(36, 1, '2015-04-07 22:13:22', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-07 22:13:22', '0000-00-00 00:00:00', '', 0, 'http://localhost/isotopic/?p=36', 1, 'nav_menu_item', '', 0),
(37, 1, '2015-04-07 22:13:22', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-07 22:13:22', '0000-00-00 00:00:00', '', 0, 'http://localhost/isotopic/?p=37', 1, 'nav_menu_item', '', 0),
(38, 1, '2015-04-07 22:13:22', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-07 22:13:22', '0000-00-00 00:00:00', '', 0, 'http://localhost/isotopic/?p=38', 1, 'nav_menu_item', '', 0),
(39, 1, '2015-04-07 22:14:37', '2015-04-08 01:14:37', ' ', '', '', 'publish', 'open', 'open', '', '39', '', '', '2015-04-25 22:32:04', '2015-04-26 01:32:04', '', 0, 'http://localhost/isotopic/?p=39', 3, 'nav_menu_item', '', 0),
(40, 1, '2015-04-07 22:14:37', '2015-04-08 01:14:37', ' ', '', '', 'publish', 'open', 'open', '', '40', '', '', '2015-04-25 22:32:04', '2015-04-26 01:32:04', '', 0, 'http://localhost/isotopic/?p=40', 2, 'nav_menu_item', '', 0),
(41, 1, '2015-04-07 22:14:38', '2015-04-08 01:14:38', ' ', '', '', 'publish', 'open', 'open', '', '41', '', '', '2015-04-25 22:32:04', '2015-04-26 01:32:04', '', 0, 'http://localhost/isotopic/?p=41', 4, 'nav_menu_item', '', 0),
(42, 1, '2015-04-07 22:14:37', '2015-04-08 01:14:37', ' ', '', '', 'publish', 'open', 'open', '', '42', '', '', '2015-04-25 22:32:04', '2015-04-26 01:32:04', '', 0, 'http://localhost/isotopic/?p=42', 1, 'nav_menu_item', '', 0),
(44, 1, '2015-04-12 00:08:14', '2015-04-12 03:08:14', 'I like to study and potatoes.', 'Home', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-04-12 00:08:14', '2015-04-12 03:08:14', '', 22, 'http://192.168.0.23/isotopic/blog/22-revision-v1/', 0, 'revision', '', 0),
(46, 1, '2015-04-12 00:14:27', '2015-04-12 03:14:27', 'I like to study and potatoes. Also it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', 'Home', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-04-12 00:14:27', '2015-04-12 03:14:27', '', 22, 'http://192.168.0.23/isotopic/blog/22-revision-v1/', 0, 'revision', '', 0),
(47, 1, '2015-04-12 10:04:49', '2015-04-12 13:04:49', '"The joy of life comes from our encounters with new experiences, and hence there is no greater joy than to have an endlessly changing horizon, for each day to have a new and different sun." - Christopher McCandless', 'Home', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-04-12 10:04:49', '2015-04-12 13:04:49', '', 22, 'http://192.168.0.23/isotopic/blog/22-revision-v1/', 0, 'revision', '', 0),
(48, 1, '2015-04-12 10:05:03', '2015-04-12 13:05:03', '<em>"The joy of life comes from our encounters with new experiences, and hence there is no greater joy than to have an endlessly changing horizon, for each day to have a new and different sun."</em> - Christopher McCandless', 'Home', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-04-12 10:05:03', '2015-04-12 13:05:03', '', 22, 'http://192.168.0.23/isotopic/blog/22-revision-v1/', 0, 'revision', '', 0),
(49, 1, '2015-04-12 10:32:17', '2015-04-12 13:32:17', 'Lorem ipsum dolor sit amet bla bla. Clique nas paradas aí.', 'Home', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-04-12 10:32:17', '2015-04-12 13:32:17', '', 22, 'http://192.168.0.23/isotopic/blog/22-revision-v1/', 0, 'revision', '', 0),
(50, 1, '2015-04-12 10:33:12', '2015-04-12 13:33:12', 'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.', 'Home', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-04-12 10:33:12', '2015-04-12 13:33:12', '', 22, 'http://192.168.0.23/isotopic/blog/22-revision-v1/', 0, 'revision', '', 0),
(51, 1, '2015-04-12 10:36:29', '2015-04-12 13:36:29', 'Home content.', 'Home', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-04-12 10:36:29', '2015-04-12 13:36:29', '', 22, 'http://192.168.0.23/isotopic/blog/22-revision-v1/', 0, 'revision', '', 0),
(52, 1, '2015-04-12 10:37:17', '2015-04-12 13:37:17', '<h2>Guilherme Cruz <span>Web Developer</span></h2>', 'Home', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-04-12 10:37:17', '2015-04-12 13:37:17', '', 22, 'http://192.168.0.23/isotopic/blog/22-revision-v1/', 0, 'revision', '', 0),
(53, 1, '2015-04-12 13:21:06', '2015-04-12 16:21:06', '<h2>Guilherme Cruz <span>Web Developer</span></h2>\n\n<P>We''re not going anywhere if we don''t take action</p>', 'Home', '', 'inherit', 'open', 'open', '', '22-autosave-v1', '', '', '2015-04-12 13:21:06', '2015-04-12 16:21:06', '', 22, 'http://192.168.0.23/isotopic/blog/22-autosave-v1/', 0, 'revision', '', 0),
(54, 1, '2015-04-12 13:21:37', '2015-04-12 16:21:37', '<h2>Guilherme Cruz <span>Web Developer</span></h2>\r\n\r\n<P>We''re not going anywhere if we don''t take action</p>', 'Home', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-04-12 13:21:37', '2015-04-12 16:21:37', '', 22, 'http://192.168.0.23/isotopic/blog/22-revision-v1/', 0, 'revision', '', 0),
(55, 1, '2015-04-12 13:22:15', '2015-04-12 16:22:15', '<h2>Guilherme Cruz <span>Web Developer</span></h2>', 'Home', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-04-12 13:22:15', '2015-04-12 16:22:15', '', 22, 'http://192.168.0.23/isotopic/blog/22-revision-v1/', 0, 'revision', '', 0),
(56, 1, '2015-04-19 00:32:51', '2015-04-19 03:32:51', '<h2>Guilherme Cruz <span>Web Developer</span></h2>\r\n\r\n<p>Construa o caminho para uma internet mais divertida</p>', 'Home', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-04-19 00:32:51', '2015-04-19 03:32:51', '', 22, 'http://192.168.0.23/isotopic/blog/22-revision-v1/', 0, 'revision', '', 0),
(57, 1, '2015-04-19 00:33:46', '2015-04-19 03:33:46', '<h2>Guilherme Cruz <span>Web Developer</span></h2>\r\n\r\n<p>Scroll down and pave the way for a more entertaining web.</p>', 'Home', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-04-19 00:33:46', '2015-04-19 03:33:46', '', 22, 'http://192.168.0.23/isotopic/blog/22-revision-v1/', 0, 'revision', '', 0),
(58, 1, '2015-04-19 00:34:40', '2015-04-19 03:34:40', '<h2>Guilherme Cruz <span>Web Developer</span></h2>\r\n\r\n<p>Texto curto para amarrar o conceito de transporte</p>', 'Home', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-04-19 00:34:40', '2015-04-19 03:34:40', '', 22, 'http://192.168.0.23/isotopic/blog/22-revision-v1/', 0, 'revision', '', 0),
(59, 1, '2015-04-19 12:08:40', '2015-04-19 15:08:40', '<h2>Guilherme Cruz <span>Web Developer</span></h2>\r\n\r\n<p>Texto curto para iniciar scroll e amarrar o conceito</p>', 'Home', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-04-19 12:08:40', '2015-04-19 15:08:40', '', 22, 'http://192.168.0.23/isotopic/blog/22-revision-v1/', 0, 'revision', '', 0),
(60, 1, '2015-04-19 13:14:12', '2015-04-19 16:14:12', '<h2>Guilherme Cruz <span>Web Developer</span></h2>\r\n\r\n<p>Lorem ipsum dolor sit amet</p>', 'Home', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-04-19 13:14:12', '2015-04-19 16:14:12', '', 22, 'http://192.168.0.23/isotopic/blog/22-revision-v1/', 0, 'revision', '', 0),
(61, 1, '2015-04-21 21:04:07', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-04-21 21:04:07', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.105/isotopic/?p=61', 0, 'post', '', 0),
(62, 1, '2015-04-21 21:08:57', '2015-04-22 00:08:57', '<h2>Guilherme Cruz <span>Web Developer</span></h2>\r\n\r\n', 'Home', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-04-21 21:08:57', '2015-04-22 00:08:57', '', 22, 'http://192.168.1.105/isotopic/blog/22-revision-v1/', 0, 'revision', '', 0),
(65, 1, '2015-04-23 00:06:01', '2015-04-23 03:06:01', 'And more descriptions here.', 'Camiseta Run Forest Run', '', 'inherit', 'open', 'open', '', '16-revision-v1', '', '', '2015-04-23 00:06:01', '2015-04-23 03:06:01', '', 16, 'http://192.168.1.105/isotopic/blog/16-revision-v1/', 0, 'revision', '', 0),
(66, 1, '2015-04-23 00:06:16', '2015-04-23 03:06:16', '', 'run_a', '', 'inherit', 'open', 'open', '', 'run_a', '', '', '2015-04-23 00:06:16', '2015-04-23 03:06:16', '', 16, 'http://192.168.1.105/isotopic/wordpress/wp-content/uploads/2014/12/run_a.jpg', 0, 'attachment', 'image/jpeg', 0),
(67, 1, '2015-04-23 00:06:17', '2015-04-23 03:06:17', '', 'run_c', '', 'inherit', 'open', 'open', '', 'run_c', '', '', '2015-04-23 00:06:17', '2015-04-23 03:06:17', '', 16, 'http://192.168.1.105/isotopic/wordpress/wp-content/uploads/2014/12/run_c.jpg', 0, 'attachment', 'image/jpeg', 0),
(68, 1, '2015-04-23 00:06:56', '2015-04-23 03:06:56', 'Descrição do projeto da camiseta.', 'Camiseta Run Forest Run', '', 'inherit', 'open', 'open', '', '16-revision-v1', '', '', '2015-04-23 00:06:56', '2015-04-23 03:06:56', '', 16, 'http://192.168.1.105/isotopic/blog/16-revision-v1/', 0, 'revision', '', 0),
(69, 1, '2015-04-23 00:11:19', '2015-04-23 03:11:19', 'Descrição da camiseta corrida de toros.', 'Corrida de Toros', '', 'inherit', 'open', 'open', '', '14-revision-v1', '', '', '2015-04-23 00:11:19', '2015-04-23 03:11:19', '', 14, 'http://192.168.1.105/isotopic/blog/14-revision-v1/', 0, 'revision', '', 0),
(70, 1, '2015-04-23 00:11:32', '2015-04-23 03:11:32', '', 'toros_a', '', 'inherit', 'open', 'open', '', 'toros_a', '', '', '2015-04-23 00:11:32', '2015-04-23 03:11:32', '', 14, 'http://192.168.1.105/isotopic/wordpress/wp-content/uploads/2014/12/toros_a.jpg', 0, 'attachment', 'image/jpeg', 0),
(71, 1, '2015-04-23 00:11:33', '2015-04-23 03:11:33', '', 'toros_c', '', 'inherit', 'open', 'open', '', 'toros_c', '', '', '2015-04-23 00:11:33', '2015-04-23 03:11:33', '', 14, 'http://192.168.1.105/isotopic/wordpress/wp-content/uploads/2014/12/toros_c.jpg', 0, 'attachment', 'image/jpeg', 0),
(72, 1, '2015-04-25 17:37:17', '2015-04-25 20:37:17', '', 'Show de Trufas', '', 'publish', 'open', 'closed', '', 'natal-cacaushow', '', '', '2015-04-26 19:22:19', '2015-04-26 22:22:19', '', 12, 'http://192.168.0.23/isotopic/?page_id=72', 0, 'page', '', 0),
(73, 1, '2015-04-25 17:30:46', '2015-04-25 20:30:46', '', 'cacaushow_a', '', 'inherit', 'open', 'open', '', 'cacaushow_a', '', '', '2015-04-25 17:30:46', '2015-04-25 20:30:46', '', 72, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/cacaushow_a.jpg', 0, 'attachment', 'image/jpeg', 0),
(74, 1, '2015-04-25 17:30:47', '2015-04-25 20:30:47', '', 'cafeque_0', '', 'inherit', 'open', 'open', '', 'cafeque_0', '', '', '2015-04-25 17:30:47', '2015-04-25 20:30:47', '', 72, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/cafeque_0.jpg', 0, 'attachment', 'image/jpeg', 0),
(75, 1, '2015-04-25 17:30:47', '2015-04-25 20:30:47', '', 'chocobichos_a', '', 'inherit', 'open', 'open', '', 'chocobichos_a', '', '', '2015-04-25 17:30:47', '2015-04-25 20:30:47', '', 72, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/chocobichos_a.jpg', 0, 'attachment', 'image/jpeg', 0),
(76, 1, '2015-04-25 17:30:47', '2015-04-25 20:30:47', '', 'jornada_b', '', 'inherit', 'open', 'open', '', 'jornada_b', '', '', '2015-04-25 17:30:47', '2015-04-25 20:30:47', '', 72, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/jornada_b.jpg', 0, 'attachment', 'image/jpeg', 0),
(77, 1, '2015-04-25 17:30:48', '2015-04-25 20:30:48', '', 'natal2010_a', '', 'inherit', 'open', 'open', '', 'natal2010_a', '', '', '2015-04-25 17:30:48', '2015-04-25 20:30:48', '', 72, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/natal2010_a.jpg', 0, 'attachment', 'image/jpeg', 0),
(78, 1, '2015-04-25 17:35:33', '2015-04-25 20:35:33', '', 'cafeque_a', '', 'inherit', 'open', 'open', '', 'cafeque_a', '', '', '2015-04-25 17:43:01', '2015-04-25 20:43:01', '', 94, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/cafeque_a.jpg', 0, 'attachment', 'image/jpeg', 0),
(79, 1, '2015-04-25 17:35:34', '2015-04-25 20:35:34', '', 'cafeque_b', '', 'inherit', 'open', 'open', '', 'cafeque_b', '', '', '2015-04-25 17:43:01', '2015-04-25 20:43:01', '', 94, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/cafeque_b.jpg', 0, 'attachment', 'image/jpeg', 0),
(80, 1, '2015-04-25 17:35:34', '2015-04-25 20:35:34', '', 'cappuccino_a', '', 'inherit', 'open', 'open', '', 'cappuccino_a', '', '', '2015-04-25 17:51:09', '2015-04-25 20:51:09', '', 104, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/cappuccino_a.jpg', 0, 'attachment', 'image/jpeg', 0),
(81, 1, '2015-04-25 17:35:34', '2015-04-25 20:35:34', '', 'cappuccino_b', '', 'inherit', 'open', 'open', '', 'cappuccino_b', '', '', '2015-04-25 17:51:09', '2015-04-25 20:51:09', '', 104, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/cappuccino_b.jpg', 0, 'attachment', 'image/jpeg', 0),
(82, 1, '2015-04-25 17:35:35', '2015-04-25 20:35:35', '', 'cappuccino_c', '', 'inherit', 'open', 'open', '', 'cappuccino_c', '', '', '2015-04-25 17:51:09', '2015-04-25 20:51:09', '', 104, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/cappuccino_c.jpg', 0, 'attachment', 'image/jpeg', 0),
(83, 1, '2015-04-25 17:35:35', '2015-04-25 20:35:35', '', 'chocobichos_a', '', 'inherit', 'open', 'open', '', 'chocobichos_a-2', '', '', '2015-04-25 17:44:09', '2015-04-25 20:44:09', '', 96, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/chocobichos_a1.jpg', 0, 'attachment', 'image/jpeg', 0),
(84, 1, '2015-04-25 17:35:35', '2015-04-25 20:35:35', '', 'chocobichos_b', '', 'inherit', 'open', 'open', '', 'chocobichos_b', '', '', '2015-04-25 17:44:09', '2015-04-25 20:44:09', '', 96, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/chocobichos_b.jpg', 0, 'attachment', 'image/jpeg', 0),
(85, 1, '2015-04-25 17:35:36', '2015-04-25 20:35:36', '', 'chocobichos_c', '', 'inherit', 'open', 'open', '', 'chocobichos_c', '', '', '2015-04-25 17:35:36', '2015-04-25 20:35:36', '', 0, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/chocobichos_c.jpg', 0, 'attachment', 'image/jpeg', 0),
(86, 1, '2015-04-25 17:35:36', '2015-04-25 20:35:36', '', 'levis_a', '', 'inherit', 'open', 'open', '', 'levis_a', '', '', '2015-04-25 17:45:22', '2015-04-25 20:45:22', '', 98, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/levis_a.jpg', 0, 'attachment', 'image/jpeg', 0),
(87, 1, '2015-04-25 17:35:36', '2015-04-25 20:35:36', '', 'levis_b', '', 'inherit', 'open', 'open', '', 'levis_b', '', '', '2015-04-25 17:45:22', '2015-04-25 20:45:22', '', 98, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/levis_b.jpg', 0, 'attachment', 'image/jpeg', 0),
(88, 1, '2015-04-25 17:35:37', '2015-04-25 20:35:37', '', 'levis_c', '', 'inherit', 'open', 'open', '', 'levis_c', '', '', '2015-04-25 17:45:22', '2015-04-25 20:45:22', '', 98, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/levis_c.jpg', 0, 'attachment', 'image/jpeg', 0),
(89, 1, '2015-04-25 17:35:37', '2015-04-25 20:35:37', '', 'trufas_0', '', 'inherit', 'open', 'open', '', 'trufas_0', '', '', '2015-04-25 17:35:37', '2015-04-25 20:35:37', '', 0, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/trufas_0.jpg', 0, 'attachment', 'image/jpeg', 0),
(90, 1, '2015-04-25 17:35:37', '2015-04-25 20:35:37', '', 'trufas_a', '', 'inherit', 'open', 'open', '', 'trufas_a', '', '', '2015-04-25 17:41:56', '2015-04-25 20:41:56', '', 72, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/trufas_a.jpg', 0, 'attachment', 'image/jpeg', 0),
(91, 1, '2015-04-25 17:35:38', '2015-04-25 20:35:38', '', 'trufas_c', '', 'inherit', 'open', 'open', '', 'trufas_c', '', '', '2015-04-25 17:41:56', '2015-04-25 20:41:56', '', 72, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/trufas_c.jpg', 0, 'attachment', 'image/jpeg', 0),
(92, 1, '2015-04-25 17:36:34', '2015-04-25 20:36:34', '', 'Trufas', '', 'inherit', 'open', 'open', '', '72-revision-v1', '', '', '2015-04-25 17:36:34', '2015-04-25 20:36:34', '', 72, 'http://192.168.0.23/isotopic/blog/72-revision-v1/', 0, 'revision', '', 0),
(93, 1, '2015-04-25 17:37:26', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-04-25 17:37:26', '0000-00-00 00:00:00', '', 0, 'http://192.168.0.23/isotopic/?page_id=93', 0, 'page', '', 0),
(94, 1, '2015-04-25 17:43:15', '2015-04-25 20:43:15', '', 'Café 3Corações institucional', '', 'publish', 'open', 'open', '', 'cafe-3-coracoes', '', '', '2015-04-26 19:09:58', '2015-04-26 22:09:58', '', 12, 'http://192.168.0.23/isotopic/?page_id=94', 0, 'page', '', 0),
(95, 1, '2015-04-25 17:43:15', '2015-04-25 20:43:15', '', 'Café 3 Corações', '', 'inherit', 'open', 'open', '', '94-revision-v1', '', '', '2015-04-25 17:43:15', '2015-04-25 20:43:15', '', 94, 'http://192.168.0.23/isotopic/blog/94-revision-v1/', 0, 'revision', '', 0),
(96, 1, '2015-04-25 17:44:34', '2015-04-25 20:44:34', '', 'Chocobichos', '', 'publish', 'open', 'open', '', 'chocobichos', '', '', '2015-04-26 11:58:02', '2015-04-26 14:58:02', '', 12, 'http://192.168.0.23/isotopic/?page_id=96', 0, 'page', '', 0),
(97, 1, '2015-04-25 17:44:34', '2015-04-25 20:44:34', '', 'Chocobichos', '', 'inherit', 'open', 'open', '', '96-revision-v1', '', '', '2015-04-25 17:44:34', '2015-04-25 20:44:34', '', 96, 'http://192.168.0.23/isotopic/blog/96-revision-v1/', 0, 'revision', '', 0),
(98, 1, '2015-04-25 17:46:02', '2015-04-25 20:46:02', '', 'Levis institucional', '', 'publish', 'open', 'open', '', 'levis', '', '', '2015-04-26 19:08:35', '2015-04-26 22:08:35', '', 12, 'http://192.168.0.23/isotopic/?page_id=98', 0, 'page', '', 0),
(99, 1, '2015-04-25 17:45:46', '2015-04-25 20:45:46', '', 'Levis', '', 'inherit', 'open', 'open', '', '98-revision-v1', '', '', '2015-04-25 17:45:46', '2015-04-25 20:45:46', '', 98, 'http://192.168.0.23/isotopic/blog/98-revision-v1/', 0, 'revision', '', 0),
(100, 1, '2015-04-25 17:50:12', '2015-04-25 20:50:12', '', 'Levis Music', '', 'publish', 'open', 'closed', '', 'levis-music', '', '', '2015-04-26 21:08:26', '2015-04-27 00:08:26', '', 12, 'http://192.168.0.23/isotopic/?page_id=100', 0, 'page', '', 0),
(101, 1, '2015-04-25 17:49:59', '2015-04-25 20:49:59', '', 'levismusic_0', '', 'inherit', 'open', 'open', '', 'levismusic_0', '', '', '2015-04-25 17:49:59', '2015-04-25 20:49:59', '', 100, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/levismusic_0.jpg', 0, 'attachment', 'image/jpeg', 0),
(102, 1, '2015-04-25 17:50:00', '2015-04-25 20:50:00', '', 'levismusic_a', '', 'inherit', 'open', 'open', '', 'levismusic_a', '', '', '2015-04-25 17:50:00', '2015-04-25 20:50:00', '', 100, 'http://192.168.0.23/isotopic/wordpress/wp-content/uploads/2015/04/levismusic_a.jpg', 0, 'attachment', 'image/jpeg', 0),
(103, 1, '2015-04-25 17:50:12', '2015-04-25 20:50:12', '', 'Levis Music', '', 'inherit', 'open', 'open', '', '100-revision-v1', '', '', '2015-04-25 17:50:12', '2015-04-25 20:50:12', '', 100, 'http://192.168.0.23/isotopic/blog/100-revision-v1/', 0, 'revision', '', 0),
(104, 1, '2015-04-25 17:51:30', '2015-04-25 20:51:30', '', 'Como você toma?', '', 'publish', 'open', 'open', '', 'cappuccino', '', '', '2015-04-26 19:21:35', '2015-04-26 22:21:35', '', 12, 'http://192.168.0.23/isotopic/?page_id=104', 0, 'page', '', 0),
(105, 1, '2015-04-25 17:51:30', '2015-04-25 20:51:30', '', 'Cappuccino', '', 'inherit', 'open', 'open', '', '104-revision-v1', '', '', '2015-04-25 17:51:30', '2015-04-25 20:51:30', '', 104, 'http://192.168.0.23/isotopic/blog/104-revision-v1/', 0, 'revision', '', 0),
(106, 1, '2015-04-25 22:26:01', '2015-04-26 01:26:01', '', 'Auto Draft', '', 'trash', 'open', 'open', '', 'auto-draft', '', '', '2015-04-25 22:26:05', '2015-04-26 01:26:05', '', 0, 'http://192.168.0.23/isotopic/?page_id=106', 0, 'page', '', 0),
(107, 1, '2015-04-25 22:26:05', '2015-04-26 01:26:05', '', 'Auto Draft', '', 'inherit', 'open', 'open', '', '106-revision-v1', '', '', '2015-04-25 22:26:05', '2015-04-26 01:26:05', '', 106, 'http://192.168.0.23/isotopic/blog/106-revision-v1/', 0, 'revision', '', 0),
(108, 1, '2015-04-26 12:48:11', '2015-04-26 15:48:11', 'Descrição do projeto da camiseta.', 'Run Forest Run', '', 'inherit', 'open', 'open', '', '16-revision-v1', '', '', '2015-04-26 12:48:11', '2015-04-26 15:48:11', '', 16, 'http://192.168.0.23/isotopic/blog/16-revision-v1/', 0, 'revision', '', 0),
(109, 1, '2015-04-26 19:08:35', '2015-04-26 22:08:35', '', 'Levis institucional', '', 'inherit', 'open', 'open', '', '98-revision-v1', '', '', '2015-04-26 19:08:35', '2015-04-26 22:08:35', '', 98, 'http://192.168.0.23/isotopic/blog/98-revision-v1/', 0, 'revision', '', 0),
(110, 1, '2015-04-26 19:08:56', '2015-04-26 22:08:56', '', 'Café 3Corações institucional', '', 'inherit', 'open', 'open', '', '94-revision-v1', '', '', '2015-04-26 19:08:56', '2015-04-26 22:08:56', '', 94, 'http://192.168.0.23/isotopic/blog/94-revision-v1/', 0, 'revision', '', 0),
(111, 1, '2015-04-26 19:21:35', '2015-04-26 22:21:35', '', 'Como você toma?', '', 'inherit', 'open', 'open', '', '104-revision-v1', '', '', '2015-04-26 19:21:35', '2015-04-26 22:21:35', '', 104, 'http://192.168.0.23/isotopic/blog/104-revision-v1/', 0, 'revision', '', 0),
(112, 1, '2015-04-26 19:22:19', '2015-04-26 22:22:19', '', 'Show de Trufas', '', 'inherit', 'open', 'open', '', '72-revision-v1', '', '', '2015-04-26 19:22:19', '2015-04-26 22:22:19', '', 72, 'http://192.168.0.23/isotopic/blog/72-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `name` (`name`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Extraindo dados da tabela `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Development', 'development', 0),
(3, 'Design', 'design', 0),
(4, 'tutorial', 'tutorial', 0),
(5, 'tools', 'tools', 0),
(6, 'git', 'git', 0),
(7, 'open source', 'open-source', 0),
(8, 'Menu principal', 'menu-principal', 0),
(9, 'html', 'html', 0),
(10, 'institucional', 'institucional', 0),
(11, 'illustration', 'illustration', 0),
(12, 'camiseteria', 'camiseteria', 0),
(13, 'Website', 'website', 0),
(14, 'Hotsite', 'hotsite', 0),
(18, 'Ilustração', 'illustration', 0),
(19, 'Game', 'game', 0),
(20, 'Mobile', 'mobile', 0),
(21, 'Front-end', 'frontend', 0),
(22, 'Back-end', 'backend', 0),
(23, 'Design', 'design', 0),
(24, 'Café 3 Corações', 'cafe3coracoes', 0),
(25, '3 Corações', 'cafe3coracoes', 0),
(26, 'Camiseteria', 'camiseteria', 0),
(27, 'Cacaushow', 'cacaushow', 0),
(28, 'Front-end', 'front-end', 0),
(29, 'Back-end', 'back-end', 0),
(30, 'Design', 'design', 0),
(31, 'Levis', 'levis', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 3, 0),
(1, 4, 0),
(1, 5, 0),
(7, 2, 0),
(7, 6, 0),
(7, 7, 0),
(14, 18, 0),
(14, 26, 0),
(14, 30, 0),
(16, 11, 0),
(16, 12, 0),
(16, 18, 0),
(16, 23, 0),
(16, 26, 0),
(16, 30, 0),
(39, 8, 0),
(40, 8, 0),
(41, 8, 0),
(42, 8, 0),
(72, 14, 0),
(72, 27, 0),
(72, 28, 0),
(94, 9, 0),
(94, 10, 0),
(94, 13, 0),
(94, 21, 0),
(94, 24, 0),
(94, 25, 0),
(94, 28, 0),
(96, 14, 0),
(96, 21, 0),
(96, 27, 0),
(96, 28, 0),
(98, 13, 0),
(98, 28, 0),
(98, 31, 0),
(100, 14, 0),
(100, 28, 0),
(100, 29, 0),
(100, 31, 0),
(104, 14, 0),
(104, 25, 0),
(104, 28, 0),
(104, 29, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Extraindo dados da tabela `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'category', '', 0, 1),
(3, 3, 'category', '', 0, 1),
(4, 4, 'post_tag', '', 0, 1),
(5, 5, 'post_tag', '', 0, 1),
(6, 6, 'post_tag', '', 0, 1),
(7, 7, 'post_tag', '', 0, 1),
(8, 8, 'nav_menu', '', 0, 4),
(9, 9, 'post_tag', '', 0, 1),
(10, 10, 'post_tag', '', 0, 1),
(11, 11, 'post_tag', '', 0, 1),
(12, 12, 'post_tag', '', 0, 1),
(13, 13, 'type', '', 0, 2),
(14, 14, 'type', '', 0, 4),
(18, 18, 'type', '', 0, 2),
(19, 19, 'type', '', 0, 0),
(20, 20, 'type', '', 0, 0),
(21, 21, 'role', '', 0, 2),
(22, 22, 'role', '', 0, 0),
(23, 23, 'role', '', 0, 1),
(24, 24, 'page', '', 0, 1),
(25, 25, 'client', '', 0, 2),
(26, 26, 'client', '', 0, 2),
(27, 27, 'client', '', 0, 2),
(28, 28, 'service', '', 0, 6),
(29, 29, 'service', '', 0, 2),
(30, 30, 'service', '', 0, 2),
(31, 31, 'client', '', 0, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Extraindo dados da tabela `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'master'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp350_media,wp360_revisions,wp360_locks,wp390_widgets,wp410_dfw'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'session_tokens', 'a:3:{s:64:"527bcd3c73942b1048f2da17cf9a85214ef9de158c0c90ddee6796a6e718b60e";a:4:{s:10:"expiration";i:1430870647;s:2:"ip";s:13:"192.168.1.105";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36";s:5:"login";i:1429661047;}s:64:"48d14e4a81a2edd8b005a720e42385de65861fcc855791f4b4a67a56a8e1a9cd";a:4:{s:10:"expiration";i:1431202017;s:2:"ip";s:12:"192.168.0.23";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0";s:5:"login";i:1429992417;}s:64:"70e312b1b0c2766bbfaee42193fb36127cec29548c9958aeaab6f2bc8ca35620";a:4:{s:10:"expiration";i:1431269653;s:2:"ip";s:12:"192.168.0.23";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36";s:5:"login";i:1430060053;}}'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '61'),
(16, 1, 'wp_user-settings', 'editor=html&libraryContent=browse&urlbutton=file'),
(17, 1, 'wp_user-settings-time', '1429758106'),
(18, 1, 'closedpostboxes_page', 'a:0:{}'),
(19, 1, 'metaboxhidden_page', 'a:4:{i:0;s:16:"commentstatusdiv";i:1;s:11:"commentsdiv";i:2;s:7:"slugdiv";i:3;s:9:"authordiv";}'),
(20, 1, 'meta-box-order_page', 'a:3:{s:4:"side";s:67:"pageparentdiv,tagsdiv-type,tagsdiv-client,tagsdiv-service,submitdiv";s:6:"normal";s:83:"commentstatusdiv,commentsdiv,slugdiv,postcustom,postimagediv,revisionsdiv,authordiv";s:8:"advanced";s:0:"";}'),
(21, 1, 'screen_layout_page', '2'),
(22, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(23, 1, 'metaboxhidden_nav-menus', 'a:2:{i:0;s:8:"add-post";i:1;s:12:"add-post_tag";}'),
(24, 1, 'wp_media_library_mode', 'grid'),
(25, 1, 'nav_menu_recently_edited', '8');

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'master', '$P$BA0wZA1.8bEJ2eJcxOlkLSxAapNvih1', 'master', 'guilhermecruz@gmail.com', '', '2014-12-11 17:20:18', '', 0, 'master');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
