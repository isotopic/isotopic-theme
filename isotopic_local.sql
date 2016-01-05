/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table wp_commentmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_commentmeta`;

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_comments`;

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`)
VALUES
	(1,1,'Mr WordPress','','https://wordpress.org/','','2014-12-11 17:20:18','2014-12-11 17:20:18','Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.',0,'1','','',0,0);

/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_links`;

CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_options`;

CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`)
VALUES
	(1,'siteurl','http://192.168.0.14/isotopic-local/wordpress','yes'),
	(2,'home','http://192.168.0.14/isotopic-local','yes'),
	(3,'blogname','Isotopic','yes'),
	(4,'blogdescription','Put the pieces together and make your path','yes'),
	(5,'users_can_register','0','yes'),
	(6,'admin_email','guilhermecruz@gmail.com','yes'),
	(7,'start_of_week','0','yes'),
	(8,'use_balanceTags','','yes'),
	(9,'use_smilies','','yes'),
	(10,'require_name_email','1','yes'),
	(11,'comments_notify','1','yes'),
	(12,'posts_per_rss','10','yes'),
	(13,'rss_use_excerpt','0','yes'),
	(14,'mailserver_url','mail.example.com','yes'),
	(15,'mailserver_login','login@example.com','yes'),
	(16,'mailserver_pass','password','yes'),
	(17,'mailserver_port','110','yes'),
	(18,'default_category','1','yes'),
	(19,'default_comment_status','open','yes'),
	(20,'default_ping_status','open','yes'),
	(21,'default_pingback_flag','1','yes'),
	(22,'posts_per_page','10','yes'),
	(23,'date_format','F j, Y','yes'),
	(24,'time_format','g:i a','yes'),
	(25,'links_updated_date_format','F j, Y g:i a','yes'),
	(26,'comment_moderation','0','yes'),
	(27,'moderation_notify','1','yes'),
	(28,'permalink_structure','/blog/%postname%/','yes'),
	(30,'hack_file','0','yes'),
	(31,'blog_charset','UTF-8','yes'),
	(32,'moderation_keys','','no'),
	(33,'active_plugins','a:0:{}','yes'),
	(34,'category_base','','yes'),
	(35,'ping_sites','http://rpc.pingomatic.com/','yes'),
	(37,'comment_max_links','2','yes'),
	(38,'gmt_offset','-3','yes'),
	(39,'default_email_category','1','yes'),
	(40,'recently_edited','a:3:{i:0;s:67:\"C:\\wamp\\www\\isotopic\\wordpress/wp-content/themes/isotopic/style.css\";i:1;s:90:\"/Users/PC8297/Desktop/Projetos/www/isotopic/wordpress/wp-content/themes/isotopic/style.css\";i:2;s:0:\"\";}','no'),
	(41,'template','isotopic','yes'),
	(42,'stylesheet','isotopic','yes'),
	(43,'comment_whitelist','1','yes'),
	(44,'blacklist_keys','','no'),
	(45,'comment_registration','0','yes'),
	(46,'html_type','text/html','yes'),
	(47,'use_trackback','0','yes'),
	(48,'default_role','subscriber','yes'),
	(49,'db_version','35700','yes'),
	(50,'uploads_use_yearmonth_folders','1','yes'),
	(51,'upload_path','','yes'),
	(52,'blog_public','1','yes'),
	(53,'default_link_category','0','yes'),
	(54,'show_on_front','page','yes'),
	(55,'tag_base','','yes'),
	(56,'show_avatars','1','yes'),
	(57,'avatar_rating','G','yes'),
	(58,'upload_url_path','','yes'),
	(59,'thumbnail_size_w','150','yes'),
	(60,'thumbnail_size_h','150','yes'),
	(61,'thumbnail_crop','1','yes'),
	(62,'medium_size_w','300','yes'),
	(63,'medium_size_h','300','yes'),
	(64,'avatar_default','mystery','yes'),
	(65,'large_size_w','1024','yes'),
	(66,'large_size_h','1024','yes'),
	(67,'image_default_link_type','file','yes'),
	(68,'image_default_size','','yes'),
	(69,'image_default_align','','yes'),
	(70,'close_comments_for_old_posts','0','yes'),
	(71,'close_comments_days_old','14','yes'),
	(72,'thread_comments','1','yes'),
	(73,'thread_comments_depth','5','yes'),
	(74,'page_comments','0','yes'),
	(75,'comments_per_page','50','yes'),
	(76,'default_comments_page','newest','yes'),
	(77,'comment_order','asc','yes'),
	(78,'sticky_posts','a:0:{}','yes'),
	(79,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),
	(80,'widget_text','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(81,'widget_rss','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(82,'uninstall_plugins','a:0:{}','no'),
	(83,'timezone_string','','yes'),
	(85,'page_on_front','22','yes'),
	(86,'default_post_format','0','yes'),
	(87,'link_manager_enabled','0','yes'),
	(88,'initial_db_version','29630','yes'),
	(89,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),
	(90,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),
	(91,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),
	(92,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),
	(93,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),
	(94,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),
	(95,'sidebars_widgets','a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:18:\"orphaned_widgets_1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes'),
	(96,'cron','a:5:{i:1452057621;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1452064080;a:1:{s:20:\"wp_maybe_auto_update\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1452100839;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1452102495;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),
	(105,'_transient_random_seed','0dcfe67c9e29eddd4b4535c02b27f463','yes'),
	(106,'auth_key','z-8%X:6HPr%6o~^HLt$gB1[BMX{T`+a]Dv%4tlP~My})t_boT$j*9{C7rAzMqI1N','yes'),
	(107,'auth_salt','[/F`N`Fd3PZ}t%hfim_L(kk]_!lgE*x}TUEhtX0J&^RVLuS`GBLJj^-pV49/(&)j','yes'),
	(108,'logged_in_key','e_hq9KTi^gVFr5~w}UWts;SSX~pTg&IX6(N+KBP/2[FF/$hwD!1-6yEXK{CPm}0n','yes'),
	(109,'logged_in_salt','w;[EVJzY7N*/n~x>@bw8_D|9x;F`:B-`,xe]3m&-)j54&//u&CsawRS|1X7Ue3r,','yes'),
	(110,'nonce_key','fNu4Xk?mUWR/`**^ks)xD~VHMv{YNU,Jiv!PKoem]^5}c7-/V(cQ-0?Gz-FmSFYE','yes'),
	(111,'nonce_salt','Ufv6c9,tEU|1LMZh~1)Du^<sA&Dx->Gb3Z2FBNN?%%YIH>ytlD0r@OJ4TQXM([<a','yes'),
	(134,'_transient_twentyfourteen_category_count','1','yes'),
	(137,'WPLANG','','yes'),
	(141,'theme_mods_twentyfourteen','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1418319879;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}','yes'),
	(142,'current_theme','Isotopic Website','yes'),
	(143,'theme_mods_isotopic','a:2:{i:0;b:0;s:18:\"nav_menu_locations\";a:2:{s:8:\"mainMenu\";i:8;s:10:\"footerMenu\";i:8;}}','yes'),
	(144,'theme_switched','','yes'),
	(153,'category_children','a:0:{}','yes'),
	(168,'theme_mods_twentytwelve','a:2:{i:0;b:0;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1418327210;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";N;s:9:\"sidebar-3\";N;}}}','yes'),
	(171,'page_for_posts','18','yes'),
	(250,'db_upgraded','','yes'),
	(330,'recently_activated','a:0:{}','yes'),
	(372,'nav_menu_options','a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}','yes'),
	(536,'auto_core_update_notified','a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:23:\"guilhermecruz@gmail.com\";s:7:\"version\";s:5:\"4.2.4\";s:9:\"timestamp\";i:1438868242;}','yes'),
	(812,'theme_mods_html5blank-stable','a:2:{i:0;b:0;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1439318136;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:13:\"widget-area-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"widget-area-2\";N;}}}','yes'),
	(826,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1452020981;s:7:\"checked\";a:4:{s:8:\"isotopic\";s:0:\"\";s:13:\"twentyfifteen\";s:3:\"1.4\";s:14:\"twentyfourteen\";s:3:\"1.6\";s:13:\"twentysixteen\";s:3:\"1.0\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}','yes'),
	(851,'finished_splitting_shared_terms','1','yes'),
	(997,'widget_calendar','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(998,'widget_nav_menu','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(999,'widget_pages','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(1001,'widget_tag_cloud','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(1074,'_site_transient_update_plugins','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1452020981;s:8:\"response\";a:1:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:2:\"15\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"3.1.7\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.3.1.7.zip\";}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:1:{s:9:\"hello.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:4:\"3564\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";}}}','yes'),
	(1102,'_site_transient_timeout_browser_0bf5f8e1fc410dbe246863a115b26894','1452542662','yes'),
	(1103,'_site_transient_browser_0bf5f8e1fc410dbe246863a115b26894','a:9:{s:8:\"platform\";s:9:\"Macintosh\";s:4:\"name\";s:7:\"Firefox\";s:7:\"version\";s:4:\"42.0\";s:10:\"update_url\";s:23:\"http://www.firefox.com/\";s:7:\"img_src\";s:50:\"http://s.wordpress.org/images/browsers/firefox.png\";s:11:\"img_src_ssl\";s:49:\"https://wordpress.org/images/browsers/firefox.png\";s:15:\"current_version\";s:2:\"16\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;}','yes'),
	(1108,'site_icon','0','yes'),
	(1109,'medium_large_size_w','768','yes'),
	(1110,'medium_large_size_h','0','yes'),
	(1111,'rewrite_rules','a:100:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:52:\"blog/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:47:\"blog/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:40:\"blog/category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:22:\"blog/category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:49:\"blog/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:44:\"blog/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:37:\"blog/tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:19:\"blog/tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:50:\"blog/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?type=$matches[1]&feed=$matches[2]\";s:45:\"blog/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?type=$matches[1]&feed=$matches[2]\";s:38:\"blog/type/([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?type=$matches[1]&paged=$matches[2]\";s:20:\"blog/type/([^/]+)/?$\";s:26:\"index.php?type=$matches[1]\";s:36:\"projects/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"projects/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"projects/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"projects/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"projects/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:42:\"projects/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:25:\"projects/([^/]+)/embed/?$\";s:40:\"index.php?project=$matches[1]&embed=true\";s:29:\"projects/([^/]+)/trackback/?$\";s:34:\"index.php?project=$matches[1]&tb=1\";s:37:\"projects/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?project=$matches[1]&paged=$matches[2]\";s:44:\"projects/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?project=$matches[1]&cpage=$matches[2]\";s:33:\"projects/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?project=$matches[1]&page=$matches[2]\";s:25:\"projects/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:35:\"projects/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:55:\"projects/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"projects/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"projects/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:31:\"projects/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"blog/service/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?service=$matches[1]&feed=$matches[2]\";s:48:\"blog/service/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?service=$matches[1]&feed=$matches[2]\";s:41:\"blog/service/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?service=$matches[1]&paged=$matches[2]\";s:23:\"blog/service/([^/]+)/?$\";s:29:\"index.php?service=$matches[1]\";s:52:\"blog/client/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?client=$matches[1]&feed=$matches[2]\";s:47:\"blog/client/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?client=$matches[1]&feed=$matches[2]\";s:40:\"blog/client/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?client=$matches[1]&paged=$matches[2]\";s:22:\"blog/client/([^/]+)/?$\";s:28:\"index.php?client=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:39:\"index.php?&page_id=22&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:52:\"blog/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:47:\"blog/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:40:\"blog/author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:22:\"blog/author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:74:\"blog/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:69:\"blog/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:62:\"blog/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:44:\"blog/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:61:\"blog/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:56:\"blog/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:49:\"blog/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:31:\"blog/([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:48:\"blog/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:43:\"blog/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:36:\"blog/([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:18:\"blog/([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:32:\"blog/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:42:\"blog/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:62:\"blog/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"blog/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"blog/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:38:\"blog/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:21:\"blog/([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:25:\"blog/([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:45:\"blog/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:40:\"blog/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:33:\"blog/([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:40:\"blog/([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:29:\"blog/([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:21:\"blog/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:31:\"blog/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:51:\"blog/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:46:\"blog/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:46:\"blog/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:27:\"blog/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}','yes'),
	(1112,'can_compress_scripts','1','yes'),
	(1117,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-4.4.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-4.4.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-4.4-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-4.4-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:3:\"4.4\";s:7:\"version\";s:3:\"4.4\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.4\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1452020980;s:15:\"version_checked\";s:3:\"4.4\";s:12:\"translations\";a:0:{}}','yes'),
	(1127,'_site_transient_timeout_theme_roots','1452022778','yes'),
	(1128,'_site_transient_theme_roots','a:4:{s:8:\"isotopic\";s:7:\"/themes\";s:13:\"twentyfifteen\";s:7:\"/themes\";s:14:\"twentyfourteen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}','yes'),
	(1129,'_site_transient_timeout_available_translations','1452035963','yes'),
	(1130,'_site_transient_available_translations','a:72:{s:2:\"ar\";a:8:{s:8:\"language\";s:2:\"ar\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-30 08:58:25\";s:12:\"english_name\";s:6:\"Arabic\";s:11:\"native_name\";s:14:\"العربية\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/4.4/ar.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:2;s:3:\"ara\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:3:\"ary\";a:8:{s:8:\"language\";s:3:\"ary\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-12 10:15:45\";s:12:\"english_name\";s:15:\"Moroccan Arabic\";s:11:\"native_name\";s:31:\"العربية المغربية\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/translation/core/4.4/ary.zip\";s:3:\"iso\";a:2:{i:1;s:5:\"ar_MA\";i:3;s:3:\"ary\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:2:\"az\";a:8:{s:8:\"language\";s:2:\"az\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-07 20:53:51\";s:12:\"english_name\";s:11:\"Azerbaijani\";s:11:\"native_name\";s:16:\"Azərbaycan dili\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/4.4/az.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:2;s:3:\"aze\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Davam\";}}s:5:\"bg_BG\";a:8:{s:8:\"language\";s:5:\"bg_BG\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-08 08:50:29\";s:12:\"english_name\";s:9:\"Bulgarian\";s:11:\"native_name\";s:18:\"Български\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/bg_BG.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bg\";i:2;s:3:\"bul\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:22:\"Продължение\";}}s:5:\"bn_BD\";a:8:{s:8:\"language\";s:5:\"bn_BD\";s:7:\"version\";s:5:\"4.3.1\";s:7:\"updated\";s:19:\"2015-09-16 05:09:40\";s:12:\"english_name\";s:7:\"Bengali\";s:11:\"native_name\";s:15:\"বাংলা\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.3.1/bn_BD.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"bn\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:23:\"এগিয়ে চল.\";}}s:5:\"bs_BA\";a:8:{s:8:\"language\";s:5:\"bs_BA\";s:7:\"version\";s:5:\"4.3.1\";s:7:\"updated\";s:19:\"2015-08-18 21:20:44\";s:12:\"english_name\";s:7:\"Bosnian\";s:11:\"native_name\";s:8:\"Bosanski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.3.1/bs_BA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bs\";i:2;s:3:\"bos\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:2:\"ca\";a:8:{s:8:\"language\";s:2:\"ca\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-07 16:27:03\";s:12:\"english_name\";s:7:\"Catalan\";s:11:\"native_name\";s:7:\"Català\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/4.4/ca.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ca\";i:2;s:3:\"cat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:2:\"cy\";a:8:{s:8:\"language\";s:2:\"cy\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-08 16:20:56\";s:12:\"english_name\";s:5:\"Welsh\";s:11:\"native_name\";s:7:\"Cymraeg\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/4.4/cy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cy\";i:2;s:3:\"cym\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Parhau\";}}s:5:\"da_DK\";a:8:{s:8:\"language\";s:5:\"da_DK\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-08 22:48:20\";s:12:\"english_name\";s:6:\"Danish\";s:11:\"native_name\";s:5:\"Dansk\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/da_DK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"da\";i:2;s:3:\"dan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Forts&#230;t\";}}s:5:\"de_CH\";a:8:{s:8:\"language\";s:5:\"de_CH\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-08 14:19:21\";s:12:\"english_name\";s:20:\"German (Switzerland)\";s:11:\"native_name\";s:17:\"Deutsch (Schweiz)\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/de_CH.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Fortfahren\";}}s:5:\"de_DE\";a:8:{s:8:\"language\";s:5:\"de_DE\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2016-01-03 15:02:45\";s:12:\"english_name\";s:6:\"German\";s:11:\"native_name\";s:7:\"Deutsch\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/de_DE.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Fortfahren\";}}s:12:\"de_DE_formal\";a:8:{s:8:\"language\";s:12:\"de_DE_formal\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2016-01-04 21:25:27\";s:12:\"english_name\";s:15:\"German (Formal)\";s:11:\"native_name\";s:13:\"Deutsch (Sie)\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/translation/core/4.4/de_DE_formal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Fortfahren\";}}s:2:\"el\";a:8:{s:8:\"language\";s:2:\"el\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-30 01:21:40\";s:12:\"english_name\";s:5:\"Greek\";s:11:\"native_name\";s:16:\"Ελληνικά\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/4.4/el.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"el\";i:2;s:3:\"ell\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Συνέχεια\";}}s:5:\"en_NZ\";a:8:{s:8:\"language\";s:5:\"en_NZ\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-08 13:34:17\";s:12:\"english_name\";s:21:\"English (New Zealand)\";s:11:\"native_name\";s:21:\"English (New Zealand)\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/en_NZ.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_ZA\";a:8:{s:8:\"language\";s:5:\"en_ZA\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-15 11:52:35\";s:12:\"english_name\";s:22:\"English (South Africa)\";s:11:\"native_name\";s:22:\"English (South Africa)\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/en_ZA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_AU\";a:8:{s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-07 04:39:48\";s:12:\"english_name\";s:19:\"English (Australia)\";s:11:\"native_name\";s:19:\"English (Australia)\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/en_AU.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_CA\";a:8:{s:8:\"language\";s:5:\"en_CA\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-06 23:10:59\";s:12:\"english_name\";s:16:\"English (Canada)\";s:11:\"native_name\";s:16:\"English (Canada)\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/en_CA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_GB\";a:8:{s:8:\"language\";s:5:\"en_GB\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-07 10:23:11\";s:12:\"english_name\";s:12:\"English (UK)\";s:11:\"native_name\";s:12:\"English (UK)\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/en_GB.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"eo\";a:8:{s:8:\"language\";s:2:\"eo\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-07 12:35:15\";s:12:\"english_name\";s:9:\"Esperanto\";s:11:\"native_name\";s:9:\"Esperanto\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/4.4/eo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eo\";i:2;s:3:\"epo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Daŭrigi\";}}s:5:\"es_CL\";a:8:{s:8:\"language\";s:5:\"es_CL\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-09 13:19:37\";s:12:\"english_name\";s:15:\"Spanish (Chile)\";s:11:\"native_name\";s:17:\"Español de Chile\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/es_CL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_VE\";a:8:{s:8:\"language\";s:5:\"es_VE\";s:7:\"version\";s:5:\"4.2.5\";s:7:\"updated\";s:19:\"2015-10-29 16:32:18\";s:12:\"english_name\";s:19:\"Spanish (Venezuela)\";s:11:\"native_name\";s:21:\"Español de Venezuela\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.5/es_VE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_ES\";a:8:{s:8:\"language\";s:5:\"es_ES\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-29 19:19:47\";s:12:\"english_name\";s:15:\"Spanish (Spain)\";s:11:\"native_name\";s:8:\"Español\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/es_ES.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"es\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_AR\";a:8:{s:8:\"language\";s:5:\"es_AR\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-23 00:46:01\";s:12:\"english_name\";s:19:\"Spanish (Argentina)\";s:11:\"native_name\";s:21:\"Español de Argentina\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/es_AR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_MX\";a:8:{s:8:\"language\";s:5:\"es_MX\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-07 17:35:10\";s:12:\"english_name\";s:16:\"Spanish (Mexico)\";s:11:\"native_name\";s:19:\"Español de México\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/es_MX.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PE\";a:8:{s:8:\"language\";s:5:\"es_PE\";s:7:\"version\";s:5:\"4.3.1\";s:7:\"updated\";s:19:\"2015-08-19 14:33:57\";s:12:\"english_name\";s:14:\"Spanish (Peru)\";s:11:\"native_name\";s:17:\"Español de Perú\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.3.1/es_PE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CO\";a:8:{s:8:\"language\";s:5:\"es_CO\";s:7:\"version\";s:6:\"4.3-RC\";s:7:\"updated\";s:19:\"2015-08-04 06:10:33\";s:12:\"english_name\";s:18:\"Spanish (Colombia)\";s:11:\"native_name\";s:20:\"Español de Colombia\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.3-RC/es_CO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"et\";a:8:{s:8:\"language\";s:2:\"et\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-08 05:14:35\";s:12:\"english_name\";s:8:\"Estonian\";s:11:\"native_name\";s:5:\"Eesti\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/4.4/et.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"et\";i:2;s:3:\"est\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Jätka\";}}s:2:\"eu\";a:8:{s:8:\"language\";s:2:\"eu\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-07 21:19:15\";s:12:\"english_name\";s:6:\"Basque\";s:11:\"native_name\";s:7:\"Euskara\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/4.4/eu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eu\";i:2;s:3:\"eus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Jarraitu\";}}s:5:\"fa_IR\";a:8:{s:8:\"language\";s:5:\"fa_IR\";s:7:\"version\";s:5:\"4.3.1\";s:7:\"updated\";s:19:\"2015-08-20 13:36:08\";s:12:\"english_name\";s:7:\"Persian\";s:11:\"native_name\";s:10:\"فارسی\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.3.1/fa_IR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:2:\"fi\";a:8:{s:8:\"language\";s:2:\"fi\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-23 06:49:15\";s:12:\"english_name\";s:7:\"Finnish\";s:11:\"native_name\";s:5:\"Suomi\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/4.4/fi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fi\";i:2;s:3:\"fin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Jatka\";}}s:5:\"fr_CA\";a:8:{s:8:\"language\";s:5:\"fr_CA\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-09 02:16:19\";s:12:\"english_name\";s:15:\"French (Canada)\";s:11:\"native_name\";s:19:\"Français du Canada\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/fr_CA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_FR\";a:8:{s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-22 14:45:38\";s:12:\"english_name\";s:15:\"French (France)\";s:11:\"native_name\";s:9:\"Français\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/fr_FR.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"fr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_BE\";a:8:{s:8:\"language\";s:5:\"fr_BE\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-08 13:47:35\";s:12:\"english_name\";s:16:\"French (Belgium)\";s:11:\"native_name\";s:21:\"Français de Belgique\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/fr_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:2:\"gd\";a:8:{s:8:\"language\";s:2:\"gd\";s:7:\"version\";s:5:\"4.3.1\";s:7:\"updated\";s:19:\"2015-09-24 15:25:30\";s:12:\"english_name\";s:15:\"Scottish Gaelic\";s:11:\"native_name\";s:9:\"Gàidhlig\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.3.1/gd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"gd\";i:2;s:3:\"gla\";i:3;s:3:\"gla\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"Lean air adhart\";}}s:5:\"gl_ES\";a:8:{s:8:\"language\";s:5:\"gl_ES\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-12 11:44:09\";s:12:\"english_name\";s:8:\"Galician\";s:11:\"native_name\";s:6:\"Galego\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/gl_ES.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gl\";i:2;s:3:\"glg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:3:\"haz\";a:8:{s:8:\"language\";s:3:\"haz\";s:7:\"version\";s:5:\"4.1.8\";s:7:\"updated\";s:19:\"2015-03-26 15:20:27\";s:12:\"english_name\";s:8:\"Hazaragi\";s:11:\"native_name\";s:15:\"هزاره گی\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.1.8/haz.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"haz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"he_IL\";a:8:{s:8:\"language\";s:5:\"he_IL\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-09 18:10:01\";s:12:\"english_name\";s:6:\"Hebrew\";s:11:\"native_name\";s:16:\"עִבְרִית\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/he_IL.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"he\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"להמשיך\";}}s:5:\"hi_IN\";a:8:{s:8:\"language\";s:5:\"hi_IN\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-07 05:11:43\";s:12:\"english_name\";s:5:\"Hindi\";s:11:\"native_name\";s:18:\"हिन्दी\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/hi_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hi\";i:2;s:3:\"hin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"जारी\";}}s:2:\"hr\";a:8:{s:8:\"language\";s:2:\"hr\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-07 22:05:31\";s:12:\"english_name\";s:8:\"Croatian\";s:11:\"native_name\";s:8:\"Hrvatski\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/4.4/hr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hr\";i:2;s:3:\"hrv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:5:\"hu_HU\";a:8:{s:8:\"language\";s:5:\"hu_HU\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-12 18:07:25\";s:12:\"english_name\";s:9:\"Hungarian\";s:11:\"native_name\";s:6:\"Magyar\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/hu_HU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hu\";i:2;s:3:\"hun\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Tovább\";}}s:2:\"hy\";a:8:{s:8:\"language\";s:2:\"hy\";s:7:\"version\";s:5:\"4.3.1\";s:7:\"updated\";s:19:\"2015-08-17 13:36:47\";s:12:\"english_name\";s:8:\"Armenian\";s:11:\"native_name\";s:14:\"Հայերեն\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.3.1/hy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hy\";i:2;s:3:\"hye\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Շարունակել\";}}s:5:\"id_ID\";a:8:{s:8:\"language\";s:5:\"id_ID\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-21 16:17:50\";s:12:\"english_name\";s:10:\"Indonesian\";s:11:\"native_name\";s:16:\"Bahasa Indonesia\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/id_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"id\";i:2;s:3:\"ind\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Lanjutkan\";}}s:5:\"is_IS\";a:8:{s:8:\"language\";s:5:\"is_IS\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-08 00:20:24\";s:12:\"english_name\";s:9:\"Icelandic\";s:11:\"native_name\";s:9:\"Íslenska\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/is_IS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"is\";i:2;s:3:\"isl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Áfram\";}}s:5:\"it_IT\";a:8:{s:8:\"language\";s:5:\"it_IT\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-21 08:04:30\";s:12:\"english_name\";s:7:\"Italian\";s:11:\"native_name\";s:8:\"Italiano\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/it_IT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"it\";i:2;s:3:\"ita\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:2:\"ja\";a:8:{s:8:\"language\";s:2:\"ja\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-25 07:46:19\";s:12:\"english_name\";s:8:\"Japanese\";s:11:\"native_name\";s:9:\"日本語\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/4.4/ja.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"ja\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"続ける\";}}s:5:\"ko_KR\";a:8:{s:8:\"language\";s:5:\"ko_KR\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-09 07:35:25\";s:12:\"english_name\";s:6:\"Korean\";s:11:\"native_name\";s:9:\"한국어\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/ko_KR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ko\";i:2;s:3:\"kor\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"계속\";}}s:5:\"lt_LT\";a:8:{s:8:\"language\";s:5:\"lt_LT\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-08 20:07:24\";s:12:\"english_name\";s:10:\"Lithuanian\";s:11:\"native_name\";s:15:\"Lietuvių kalba\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/lt_LT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lt\";i:2;s:3:\"lit\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Tęsti\";}}s:5:\"ms_MY\";a:8:{s:8:\"language\";s:5:\"ms_MY\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-15 05:49:00\";s:12:\"english_name\";s:5:\"Malay\";s:11:\"native_name\";s:13:\"Bahasa Melayu\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/ms_MY.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ms\";i:2;s:3:\"msa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Teruskan\";}}s:5:\"my_MM\";a:8:{s:8:\"language\";s:5:\"my_MM\";s:7:\"version\";s:5:\"4.1.8\";s:7:\"updated\";s:19:\"2015-03-26 15:57:42\";s:12:\"english_name\";s:17:\"Myanmar (Burmese)\";s:11:\"native_name\";s:15:\"ဗမာစာ\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.1.8/my_MM.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"my\";i:2;s:3:\"mya\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:54:\"ဆက်လက်လုပ်ေဆာင်ပါ။\";}}s:5:\"nb_NO\";a:8:{s:8:\"language\";s:5:\"nb_NO\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-07 10:01:09\";s:12:\"english_name\";s:19:\"Norwegian (Bokmål)\";s:11:\"native_name\";s:13:\"Norsk bokmål\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/nb_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nb\";i:2;s:3:\"nob\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsett\";}}s:5:\"nl_NL\";a:8:{s:8:\"language\";s:5:\"nl_NL\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2016-01-01 12:07:02\";s:12:\"english_name\";s:5:\"Dutch\";s:11:\"native_name\";s:10:\"Nederlands\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/nl_NL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nn_NO\";a:8:{s:8:\"language\";s:5:\"nn_NO\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-14 12:19:44\";s:12:\"english_name\";s:19:\"Norwegian (Nynorsk)\";s:11:\"native_name\";s:13:\"Norsk nynorsk\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/nn_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nn\";i:2;s:3:\"nno\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Hald fram\";}}s:3:\"oci\";a:8:{s:8:\"language\";s:3:\"oci\";s:7:\"version\";s:6:\"4.3-RC\";s:7:\"updated\";s:19:\"2015-08-02 07:53:33\";s:12:\"english_name\";s:7:\"Occitan\";s:11:\"native_name\";s:7:\"Occitan\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.3-RC/oci.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"oc\";i:2;s:3:\"oci\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Contunhar\";}}s:5:\"pl_PL\";a:8:{s:8:\"language\";s:5:\"pl_PL\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-19 13:20:56\";s:12:\"english_name\";s:6:\"Polish\";s:11:\"native_name\";s:6:\"Polski\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/pl_PL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pl\";i:2;s:3:\"pol\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Kontynuuj\";}}s:2:\"ps\";a:8:{s:8:\"language\";s:2:\"ps\";s:7:\"version\";s:5:\"4.1.8\";s:7:\"updated\";s:19:\"2015-03-29 22:19:48\";s:12:\"english_name\";s:6:\"Pashto\";s:11:\"native_name\";s:8:\"پښتو\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.1.8/ps.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ps\";i:2;s:3:\"pus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"دوام\";}}s:5:\"pt_BR\";a:8:{s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-10 18:05:56\";s:12:\"english_name\";s:19:\"Portuguese (Brazil)\";s:11:\"native_name\";s:20:\"Português do Brasil\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/pt_BR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pt\";i:2;s:3:\"por\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_PT\";a:8:{s:8:\"language\";s:5:\"pt_PT\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-30 22:40:18\";s:12:\"english_name\";s:21:\"Portuguese (Portugal)\";s:11:\"native_name\";s:10:\"Português\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/pt_PT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"ro_RO\";a:8:{s:8:\"language\";s:5:\"ro_RO\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-09 18:41:28\";s:12:\"english_name\";s:8:\"Romanian\";s:11:\"native_name\";s:8:\"Română\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/ro_RO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ro\";i:2;s:3:\"ron\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuă\";}}s:5:\"ru_RU\";a:8:{s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2016-01-02 00:04:31\";s:12:\"english_name\";s:7:\"Russian\";s:11:\"native_name\";s:14:\"Русский\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/ru_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ru\";i:2;s:3:\"rus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продолжить\";}}s:5:\"sk_SK\";a:8:{s:8:\"language\";s:5:\"sk_SK\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-30 10:37:54\";s:12:\"english_name\";s:6:\"Slovak\";s:11:\"native_name\";s:11:\"Slovenčina\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/sk_SK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sk\";i:2;s:3:\"slk\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Pokračovať\";}}s:5:\"sl_SI\";a:8:{s:8:\"language\";s:5:\"sl_SI\";s:7:\"version\";s:5:\"4.3.1\";s:7:\"updated\";s:19:\"2015-09-06 16:10:24\";s:12:\"english_name\";s:9:\"Slovenian\";s:11:\"native_name\";s:13:\"Slovenščina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.3.1/sl_SI.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sl\";i:2;s:3:\"slv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Nadaljujte\";}}s:2:\"sq\";a:8:{s:8:\"language\";s:2:\"sq\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-07 09:13:24\";s:12:\"english_name\";s:8:\"Albanian\";s:11:\"native_name\";s:5:\"Shqip\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/4.4/sq.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sq\";i:2;s:3:\"sqi\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Vazhdo\";}}s:5:\"sr_RS\";a:8:{s:8:\"language\";s:5:\"sr_RS\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-09 09:09:51\";s:12:\"english_name\";s:7:\"Serbian\";s:11:\"native_name\";s:23:\"Српски језик\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/sr_RS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sr\";i:2;s:3:\"srp\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:14:\"Настави\";}}s:5:\"sv_SE\";a:8:{s:8:\"language\";s:5:\"sv_SE\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-08 23:28:56\";s:12:\"english_name\";s:7:\"Swedish\";s:11:\"native_name\";s:7:\"Svenska\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/sv_SE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sv\";i:2;s:3:\"swe\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Fortsätt\";}}s:2:\"th\";a:8:{s:8:\"language\";s:2:\"th\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-08 03:22:55\";s:12:\"english_name\";s:4:\"Thai\";s:11:\"native_name\";s:9:\"ไทย\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/4.4/th.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"th\";i:2;s:3:\"tha\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"ต่อไป\";}}s:2:\"tl\";a:8:{s:8:\"language\";s:2:\"tl\";s:7:\"version\";s:5:\"4.3.1\";s:7:\"updated\";s:19:\"2015-08-20 03:52:15\";s:12:\"english_name\";s:7:\"Tagalog\";s:11:\"native_name\";s:7:\"Tagalog\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.3.1/tl.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tl\";i:2;s:3:\"tgl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Magpatuloy\";}}s:5:\"tr_TR\";a:8:{s:8:\"language\";s:5:\"tr_TR\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-17 23:12:27\";s:12:\"english_name\";s:7:\"Turkish\";s:11:\"native_name\";s:8:\"Türkçe\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/tr_TR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tr\";i:2;s:3:\"tur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Devam\";}}s:5:\"ug_CN\";a:8:{s:8:\"language\";s:5:\"ug_CN\";s:7:\"version\";s:5:\"4.1.8\";s:7:\"updated\";s:19:\"2015-03-26 16:45:38\";s:12:\"english_name\";s:6:\"Uighur\";s:11:\"native_name\";s:9:\"Uyƣurqə\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.1.8/ug_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ug\";i:2;s:3:\"uig\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:26:\"داۋاملاشتۇرۇش\";}}s:2:\"uk\";a:8:{s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2016-01-03 22:04:41\";s:12:\"english_name\";s:9:\"Ukrainian\";s:11:\"native_name\";s:20:\"Українська\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/4.4/uk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uk\";i:2;s:3:\"ukr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продовжити\";}}s:2:\"vi\";a:8:{s:8:\"language\";s:2:\"vi\";s:7:\"version\";s:5:\"4.3.1\";s:7:\"updated\";s:19:\"2015-11-27 09:19:03\";s:12:\"english_name\";s:10:\"Vietnamese\";s:11:\"native_name\";s:14:\"Tiếng Việt\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.3.1/vi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"vi\";i:2;s:3:\"vie\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Tiếp tục\";}}s:5:\"zh_TW\";a:8:{s:8:\"language\";s:5:\"zh_TW\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-11 18:51:41\";s:12:\"english_name\";s:16:\"Chinese (Taiwan)\";s:11:\"native_name\";s:12:\"繁體中文\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/zh_TW.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}s:5:\"zh_CN\";a:8:{s:8:\"language\";s:5:\"zh_CN\";s:7:\"version\";s:3:\"4.4\";s:7:\"updated\";s:19:\"2015-12-12 22:55:08\";s:12:\"english_name\";s:15:\"Chinese (China)\";s:11:\"native_name\";s:12:\"简体中文\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4/zh_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"继续\";}}}','yes');

/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_postmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_postmeta`;

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`)
VALUES
	(1,2,'_wp_page_template','default'),
	(2,1,'_edit_lock','1448199058:1'),
	(3,1,'_edit_last','1'),
	(8,7,'_edit_last','1'),
	(9,7,'_edit_lock','1448199008:1'),
	(20,2,'_edit_lock','1452012635:1'),
	(21,2,'_edit_last','1'),
	(22,10,'_edit_last','1'),
	(23,10,'_edit_lock','1452013203:1'),
	(24,12,'_edit_last','1'),
	(25,12,'_edit_lock','1452012509:1'),
	(30,18,'_edit_last','1'),
	(31,18,'_edit_lock','1452012641:1'),
	(32,22,'_edit_last','1'),
	(33,22,'_edit_lock','1452025017:1'),
	(36,18,'post_subtitle','Subtitle'),
	(146,39,'_menu_item_type','post_type'),
	(147,39,'_menu_item_menu_item_parent','0'),
	(148,39,'_menu_item_object_id','18'),
	(149,39,'_menu_item_object','page'),
	(150,39,'_menu_item_target',''),
	(151,39,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(152,39,'_menu_item_xfn',''),
	(153,39,'_menu_item_url',''),
	(155,40,'_menu_item_type','post_type'),
	(156,40,'_menu_item_menu_item_parent','0'),
	(157,40,'_menu_item_object_id','12'),
	(158,40,'_menu_item_object','page'),
	(159,40,'_menu_item_target',''),
	(160,40,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(161,40,'_menu_item_xfn',''),
	(162,40,'_menu_item_url',''),
	(173,42,'_menu_item_type','post_type'),
	(174,42,'_menu_item_menu_item_parent','0'),
	(175,42,'_menu_item_object_id','2'),
	(176,42,'_menu_item_object','page'),
	(177,42,'_menu_item_target',''),
	(178,42,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(179,42,'_menu_item_xfn',''),
	(180,42,'_menu_item_url',''),
	(289,122,'_edit_last','1'),
	(290,122,'_edit_lock','1452024451:1'),
	(291,12,'_wp_page_template','default'),
	(292,10,'_wp_page_template','default'),
	(296,22,'_wp_page_template','default'),
	(300,2,'about_content_info','<div class=\"about-info-content-item\">\r\n	<h5>one</h5> <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. </p>\r\n</div>\r\n							\r\n<div class=\"about-info-content-item\">\r\n	<h5>two</h5> <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>\r\n</div>\r\n'),
	(301,2,'about_content_skills',''),
	(302,2,'about_content_timeline','<div class=\"about-timeline-year\">\r\n	<h4>2002</h4>\r\n</div>\r\n\r\n	<div class=\"about-timeline-fact about-timeline-fact-work\">\r\n		<h5> <div>2002 <span>jan</span></div> Event</h5>\r\n		<p>Description goes here</p>\r\n	</div>\r\n\r\n\r\n	<div class=\"about-timeline-fact about-timeline-fact-education\">\r\n		<h5><div>2003 <span>mar</span></div>Event</h5>\r\n		<p>Description goes here</p>\r\n	</div>\r\n\r\n\r\n	<div class=\"about-timeline-fact about-timeline-fact-work\">\r\n		<h5> <div>2010 <span>jun</span></div> Event</h5>\r\n		<p>Description goes here</p>\r\n\r\n	</div>\r\n\r\n	<div class=\"about-timeline-fact about-timeline-fact-work\">\r\n		<h5> <div>2015 <span>nov</span></div>Event</h5>\r\n		<p>Description goes here</p>\r\n	</div>\r\n\r\n\r\n<div class=\"about-timeline-year\">\r\n	<h4>2016</h4>\r\n</div>'),
	(303,2,'about_content_skills1','<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>'),
	(304,2,'about_content_skills2','<p> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Laboris nisi ut aliquip ex ea commodo consequat.</p>'),
	(305,2,'about_content_skills3','<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>'),
	(313,22,'home_links_airplane','<a href=\"about\"><p>Title <span>Link description</span></p></a>'),
	(314,22,'home_links_bus','<a href=\"projects\"><p>Title <span>Link description</span></p></a>'),
	(315,22,'home_links_ship','<a href=\"blog\"><p>Title <span>Link description</span></p></a>'),
	(316,22,'home_links_train','<a href=\"contact\"><p>Title <span>Link description</span></p></a>'),
	(342,189,'_edit_last','1'),
	(343,189,'_edit_lock','1451943540:1'),
	(350,193,'_wp_attached_file','2016/01/700x500.jpg'),
	(351,193,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:700;s:6:\"height\";i:500;s:4:\"file\";s:19:\"2016/01/700x500.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"700x500-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"700x500-300x214.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:214;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}'),
	(352,189,'_thumbnail_id','193'),
	(353,189,'_wp_trash_meta_status','publish'),
	(354,189,'_wp_trash_meta_time','1451943684'),
	(355,194,'_edit_last','1'),
	(356,194,'_edit_lock','1452019704:1'),
	(357,194,'_thumbnail_id','193'),
	(358,194,'project_url_project_url','https://unsplash.com/photos/IClZBVw5W5A'),
	(359,196,'_menu_item_type','custom'),
	(360,196,'_menu_item_menu_item_parent','0'),
	(361,196,'_menu_item_object_id','196'),
	(362,196,'_menu_item_object','custom'),
	(363,196,'_menu_item_target',''),
	(364,196,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(365,196,'_menu_item_xfn',''),
	(366,196,'_menu_item_url','http://isotopic.github.io'),
	(368,10,'_wp_trash_meta_status','publish'),
	(369,10,'_wp_trash_meta_time','1452018887');

/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_posts`;

CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_name` (`post_name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`)
VALUES
	(1,1,'2014-12-11 17:20:18','2014-12-11 17:20:18','<p>This is the content of the post.</p>','This is the first post.','<p>Excerpt for this post.</p>','publish','closed','closed','','hello-world','','','2015-11-22 10:33:21','2015-11-22 13:33:21','',0,'http://localhost/isotopic/wordpress/?p=1',0,'post','',1),
	(2,1,'2014-12-11 17:20:18','2014-12-11 17:20:18','This is the About page.','About','','publish','open','closed','','about','','','2015-11-11 18:09:55','2015-11-11 21:09:55','',0,'http://localhost/isotopic/wordpress/?page_id=2',1,'page','',0),
	(7,1,'2014-12-11 18:55:00','2014-12-11 18:55:00','<p>Second post\'s content.</p>','And this one is the second post.','<p>Another excerpt.</p>','publish','closed','closed','','and-this-one-is-a-second-post','','','2015-11-22 10:32:30','2015-11-22 13:32:30','',0,'http://localhost/isotopic/?p=7',0,'post','',0),
	(10,1,'2014-12-11 18:58:05','2014-12-11 21:58:05','This is the contact page.','Contact','','trash','open','closed','','contact','','','2016-01-05 15:34:47','2016-01-05 18:34:47','',0,'http://localhost/isotopic/?page_id=10',4,'page','',0),
	(12,1,'2014-12-11 18:59:04','2014-12-11 18:59:04','Parent page for all sample works.','Projects','','publish','open','closed','','projects','','','2015-11-07 21:09:45','2015-11-08 00:09:45','',0,'http://localhost/isotopic/?page_id=12',2,'page','',0),
	(18,1,'2014-12-11 19:14:56','2014-12-11 19:14:56','This is the blog home.','Blog','','publish','open','closed','','blog','','','2015-11-07 21:10:02','2015-11-08 00:10:02','',0,'http://localhost/isotopic/?page_id=18',3,'page','',0),
	(22,1,'2015-03-22 17:52:11','2015-03-22 17:52:11','<h2>Congratulations! \r\n\r\n<span>\r\nYou have sucessfully installed a local version of isotopic.com.br <br>\r\n<a href=\"wordpress/wp-admin\">admin</a> ( user: <i>hello</i> &nbsp; pass: <i>world</i> )</span>\r\n\r\n</h2>\r\n\r\n\r\n','Home','','publish','closed','closed','','home','','','2016-01-05 15:35:15','2016-01-05 18:35:15','',0,'http://localhost/isotopic/?page_id=22',0,'page','',0),
	(39,1,'2015-04-07 22:14:37','2015-04-08 01:14:37',' ','','','publish','open','closed','','39','','','2016-01-05 15:34:14','2016-01-05 18:34:14','',0,'http://localhost/isotopic/?p=39',3,'nav_menu_item','',0),
	(40,1,'2015-04-07 22:14:37','2015-04-08 01:14:37',' ','','','publish','open','closed','','40','','','2016-01-05 15:34:14','2016-01-05 18:34:14','',0,'http://localhost/isotopic/?p=40',2,'nav_menu_item','',0),
	(42,1,'2015-04-07 22:14:37','2015-04-08 01:14:37',' ','','','publish','open','closed','','42','','','2016-01-05 15:34:14','2016-01-05 18:34:14','',0,'http://localhost/isotopic/?p=42',1,'nav_menu_item','',0),
	(122,1,'2015-05-14 22:17:40','2015-05-15 01:17:40','<p>Content for this post.</p>','The third post','<p>Excerpt for this post.</p>','publish','closed','closed','','the-rule-of-thirds','','','2016-01-04 18:48:40','2016-01-04 21:48:40','',0,'http://localhost/isotopic/?p=122',0,'post','',0),
	(183,1,'2015-11-22 10:32:12','2015-11-22 13:32:12','<p>This is the content of the post.</p>','This is the first post.','<p>Excerpt for this post.</p>','inherit','closed','closed','','1-revision-v1','','','2015-11-22 10:32:12','2015-11-22 13:32:12','',1,'http://localhost/isotopic-local/blog/1-revision-v1/',0,'revision','',0),
	(184,1,'2015-11-22 10:32:30','2015-11-22 13:32:30','<p>Second post\'s content.</p>','And this one is the second post.','<p>Another excerpt.</p>','inherit','closed','closed','','7-revision-v1','','','2015-11-22 10:32:30','2015-11-22 13:32:30','',7,'http://localhost/isotopic-local/blog/7-revision-v1/',0,'revision','',0),
	(185,1,'2015-11-22 10:32:44','2015-11-22 13:32:44','<p>Content for this post.</p>','The third post','<p>Excerpt for this post.</p>','inherit','closed','closed','','122-revision-v1','','','2015-11-22 10:32:44','2015-11-22 13:32:44','',122,'http://localhost/isotopic-local/blog/122-revision-v1/',0,'revision','',0),
	(186,1,'2016-01-04 17:04:22','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2016-01-04 17:04:22','0000-00-00 00:00:00','',0,'http://192.168.0.14/isotopic-local/?p=186',0,'post','',0),
	(189,1,'2016-01-04 17:52:12','2016-01-04 20:52:12','Content for another test.','Another test','','trash','closed','closed','','another-test','','','2016-01-04 18:41:24','2016-01-04 21:41:24','',0,'http://192.168.0.14/isotopic-local/?post_type=project&#038;p=189',0,'project','',0),
	(192,1,'2016-01-04 18:36:52','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','closed','','','','','2016-01-04 18:36:52','0000-00-00 00:00:00','',0,'http://192.168.0.14/isotopic-local/?post_type=project&p=192',0,'project','',0),
	(193,1,'2016-01-04 18:41:16','2016-01-04 21:41:16','','700x500','','inherit','open','closed','','700x500','','','2016-01-04 18:41:16','2016-01-04 21:41:16','',194,'http://192.168.0.14/isotopic-local/wordpress/wp-content/uploads/2016/01/700x500.jpg',0,'attachment','image/jpeg',0),
	(194,1,'2016-01-04 18:47:17','2016-01-04 21:47:17','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Example project','','publish','closed','closed','','example-project','','','2016-01-05 15:29:33','2016-01-05 18:29:33','',0,'http://192.168.0.14/isotopic-local/?post_type=project&#038;p=194',0,'project','',0),
	(195,1,'2016-01-04 18:50:10','2016-01-04 21:50:10','<h2>Congratulations! \r\n\r\n<span>\r\nYou have sucessfully installed a local version of isotopic.com.br <br>\r\n<a href=\"wordpress/wp-admin\">admin</a> ( user: <i>hello</i> &nbsp; pass: <i>world</i> )</span>\r\n\r\n</h2>\r\n\r\n\r\n','Home','','inherit','closed','closed','','22-revision-v1','','','2016-01-04 18:50:10','2016-01-04 21:50:10','',22,'http://192.168.0.14/isotopic-local/blog/22-revision-v1/',0,'revision','',0),
	(196,1,'2016-01-05 15:34:14','2016-01-05 18:34:14','','Lab','','publish','closed','closed','','lab','','','2016-01-05 15:34:14','2016-01-05 18:34:14','',0,'http://192.168.0.14/isotopic-local/?p=196',4,'nav_menu_item','',0),
	(197,1,'2016-01-05 15:34:47','2016-01-05 18:34:47','This is the contact page.','Contact','','inherit','closed','closed','','10-revision-v1','','','2016-01-05 15:34:47','2016-01-05 18:34:47','',10,'http://192.168.0.14/isotopic-local/blog/10-revision-v1/',0,'revision','',0);

/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_term_relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_term_relationships`;

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`)
VALUES
	(1,3,0),
	(1,4,0),
	(1,5,0),
	(1,38,0),
	(7,2,0),
	(7,6,0),
	(7,7,0),
	(16,23,0),
	(39,8,0),
	(40,8,0),
	(42,8,0),
	(94,21,0),
	(94,24,0),
	(96,21,0),
	(113,28,0),
	(113,29,0),
	(122,2,0),
	(122,4,0),
	(189,28,0),
	(194,28,0),
	(194,29,0),
	(194,45,0),
	(194,53,0),
	(196,8,0);

/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_term_taxonomy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_term_taxonomy`;

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`)
VALUES
	(1,1,'category','',0,0),
	(2,2,'category','',0,2),
	(3,3,'category','',0,1),
	(4,4,'post_tag','',0,2),
	(5,5,'post_tag','',0,1),
	(6,6,'post_tag','',0,1),
	(7,7,'post_tag','',0,1),
	(8,8,'nav_menu','',0,4),
	(21,21,'role','',0,2),
	(22,22,'role','',0,0),
	(23,23,'role','',0,1),
	(24,24,'page','',0,1),
	(28,28,'service','',0,1),
	(29,29,'service','',0,1),
	(30,30,'service','',0,0),
	(38,38,'post_tag','',0,1),
	(45,45,'type','',0,1),
	(47,47,'client','',0,0),
	(49,49,'type','',0,0),
	(50,50,'type','',0,0),
	(51,51,'service','',0,0),
	(52,52,'type','',0,0),
	(53,53,'client','',0,1);

/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_termmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_termmeta`;

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_terms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_terms`;

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`)
VALUES
	(1,'Uncategorized','uncategorized',0),
	(2,'Development','development',0),
	(3,'Design','design',0),
	(4,'tutorial','tutorial',0),
	(5,'tools','tools',0),
	(6,'git','git',0),
	(7,'open source','open-source',0),
	(8,'Menu principal','menu-principal',0),
	(21,'Front-end','frontend',0),
	(22,'Back-end','backend',0),
	(23,'Design','design',0),
	(24,'Café 3 Corações','cafe3coracoes',0),
	(28,'Front-end','front-end',0),
	(29,'Back-end','back-end',0),
	(30,'Design','design',0),
	(38,'bash','bash',0),
	(45,'Website','website',0),
	(47,'Acme','acme',0),
	(49,'Hotsite','hotsite',0),
	(50,'Web app','webapp',0),
	(51,'Animation','animation',0),
	(52,'Game','game',0),
	(53,'Some Company','some-company',0);

/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_usermeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_usermeta`;

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`)
VALUES
	(1,1,'nickname','hello'),
	(2,1,'first_name','John'),
	(3,1,'last_name','Doe'),
	(4,1,'description',''),
	(5,1,'rich_editing','false'),
	(6,1,'comment_shortcuts','false'),
	(7,1,'admin_color','fresh'),
	(8,1,'use_ssl','0'),
	(9,1,'show_admin_bar_front','false'),
	(10,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),
	(11,1,'wp_user_level','10'),
	(12,1,'dismissed_wp_pointers','wp350_media,wp360_revisions,wp360_locks,wp390_widgets,wp410_dfw'),
	(13,1,'show_welcome_panel','0'),
	(14,1,'session_tokens','a:1:{s:64:\"2c4b3e13d0ba9cdc9b2f2b1a2965e654def2420af80578f835d1631f1a5b0f34\";a:4:{s:10:\"expiration\";i:1453147461;s:2:\"ip\";s:12:\"192.168.0.14\";s:2:\"ua\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:42.0) Gecko/20100101 Firefox/42.0\";s:5:\"login\";i:1451937861;}}'),
	(15,1,'wp_dashboard_quick_press_last_post_id','186'),
	(16,1,'wp_user-settings','editor=html&libraryContent=browse&urlbutton=file&imgsize=full&editor_expand=on'),
	(17,1,'wp_user-settings-time','1447269323'),
	(18,1,'closedpostboxes_page','a:0:{}'),
	(19,1,'metaboxhidden_page','a:0:{}'),
	(20,1,'meta-box-order_page','a:3:{s:4:\"side\";s:67:\"pageparentdiv,tagsdiv-type,tagsdiv-client,tagsdiv-service,submitdiv\";s:6:\"normal\";s:83:\"commentstatusdiv,commentsdiv,slugdiv,postcustom,postimagediv,revisionsdiv,authordiv\";s:8:\"advanced\";s:0:\"\";}'),
	(21,1,'screen_layout_page','2'),
	(22,1,'managenav-menuscolumnshidden','a:4:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";}'),
	(23,1,'metaboxhidden_nav-menus','a:2:{i:0;s:8:\"add-post\";i:1;s:12:\"add-post_tag\";}'),
	(24,1,'wp_media_library_mode','list'),
	(25,1,'nav_menu_recently_edited','8'),
	(26,1,'closedpostboxes_post','a:0:{}'),
	(27,1,'metaboxhidden_post','a:6:{i:0;s:13:\"trackbacksdiv\";i:1;s:10:\"postcustom\";i:2;s:16:\"commentstatusdiv\";i:3;s:11:\"commentsdiv\";i:4;s:7:\"slugdiv\";i:5;s:9:\"authordiv\";}'),
	(28,1,'closedpostboxes_dashboard','a:4:{i:0;s:19:\"dashboard_right_now\";i:1;s:18:\"dashboard_activity\";i:2;s:21:\"dashboard_quick_press\";i:3;s:17:\"dashboard_primary\";}'),
	(29,1,'metaboxhidden_dashboard','a:4:{i:0;s:19:\"dashboard_right_now\";i:1;s:18:\"dashboard_activity\";i:2;s:21:\"dashboard_quick_press\";i:3;s:17:\"dashboard_primary\";}'),
	(30,1,'meta-box-order_dashboard','a:4:{s:6:\"normal\";s:59:\"dashboard_right_now,dashboard_activity,shortcuts_widget_box\";s:4:\"side\";s:39:\"dashboard_quick_press,dashboard_primary\";s:7:\"column3\";s:0:\"\";s:7:\"column4\";s:0:\"\";}'),
	(31,1,'closedpostboxes_project','a:0:{}'),
	(32,1,'metaboxhidden_project','a:1:{i:0;s:7:\"slugdiv\";}');

/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_users`;

CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`)
VALUES
	(1,'hello','$P$BkJPoqgJadFMLMDB/GW9sxJm7t5vRi.','hello','isotopic@mailinator.com','','2014-12-11 17:20:18','',0,'John Doe');

/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
