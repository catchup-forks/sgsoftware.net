/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50630
 Source Host           : localhost
 Source Database       : sgsoft_v2

 Target Server Type    : MySQL
 Target Server Version : 50630
 File Encoding         : utf-8

 Date: 11/20/2016 19:09:45 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page_template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('activated','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activated',
  `order` int(11) NOT NULL DEFAULT '0',
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  KEY `categories_created_by_foreign` (`created_by`),
  KEY `categories_updated_by_foreign` (`updated_by`),
  CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `custom_fields`
-- ----------------------------
DROP TABLE IF EXISTS `custom_fields`;
CREATE TABLE `custom_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `use_for` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `use_for_id` int(10) unsigned NOT NULL,
  `field_item_id` int(10) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `custom_fields_field_item_id_foreign` (`field_item_id`),
  CONSTRAINT `custom_fields_field_item_id_foreign` FOREIGN KEY (`field_item_id`) REFERENCES `field_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `custom_fields`
-- ----------------------------
BEGIN;
INSERT INTO `custom_fields` VALUES ('1', 'WebEd\\Plugins\\Pages\\Models\\EloquentPage', '1', '1', 'text', 'how_it_works_title', 'How it works'), ('2', 'WebEd\\Plugins\\Pages\\Models\\EloquentPage', '1', '2', 'wysiwyg', 'how_it_works_caption', ''), ('3', 'WebEd\\Plugins\\Pages\\Models\\EloquentPage', '1', '3', 'repeater', 'how_it_works_steps', '[[{\"field_item_id\":4,\"type\":\"image\",\"slug\":\"image\",\"value\":\"\\/uploads\\/images\\/home\\/step-1.svg\"},{\"field_item_id\":5,\"type\":\"text\",\"slug\":\"title\",\"value\":\"ALIGNMENT\"},{\"field_item_id\":6,\"type\":\"text\",\"slug\":\"caption\",\"value\":\"First of all, we know what customers  need and want\"}],[{\"field_item_id\":4,\"type\":\"image\",\"slug\":\"image\",\"value\":\"\\/uploads\\/images\\/home\\/step-2.svg\"},{\"field_item_id\":5,\"type\":\"text\",\"slug\":\"title\",\"value\":\"CONCEPTUALISATION\"},{\"field_item_id\":6,\"type\":\"text\",\"slug\":\"caption\",\"value\":\"Based on that understanding, we research and develop  ideas suitable for the customers.\"}],[{\"field_item_id\":4,\"type\":\"image\",\"slug\":\"image\",\"value\":\"\\/uploads\\/images\\/home\\/step-3.svg\"},{\"field_item_id\":5,\"type\":\"text\",\"slug\":\"title\",\"value\":\"IMPLEMENTATION\"},{\"field_item_id\":6,\"type\":\"text\",\"slug\":\"caption\",\"value\":\"The value of the product is the vision and ideas that we bring to customers.\"}]]'), ('4', 'WebEd\\Plugins\\Pages\\Models\\EloquentPage', '1', '7', 'text', 'our_services_title', ''), ('5', 'WebEd\\Plugins\\Pages\\Models\\EloquentPage', '1', '8', 'text', 'our_services_caption', 'Everything you need'), ('6', 'WebEd\\Plugins\\Pages\\Models\\EloquentPage', '1', '9', 'repeater', 'services', '[[{\"field_item_id\":10,\"type\":\"text\",\"slug\":\"icon_font\",\"value\":\"fa fa-paint-brush\"},{\"field_item_id\":11,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Website Design\"},{\"field_item_id\":12,\"type\":\"wysiwyg\",\"slug\":\"description\",\"value\":\"<p>You&rsquo;ve got 15 seconds to impress visitors at the right time they hit your website before they click away to your competitors. Let Saigon Software help you achieve this difficult task with a unique and professional website which is interestingly informative, easily accessible and extremely attractive.<\\/p>\\n\"},{\"field_item_id\":13,\"type\":\"repeater\",\"slug\":\"steps\",\"value\":[[{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Template website design\"}],[{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Content management system\"}],[{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Responsive web design\"}],[{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Web maintenance\"}]]}],[{\"field_item_id\":10,\"type\":\"text\",\"slug\":\"icon_font\",\"value\":\"fa fa-code\"},{\"field_item_id\":11,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Website Development\"},{\"field_item_id\":12,\"type\":\"wysiwyg\",\"slug\":\"description\",\"value\":\"<p>Saigon Software uses progressive programming languages such as Java, PHP, ASP, CGI and strong database systems including Access, SQL, Oracle to turn static website into dynamic website system, which is very flexible, updated, highly interactive and responsive; therefore, it attracts more visitors and improve your business.<\\/p>\\n\"},{\"field_item_id\":13,\"type\":\"repeater\",\"slug\":\"steps\",\"value\":[[{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"title\",\"value\":\"E-commerce website\"}],[{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Business website\"}],[{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Web application\"}],[{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Web service\"}]]}],[{\"field_item_id\":10,\"type\":\"text\",\"slug\":\"icon_font\",\"value\":\"fa fa-bullseye\"},{\"field_item_id\":11,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Corporate identity\"},{\"field_item_id\":12,\"type\":\"wysiwyg\",\"slug\":\"description\",\"value\":\"<p>Corporate identity package is appreciated as the fastest, shortest and most effective way to communicate with customers in the brand war. Moreover, it is the important part of corporate culture. Therefore, it is invested carefully.<\\/p>\\n\\n<p>Designing a product is building a relationship. This is the primary reason motivating Lorsi to design impressive and effective corporate identity packaging, which reflect the corporate culture, build the customer belief and improve the cohesiveness among corporate members.<\\/p>\\n\"},{\"field_item_id\":13,\"type\":\"repeater\",\"slug\":\"steps\",\"value\":[[{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Naming & Logo design\"}],[{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Stationery design (Name card, Letterhead, envelop, ...)\"}],[{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Print design (Profile, Leaflet, Brochure, Catalogue, Poster...)\"}],[{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Printing service\"}]]}],[{\"field_item_id\":10,\"type\":\"text\",\"slug\":\"icon_font\",\"value\":\"fa fa-mobile\"},{\"field_item_id\":11,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Mobile App Development\"},{\"field_item_id\":12,\"type\":\"wysiwyg\",\"slug\":\"description\",\"value\":\"<p>Saigon Software designs entertainment software and focuses on building mobile application software to increase your competitive advantage. Saigon Software&rsquo;s products provide users with the experience of fast and convenient information access.<\\/p>\\n\"},{\"field_item_id\":13,\"type\":\"repeater\",\"slug\":\"steps\",\"value\":[[{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"title\",\"value\":\"iOS\"}],[{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Android\"}],[{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Windows phone\"}],[{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Cross-platforms application (React native, ElectronJs...)\"}]]}]]'), ('7', 'WebEd\\Plugins\\Pages\\Models\\EloquentPage', '1', '15', 'text', 'testimonial_title', 'Testimonials'), ('8', 'WebEd\\Plugins\\Pages\\Models\\EloquentPage', '1', '16', 'text', 'testimonial_caption', 'We take our clients\' trust in us'), ('9', 'WebEd\\Plugins\\Pages\\Models\\EloquentPage', '1', '17', 'repeater', 'testimonials', '[[{\"field_item_id\":18,\"type\":\"text\",\"slug\":\"content\",\"value\":\"Good team. I always feel happy and appreciate the quality of work and responsibilities of Saigon Software.\"},{\"field_item_id\":19,\"type\":\"text\",\"slug\":\"author\",\"value\":\"Michael Laurent\"},{\"field_item_id\":20,\"type\":\"text\",\"slug\":\"position\",\"value\":\"CEO - TBSCG\"},{\"field_item_id\":21,\"type\":\"image\",\"slug\":\"avatar\",\"value\":\"http:\\/\\/placehold.it\\/60x60\"}],[{\"field_item_id\":18,\"type\":\"text\",\"slug\":\"content\",\"value\":\"The quality of the end result has always lived up to my expectations\\u2026and we have always had great fun getting the job done!\"},{\"field_item_id\":19,\"type\":\"text\",\"slug\":\"author\",\"value\":\"Alvin Wang\"},{\"field_item_id\":20,\"type\":\"text\",\"slug\":\"position\",\"value\":\"Head of marketing\"},{\"field_item_id\":21,\"type\":\"image\",\"slug\":\"avatar\",\"value\":\"http:\\/\\/placehold.it\\/60x60\"}]]');
COMMIT;

-- ----------------------------
--  Table structure for `field_groups`
-- ----------------------------
DROP TABLE IF EXISTS `field_groups`;
CREATE TABLE `field_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rules` text COLLATE utf8_unicode_ci,
  `status` enum('activated','disabled') COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_groups_created_by_foreign` (`created_by`),
  KEY `field_groups_updated_by_foreign` (`updated_by`),
  CONSTRAINT `field_groups_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_groups_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `field_groups`
-- ----------------------------
BEGIN;
INSERT INTO `field_groups` VALUES ('1', 'How it works section', '[[{\"name\":\"page_template\",\"type\":\"==\",\"value\":\"Homepage\"}]]', 'activated', '0', '1', '1', '2016-11-20 06:41:51', '2016-11-20 06:41:51'), ('2', 'Our services section', '[[{\"name\":\"page_template\",\"type\":\"==\",\"value\":\"Homepage\"}]]', 'activated', '0', '1', '1', '2016-11-20 07:00:13', '2016-11-20 07:00:13'), ('3', 'Testimonials section', '[[{\"name\":\"page_template\",\"type\":\"==\",\"value\":\"Homepage\"}]]', 'activated', '0', '1', '1', '2016-11-20 07:22:39', '2016-11-20 07:22:39');
COMMIT;

-- ----------------------------
--  Table structure for `field_items`
-- ----------------------------
DROP TABLE IF EXISTS `field_items`;
CREATE TABLE `field_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_group_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  `options` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_items_field_group_id_parent_id_slug_unique` (`field_group_id`,`parent_id`,`slug`),
  KEY `field_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `field_items_field_group_id_foreign` FOREIGN KEY (`field_group_id`) REFERENCES `field_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `field_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `field_items`
-- ----------------------------
BEGIN;
INSERT INTO `field_items` VALUES ('1', '1', null, '1', 'How it works - title', 'how_it_works_title', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('2', '1', null, '2', 'How it works - caption', 'how_it_works_caption', 'wysiwyg', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":\"basic\",\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('3', '1', null, '3', 'How it works - steps', 'how_it_works_steps', 'repeater', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('4', '1', '3', '1', 'Image', 'image', 'image', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('5', '1', '3', '2', 'Title', 'title', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('6', '1', '3', '3', 'Caption', 'caption', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('7', '2', null, '1', 'Our services - title', 'our_services_title', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('8', '2', null, '2', 'Our services - caption', 'our_services_caption', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('9', '2', null, '3', 'Services', 'services', 'repeater', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":\"Add service\",\"rows\":null}'), ('10', '2', '9', '1', 'Icon font', 'icon_font', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('11', '2', '9', '2', 'Title', 'title', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('12', '2', '9', '3', 'Description', 'description', 'wysiwyg', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":\"basic\",\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('13', '2', '9', '4', 'Steps', 'steps', 'repeater', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('14', '2', '13', '1', 'Title', 'title', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('15', '3', null, '1', 'Testimonial title', 'testimonial_title', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('16', '3', null, '2', 'Testimonial caption', 'testimonial_caption', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('17', '3', null, '3', 'Testimonials', 'testimonials', 'repeater', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('18', '3', '17', '1', 'Content', 'content', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('19', '3', '17', '2', 'Author', 'author', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('20', '3', '17', '3', 'Position', 'position', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('21', '3', '17', '4', 'Avatar', 'avatar', 'image', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}');
COMMIT;

-- ----------------------------
--  Table structure for `menu_nodes`
-- ----------------------------
DROP TABLE IF EXISTS `menu_nodes`;
CREATE TABLE `menu_nodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `related_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_font` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_foreign` (`menu_id`),
  KEY `menu_nodes_parent_id_foreign` (`parent_id`),
  CONSTRAINT `menu_nodes_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_nodes_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menu_nodes` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `menu_nodes`
-- ----------------------------
BEGIN;
INSERT INTO `menu_nodes` VALUES ('1', '1', null, null, 'custom-link', '#how-it-works', 'How it works', '', '', '0', '2016-11-20 06:12:21', '2016-11-20 06:12:21'), ('2', '1', null, null, 'custom-link', '#features', 'Services', '', '', '1', '2016-11-20 06:12:21', '2016-11-20 06:12:21');
COMMIT;

-- ----------------------------
--  Table structure for `menus`
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('activated','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activated',
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menus_created_by_foreign` (`created_by`),
  KEY `menus_updated_by_foreign` (`updated_by`),
  CONSTRAINT `menus_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `menus_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `menus`
-- ----------------------------
BEGIN;
INSERT INTO `menus` VALUES ('1', 'Top menu', 'top-menu', 'activated', null, '1', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `migrations`
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES ('1', '2016_08_04_043730_create_users_table', '1'), ('2', '2016_08_04_043732_create_roles_table', '1'), ('3', '2016_08_04_043756_create_settings_table', '1'), ('4', '2016_11_07_102334_create_menus', '1');
COMMIT;

-- ----------------------------
--  Table structure for `pages`
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page_template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('activated','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activated',
  `order` int(11) NOT NULL DEFAULT '0',
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`),
  KEY `pages_created_by_foreign` (`created_by`),
  KEY `pages_updated_by_foreign` (`updated_by`),
  CONSTRAINT `pages_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `pages_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `pages`
-- ----------------------------
BEGIN;
INSERT INTO `pages` VALUES ('1', 'Homepage', 'Homepage', 'homepage', '', '', '', '', 'activated', '0', '1', '1', '2016-11-20 06:09:23', '2016-11-20 06:09:23');
COMMIT;

-- ----------------------------
--  Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `permissions`
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `permissions`
-- ----------------------------
BEGIN;
INSERT INTO `permissions` VALUES ('1', 'View roles', 'view-roles', 'WebEd\\Base\\ACL'), ('2', 'Create roles', 'create-roles', 'WebEd\\Base\\ACL'), ('3', 'Edit roles', 'edit-roles', 'WebEd\\Base\\ACL'), ('4', 'Delete roles', 'delete-roles', 'WebEd\\Base\\ACL'), ('5', 'View permissions', 'view-permissions', 'WebEd\\Base\\ACL'), ('6', 'View cache management page', 'view-cache', 'WebEd\\Base\\Caching'), ('7', 'Modify cache', 'modify-cache', 'WebEd\\Base\\Caching'), ('8', 'Clear cache', 'clear-cache', 'WebEd\\Base\\Caching'), ('9', 'Access to dashboard', 'access-dashboard', 'WebEd\\Base\\Core'), ('10', 'View files', 'view-files', 'WebEd\\Base\\Elfinder'), ('11', 'Upload file', 'upload-files', 'WebEd\\Base\\Elfinder'), ('12', 'Edit file', 'edit-files', 'WebEd\\Base\\Elfinder'), ('13', 'Delete file', 'delete-files', 'WebEd\\Base\\Elfinder'), ('14', 'View menus', 'view-menus', 'WebEd\\Base\\Menu'), ('15', 'Delete menus', 'delete-menus', 'WebEd\\Base\\Menu'), ('16', 'Edit menus', 'edit-menus', 'WebEd\\Base\\Menu'), ('17', 'Manage modules', 'view-modules', 'WebEd\\Base\\ModulesManagement'), ('18', 'Add module', 'add-modules', 'WebEd\\Base\\ModulesManagement'), ('19', 'Edit module', 'edit-modules', 'WebEd\\Base\\ModulesManagement'), ('20', 'Remove module', 'remove-modules', 'WebEd\\Base\\ModulesManagement'), ('21', 'View settings page', 'view-settings', 'WebEd\\Base\\Settings'), ('22', 'Edit settings', 'edit-settings', 'WebEd\\Base\\Settings'), ('23', 'View themes', 'view-themes', 'WebEd\\Base\\ThemesManagement'), ('24', 'Add theme', 'add-themes', 'WebEd\\Base\\ThemesManagement'), ('25', 'Edit theme', 'edit-themes', 'WebEd\\Base\\ThemesManagement'), ('26', 'Remove theme', 'remove-themes', 'WebEd\\Base\\ThemesManagement'), ('27', 'View users', 'view-users', 'WebEd\\Base\\Users'), ('28', 'Create user', 'create-users', 'WebEd\\Base\\Users'), ('29', 'Edit other user', 'edit-other-users', 'WebEd\\Base\\Users'), ('30', 'Delete user', 'delete-users', 'WebEd\\Base\\Users'), ('31', 'Assign roles', 'assign-roles', 'WebEd\\Base\\Users'), ('32', 'View pages', 'view-pages', 'WebEd\\Plugins\\Pages'), ('33', 'Create page', 'create-pages', 'WebEd\\Plugins\\Pages'), ('34', 'Edit page', 'edit-pages', 'WebEd\\Plugins\\Pages'), ('35', 'Delete pages', 'delete-pages', 'WebEd\\Plugins\\Pages'), ('36', 'View custom fields', 'view-custom-fields', 'WebEd\\Plugins\\CustomFields'), ('37', 'Create field group', 'create-field-groups', 'WebEd\\Plugins\\CustomFields'), ('38', 'Edit field group', 'edit-field-groups', 'WebEd\\Plugins\\CustomFields'), ('39', 'Delete field group', 'delete-field-groups', 'WebEd\\Plugins\\CustomFields'), ('40', 'View posts', 'view-posts', 'WebEd\\Plugins\\Blog'), ('41', 'Create posts', 'create-posts', 'WebEd\\Plugins\\Blog'), ('42', 'Update posts', 'update-posts', 'WebEd\\Plugins\\Blog'), ('43', 'Delete posts', 'delete-posts', 'WebEd\\Plugins\\Blog'), ('44', 'View categories', 'view-categories', 'WebEd\\Plugins\\Blog'), ('45', 'Create categories', 'create-categories', 'WebEd\\Plugins\\Blog'), ('46', 'Update categories', 'update-categories', 'WebEd\\Plugins\\Blog'), ('47', 'Delete categories', 'delete-categories', 'WebEd\\Plugins\\Blog');
COMMIT;

-- ----------------------------
--  Table structure for `posts`
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page_template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('activated','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activated',
  `order` int(11) NOT NULL DEFAULT '0',
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_created_by_foreign` (`created_by`),
  KEY `posts_updated_by_foreign` (`updated_by`),
  CONSTRAINT `posts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `posts_categories`
-- ----------------------------
DROP TABLE IF EXISTS `posts_categories`;
CREATE TABLE `posts_categories` (
  `post_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `posts_categories_post_id_category_id_unique` (`post_id`,`category_id`),
  KEY `posts_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `posts_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_categories_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `roles`
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES ('1', 'Super Admin', 'super-admin');
COMMIT;

-- ----------------------------
--  Table structure for `roles_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `roles_permissions`;
CREATE TABLE `roles_permissions` (
  `role_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `roles_permissions_role_id_permission_id_unique` (`role_id`,`permission_id`),
  KEY `roles_permissions_permission_id_foreign` (`permission_id`),
  CONSTRAINT `roles_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `roles_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `settings`
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `option_value` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_option_key_unique` (`option_key`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `settings`
-- ----------------------------
BEGIN;
INSERT INTO `settings` VALUES ('1', 'default_homepage', '1', '2016-11-20 06:20:43', '2016-11-20 06:20:43'), ('2', 'top_menu', 'top-menu', '2016-11-20 06:20:43', '2016-11-20 06:20:43'), ('3', 'header_background', '/uploads/hero.jpg', '2016-11-20 06:30:48', '2016-11-20 06:30:48'), ('4', 'site_title', '', '2016-11-20 06:30:48', '2016-11-20 06:30:48'), ('5', 'site_logo', '', '2016-11-20 06:30:48', '2016-11-20 06:30:48'), ('6', 'favicon', '', '2016-11-20 06:30:48', '2016-11-20 06:30:48'), ('7', 'address', '21 Nguyen Trung Ngan st, 1 dist, HCM city, Vietnam', '2016-11-20 07:32:00', '2016-11-20 07:32:00'), ('8', 'phone', '+84 915 42 82 02', '2016-11-20 07:32:00', '2016-11-20 07:32:00');
COMMIT;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activation_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` enum('male','female','other') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'male',
  `status` enum('activated','disabled','deleted') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activated',
  `birthday` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_activity_at` timestamp NULL DEFAULT NULL,
  `disabled_until` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_created_by_foreign` (`created_by`),
  KEY `users_updated_by_foreign` (`updated_by`),
  CONSTRAINT `users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', 'admin', 'admin@webed.com', '$2y$10$jMkgGbVeqAO4j34RIUN8iujTY..4ojvRQP22eDTXHWOQtxcUW8Ngu', 'Super Admin', 'Admin', '0', null, null, null, null, 'male', 'activated', null, null, '0tpzJAgwxkQ7aed8aSUJldsh2y4A58s0uAjwOMVj9zbAQ5AIBT9YzQyabDpG', null, null, '2016-11-20 12:00:01', null, null, null, '2016-11-20 05:58:05', '2016-11-20 12:00:01');
COMMIT;

-- ----------------------------
--  Table structure for `users_roles`
-- ----------------------------
DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `users_roles_user_id_role_id_unique` (`user_id`,`role_id`),
  KEY `users_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `users_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `users_roles`
-- ----------------------------
BEGIN;
INSERT INTO `users_roles` VALUES ('1', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
