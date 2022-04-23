-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th6 22, 2020 lúc 03:06 PM
-- Phiên bản máy phục vụ: 5.7.30-0ubuntu0.18.04.1
-- Phiên bản PHP: 7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `noithat`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_00_00_step1_create_tables_admin', 1),
(2, '2020_00_00_step2_create_tables_shop', 2),
(3, '2020_00_00_step3_insert_database_admin', 3),
(4, '2020_00_00_step4_insert_database_shop', 4),
(5, '2020_00_00_step5_insert_database_product', 5),
(6, '2020_06_17_160158_table_duan', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'S_Cart Personal Access Client', 'kSHLqujpzoBI2SSSJa3YgW4nbwRnZ9JZuH9vS5dk', 'http://localhost', 1, 0, 0, '2020-05-22 02:25:31', '2020-05-22 02:25:31'),
(2, NULL, 'S_Cart Password Grant Client', 'IU5gQ0nz1EKvDt6KW0aCJOxlXVaO3P9YJ6pt6yW9', 'http://localhost', 0, 1, 0, '2020-05-22 02:25:31', '2020-05-22 02:25:31'),
(3, NULL, 'Demo S-cart : Free Laravel eCommerce for Business Personal Access Client', 'FYbgoyIV9IIewenFuHgk1aeJHg1Wgp9Rd4GmMOOa', 'http://localhost', 1, 0, 0, '2020-06-19 02:08:22', '2020-06-19 02:08:22'),
(4, NULL, 'Demo S-cart : Free Laravel eCommerce for Business Password Grant Client', '053oBOOAWHLZcRZqLCSU2xOzoAzGLjiuZAfefMgg', 'http://localhost', 0, 1, 0, '2020-06-19 02:08:22', '2020-06-19 02:08:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-05-22 02:25:31', '2020-05-22 02:25:31'),
(2, 3, '2020-06-19 02:08:22', '2020-06-19 02:08:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_admin_config`
--

CREATE TABLE `sc_admin_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `detail` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_admin_config`
--

INSERT INTO `sc_admin_config` (`id`, `group`, `code`, `key`, `value`, `store_id`, `sort`, `detail`) VALUES
(1, '', 'config', 'shop_allow_guest', '1', '1', 11, 'lang::admin.shop_allow_guest'),
(2, '', 'config', 'product_preorder', '1', '1', 18, 'lang::admin.product_preorder'),
(3, '', 'config', 'product_display_out_of_stock', '1', '1', 19, 'lang::admin.product_display_out_of_stock'),
(4, '', 'config', 'product_buy_out_of_stock', '1', '1', 20, 'lang::admin.product_buy_out_of_stock'),
(5, '', 'config', 'show_date_available', '1', '1', 21, 'lang::admin.show_date_available'),
(6, '', 'display', 'product_hot', '6', '1', 0, 'lang::admin.hot_product'),
(7, '', 'display', 'product_new', '6', '1', 0, 'lang::admin.new_product'),
(8, '', 'display', 'product_list', '9', '1', 0, 'lang::admin.list_product'),
(9, '', 'display', 'product_relation', '4', '1', 0, 'lang::admin.relation_product'),
(10, '', 'display', 'product_viewed', '4', '1', 0, 'lang::admin.viewed_product'),
(11, '', 'display', 'item_list', '12', '1', 0, 'lang::admin.item_list'),
(12, '', 'display', 'news_list', '16', '1', 0, 'lang::admin.news_list'),
(13, '', 'email_action', 'email_action_mode', '1', '1', 0, 'lang::email.email_action.email_action_mode'),
(14, '', 'email_action', 'order_success_to_admin', '0', '1', 1, 'lang::email.email_action.order_success_to_admin'),
(15, '', 'email_action', 'order_success_to_customer', '0', '1', 2, 'lang::email.email_action.order_success_to_cutomer'),
(16, '', 'email_action', 'welcome_customer', '0', '1', 4, 'lang::email.email_action.welcome_customer'),
(17, '', 'email_action', 'contact_to_admin', '1', '1', 6, 'lang::email.email_action.contact_to_admin'),
(18, '', 'email_action', 'email_action_smtp_mode', '0', '1', 6, 'lang::email.email_action.email_action_smtp_mode'),
(19, 'Plugins', 'Payment', 'Cash', '1', '1', 0, 'Plugins/Payment/Cash::lang.title'),
(20, 'Plugins', 'Shipping', 'ShippingStandard', '1', '1', 0, 'lang::Shipping Standard'),
(21, '', 'smtp', 'smtp_host', '', '1', 8, 'lang::email.smtp_host'),
(22, '', 'smtp', 'smtp_user', '', '1', 7, 'lang::email.smtp_user'),
(23, '', 'smtp', 'smtp_password', '', '1', 6, 'lang::email.smtp_password'),
(24, '', 'smtp', 'smtp_security', '', '1', 5, 'lang::email.smtp_security'),
(25, '', 'smtp', 'smtp_port', '', '1', 4, 'lang::email.smtp_port'),
(26, '', 'cache', 'cache_status', '0', '1', 0, 'lang::cache.config_manager.cache_status'),
(27, '', 'cache', 'cache_time', '600', '1', 1, 'lang::cache.config_manager.cache_time'),
(28, '', 'cache', 'cache_category', '0', '1', 3, 'lang::cache.config_manager.cache_category'),
(29, '', 'cache', 'cache_product', '0', '1', 4, 'lang::cache.config_manager.cache_product'),
(30, '', 'cache', 'cache_news', '0', '1', 5, 'lang::cache.config_manager.cache_news'),
(31, '', 'cache', 'cache_category_cms', '0', '1', 6, 'lang::cache.config_manager.cache_category_cms'),
(32, '', 'cache', 'cache_content_cms', '0', '1', 7, 'lang::cache.config_manager.cache_content_cms'),
(33, '', 'cache', 'cache_page', '0', '1', 8, 'lang::cache.config_manager.cache_page'),
(34, '', 'upload', 'upload_image_size', '2048', '1', 0, ''),
(35, '', 'upload', 'upload_image_thumb_width', '250', '1', 0, ''),
(36, '', 'upload', 'upload_image_thumb_status', '1', '1', 0, ''),
(37, '', 'upload', 'upload_watermark_status', '1', '1', 0, ''),
(38, '', 'upload', 'upload_watermark_path', 'images/watermark.png', '1', 0, ''),
(39, '', 'env', 'SITE_STATUS', 'on', '1', 0, 'lang::env.SITE_STATUS'),
(40, '', 'env', 'SITE_TIMEZONE', 'Asia/Ho_Chi_Minh', '1', 0, 'lang::env.SITE_TIMEZONE'),
(41, '', 'env', 'SITE_LANGUAGE', 'en', '1', 0, 'lang::env.SITE_LANGUAGE'),
(42, '', 'env', 'SITE_CURRENCY', 'USD', '1', 0, 'lang::env.SITE_CURRENCY'),
(43, '', 'env', 'APP_DEBUG', 'on', '1', 0, 'lang::env.APP_DEBUG'),
(44, '', 'env', 'ADMIN_LOG', 'on', '1', 0, 'lang::env.ADMIN_LOG'),
(45, '', 'env', 'ADMIN_LOG_EXP', '', '1', 0, 'lang::env.ADMIN_LOG_EXP'),
(46, '', 'env', 'ADMIN_NAME', 'S-Cart System', '1', 0, 'lang::env.ADMIN_NAME'),
(47, '', 'env', 'ADMIN_TITLE', 'S-Cart System', '1', 0, 'lang::env.ADMIN_TITLE'),
(48, '', 'env', 'ADMIN_LOGO', 'S-Cart Admin', '1', 0, 'lang::env.ADMIN_LOGO'),
(49, '', 'env', 'ADMIN_LOGO_MINI', '<i class=\"fa fa-map-o\" aria-hidden=\"true\"></i>', '1', 0, 'lang::env.ADMIN_LOGO_MINI'),
(50, '', 'env', 'LOG_SLACK_WEBHOOK_URL', '', '1', 0, 'lang::env.LOG_SLACK_WEBHOOK_URL'),
(51, '', 'url', 'SUFFIX_URL', '.html', '1', 0, 'lang::url.SUFFIX_URL'),
(52, '', 'url', 'PREFIX_BRAND', 'brand', '1', 0, 'lang::url.PREFIX_BRAND'),
(53, '', 'url', 'PREFIX_SUPPLIER', 'supplier', '1', 0, 'lang::url.PREFIX_SUPPLIER'),
(54, '', 'url', 'PREFIX_CATEGORY', 'category', '1', 0, 'lang::url.PREFIX_CATEGORY'),
(55, '', 'url', 'PREFIX_PRODUCT', 'product', '1', 0, 'lang::url.PREFIX_PRODUCT'),
(56, '', 'url', 'PREFIX_SEARCH', 'search', '1', 0, 'lang::url.PREFIX_SEARCH'),
(57, '', 'url', 'PREFIX_CONTACT', 'contact', '1', 0, 'lang::url.PREFIX_CONTACT'),
(58, '', 'url', 'PREFIX_NEWS', 'news', '1', 0, 'lang::url.PREFIX_NEWS'),
(59, '', 'url', 'PREFIX_MEMBER', 'member', '1', 0, 'lang::url.PREFIX_MEMBER'),
(60, '', 'url', 'PREFIX_MEMBER_ORDER_LIST', 'order-list', '1', 0, 'lang::url.PREFIX_MEMBER_ORDER_LIST'),
(61, '', 'url', 'PREFIX_MEMBER_CHANGE_PWD', 'change-password', '1', 0, 'lang::url.PREFIX_MEMBER_CHANGE_PWD'),
(62, '', 'url', 'PREFIX_MEMBER_CHANGE_INFO', 'change-info', '1', 0, 'lang::url.PREFIX_MEMBER_CHANGE_INFO'),
(63, '', 'url', 'PREFIX_CMS_CATEGORY', 'cms-category', '1', 0, 'lang::url.PREFIX_CMS_CATEGORY'),
(64, '', 'url', 'PREFIX_CMS_ENTRY', 'entry', '1', 0, 'lang::url.PREFIX_CMS_ENTRY'),
(65, '', 'url', 'PREFIX_CART_WISHLIST', 'wishlst', '1', 0, 'lang::url.PREFIX_CART_WISHLIST'),
(66, '', 'url', 'PREFIX_CART_COMPARE', 'compare', '1', 0, 'lang::url.PREFIX_CART_COMPARE'),
(67, '', 'url', 'PREFIX_CART_DEFAULT', 'cart', '1', 0, 'lang::url.PREFIX_CART_DEFAULT'),
(68, '', 'url', 'PREFIX_CART_CHECKOUT', 'checkout', '1', 0, 'lang::url.PREFIX_CART_CHECKOUT'),
(69, '', 'url', 'PREFIX_ORDER_SUCCESS', 'order-success', '1', 0, 'lang::url.PREFIX_ORDER_SUCCESS'),
(70, '', 'product', 'product_brand', '1', '1', 0, 'lang::product.config_manager.brand'),
(71, '', 'product', 'product_supplier', '1', '1', 0, 'lang::product.config_manager.supplier'),
(72, '', 'product', 'product_price', '1', '1', 0, 'lang::product.config_manager.price'),
(73, '', 'product', 'product_cost', '1', '1', 0, 'lang::product.config_manager.cost'),
(74, '', 'product', 'product_promotion', '1', '1', 0, 'lang::product.config_manager.promotion'),
(75, '', 'product', 'product_stock', '1', '1', 0, 'lang::product.config_manager.stock'),
(76, '', 'product', 'product_kind', '1', '1', 0, 'lang::product.config_manager.kind'),
(77, '', 'product', 'product_virtual', '1', '1', 0, 'lang::product.config_manager.virtual'),
(78, '', 'product', 'product_attribute', '1', '1', 0, 'lang::product.config_manager.attribute'),
(79, '', 'product', 'product_available', '1', '1', 0, 'lang::product.config_manager.available'),
(80, '', 'product', 'product_weight', '1', '1', 0, 'lang::product.config_manager.weight'),
(81, '', 'product', 'product_length', '1', '1', 0, 'lang::product.config_manager.length'),
(82, '', 'env', 'product_tax', '1', '1', 0, 'lang::product.config_manager.tax'),
(83, '', 'customer', 'customer_lastname', '1', '1', 0, 'lang::customer.config_manager.lastname'),
(84, '', 'customer', 'customer_address1', '0', '1', 0, 'lang::customer.config_manager.address1'),
(85, '', 'customer', 'customer_address2', '0', '1', 0, 'lang::customer.config_manager.address2'),
(86, '', 'customer', 'customer_company', '0', '1', 0, 'lang::customer.config_manager.company'),
(87, '', 'customer', 'customer_postcode', '0', '1', 0, 'lang::customer.config_manager.postcode'),
(88, '', 'customer', 'customer_country', '0', '1', 0, 'lang::customer.config_manager.country'),
(89, '', 'customer', 'customer_group', '0', '1', 0, 'lang::customer.config_manager.group'),
(90, '', 'customer', 'customer_birthday', '0', '1', 0, 'lang::customer.config_manager.birthday'),
(91, '', 'customer', 'customer_sex', '0', '1', 0, 'lang::customer.config_manager.sex'),
(92, '', 'customer', 'customer_phone', '1', '1', 1, 'lang::customer.config_manager.phone'),
(93, '', 'api', 'api_connection_required', '0', '1', 1, 'lang::api_connection.api_connection_required'),
(94, 'Plugins', 'Cms', 'Content', '1', '1', 0, 'Plugins/Cms/Content::Content.title'),
(95, 'Plugins', 'Other', 'Duan', '1', '1', 0, 'Plugins/Other/Duan::lang.title'),
(96, 'Plugins', 'Total', 'Discount', '0', '1', 0, 'Plugins/Total/Discount::lang.title');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_admin_log`
--

CREATE TABLE `sc_admin_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_admin_log`
--

INSERT INTO `sc_admin_log` (`id`, `user_id`, `path`, `method`, `ip`, `user_agent`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:43:29', '2020-06-17 06:43:29'),
(2, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:43:41', '2020-06-17 06:43:41'),
(3, 1, 'sc_admin/setting', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:43:42', '2020-06-17 06:43:42'),
(4, 1, 'sc_admin/setting/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"APP_DEBUG\",\"value\":\"on\",\"pk\":null,\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\"}', '2020-06-17 06:43:47', '2020-06-17 06:43:47'),
(5, 1, 'sc_admin/locale/vi', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:43:48', '2020-06-17 06:43:48'),
(6, 1, 'sc_admin/setting', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:43:48', '2020-06-17 06:43:48'),
(7, 1, 'sc_admin/news', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:44:26', '2020-06-17 06:44:26'),
(8, 1, 'sc_admin/news', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:44:36', '2020-06-17 06:44:36'),
(9, 1, 'sc_admin/news', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:44:43', '2020-06-17 06:44:43'),
(10, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:48:21', '2020-06-17 06:48:21'),
(11, 1, 'sc_admin/news', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:48:28', '2020-06-17 06:48:28'),
(12, 1, 'sc_admin/plugin/cms', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:48:46', '2020-06-17 06:48:46'),
(13, 1, 'sc_admin/plugin/cms/online', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:48:51', '2020-06-17 06:48:51'),
(14, 1, 'sc_admin/plugin/install/online', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\",\"key\":\"Content\",\"path\":\"https:\\/\\/api.s-cart.org\\/process\\/file?key=1586095900\",\"code\":\"Cms\"}', '2020-06-17 06:48:57', '2020-06-17 06:48:57'),
(15, 1, 'sc_admin/plugin/cms/online', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:48:58', '2020-06-17 06:48:58'),
(16, 1, 'sc_admin/news', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:49:04', '2020-06-17 06:49:04'),
(17, 1, 'sc_admin/cms_category', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:49:12', '2020-06-17 06:49:12'),
(18, 1, 'sc_admin/cms_category/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:49:16', '2020-06-17 06:49:16'),
(19, 1, 'sc_admin/language', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:49:30', '2020-06-17 06:49:30'),
(20, 1, 'sc_admin/language/edit/2', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:49:31', '2020-06-17 06:49:31'),
(21, 1, 'sc_admin/language/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:49:35', '2020-06-17 06:49:35'),
(22, 1, 'sc_admin/language/edit/1', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"English\",\"code\":\"en\",\"icon\":\"\\/data\\/language\\/flag_uk.png\",\"sort\":\"1\",\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\"}', '2020-06-17 06:49:37', '2020-06-17 06:49:37'),
(23, 1, 'sc_admin/language', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:49:37', '2020-06-17 06:49:37'),
(24, 1, 'sc_admin/currency', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:49:39', '2020-06-17 06:49:39'),
(25, 1, 'sc_admin/currency/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:49:42', '2020-06-17 06:49:42'),
(26, 1, 'sc_admin/currency/edit/1', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"USD Dola\",\"code\":\"USD\",\"symbol\":\"$\",\"exchange_rate\":\"1\",\"precision\":\"0\",\"symbol_first\":\"1\",\"thousands\":\",\",\"sort\":\"0\",\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\"}', '2020-06-17 06:49:44', '2020-06-17 06:49:44'),
(27, 1, 'sc_admin/currency', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:49:44', '2020-06-17 06:49:44'),
(28, 1, 'sc_admin/currency/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:49:47', '2020-06-17 06:49:47'),
(29, 1, 'sc_admin/language/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:49:48', '2020-06-17 06:49:48'),
(30, 1, 'sc_admin/news', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:49:50', '2020-06-17 06:49:50'),
(31, 1, 'sc_admin/cms_category/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:49:53', '2020-06-17 06:49:53'),
(32, 1, 'sc_admin/news', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:50:41', '2020-06-17 06:50:41'),
(33, 1, 'sc_admin/news/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:50:44', '2020-06-17 06:50:44'),
(34, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"content\"}', '2020-06-17 06:50:58', '2020-06-17 06:50:58'),
(35, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"content\",\"_\":\"1592376659444\"}', '2020-06-17 06:50:59', '2020-06-17 06:50:59'),
(36, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"content\",\"_\":\"1592376659445\"}', '2020-06-17 06:50:59', '2020-06-17 06:50:59'),
(37, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"content\",\"sort_type\":\"alphabetic\",\"_\":\"1592376659446\"}', '2020-06-17 06:50:59', '2020-06-17 06:50:59'),
(38, 1, 'sc_admin/news/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"descriptions\":{\"vi\":{\"title\":\"Tr\\u00e0 Th\\u1ea3o M\\u1ed9c: 8 Lo\\u1ea1i T\\u1ed1t Cho S\\u1ee9c Kh\\u1ecfe M\\u00e0 B\\u1ea1n N\\u00ean D\\u00f9ng\",\"keyword\":\"Tr\\u00e0 Th\\u1ea3o M\\u1ed9c: 8 Lo\\u1ea1i T\\u1ed1t Cho S\\u1ee9c Kh\\u1ecfe M\\u00e0 B\\u1ea1n N\\u00ean D\\u00f9ng\",\"description\":\"gWAGSZ\",\"content\":\"AFGAWVA\"}},\"alias\":null,\"image\":\"http:\\/\\/127.0.0.1:8000\\/data\\/content\\/img-22.jpg\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\"}', '2020-06-17 06:51:09', '2020-06-17 06:51:09'),
(39, 1, 'sc_admin/news', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:51:09', '2020-06-17 06:51:09'),
(40, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:51:13', '2020-06-17 06:51:13'),
(41, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 06:59:32', '2020-06-17 06:59:32'),
(42, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\",\"key\":\"noithat\"}', '2020-06-17 07:00:42', '2020-06-17 07:00:42'),
(43, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:00:42', '2020-06-17 07:00:42'),
(44, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\",\"key\":\"default-new\"}', '2020-06-17 07:06:14', '2020-06-17 07:06:14'),
(45, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:06:15', '2020-06-17 07:06:15'),
(46, 1, 'sc_admin/template/remove', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\",\"key\":\"noithat\"}', '2020-06-17 07:06:23', '2020-06-17 07:06:23'),
(47, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:06:23', '2020-06-17 07:06:23'),
(48, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:06:39', '2020-06-17 07:06:39'),
(49, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:07:10', '2020-06-17 07:07:10'),
(50, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\",\"key\":\"noithat\"}', '2020-06-17 07:07:12', '2020-06-17 07:07:12'),
(51, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:07:12', '2020-06-17 07:07:12'),
(52, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\",\"key\":\"default-new\"}', '2020-06-17 07:07:18', '2020-06-17 07:07:18'),
(53, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:07:18', '2020-06-17 07:07:18'),
(54, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\",\"key\":\"noithat\"}', '2020-06-17 07:07:23', '2020-06-17 07:07:23'),
(55, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:07:24', '2020-06-17 07:07:24'),
(56, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:41:22', '2020-06-17 07:41:22'),
(57, 1, 'sc_admin/plugin/cms', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:41:26', '2020-06-17 07:41:26'),
(58, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:41:44', '2020-06-17 07:41:44'),
(59, 1, 'sc_admin/block_content/edit/6', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:42:12', '2020-06-17 07:42:12'),
(60, 1, 'sc_admin/block_content/edit/6', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"Categories\",\"position\":\"left\",\"page\":[\"product_list\",\"product_detail\",\"shop_cart\"],\"type\":\"view\",\"text\":\"categories\",\"sort\":\"4\",\"status\":\"on\",\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\"}', '2020-06-17 07:42:23', '2020-06-17 07:42:23'),
(61, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:42:23', '2020-06-17 07:42:23'),
(62, 1, 'sc_admin/block_content/edit/7', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:42:44', '2020-06-17 07:42:44'),
(63, 1, 'sc_admin/block_content/edit/7', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"Product last view\",\"position\":\"left\",\"type\":\"view\",\"text\":\"product_lastview\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\"}', '2020-06-17 07:42:49', '2020-06-17 07:42:49'),
(64, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:42:49', '2020-06-17 07:42:49'),
(65, 1, 'sc_admin/block_content/edit/5', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:42:50', '2020-06-17 07:42:50'),
(66, 1, 'sc_admin/block_content/edit/5', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"Banner home\",\"position\":\"banner_top\",\"type\":\"view\",\"text\":\"banner_image\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\"}', '2020-06-17 07:42:54', '2020-06-17 07:42:54'),
(67, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:42:54', '2020-06-17 07:42:54'),
(68, 1, 'sc_admin/block_content/edit/4', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:42:56', '2020-06-17 07:42:56'),
(69, 1, 'sc_admin/block_content/edit/4', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"Brands\",\"position\":\"left\",\"page\":[\"item_list\"],\"type\":\"view\",\"text\":\"brands_left\",\"sort\":\"3\",\"status\":\"on\",\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\"}', '2020-06-17 07:43:00', '2020-06-17 07:43:00'),
(70, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:43:00', '2020-06-17 07:43:00'),
(71, 1, 'sc_admin/block_content/edit/3', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:43:10', '2020-06-17 07:43:10'),
(72, 1, 'sc_admin/block_content/edit/3', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"Product special\",\"position\":\"left\",\"page\":[\"product_list\"],\"type\":\"view\",\"text\":\"product_special\",\"sort\":\"1\",\"status\":\"on\",\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\"}', '2020-06-17 07:43:13', '2020-06-17 07:43:13'),
(73, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 07:43:14', '2020-06-17 07:43:14'),
(74, 1, 'sc_admin/plugin/cms', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 09:11:02', '2020-06-17 09:11:02'),
(75, 1, 'sc_admin/plugin/other', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 09:11:05', '2020-06-17 09:11:05'),
(76, 1, 'sc_admin/plugin/install', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\",\"key\":\"Duan\",\"code\":\"Other\"}', '2020-06-17 09:11:08', '2020-06-17 09:11:08'),
(77, 1, 'sc_admin/plugin/other', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 09:11:08', '2020-06-17 09:11:08'),
(78, 1, 'sc_admin/plugin/disable', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\",\"key\":\"Duan\",\"code\":\"Other\"}', '2020-06-17 09:11:10', '2020-06-17 09:11:10'),
(79, 1, 'sc_admin/plugin/other', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_pjax\":\"#pjax-container\"}', '2020-06-17 09:11:10', '2020-06-17 09:11:10'),
(80, 1, 'sc_admin/plugin/enable', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\",\"key\":\"Duan\",\"code\":\"Other\"}', '2020-06-17 09:11:25', '2020-06-17 09:11:25'),
(81, 1, 'sc_admin/plugin/other', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_pjax\":\"#pjax-container\"}', '2020-06-17 09:11:25', '2020-06-17 09:11:25'),
(82, 1, 'sc_admin/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 09:12:04', '2020-06-17 09:12:04'),
(83, 1, 'sc_admin/cms_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 09:16:41', '2020-06-17 09:16:41'),
(84, 1, 'sc_admin/cms_category', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 09:16:43', '2020-06-17 09:16:43'),
(85, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 09:17:55', '2020-06-17 09:17:55'),
(86, 1, 'sc_admin/banner/edit/2', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 09:20:06', '2020-06-17 09:20:06'),
(87, 1, 'sc_admin/banner/edit/2', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"image\":\"\\/data\\/banner\\/Main-banner-3-1903x600.jpg\",\"url\":null,\"target\":\"_self\",\"html\":null,\"type\":\"0\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\"}', '2020-06-17 09:20:10', '2020-06-17 09:20:10'),
(88, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 09:20:10', '2020-06-17 09:20:10'),
(89, 1, 'sc_admin/banner/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 09:20:13', '2020-06-17 09:20:13'),
(90, 1, 'sc_admin/banner/edit/1', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"image\":\"\\/data\\/banner\\/Main-banner-1-1903x600.jpg\",\"url\":null,\"target\":\"_self\",\"html\":null,\"type\":\"0\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\"}', '2020-06-17 09:20:15', '2020-06-17 09:20:15'),
(91, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 09:20:15', '2020-06-17 09:20:15'),
(92, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 09:21:52', '2020-06-17 09:21:52'),
(93, 1, 'sc_admin/block_content/edit/5', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 09:21:58', '2020-06-17 09:21:58'),
(94, 1, 'sc_admin/block_content/edit/5', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"Banner home\",\"position\":\"banner_top\",\"page\":[\"shop_home\"],\"type\":\"view\",\"text\":\"banner_image\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\"}', '2020-06-17 09:22:06', '2020-06-17 09:22:06'),
(95, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 09:22:06', '2020-06-17 09:22:06'),
(96, 1, 'sc_admin/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 09:22:08', '2020-06-17 09:22:08'),
(97, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 09:23:37', '2020-06-17 09:23:37'),
(98, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"NcnJm2l8jkMsNrTxtngUXIHpBY0pMa9SrN9tRkDz\",\"key\":\"default-new\"}', '2020-06-17 09:23:39', '2020-06-17 09:23:39'),
(99, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 09:23:39', '2020-06-17 09:23:39'),
(100, 1, 'sc_admin/category', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 09:23:59', '2020-06-17 09:23:59'),
(101, 1, 'sc_admin/category', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 09:35:40', '2020-06-17 09:35:40'),
(102, 1, 'sc_admin/category/edit/13', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-17 09:37:31', '2020-06-17 09:37:31'),
(103, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 02:35:53', '2020-06-18 02:35:53'),
(104, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 02:35:59', '2020-06-18 02:35:59'),
(105, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\",\"key\":\"noithat\"}', '2020-06-18 02:36:00', '2020-06-18 02:36:00'),
(106, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 02:36:00', '2020-06-18 02:36:00'),
(107, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 02:36:02', '2020-06-18 02:36:02'),
(108, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 02:45:30', '2020-06-18 02:45:30'),
(109, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 03:54:09', '2020-06-18 03:54:09'),
(110, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 03:54:11', '2020-06-18 03:54:11'),
(111, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 03:55:49', '2020-06-18 03:55:49'),
(112, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 03:55:51', '2020-06-18 03:55:51'),
(113, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\",\"key\":\"default-new\"}', '2020-06-18 03:55:53', '2020-06-18 03:55:53'),
(114, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 03:55:53', '2020-06-18 03:55:53'),
(115, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 03:56:24', '2020-06-18 03:56:24'),
(116, 1, 'sc_admin/banner/edit/2', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 03:56:26', '2020-06-18 03:56:26'),
(117, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:03:27', '2020-06-18 04:03:27'),
(118, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\",\"key\":\"noithat\"}', '2020-06-18 04:03:28', '2020-06-18 04:03:28'),
(119, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:03:29', '2020-06-18 04:03:29'),
(120, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\",\"key\":\"default-new\"}', '2020-06-18 04:05:54', '2020-06-18 04:05:54'),
(121, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:05:54', '2020-06-18 04:05:54'),
(122, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\",\"key\":\"noithat\"}', '2020-06-18 04:06:13', '2020-06-18 04:06:13'),
(123, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:06:13', '2020-06-18 04:06:13'),
(124, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:10:16', '2020-06-18 04:10:16'),
(125, 1, 'sc_admin/banner/delete', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"ids\":\"1\",\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\"}', '2020-06-18 04:10:21', '2020-06-18 04:10:21'),
(126, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_pjax\":\"#pjax-container\"}', '2020-06-18 04:10:21', '2020-06-18 04:10:21'),
(127, 1, 'sc_admin/banner/edit/2', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:10:24', '2020-06-18 04:10:24'),
(128, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"banner\"}', '2020-06-18 04:10:27', '2020-06-18 04:10:27'),
(129, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"_\":\"1592453428563\"}', '2020-06-18 04:10:28', '2020-06-18 04:10:28'),
(130, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"_\":\"1592453428564\"}', '2020-06-18 04:10:28', '2020-06-18 04:10:28'),
(131, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"sort_type\":\"alphabetic\",\"_\":\"1592453428565\"}', '2020-06-18 04:10:28', '2020-06-18 04:10:28'),
(132, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"banner\"}', '2020-06-18 04:10:34', '2020-06-18 04:10:34'),
(133, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"_\":\"1592453434910\"}', '2020-06-18 04:10:35', '2020-06-18 04:10:35'),
(134, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"_\":\"1592453434911\"}', '2020-06-18 04:10:35', '2020-06-18 04:10:35'),
(135, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"sort_type\":\"alphabetic\",\"_\":\"1592453434912\"}', '2020-06-18 04:10:35', '2020-06-18 04:10:35'),
(136, 1, 'sc_admin/uploads/upload', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":\"\\/\",\"type\":\"banner\",\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\"}', '2020-06-18 04:11:01', '2020-06-18 04:11:01'),
(137, 1, 'sc_admin/uploads/upload', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":\"\\/\",\"type\":\"banner\",\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\"}', '2020-06-18 04:11:02', '2020-06-18 04:11:02'),
(138, 1, 'sc_admin/uploads/upload', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":\"\\/\",\"type\":\"banner\",\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\"}', '2020-06-18 04:11:02', '2020-06-18 04:11:02'),
(139, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"banner\"}', '2020-06-18 04:11:41', '2020-06-18 04:11:41'),
(140, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"_\":\"1592453501654\"}', '2020-06-18 04:11:41', '2020-06-18 04:11:41'),
(141, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"_\":\"1592453501655\"}', '2020-06-18 04:11:41', '2020-06-18 04:11:41'),
(142, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"sort_type\":\"alphabetic\",\"_\":\"1592453501656\"}', '2020-06-18 04:11:41', '2020-06-18 04:11:41'),
(143, 1, 'sc_admin/banner/edit/2', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"image\":\"http:\\/\\/127.0.0.1:8000\\/data\\/banner\\/slider-01.jpg\",\"url\":null,\"target\":\"_self\",\"html\":null,\"type\":\"0\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\"}', '2020-06-18 04:11:45', '2020-06-18 04:11:45'),
(144, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:11:45', '2020-06-18 04:11:45'),
(145, 1, 'sc_admin/banner/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:11:59', '2020-06-18 04:11:59'),
(146, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"banner\"}', '2020-06-18 04:12:01', '2020-06-18 04:12:01'),
(147, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"_\":\"1592453521283\"}', '2020-06-18 04:12:01', '2020-06-18 04:12:01'),
(148, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"_\":\"1592453521284\"}', '2020-06-18 04:12:01', '2020-06-18 04:12:01'),
(149, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"sort_type\":\"alphabetic\",\"_\":\"1592453521285\"}', '2020-06-18 04:12:01', '2020-06-18 04:12:01'),
(150, 1, 'sc_admin/banner/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"image\":\"http:\\/\\/127.0.0.1:8000\\/data\\/banner\\/slider-02.jpg\",\"url\":null,\"target\":null,\"html\":null,\"type\":\"0\",\"sort\":\"0\",\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\"}', '2020-06-18 04:12:04', '2020-06-18 04:12:04'),
(151, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:12:04', '2020-06-18 04:12:04'),
(152, 1, 'sc_admin/banner/edit/3', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:12:13', '2020-06-18 04:12:13'),
(153, 1, 'sc_admin/banner/edit/3', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"image\":\"http:\\/\\/127.0.0.1:8000\\/data\\/banner\\/slider-02.jpg\",\"url\":null,\"target\":null,\"html\":null,\"type\":\"0\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\"}', '2020-06-18 04:12:17', '2020-06-18 04:12:17'),
(154, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:12:17', '2020-06-18 04:12:17'),
(155, 1, 'sc_admin/banner/edit/3', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:13:41', '2020-06-18 04:13:41'),
(156, 1, 'sc_admin/banner/edit/3', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"image\":\"http:\\/\\/127.0.0.1:8000\\/data\\/banner\\/slider-02.jpg\",\"url\":null,\"target\":null,\"html\":\"B\\u1ed9 s\\u01b0u t\\u1eadp n\\u1ed9i th\\u1ea5t c\\u0103n h\\u1ed9\",\"type\":\"0\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\"}', '2020-06-18 04:13:44', '2020-06-18 04:13:44'),
(157, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:13:44', '2020-06-18 04:13:44'),
(158, 1, 'sc_admin/banner/edit/2', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:13:48', '2020-06-18 04:13:48'),
(159, 1, 'sc_admin/banner/edit/2', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"image\":\"http:\\/\\/127.0.0.1:8000\\/data\\/banner\\/slider-01.jpg\",\"url\":null,\"target\":\"_self\",\"html\":\"B\\u1ed9 s\\u01b0u t\\u1eadp n\\u1ed9i th\\u1ea5t c\\u0103n h\\u1ed9\",\"type\":\"0\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\"}', '2020-06-18 04:13:50', '2020-06-18 04:13:50'),
(160, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:13:50', '2020-06-18 04:13:50'),
(161, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:23:59', '2020-06-18 04:23:59'),
(162, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\",\"key\":\"default-new\"}', '2020-06-18 04:24:01', '2020-06-18 04:24:01'),
(163, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:24:01', '2020-06-18 04:24:01'),
(164, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\",\"key\":\"noithat\"}', '2020-06-18 04:25:52', '2020-06-18 04:25:52'),
(165, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:25:52', '2020-06-18 04:25:52'),
(166, 1, 'sc_admin/link', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:31:40', '2020-06-18 04:31:40'),
(167, 1, 'sc_admin/link/edit/2', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:31:42', '2020-06-18 04:31:42'),
(168, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:33:07', '2020-06-18 04:33:07'),
(169, 1, 'sc_admin/link/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:34:37', '2020-06-18 04:34:37'),
(170, 1, 'sc_admin/plugin/other', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 04:47:02', '2020-06-18 04:47:02'),
(171, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 06:18:11', '2020-06-18 06:18:11'),
(172, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\",\"key\":\"default-new\"}', '2020-06-18 06:18:15', '2020-06-18 06:18:15'),
(173, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 06:18:15', '2020-06-18 06:18:15'),
(174, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\",\"key\":\"noithat\"}', '2020-06-18 06:19:51', '2020-06-18 06:19:51'),
(175, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 06:19:51', '2020-06-18 06:19:51'),
(176, 1, 'sc_admin/product_config', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 06:27:53', '2020-06-18 06:27:53'),
(177, 1, 'sc_admin/length_unit', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 06:28:02', '2020-06-18 06:28:02'),
(178, 1, 'sc_admin/attribute_group', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 06:28:05', '2020-06-18 06:28:05'),
(179, 1, 'sc_admin/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 06:28:09', '2020-06-18 06:28:09'),
(180, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 06:53:42', '2020-06-18 06:53:42'),
(181, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:02:54', '2020-06-18 07:02:54'),
(182, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:03:11', '2020-06-18 07:03:11'),
(183, 1, 'sc_admin/block_content/edit/6', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:03:18', '2020-06-18 07:03:18'),
(184, 1, 'sc_admin/block_content/edit/6', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"Categories\",\"position\":\"left\",\"page\":[\"product_list\",\"shop_cart\"],\"type\":\"view\",\"text\":\"categories\",\"sort\":\"4\",\"status\":\"on\",\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\"}', '2020-06-18 07:03:26', '2020-06-18 07:03:26'),
(185, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:03:26', '2020-06-18 07:03:26'),
(186, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:09:33', '2020-06-18 07:09:33'),
(187, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\",\"key\":\"default-new\"}', '2020-06-18 07:09:37', '2020-06-18 07:09:37'),
(188, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:09:37', '2020-06-18 07:09:37'),
(189, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\",\"key\":\"noithat\"}', '2020-06-18 07:10:02', '2020-06-18 07:10:02'),
(190, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:10:02', '2020-06-18 07:10:02'),
(191, 1, 'sc_admin/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:23:33', '2020-06-18 07:23:33'),
(192, 1, 'sc_admin/product/edit/13', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:23:38', '2020-06-18 07:23:38'),
(193, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"product\"}', '2020-06-18 07:23:44', '2020-06-18 07:23:44'),
(194, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"product\",\"_\":\"1592465024522\"}', '2020-06-18 07:23:44', '2020-06-18 07:23:44'),
(195, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"product\",\"_\":\"1592465024523\"}', '2020-06-18 07:23:44', '2020-06-18 07:23:44'),
(196, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"product\",\"sort_type\":\"alphabetic\",\"_\":\"1592465024524\"}', '2020-06-18 07:23:44', '2020-06-18 07:23:44');
INSERT INTO `sc_admin_log` (`id`, `user_id`, `path`, `method`, `ip`, `user_agent`, `input`, `created_at`, `updated_at`) VALUES
(197, 1, 'sc_admin/product/edit/13', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"descriptions\":{\"vi\":{\"name\":\"Easy Polo Black Edition 13\",\"keyword\":null,\"description\":null,\"content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\\\"\\\" src=\\\"\\/data\\/product\\/img-21.jpg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\"}},\"category\":[\"5\"],\"image\":\"\\/data\\/product\\/img-34.jpg\",\"sub_image\":[\"http:\\/\\/127.0.0.1:8000\\/data\\/product\\/img-1.jpg\"],\"sku\":\"3D-GOLD1.75\",\"alias\":\"demo-alias-name-product-13\",\"brand_id\":\"3\",\"supplier_id\":[\"1\"],\"cost\":\"5000\",\"price\":\"10000\",\"tax_id\":\"auto\",\"price_promotion\":\"4000\",\"price_promotion_start\":null,\"price_promotion_end\":null,\"stock\":\"0\",\"weight_class\":null,\"weight\":\"0\",\"length_class\":null,\"length\":\"0\",\"height\":\"0\",\"width\":\"0\",\"virtual\":\"0\",\"date_available\":null,\"minimum\":\"0\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\"}', '2020-06-18 07:24:02', '2020-06-18 07:24:02'),
(198, 1, 'sc_admin/product/edit/13', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:24:02', '2020-06-18 07:24:02'),
(199, 1, 'sc_admin/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:37:20', '2020-06-18 07:37:20'),
(200, 1, 'sc_admin/product/edit/13', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:37:27', '2020-06-18 07:37:27'),
(201, 1, 'sc_admin/product/edit/13', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"descriptions\":{\"vi\":{\"name\":\"Easy Polo Black Edition 13\",\"keyword\":null,\"description\":\"22\\u201d class screen full LED TV\\r\\nHight precision lens provides a clearer picture and a better view.\\r\\nWith stand: 50.23\\u201dW x 30.1\\u201dH x 15.5\\u201dD\\r\\nDispay type: Resolution: 1170 x 768\\r\\nMotion Rate: 130\",\"content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\\\"\\\" src=\\\"\\/data\\/product\\/img-21.jpg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\"}},\"category\":[\"5\"],\"image\":\"\\/data\\/product\\/img-34.jpg\",\"sku\":\"3D-GOLD1.75\",\"alias\":\"demo-alias-name-product-13\",\"brand_id\":\"3\",\"supplier_id\":[\"1\"],\"cost\":\"5000\",\"price\":\"10000\",\"tax_id\":\"auto\",\"price_promotion\":\"4000\",\"price_promotion_start\":null,\"price_promotion_end\":null,\"stock\":\"0\",\"weight_class\":null,\"weight\":\"0\",\"length_class\":null,\"length\":\"0\",\"height\":\"0\",\"width\":\"0\",\"virtual\":\"0\",\"date_available\":null,\"minimum\":\"0\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\"}', '2020-06-18 07:37:58', '2020-06-18 07:37:58'),
(202, 1, 'sc_admin/product/edit/13', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:37:58', '2020-06-18 07:37:58'),
(203, 1, 'sc_admin/customer', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:39:27', '2020-06-18 07:39:27'),
(204, 1, 'sc_admin/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:39:29', '2020-06-18 07:39:29'),
(205, 1, 'sc_admin/product/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:39:34', '2020-06-18 07:39:34'),
(206, 1, 'sc_admin/product/edit/1', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"descriptions\":{\"vi\":{\"name\":\"Easy Polo Black Edition 1\",\"keyword\":null,\"description\":\"22\\u201d class screen full LED TV\\r\\nHight precision lens provides a clearer picture and a better view.\\r\\nWith stand: 50.23\\u201dW x 30.1\\u201dH x 15.5\\u201dD\\r\\nDispay type: Resolution: 1170 x 768\\r\\nMotion Rate: 130\",\"content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\\\"\\\" src=\\\"\\/data\\/product\\/img-21.jpg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.22&rdquo; class screen full LED TV<br \\/>\\r\\nHight precision lens provides a clearer picture and a better view.<br \\/>\\r\\nWith stand: 50.23&rdquo;W x 30.1&rdquo;H x 15.5&rdquo;D<br \\/>\\r\\nDispay type: Resolution: 1170 x 768<br \\/>\\r\\nMotion Rate: 130<\\/p>\"}},\"category\":[\"6\",\"10\",\"13\"],\"image\":\"\\/data\\/product\\/img-1.jpg\",\"sub_image\":[\"\\/data\\/product\\/img-32.jpg\",\"\\/data\\/product\\/img-33.jpg\"],\"sku\":\"ABCZZ\",\"alias\":\"demo-alias-name-product-1\",\"brand_id\":\"1\",\"supplier_id\":[\"1\"],\"cost\":\"10000\",\"price\":\"15000\",\"tax_id\":\"auto\",\"price_promotion\":\"5000\",\"price_promotion_start\":null,\"price_promotion_end\":null,\"stock\":\"99\",\"weight_class\":null,\"weight\":\"0\",\"length_class\":null,\"length\":\"0\",\"height\":\"0\",\"width\":\"0\",\"virtual\":\"0\",\"date_available\":\"2020-06-22\",\"minimum\":\"0\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\"}', '2020-06-18 07:40:09', '2020-06-18 07:40:09'),
(207, 1, 'sc_admin/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:40:10', '2020-06-18 07:40:10'),
(208, 1, 'sc_admin/product/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:40:47', '2020-06-18 07:40:47'),
(209, 1, 'sc_admin/product/edit/1', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"descriptions\":{\"vi\":{\"name\":\"Easy Polo Black Edition 1\",\"keyword\":null,\"description\":\"<p>22\\u201d class screen full LED TV<\\/p>\\r\\nHight precision lens provides a clearer picture and a better view.\\r\\nWith stand: 50.23\\u201dW x 30.1\\u201dH x 15.5\\u201dD\\r\\nDispay type: Resolution: 1170 x 768\\r\\nMotion Rate: 130\",\"content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\\\"\\\" src=\\\"\\/data\\/product\\/img-21.jpg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.22&rdquo; class screen full LED TV<br \\/>\\r\\nHight precision lens provides a clearer picture and a better view.<br \\/>\\r\\nWith stand: 50.23&rdquo;W x 30.1&rdquo;H x 15.5&rdquo;D<br \\/>\\r\\nDispay type: Resolution: 1170 x 768<br \\/>\\r\\nMotion Rate: 130<\\/p>\"}},\"category\":[\"6\",\"10\",\"13\"],\"image\":\"\\/data\\/product\\/img-1.jpg\",\"sub_image\":[\"\\/data\\/product\\/img-32.jpg\",\"\\/data\\/product\\/img-33.jpg\"],\"sku\":\"ABCZZ\",\"alias\":\"demo-alias-name-product-1\",\"brand_id\":\"1\",\"supplier_id\":[\"1\"],\"cost\":\"10000\",\"price\":\"15000\",\"tax_id\":\"auto\",\"price_promotion\":\"5000\",\"price_promotion_start\":null,\"price_promotion_end\":null,\"stock\":\"99\",\"weight_class\":null,\"weight\":\"0\",\"length_class\":null,\"length\":\"0\",\"height\":\"0\",\"width\":\"0\",\"virtual\":\"0\",\"date_available\":\"2020-06-22\",\"minimum\":\"0\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\"}', '2020-06-18 07:42:05', '2020-06-18 07:42:05'),
(210, 1, 'sc_admin/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:42:05', '2020-06-18 07:42:05'),
(211, 1, 'sc_admin/product/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:42:24', '2020-06-18 07:42:24'),
(212, 1, 'sc_admin/product/edit/1', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"descriptions\":{\"vi\":{\"name\":\"Easy Polo Black Edition 1\",\"keyword\":null,\"description\":\"22\\u201d class screen full LED TV\\r\\nHight precision lens provides a clearer picture and a better view.\\r\\nWith stand: 50.23\\u201dW x 30.1\\u201dH x 15.5\\u201dD\\r\\nDispay type: Resolution: 1170 x 768\\r\\nMotion Rate: 130\",\"content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\\\"\\\" src=\\\"\\/data\\/product\\/img-21.jpg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.22&rdquo; class screen full LED TV<br \\/>\\r\\nHight precision lens provides a clearer picture and a better view.<br \\/>\\r\\nWith stand: 50.23&rdquo;W x 30.1&rdquo;H x 15.5&rdquo;D<br \\/>\\r\\nDispay type: Resolution: 1170 x 768<br \\/>\\r\\nMotion Rate: 130<\\/p>\"}},\"category\":[\"6\",\"10\",\"13\"],\"image\":\"\\/data\\/product\\/img-1.jpg\",\"sub_image\":[\"\\/data\\/product\\/img-32.jpg\",\"\\/data\\/product\\/img-33.jpg\"],\"sku\":\"ABCZZ\",\"alias\":\"demo-alias-name-product-1\",\"brand_id\":\"1\",\"supplier_id\":[\"1\"],\"cost\":\"10000\",\"price\":\"15000\",\"tax_id\":\"auto\",\"price_promotion\":\"5000\",\"price_promotion_start\":null,\"price_promotion_end\":null,\"stock\":\"99\",\"weight_class\":null,\"weight\":\"0\",\"length_class\":null,\"length\":\"0\",\"height\":\"0\",\"width\":\"0\",\"virtual\":\"0\",\"date_available\":\"2020-06-22\",\"minimum\":\"0\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\"}', '2020-06-18 07:42:40', '2020-06-18 07:42:40'),
(213, 1, 'sc_admin/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:42:40', '2020-06-18 07:42:40'),
(214, 1, 'sc_admin/product/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:51:57', '2020-06-18 07:51:57'),
(215, 1, 'sc_admin/product/edit/1', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"descriptions\":{\"vi\":{\"name\":\"Easy Polo Black Edition 1\",\"keyword\":null,\"description\":\"22\\u201d class screen full LED TV\\r\\nHight precision lens provides a clearer picture and a better view.\\r\\nWith stand: 50.23\\u201dW x 30.1\\u201dH x 15.5\\u201dD\\r\\nDispay type: Resolution: 1170 x 768\\r\\nMotion Rate: 130\",\"content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\\\"\\\" src=\\\"\\/data\\/product\\/img-21.jpg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.22&rdquo; class screen full LED TV<br \\/>\\r\\nHight precision lens provides a clearer picture and a better view.<br \\/>\\r\\nWith stand: 50.23&rdquo;W x 30.1&rdquo;H x 15.5&rdquo;D<br \\/>\\r\\nDispay type: Resolution: 1170 x 768<br \\/>\\r\\nMotion Rate: 130<\\/p>\"}},\"category\":[\"6\",\"10\",\"13\"],\"image\":\"\\/data\\/product\\/img-1.jpg\",\"sub_image\":[\"\\/data\\/product\\/img-32.jpg\",\"\\/data\\/product\\/img-33.jpg\"],\"sku\":\"ABCZZ\",\"alias\":\"demo-alias-name-product-1\",\"brand_id\":\"1\",\"supplier_id\":[\"1\"],\"cost\":\"10000\",\"price\":\"15000\",\"tax_id\":\"auto\",\"price_promotion\":\"5000\",\"price_promotion_start\":null,\"price_promotion_end\":null,\"stock\":\"99\",\"weight_class\":null,\"weight\":\"0\",\"length_class\":null,\"length\":\"0\",\"height\":\"0\",\"width\":\"0\",\"virtual\":\"0\",\"date_available\":\"2020-06-22\",\"minimum\":\"0\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\"}', '2020-06-18 07:52:15', '2020-06-18 07:52:15'),
(216, 1, 'sc_admin/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:52:15', '2020-06-18 07:52:15'),
(217, 1, 'sc_admin/product/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 07:54:51', '2020-06-18 07:54:51'),
(218, 1, 'sc_admin/setting', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 08:26:19', '2020-06-18 08:26:19'),
(219, 1, 'sc_admin/setting/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"product_list\",\"value\":\"9\",\"pk\":\"product_list\",\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\"}', '2020-06-18 08:26:36', '2020-06-18 08:26:36'),
(220, 1, 'sc_admin/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 08:42:50', '2020-06-18 08:42:50'),
(221, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 08:42:57', '2020-06-18 08:42:57'),
(222, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 08:43:05', '2020-06-18 08:43:05'),
(223, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\",\"key\":\"default-new\"}', '2020-06-18 08:43:06', '2020-06-18 08:43:06'),
(224, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 08:43:07', '2020-06-18 08:43:07'),
(225, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\",\"key\":\"noithat\"}', '2020-06-18 08:45:18', '2020-06-18 08:45:18'),
(226, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 08:45:18', '2020-06-18 08:45:18'),
(227, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 09:14:55', '2020-06-18 09:14:55'),
(228, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\",\"key\":\"default-new\"}', '2020-06-18 09:14:58', '2020-06-18 09:14:58'),
(229, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 09:14:58', '2020-06-18 09:14:58'),
(230, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\",\"key\":\"noithat\"}', '2020-06-18 09:20:26', '2020-06-18 09:20:26'),
(231, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 09:20:27', '2020-06-18 09:20:27'),
(232, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 09:21:30', '2020-06-18 09:21:30'),
(233, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 09:35:45', '2020-06-18 09:35:45'),
(234, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 09:35:51', '2020-06-18 09:35:51'),
(235, 1, 'sc_admin/page', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 09:36:15', '2020-06-18 09:36:15'),
(236, 1, 'sc_admin/news', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 09:36:20', '2020-06-18 09:36:20'),
(237, 1, 'sc_admin/maintain', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 09:37:56', '2020-06-18 09:37:56'),
(238, 1, 'sc_admin/plugin/other', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 09:38:18', '2020-06-18 09:38:18'),
(239, 1, 'sc_admin/page', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 09:38:20', '2020-06-18 09:38:20'),
(240, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 09:38:38', '2020-06-18 09:38:38'),
(241, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-18 09:38:41', '2020-06-18 09:38:41'),
(242, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592473121780\"}', '2020-06-18 09:38:41', '2020-06-18 09:38:41'),
(243, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592473121781\"}', '2020-06-18 09:38:41', '2020-06-18 09:38:41'),
(244, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592473121782\"}', '2020-06-18 09:38:42', '2020-06-18 09:38:42'),
(245, 1, 'sc_admin/uploads/upload', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":\"\\/\",\"type\":\"logo\",\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\"}', '2020-06-18 09:39:25', '2020-06-18 09:39:25'),
(246, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-18 09:39:34', '2020-06-18 09:39:34'),
(247, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592473174472\"}', '2020-06-18 09:39:34', '2020-06-18 09:39:34'),
(248, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592473174473\"}', '2020-06-18 09:39:34', '2020-06-18 09:39:34'),
(249, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592473174474\"}', '2020-06-18 09:39:34', '2020-06-18 09:39:34'),
(250, 1, 'sc_admin/store_info/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"logo\",\"value\":\"http:\\/\\/127.0.0.1:8000\\/data\\/logo\\/LOGO-01.png\",\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\"}', '2020-06-18 09:39:36', '2020-06-18 09:39:36'),
(251, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 09:39:41', '2020-06-18 09:39:41'),
(252, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 10:13:22', '2020-06-18 10:13:22'),
(253, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 10:16:10', '2020-06-18 10:16:10'),
(254, 1, 'sc_admin/menu', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 10:16:25', '2020-06-18 10:16:25'),
(255, 1, 'sc_admin/menu/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"parent_id\":\"7\",\"title\":\"D\\u1ef1 \\u00e1n\",\"icon\":\"fa-bars\",\"uri\":null,\"sort\":\"0\",\"_token\":\"JnrOZqZxkRloHdLWan0AdORGjV3zovDxWWT9MpW4\"}', '2020-06-18 10:17:05', '2020-06-18 10:17:05'),
(256, 1, 'sc_admin/menu', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 10:17:05', '2020-06-18 10:17:05'),
(257, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-18 10:17:30', '2020-06-18 10:17:30'),
(258, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"sort_order\":\"id__desc\",\"_pjax\":\"#pjax-container\"}', '2020-06-18 10:17:35', '2020-06-18 10:17:35'),
(259, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:31:51', '2020-06-19 01:31:51'),
(260, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:40:05', '2020-06-19 01:40:05'),
(261, 1, 'sc_admin/menu', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:45:21', '2020-06-19 01:45:21'),
(262, 1, 'sc_admin/menu/edit/67', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:45:37', '2020-06-19 01:45:37'),
(263, 1, 'sc_admin/menu/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:46:04', '2020-06-19 01:46:04'),
(264, 1, 'sc_admin/menu/edit/12', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:46:16', '2020-06-19 01:46:16'),
(265, 1, 'sc_admin/menu/edit/67', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"parent_id\":\"7\",\"title\":\"D\\u1ef1 \\u00e1n\",\"icon\":\"fa-codepen\",\"uri\":\"admin::duan\",\"sort\":\"0\",\"_token\":\"w8Lm7EusCHH11yz9guMhyzEhZw1BDEgNw6qyZXjc\"}', '2020-06-19 01:46:27', '2020-06-19 01:46:27'),
(266, 1, 'sc_admin/menu', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:46:27', '2020-06-19 01:46:27'),
(267, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:46:29', '2020-06-19 01:46:29'),
(268, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:46:34', '2020-06-19 01:46:34'),
(269, 1, 'sc_admin/menu/edit/67', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:46:43', '2020-06-19 01:46:43'),
(270, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:46:48', '2020-06-19 01:46:48'),
(271, 1, 'sc_admin/menu/edit/63', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:47:00', '2020-06-19 01:47:00'),
(272, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:47:50', '2020-06-19 01:47:50'),
(273, 1, 'sc_admin/menu/edit/67', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:48:14', '2020-06-19 01:48:14'),
(274, 1, 'sc_admin/menu/edit/33', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:48:19', '2020-06-19 01:48:19'),
(275, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:50:57', '2020-06-19 01:50:57'),
(276, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:51:32', '2020-06-19 01:51:32'),
(277, 1, 'sc_admin/duan/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:51:36', '2020-06-19 01:51:36'),
(278, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:51:41', '2020-06-19 01:51:41'),
(279, 1, 'sc_admin/menu/delete', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"id\":\"67\",\"_token\":\"w8Lm7EusCHH11yz9guMhyzEhZw1BDEgNw6qyZXjc\"}', '2020-06-19 01:58:11', '2020-06-19 01:58:11'),
(280, 1, 'sc_admin/menu/edit/33', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:58:11', '2020-06-19 01:58:11'),
(281, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:58:15', '2020-06-19 01:58:15'),
(282, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:58:22', '2020-06-19 01:58:22'),
(283, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:58:28', '2020-06-19 01:58:28'),
(284, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:58:29', '2020-06-19 01:58:29'),
(285, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:58:29', '2020-06-19 01:58:29'),
(286, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:58:57', '2020-06-19 01:58:57'),
(287, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:58:57', '2020-06-19 01:58:57'),
(288, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:58:58', '2020-06-19 01:58:58'),
(289, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:58:58', '2020-06-19 01:58:58'),
(290, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 01:59:07', '2020-06-19 01:59:07'),
(291, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:05:12', '2020-06-19 02:05:12'),
(292, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:05:14', '2020-06-19 02:05:14'),
(293, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:05:15', '2020-06-19 02:05:15'),
(294, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:05:16', '2020-06-19 02:05:16'),
(295, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:05:16', '2020-06-19 02:05:16'),
(296, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:05:16', '2020-06-19 02:05:16'),
(297, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:09:07', '2020-06-19 02:09:07'),
(298, 1, 'sc_admin/menu', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:09:27', '2020-06-19 02:09:27'),
(299, 1, 'sc_admin/menu/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"parent_id\":\"7\",\"title\":\"D\\u1ef1 \\u00e1n\",\"icon\":\"fa-institution\",\"uri\":\"admin::duan\",\"sort\":\"0\",\"_token\":\"w8Lm7EusCHH11yz9guMhyzEhZw1BDEgNw6qyZXjc\"}', '2020-06-19 02:09:49', '2020-06-19 02:09:49'),
(300, 1, 'sc_admin/menu', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:09:49', '2020-06-19 02:09:49'),
(301, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:09:51', '2020-06-19 02:09:51'),
(302, 1, 'sc_admin/duan/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:09:55', '2020-06-19 02:09:55'),
(303, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:12:54', '2020-06-19 02:12:54'),
(304, 1, 'sc_admin/duan/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:12:56', '2020-06-19 02:12:56'),
(305, 1, 'sc_admin/duan/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:13:33', '2020-06-19 02:13:33'),
(306, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:14:52', '2020-06-19 02:14:52'),
(307, 1, 'sc_admin/banner/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:14:54', '2020-06-19 02:14:54'),
(308, 1, 'sc_admin/banner/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:17:10', '2020-06-19 02:17:10'),
(309, 1, 'sc_admin/duan/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:17:14', '2020-06-19 02:17:14'),
(310, 1, 'sc_admin/duan/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:17:28', '2020-06-19 02:17:28'),
(311, 1, 'sc_admin/duan/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:19:20', '2020-06-19 02:19:20'),
(312, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"banner\"}', '2020-06-19 02:19:22', '2020-06-19 02:19:22'),
(313, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"_\":\"1592533163746\"}', '2020-06-19 02:19:23', '2020-06-19 02:19:23'),
(314, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"_\":\"1592533163747\"}', '2020-06-19 02:19:23', '2020-06-19 02:19:23'),
(315, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"sort_type\":\"alphabetic\",\"_\":\"1592533163748\"}', '2020-06-19 02:19:23', '2020-06-19 02:19:23'),
(316, 1, 'sc_admin/duan/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"image\":\"http:\\/\\/127.0.0.1:8000\\/data\\/banner\\/slider-01.jpg\",\"html\":\"KASBDkjasdjkbsadf\",\"status\":\"on\",\"_token\":\"w8Lm7EusCHH11yz9guMhyzEhZw1BDEgNw6qyZXjc\"}', '2020-06-19 02:19:32', '2020-06-19 02:19:32'),
(317, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:19:32', '2020-06-19 02:19:32'),
(318, 1, 'sc_admin/duan/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:19:48', '2020-06-19 02:19:48'),
(319, 1, 'sc_admin/duan/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:20:01', '2020-06-19 02:20:01'),
(320, 1, 'sc_admin/duan/edit/1', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"image\":\"http:\\/\\/127.0.0.1:8000\\/data\\/banner\\/slider-01.jpg\",\"html\":null,\"status\":\"on\",\"_token\":\"w8Lm7EusCHH11yz9guMhyzEhZw1BDEgNw6qyZXjc\"}', '2020-06-19 02:20:23', '2020-06-19 02:20:23'),
(321, 1, 'sc_admin/duan/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:20:23', '2020-06-19 02:20:23'),
(322, 1, 'sc_admin/duan/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:20:46', '2020-06-19 02:20:46'),
(323, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:20:49', '2020-06-19 02:20:49'),
(324, 1, 'sc_admin/banner/edit/3', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:21:38', '2020-06-19 02:21:38'),
(325, 1, 'sc_admin/duan/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:21:58', '2020-06-19 02:21:58'),
(326, 1, 'sc_admin/duan/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:22:05', '2020-06-19 02:22:05'),
(327, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:22:07', '2020-06-19 02:22:07'),
(328, 1, 'sc_admin/duan/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:22:09', '2020-06-19 02:22:09'),
(329, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"banner\"}', '2020-06-19 02:22:11', '2020-06-19 02:22:11'),
(330, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"_\":\"1592533331598\"}', '2020-06-19 02:22:11', '2020-06-19 02:22:11'),
(331, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"_\":\"1592533331599\"}', '2020-06-19 02:22:11', '2020-06-19 02:22:11'),
(332, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"sort_type\":\"alphabetic\",\"_\":\"1592533331600\"}', '2020-06-19 02:22:11', '2020-06-19 02:22:11'),
(333, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"banner\"}', '2020-06-19 02:22:14', '2020-06-19 02:22:14'),
(334, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"_\":\"1592533334413\"}', '2020-06-19 02:22:14', '2020-06-19 02:22:14'),
(335, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"_\":\"1592533334414\"}', '2020-06-19 02:22:14', '2020-06-19 02:22:14'),
(336, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"sort_type\":\"alphabetic\",\"_\":\"1592533334415\"}', '2020-06-19 02:22:14', '2020-06-19 02:22:14'),
(337, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:22:19', '2020-06-19 02:22:19'),
(338, 1, 'sc_admin/duan/delete', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"ids\":\"1\",\"_token\":\"w8Lm7EusCHH11yz9guMhyzEhZw1BDEgNw6qyZXjc\"}', '2020-06-19 02:22:21', '2020-06-19 02:22:21'),
(339, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_pjax\":\"#pjax-container\"}', '2020-06-19 02:22:21', '2020-06-19 02:22:21'),
(340, 1, 'sc_admin/duan/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:22:23', '2020-06-19 02:22:23'),
(341, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"banner\"}', '2020-06-19 02:22:26', '2020-06-19 02:22:26'),
(342, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"_\":\"1592533346266\"}', '2020-06-19 02:22:26', '2020-06-19 02:22:26'),
(343, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"_\":\"1592533346267\"}', '2020-06-19 02:22:26', '2020-06-19 02:22:26'),
(344, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"banner\",\"sort_type\":\"alphabetic\",\"_\":\"1592533346268\"}', '2020-06-19 02:22:26', '2020-06-19 02:22:26'),
(345, 1, 'sc_admin/duan/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"image\":\"http:\\/\\/127.0.0.1:8000\\/data\\/banner\\/slider-01.jpg\",\"html\":\"KASBDkjasdjkbsadf\",\"status\":\"on\",\"_token\":\"w8Lm7EusCHH11yz9guMhyzEhZw1BDEgNw6qyZXjc\"}', '2020-06-19 02:22:30', '2020-06-19 02:22:30'),
(346, 1, 'sc_admin/duan', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:22:30', '2020-06-19 02:22:30'),
(347, 1, 'sc_admin/duan/edit/2', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:29:57', '2020-06-19 02:29:57'),
(348, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:39:13', '2020-06-19 02:39:13'),
(349, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"w8Lm7EusCHH11yz9guMhyzEhZw1BDEgNw6qyZXjc\",\"key\":\"default-new\"}', '2020-06-19 02:39:15', '2020-06-19 02:39:15'),
(350, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:39:16', '2020-06-19 02:39:16'),
(351, 1, 'sc_admin/template/changeTemplate', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"w8Lm7EusCHH11yz9guMhyzEhZw1BDEgNw6qyZXjc\",\"key\":\"noithat\"}', '2020-06-19 02:40:45', '2020-06-19 02:40:45'),
(352, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:40:45', '2020-06-19 02:40:45'),
(353, 1, 'sc_admin/link', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:44:08', '2020-06-19 02:44:08'),
(354, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 02:44:34', '2020-06-19 02:44:34'),
(355, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 03:56:07', '2020-06-19 03:56:07'),
(356, 1, 'sc_admin/link', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-19 03:56:13', '2020-06-19 03:56:13'),
(357, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 04:03:56', '2020-06-20 04:03:56'),
(358, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 04:15:38', '2020-06-20 04:15:38'),
(359, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 04:21:35', '2020-06-20 04:21:35'),
(360, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 04:22:53', '2020-06-20 04:22:53'),
(361, 1, 'sc_admin/store_info/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"facebook\",\"value\":\"dwvoqAVWWQA\",\"pk\":null,\"_token\":\"DeSObUbC8BJHj7Fywk01SPznBLLfBJVqWvLnEBYN\"}', '2020-06-20 04:22:58', '2020-06-20 04:22:58'),
(362, 1, 'sc_admin/store_info/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"title__vi\",\"value\":\"ch\\u00e0o m\\u01b0ng b\\u1ea1n \\u0111\\u00ean v\\u1edbi n\\u1ed9i th\\u1ea5t nha trang\",\"pk\":null,\"_token\":\"DeSObUbC8BJHj7Fywk01SPznBLLfBJVqWvLnEBYN\"}', '2020-06-20 04:33:35', '2020-06-20 04:33:35');
INSERT INTO `sc_admin_log` (`id`, `user_id`, `path`, `method`, `ip`, `user_agent`, `input`, `created_at`, `updated_at`) VALUES
(363, 1, 'sc_admin/store_info/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"title__vi\",\"value\":\"Ch\\u00e0o m\\u1eebng b\\u1ea1n \\u0111\\u00ean v\\u1edbi n\\u1ed9i th\\u1ea5t nha trang\",\"pk\":null,\"_token\":\"DeSObUbC8BJHj7Fywk01SPznBLLfBJVqWvLnEBYN\"}', '2020-06-20 04:34:35', '2020-06-20 04:34:35'),
(364, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 06:56:00', '2020-06-20 06:56:00'),
(365, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 06:56:08', '2020-06-20 06:56:08'),
(366, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 06:56:14', '2020-06-20 06:56:14'),
(367, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 06:58:58', '2020-06-20 06:58:58'),
(368, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 06:59:08', '2020-06-20 06:59:08'),
(369, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 06:59:19', '2020-06-20 06:59:19'),
(370, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:00:03', '2020-06-20 07:00:03'),
(371, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:00:27', '2020-06-20 07:00:27'),
(372, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:00:38', '2020-06-20 07:00:38'),
(373, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:01:17', '2020-06-20 07:01:17'),
(374, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:01:20', '2020-06-20 07:01:20'),
(375, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo-footer\"}', '2020-06-20 07:01:42', '2020-06-20 07:01:42'),
(376, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo-footer\",\"_\":\"1592636503294\"}', '2020-06-20 07:01:43', '2020-06-20 07:01:43'),
(377, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo-footer\",\"_\":\"1592636503295\"}', '2020-06-20 07:01:43', '2020-06-20 07:01:43'),
(378, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo-footer\",\"sort_type\":\"alphabetic\",\"_\":\"1592636503296\"}', '2020-06-20 07:01:43', '2020-06-20 07:01:43'),
(379, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:04:33', '2020-06-20 07:04:33'),
(380, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logofooter\"}', '2020-06-20 07:04:35', '2020-06-20 07:04:35'),
(381, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logofooter\",\"_\":\"1592636675460\"}', '2020-06-20 07:04:35', '2020-06-20 07:04:35'),
(382, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logofooter\",\"_\":\"1592636675461\"}', '2020-06-20 07:04:35', '2020-06-20 07:04:35'),
(383, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logofooter\",\"sort_type\":\"alphabetic\",\"_\":\"1592636675462\"}', '2020-06-20 07:04:35', '2020-06-20 07:04:35'),
(384, 1, 'sc_admin/uploads/upload', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":\"\\/\",\"type\":\"logofooter\",\"_token\":\"fhHGhp3vXn7Crht9GnkNshvgFhzMpsq5ltnyHB6M\"}', '2020-06-20 07:04:49', '2020-06-20 07:04:49'),
(385, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logofooter\"}', '2020-06-20 07:04:56', '2020-06-20 07:04:56'),
(386, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logofooter\",\"_\":\"1592636696457\"}', '2020-06-20 07:04:56', '2020-06-20 07:04:56'),
(387, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logofooter\",\"_\":\"1592636696458\"}', '2020-06-20 07:04:56', '2020-06-20 07:04:56'),
(388, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logofooter\",\"sort_type\":\"alphabetic\",\"_\":\"1592636696459\"}', '2020-06-20 07:04:56', '2020-06-20 07:04:56'),
(389, 1, 'sc_admin/store_info/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"logo\",\"value\":\"http:\\/\\/127.0.0.1:8000\\/data\\/file\\/LOGO-01.png\",\"_token\":\"fhHGhp3vXn7Crht9GnkNshvgFhzMpsq5ltnyHB6M\"}', '2020-06-20 07:04:58', '2020-06-20 07:04:58'),
(390, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:06:04', '2020-06-20 07:06:04'),
(391, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:06:06', '2020-06-20 07:06:06'),
(392, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592636766611\"}', '2020-06-20 07:06:06', '2020-06-20 07:06:06'),
(393, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592636766612\"}', '2020-06-20 07:06:06', '2020-06-20 07:06:06'),
(394, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592636766613\"}', '2020-06-20 07:06:06', '2020-06-20 07:06:06'),
(395, 1, 'sc_admin/store_info/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"logo\",\"value\":\"http:\\/\\/127.0.0.1:8000\\/data\\/logo\\/LOGO-01.png\",\"_token\":\"fhHGhp3vXn7Crht9GnkNshvgFhzMpsq5ltnyHB6M\"}', '2020-06-20 07:06:08', '2020-06-20 07:06:08'),
(396, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:06:10', '2020-06-20 07:06:10'),
(397, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:06:13', '2020-06-20 07:06:13'),
(398, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592636773528\"}', '2020-06-20 07:06:13', '2020-06-20 07:06:13'),
(399, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592636773529\"}', '2020-06-20 07:06:13', '2020-06-20 07:06:13'),
(400, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592636773530\"}', '2020-06-20 07:06:13', '2020-06-20 07:06:13'),
(401, 1, 'sc_admin/store_info/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"logo\",\"value\":\"http:\\/\\/127.0.0.1:8000\\/data\\/logo\\/LOGO-01.png\",\"_token\":\"fhHGhp3vXn7Crht9GnkNshvgFhzMpsq5ltnyHB6M\"}', '2020-06-20 07:06:14', '2020-06-20 07:06:14'),
(402, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:06:48', '2020-06-20 07:06:48'),
(403, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:06:50', '2020-06-20 07:06:50'),
(404, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592636810189\"}', '2020-06-20 07:06:50', '2020-06-20 07:06:50'),
(405, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592636810190\"}', '2020-06-20 07:06:50', '2020-06-20 07:06:50'),
(406, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592636810191\"}', '2020-06-20 07:06:50', '2020-06-20 07:06:50'),
(407, 1, 'sc_admin/store_info/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"logo\",\"value\":\"http:\\/\\/127.0.0.1:8000\\/data\\/logo\\/LOGO-01.png\",\"_token\":\"fhHGhp3vXn7Crht9GnkNshvgFhzMpsq5ltnyHB6M\"}', '2020-06-20 07:06:51', '2020-06-20 07:06:51'),
(408, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:08:31', '2020-06-20 07:08:31'),
(409, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:08:53', '2020-06-20 07:08:53'),
(410, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592636933663\"}', '2020-06-20 07:08:53', '2020-06-20 07:08:53'),
(411, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592636933664\"}', '2020-06-20 07:08:53', '2020-06-20 07:08:53'),
(412, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592636933665\"}', '2020-06-20 07:08:53', '2020-06-20 07:08:53'),
(413, 1, 'sc_admin/store_info/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"logo\",\"value\":\"http:\\/\\/127.0.0.1:8000\\/data\\/logo\\/LOGO-01.png\",\"_token\":\"fhHGhp3vXn7Crht9GnkNshvgFhzMpsq5ltnyHB6M\"}', '2020-06-20 07:08:55', '2020-06-20 07:08:55'),
(414, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:08:57', '2020-06-20 07:08:57'),
(415, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592636937867\"}', '2020-06-20 07:08:58', '2020-06-20 07:08:58'),
(416, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592636937868\"}', '2020-06-20 07:08:58', '2020-06-20 07:08:58'),
(417, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592636937869\"}', '2020-06-20 07:08:58', '2020-06-20 07:08:58'),
(418, 1, 'sc_admin/store_info/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"logo\",\"value\":\"http:\\/\\/127.0.0.1:8000\\/data\\/logo\\/scart-mid.png\",\"_token\":\"fhHGhp3vXn7Crht9GnkNshvgFhzMpsq5ltnyHB6M\"}', '2020-06-20 07:08:59', '2020-06-20 07:08:59'),
(419, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:11:16', '2020-06-20 07:11:16'),
(420, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:11:18', '2020-06-20 07:11:18'),
(421, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637078692\"}', '2020-06-20 07:11:18', '2020-06-20 07:11:18'),
(422, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637078693\"}', '2020-06-20 07:11:18', '2020-06-20 07:11:18'),
(423, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637078694\"}', '2020-06-20 07:11:18', '2020-06-20 07:11:18'),
(424, 1, 'sc_admin/store_info/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"logo\",\"value\":\"http:\\/\\/127.0.0.1:8000\\/data\\/logo\\/LOGO-01.png\",\"_token\":\"fhHGhp3vXn7Crht9GnkNshvgFhzMpsq5ltnyHB6M\"}', '2020-06-20 07:11:19', '2020-06-20 07:11:19'),
(425, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:11:21', '2020-06-20 07:11:21'),
(426, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:11:29', '2020-06-20 07:11:29'),
(427, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637089964\"}', '2020-06-20 07:11:30', '2020-06-20 07:11:30'),
(428, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637089965\"}', '2020-06-20 07:11:30', '2020-06-20 07:11:30'),
(429, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637089966\"}', '2020-06-20 07:11:30', '2020-06-20 07:11:30'),
(430, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:11:35', '2020-06-20 07:11:35'),
(431, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:11:36', '2020-06-20 07:11:36'),
(432, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637096913\"}', '2020-06-20 07:11:37', '2020-06-20 07:11:37'),
(433, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637096914\"}', '2020-06-20 07:11:37', '2020-06-20 07:11:37'),
(434, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637096915\"}', '2020-06-20 07:11:37', '2020-06-20 07:11:37'),
(435, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:12:07', '2020-06-20 07:12:07'),
(436, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:12:08', '2020-06-20 07:12:08'),
(437, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637128899\"}', '2020-06-20 07:12:09', '2020-06-20 07:12:09'),
(438, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637128900\"}', '2020-06-20 07:12:09', '2020-06-20 07:12:09'),
(439, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637128901\"}', '2020-06-20 07:12:09', '2020-06-20 07:12:09'),
(440, 1, 'sc_admin/store_info/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"logo\",\"value\":\"http:\\/\\/127.0.0.1:8000\\/data\\/logo\\/scart-mid.png\",\"_token\":\"fhHGhp3vXn7Crht9GnkNshvgFhzMpsq5ltnyHB6M\"}', '2020-06-20 07:12:10', '2020-06-20 07:12:10'),
(441, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:12:13', '2020-06-20 07:12:13'),
(442, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:12:32', '2020-06-20 07:12:32'),
(443, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637153010\"}', '2020-06-20 07:12:33', '2020-06-20 07:12:33'),
(444, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637153011\"}', '2020-06-20 07:12:33', '2020-06-20 07:12:33'),
(445, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637153012\"}', '2020-06-20 07:12:33', '2020-06-20 07:12:33'),
(446, 1, 'sc_admin/store_info/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"logo\",\"value\":\"http:\\/\\/127.0.0.1:8000\\/data\\/logo\\/scart-mid.png\",\"_token\":\"fhHGhp3vXn7Crht9GnkNshvgFhzMpsq5ltnyHB6M\"}', '2020-06-20 07:12:34', '2020-06-20 07:12:34'),
(447, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:12:39', '2020-06-20 07:12:39'),
(448, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:13:05', '2020-06-20 07:13:05'),
(449, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637185843\"}', '2020-06-20 07:13:05', '2020-06-20 07:13:05'),
(450, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637185844\"}', '2020-06-20 07:13:06', '2020-06-20 07:13:06'),
(451, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637185845\"}', '2020-06-20 07:13:06', '2020-06-20 07:13:06'),
(452, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:13:56', '2020-06-20 07:13:56'),
(453, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:13:57', '2020-06-20 07:13:57'),
(454, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637237645\"}', '2020-06-20 07:13:57', '2020-06-20 07:13:57'),
(455, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637237646\"}', '2020-06-20 07:13:57', '2020-06-20 07:13:57'),
(456, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637237647\"}', '2020-06-20 07:13:57', '2020-06-20 07:13:57'),
(457, 1, 'sc_admin/store_info/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"logo\",\"value\":\"http:\\/\\/127.0.0.1:8000\\/data\\/logo\\/LOGO-01.png\",\"_token\":\"fhHGhp3vXn7Crht9GnkNshvgFhzMpsq5ltnyHB6M\"}', '2020-06-20 07:13:59', '2020-06-20 07:13:59'),
(458, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:14:01', '2020-06-20 07:14:01'),
(459, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:15:30', '2020-06-20 07:15:30'),
(460, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:15:31', '2020-06-20 07:15:31'),
(461, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637331925\"}', '2020-06-20 07:15:32', '2020-06-20 07:15:32'),
(462, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637331926\"}', '2020-06-20 07:15:32', '2020-06-20 07:15:32'),
(463, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637331927\"}', '2020-06-20 07:15:32', '2020-06-20 07:15:32'),
(464, 1, 'sc_admin/store_info/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"logo\",\"value\":\"http:\\/\\/127.0.0.1:8000\\/data\\/logo\\/scart-mid.png\",\"_token\":\"fhHGhp3vXn7Crht9GnkNshvgFhzMpsq5ltnyHB6M\"}', '2020-06-20 07:15:33', '2020-06-20 07:15:33'),
(465, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:16:31', '2020-06-20 07:16:31'),
(466, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:16:31', '2020-06-20 07:16:31'),
(467, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637392070\"}', '2020-06-20 07:16:32', '2020-06-20 07:16:32'),
(468, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637392071\"}', '2020-06-20 07:16:32', '2020-06-20 07:16:32'),
(469, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637392072\"}', '2020-06-20 07:16:32', '2020-06-20 07:16:32'),
(470, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:16:34', '2020-06-20 07:16:34'),
(471, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:16:36', '2020-06-20 07:16:36'),
(472, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637396186\"}', '2020-06-20 07:16:36', '2020-06-20 07:16:36'),
(473, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637396187\"}', '2020-06-20 07:16:36', '2020-06-20 07:16:36'),
(474, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637396188\"}', '2020-06-20 07:16:36', '2020-06-20 07:16:36'),
(475, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:16:44', '2020-06-20 07:16:44'),
(476, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:17:00', '2020-06-20 07:17:00'),
(477, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637420810\"}', '2020-06-20 07:17:00', '2020-06-20 07:17:00'),
(478, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637420811\"}', '2020-06-20 07:17:00', '2020-06-20 07:17:00'),
(479, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637420812\"}', '2020-06-20 07:17:01', '2020-06-20 07:17:01'),
(480, 1, 'sc_admin/store_info/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"logo\",\"value\":\"http:\\/\\/127.0.0.1:8000\\/data\\/logo\\/LOGO-01.png\",\"_token\":\"fhHGhp3vXn7Crht9GnkNshvgFhzMpsq5ltnyHB6M\"}', '2020-06-20 07:17:02', '2020-06-20 07:17:02'),
(481, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:17:03', '2020-06-20 07:17:03'),
(482, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:17:57', '2020-06-20 07:17:57'),
(483, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:17:58', '2020-06-20 07:17:58'),
(484, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637478671\"}', '2020-06-20 07:17:58', '2020-06-20 07:17:58'),
(485, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637478672\"}', '2020-06-20 07:17:58', '2020-06-20 07:17:58'),
(486, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637478673\"}', '2020-06-20 07:17:58', '2020-06-20 07:17:58'),
(487, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:18:01', '2020-06-20 07:18:01'),
(488, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:18:04', '2020-06-20 07:18:04'),
(489, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637484494\"}', '2020-06-20 07:18:04', '2020-06-20 07:18:04'),
(490, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637484495\"}', '2020-06-20 07:18:04', '2020-06-20 07:18:04'),
(491, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637484496\"}', '2020-06-20 07:18:04', '2020-06-20 07:18:04'),
(492, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:18:23', '2020-06-20 07:18:23'),
(493, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:18:39', '2020-06-20 07:18:39'),
(494, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:19:10', '2020-06-20 07:19:10'),
(495, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:19:12', '2020-06-20 07:19:12'),
(496, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637552356\"}', '2020-06-20 07:19:12', '2020-06-20 07:19:12'),
(497, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637552357\"}', '2020-06-20 07:19:12', '2020-06-20 07:19:12'),
(498, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637552358\"}', '2020-06-20 07:19:12', '2020-06-20 07:19:12'),
(499, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:19:16', '2020-06-20 07:19:16'),
(500, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:19:55', '2020-06-20 07:19:55'),
(501, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:20:34', '2020-06-20 07:20:34'),
(502, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637634863\"}', '2020-06-20 07:20:34', '2020-06-20 07:20:34'),
(503, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637634864\"}', '2020-06-20 07:20:35', '2020-06-20 07:20:35'),
(504, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637634865\"}', '2020-06-20 07:20:35', '2020-06-20 07:20:35'),
(505, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:20:37', '2020-06-20 07:20:37'),
(506, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:20:40', '2020-06-20 07:20:40'),
(507, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637640378\"}', '2020-06-20 07:20:40', '2020-06-20 07:20:40'),
(508, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637640379\"}', '2020-06-20 07:20:40', '2020-06-20 07:20:40'),
(509, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637640380\"}', '2020-06-20 07:20:40', '2020-06-20 07:20:40'),
(510, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:20:42', '2020-06-20 07:20:42'),
(511, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:22:06', '2020-06-20 07:22:06'),
(512, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:22:07', '2020-06-20 07:22:07'),
(513, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637727215\"}', '2020-06-20 07:22:07', '2020-06-20 07:22:07'),
(514, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637727216\"}', '2020-06-20 07:22:07', '2020-06-20 07:22:07'),
(515, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637727217\"}', '2020-06-20 07:22:07', '2020-06-20 07:22:07'),
(516, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:22:08', '2020-06-20 07:22:08'),
(517, 1, 'sc_admin/store_info/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"phone\",\"value\":\"01234567890\",\"pk\":null,\"_token\":\"fhHGhp3vXn7Crht9GnkNshvgFhzMpsq5ltnyHB6M\"}', '2020-06-20 07:22:48', '2020-06-20 07:22:48'),
(518, 1, 'sc_admin/store_info/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"phone\",\"value\":\"0123456789\",\"pk\":null,\"_token\":\"fhHGhp3vXn7Crht9GnkNshvgFhzMpsq5ltnyHB6M\"}', '2020-06-20 07:22:55', '2020-06-20 07:22:55'),
(519, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:22:56', '2020-06-20 07:22:56'),
(520, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637776826\"}', '2020-06-20 07:22:56', '2020-06-20 07:22:56'),
(521, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637776827\"}', '2020-06-20 07:22:57', '2020-06-20 07:22:57'),
(522, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637776828\"}', '2020-06-20 07:22:57', '2020-06-20 07:22:57'),
(523, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:23:05', '2020-06-20 07:23:05'),
(524, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:23:07', '2020-06-20 07:23:07'),
(525, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637787544\"}', '2020-06-20 07:23:07', '2020-06-20 07:23:07'),
(526, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637787545\"}', '2020-06-20 07:23:07', '2020-06-20 07:23:07'),
(527, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637787546\"}', '2020-06-20 07:23:07', '2020-06-20 07:23:07'),
(528, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:23:10', '2020-06-20 07:23:10'),
(529, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:23:12', '2020-06-20 07:23:12'),
(530, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637792251\"}', '2020-06-20 07:23:12', '2020-06-20 07:23:12'),
(531, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637792252\"}', '2020-06-20 07:23:12', '2020-06-20 07:23:12'),
(532, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637792253\"}', '2020-06-20 07:23:12', '2020-06-20 07:23:12'),
(533, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:24:11', '2020-06-20 07:24:11'),
(534, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"type\":\"logo\"}', '2020-06-20 07:24:12', '2020-06-20 07:24:12'),
(535, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637852397\"}', '2020-06-20 07:24:12', '2020-06-20 07:24:12'),
(536, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"_\":\"1592637852398\"}', '2020-06-20 07:24:12', '2020-06-20 07:24:12'),
(537, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"working_dir\":null,\"type\":\"logo\",\"sort_type\":\"alphabetic\",\"_\":\"1592637852399\"}', '2020-06-20 07:24:12', '2020-06-20 07:24:12'),
(538, 1, 'sc_admin/store_info/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"logofooter\",\"value\":\"http:\\/\\/127.0.0.1:8000\\/data\\/logo\\/scart-mid.png\",\"_token\":\"fhHGhp3vXn7Crht9GnkNshvgFhzMpsq5ltnyHB6M\"}', '2020-06-20 07:24:13', '2020-06-20 07:24:13'),
(539, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:24:14', '2020-06-20 07:24:14'),
(540, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:24:15', '2020-06-20 07:24:15'),
(541, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:24:15', '2020-06-20 07:24:15'),
(542, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:24:15', '2020-06-20 07:24:15'),
(543, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:24:16', '2020-06-20 07:24:16'),
(544, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:24:16', '2020-06-20 07:24:16'),
(545, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:24:16', '2020-06-20 07:24:16'),
(546, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-20 07:24:16', '2020-06-20 07:24:16'),
(547, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 04:25:55', '2020-06-22 04:25:55'),
(548, 1, 'sc_admin/customer_config', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 04:26:26', '2020-06-22 04:26:26'),
(549, 1, 'sc_admin/setting/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"customer_country\",\"value\":\"0\",\"_token\":\"8DvhqxiQX39eQ2bloJ8GxTDELgic8r4KX5zc3O0C\"}', '2020-06-22 04:26:31', '2020-06-22 04:26:31'),
(550, 1, 'sc_admin/setting/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"customer_address2\",\"value\":\"0\",\"_token\":\"8DvhqxiQX39eQ2bloJ8GxTDELgic8r4KX5zc3O0C\"}', '2020-06-22 04:26:48', '2020-06-22 04:26:48');
INSERT INTO `sc_admin_log` (`id`, `user_id`, `path`, `method`, `ip`, `user_agent`, `input`, `created_at`, `updated_at`) VALUES
(551, 1, 'sc_admin/setting/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"customer_address1\",\"value\":\"0\",\"_token\":\"8DvhqxiQX39eQ2bloJ8GxTDELgic8r4KX5zc3O0C\"}', '2020-06-22 04:26:49', '2020-06-22 04:26:49'),
(552, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 04:47:01', '2020-06-22 04:47:01'),
(553, 1, 'sc_admin/order/detail/4', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 04:47:04', '2020-06-22 04:47:04'),
(554, 1, 'sc_admin/news', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 04:51:24', '2020-06-22 04:51:24'),
(555, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 04:51:26', '2020-06-22 04:51:26'),
(556, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 04:53:06', '2020-06-22 04:53:06'),
(557, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 04:53:18', '2020-06-22 04:53:18'),
(558, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 04:53:45', '2020-06-22 04:53:45'),
(559, 1, 'sc_admin/order/detail/4', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 04:53:48', '2020-06-22 04:53:48'),
(560, 1, 'sc_admin/order/detail/4', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 04:59:43', '2020-06-22 04:59:43'),
(561, 1, 'sc_admin/order/detail/5', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 04:59:45', '2020-06-22 04:59:45'),
(562, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 04:59:49', '2020-06-22 04:59:49'),
(563, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:10:03', '2020-06-22 05:10:03'),
(564, 1, 'sc_admin/order/detail/5', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:10:05', '2020-06-22 05:10:05'),
(565, 1, 'sc_admin/order/detail/5', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:14:55', '2020-06-22 05:14:55'),
(566, 1, 'sc_admin/order/detail/5', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:16:06', '2020-06-22 05:16:06'),
(567, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:16:26', '2020-06-22 05:16:26'),
(568, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:19:01', '2020-06-22 05:19:01'),
(569, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:19:18', '2020-06-22 05:19:18'),
(570, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:19:40', '2020-06-22 05:19:40'),
(571, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:24:23', '2020-06-22 05:24:23'),
(572, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:24:44', '2020-06-22 05:24:44'),
(573, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:31:26', '2020-06-22 05:31:26'),
(574, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:31:43', '2020-06-22 05:31:43'),
(575, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:32:40', '2020-06-22 05:32:40'),
(576, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:32:50', '2020-06-22 05:32:50'),
(577, 1, 'sc_admin/order/detail/5', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:32:52', '2020-06-22 05:32:52'),
(578, 1, 'sc_admin/order/export_detail', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"order_id\":\"5\",\"type\":\"invoice\"}', '2020-06-22 05:33:05', '2020-06-22 05:33:05'),
(579, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:33:39', '2020-06-22 05:33:39'),
(580, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:33:48', '2020-06-22 05:33:48'),
(581, 1, 'sc_admin/order/detail/5', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:33:50', '2020-06-22 05:33:50'),
(582, 1, 'sc_admin/order/export_detail', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"order_id\":\"5\",\"type\":\"invoice\"}', '2020-06-22 05:33:51', '2020-06-22 05:33:51'),
(583, 1, 'sc_admin/order/export_detail', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"order_id\":\"5\",\"type\":\"invoice\"}', '2020-06-22 05:35:14', '2020-06-22 05:35:14'),
(584, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:35:29', '2020-06-22 05:35:29'),
(585, 1, 'sc_admin/order/detail/5', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:35:31', '2020-06-22 05:35:31'),
(586, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:35:44', '2020-06-22 05:35:44'),
(587, 1, 'sc_admin/customer', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:35:47', '2020-06-22 05:35:47'),
(588, 1, 'sc_admin/plugin/payment', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:36:56', '2020-06-22 05:36:56'),
(589, 1, 'sc_admin/plugin/payment/online', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:36:58', '2020-06-22 05:36:58'),
(590, 1, 'sc_admin/plugin/payment/online', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:37:19', '2020-06-22 05:37:19'),
(591, 1, 'sc_admin/plugin/payment', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:37:21', '2020-06-22 05:37:21'),
(592, 1, 'sc_admin/plugin/payment/online', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:37:22', '2020-06-22 05:37:22'),
(593, 1, 'sc_admin/plugin/payment', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:37:23', '2020-06-22 05:37:23'),
(594, 1, 'sc_admin/plugin/payment', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:37:31', '2020-06-22 05:37:31'),
(595, 1, 'sc_admin/plugin/payment/online', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:37:32', '2020-06-22 05:37:32'),
(596, 1, 'sc_admin/plugin/payment', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:37:33', '2020-06-22 05:37:33'),
(597, 1, 'sc_admin/plugin/payment/online', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:37:34', '2020-06-22 05:37:34'),
(598, 1, 'sc_admin/plugin/payment', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:37:39', '2020-06-22 05:37:39'),
(599, 1, 'sc_admin/plugin/shipping', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:37:51', '2020-06-22 05:37:51'),
(600, 1, 'sc_admin/plugin/shipping/online', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:37:52', '2020-06-22 05:37:52'),
(601, 1, 'sc_admin/plugin/shipping', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:37:52', '2020-06-22 05:37:52'),
(602, 1, 'sc_admin/plugin/shipping/online', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:37:53', '2020-06-22 05:37:53'),
(603, 1, 'sc_admin/plugin/shipping', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:37:54', '2020-06-22 05:37:54'),
(604, 1, 'sc_admin/plugin/shipping/online', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:37:54', '2020-06-22 05:37:54'),
(605, 1, 'sc_admin/report/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:37:57', '2020-06-22 05:37:57'),
(606, 1, 'sc_admin/order_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:38:00', '2020-06-22 05:38:00'),
(607, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:38:01', '2020-06-22 05:38:01'),
(608, 1, 'sc_admin/order/detail/6', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:38:05', '2020-06-22 05:38:05'),
(609, 1, 'sc_admin/plugin/payment', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:38:15', '2020-06-22 05:38:15'),
(610, 1, 'sc_admin/plugin/shipping', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:38:17', '2020-06-22 05:38:17'),
(611, 1, 'sc_admin/plugin/shipping', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"action\":\"config\",\"pluginKey\":\"ShippingStandard\"}', '2020-06-22 05:38:18', '2020-06-22 05:38:18'),
(612, 1, 'sc_admin/plugin/process/Shipping/ShippingStandard', 'PUT', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"fee\",\"value\":\"0\",\"pk\":\"1\",\"_token\":\"Rhto7h3xMCguJSdGthj7FqrKsmxc0oIXSDFR4pU4\"}', '2020-06-22 05:38:21', '2020-06-22 05:38:21'),
(613, 1, 'sc_admin/plugin/process/Shipping/ShippingStandard', 'PUT', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"name\":\"shipping_free\",\"value\":\"0\",\"pk\":\"1\",\"_token\":\"Rhto7h3xMCguJSdGthj7FqrKsmxc0oIXSDFR4pU4\"}', '2020-06-22 05:38:26', '2020-06-22 05:38:26'),
(614, 1, 'sc_admin/plugin/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:38:29', '2020-06-22 05:38:29'),
(615, 1, 'sc_admin/plugin/install', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"Rhto7h3xMCguJSdGthj7FqrKsmxc0oIXSDFR4pU4\",\"key\":\"Discount\",\"code\":\"Total\"}', '2020-06-22 05:38:31', '2020-06-22 05:38:31'),
(616, 1, 'sc_admin/plugin/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:38:31', '2020-06-22 05:38:31'),
(617, 1, 'sc_admin/plugin/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"action\":\"config\",\"pluginKey\":\"Discount\"}', '2020-06-22 05:38:34', '2020-06-22 05:38:34'),
(618, 1, 'sc_admin/shop_discount', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:38:35', '2020-06-22 05:38:35'),
(619, 1, 'sc_admin/plugin/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:39:11', '2020-06-22 05:39:11'),
(620, 1, 'sc_admin/plugin/disable', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"Rhto7h3xMCguJSdGthj7FqrKsmxc0oIXSDFR4pU4\",\"key\":\"Discount\",\"code\":\"Total\"}', '2020-06-22 05:39:12', '2020-06-22 05:39:12'),
(621, 1, 'sc_admin/plugin/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_pjax\":\"#pjax-container\"}', '2020-06-22 05:39:12', '2020-06-22 05:39:12'),
(622, 1, 'sc_admin/plugin/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"action\":\"config\",\"pluginKey\":\"Discount\"}', '2020-06-22 05:39:15', '2020-06-22 05:39:15'),
(623, 1, 'sc_admin/shop_discount', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:39:15', '2020-06-22 05:39:15'),
(624, 1, 'sc_admin/plugin/disable', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"Rhto7h3xMCguJSdGthj7FqrKsmxc0oIXSDFR4pU4\",\"key\":\"Discount\",\"code\":\"Total\"}', '2020-06-22 05:39:20', '2020-06-22 05:39:20'),
(625, 1, 'sc_admin/plugin/disable', 'POST', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"_token\":\"Rhto7h3xMCguJSdGthj7FqrKsmxc0oIXSDFR4pU4\",\"key\":\"Discount\",\"code\":\"Total\"}', '2020-06-22 05:39:23', '2020-06-22 05:39:23'),
(626, 1, 'sc_admin/plugin/total/online', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:39:27', '2020-06-22 05:39:27'),
(627, 1, 'sc_admin/plugin/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:39:27', '2020-06-22 05:39:27'),
(628, 1, 'sc_admin/plugin/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:39:30', '2020-06-22 05:39:30'),
(629, 1, 'sc_admin/plugin/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"action\":\"config\",\"pluginKey\":\"Discount\"}', '2020-06-22 05:39:33', '2020-06-22 05:39:33'),
(630, 1, 'sc_admin/shop_discount', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:39:33', '2020-06-22 05:39:33'),
(631, 1, 'sc_admin/plugin/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:39:34', '2020-06-22 05:39:34'),
(632, 1, 'sc_admin/plugin/shipping', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:39:40', '2020-06-22 05:39:40'),
(633, 1, 'sc_admin/plugin/import', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 05:39:42', '2020-06-22 05:39:42'),
(634, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 07:01:26', '2020-06-22 07:01:26'),
(635, 1, 'sc_admin/plugin/payment', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 07:01:38', '2020-06-22 07:01:38'),
(636, 1, 'sc_admin/plugin/payment/online', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 07:01:40', '2020-06-22 07:01:40'),
(637, 1, 'sc_admin/plugin/payment', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 07:01:55', '2020-06-22 07:01:55'),
(638, 1, 'sc_admin/plugin/payment', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 07:03:09', '2020-06-22 07:03:09'),
(639, 1, 'sc_admin/plugin/payment/online', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 07:03:16', '2020-06-22 07:03:16'),
(640, 1, 'sc_admin/plugin/Payment/online', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"only_version\":\"1\"}', '2020-06-22 07:03:18', '2020-06-22 07:03:18'),
(641, 1, 'sc_admin/plugin/Payment/online', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 07:03:19', '2020-06-22 07:03:19'),
(642, 1, 'sc_admin/plugin/Payment/online', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '{\"only_version\":\"1\"}', '2020-06-22 07:03:20', '2020-06-22 07:03:20'),
(643, 1, 'sc_admin/plugin/payment', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 07:03:22', '2020-06-22 07:03:22'),
(644, 1, 'sc_admin/plugin/payment', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 07:04:15', '2020-06-22 07:04:15'),
(645, 1, 'sc_admin/plugin/payment/online', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 07:04:18', '2020-06-22 07:04:18'),
(646, 1, 'sc_admin/plugin/payment', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 07:04:20', '2020-06-22 07:04:20'),
(647, 1, 'sc_admin/plugin/shipping', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 07:04:31', '2020-06-22 07:04:31'),
(648, 1, 'sc_admin/plugin/shipping/online', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 07:04:38', '2020-06-22 07:04:38'),
(649, 1, 'sc_admin/plugin/shipping', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 07:04:39', '2020-06-22 07:04:39'),
(650, 1, 'sc_admin/plugin/cms', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 07:04:41', '2020-06-22 07:04:41'),
(651, 1, 'sc_admin/plugin/cms', 'GET', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '[]', '2020-06-22 07:07:07', '2020-06-22 07:07:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_admin_menu`
--

CREATE TABLE `sc_admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_admin_menu`
--

INSERT INTO `sc_admin_menu` (`id`, `parent_id`, `sort`, `title`, `icon`, `uri`, `type`, `key`, `permission`, `created_at`, `updated_at`) VALUES
(1, 6, 11, 'lang::admin.menu_titles.order_manager', 'fa-cart-arrow-down', '', 0, 'ORDER_MANAGER', NULL, NULL, NULL),
(2, 6, 12, 'lang::admin.menu_titles.catalog_mamager', 'fa-folder-open', '', 0, 'CATALOG_MANAGER', NULL, NULL, NULL),
(3, 6, 13, 'lang::admin.menu_titles.customer_manager', 'fa-group', '', 0, 'CUSTOMER_MANAGER', NULL, NULL, NULL),
(4, 8, 201, 'lang::admin.menu_titles.template_layout', 'fa-object-ungroup', '', 0, 'TEMPLATE', NULL, NULL, NULL),
(5, 9, 301, 'lang::admin.menu_titles.config_manager', 'fa-cogs', '', 0, 'CONFIG_MANAGER', NULL, NULL, NULL),
(6, 0, 10, 'lang::ADMIN SHOP', 'fa-minus', '', 0, 'ADMIN_SHOP', NULL, NULL, NULL),
(7, 0, 100, 'lang::ADMIN CONTENT', 'fa-minus', '', 0, 'ADMIN_CONTENT', NULL, NULL, NULL),
(8, 0, 200, 'lang::ADMIN EXTENSION', 'fa-minus', '', 0, 'ADMIN_EXTENSION', NULL, NULL, NULL),
(9, 0, 300, 'lang::ADMIN SYSTEM', 'fa-minus', '', 0, 'ADMIN_SYSTEM', NULL, NULL, NULL),
(10, 7, 102, 'lang::page.admin.title', 'fa-clone', 'admin::page', 0, NULL, NULL, NULL, NULL),
(11, 1, 6, 'lang::shipping_status.admin.title', 'fa-truck', 'admin::shipping_status', 0, NULL, NULL, NULL, NULL),
(12, 1, 3, 'lang::order.admin.title', 'fa-shopping-cart', 'admin::order', 0, NULL, NULL, NULL, NULL),
(13, 1, 4, 'lang::order_status.admin.title', 'fa-asterisk', 'admin::order_status', 0, NULL, NULL, NULL, NULL),
(14, 1, 5, 'lang::payment_status.admin.title', 'fa-recycle', 'admin::payment_status', 0, NULL, NULL, NULL, NULL),
(15, 2, 0, 'lang::product.admin.title', 'fa-file-photo-o', 'admin::product', 0, NULL, NULL, NULL, NULL),
(16, 2, 0, 'lang::category.admin.title', 'fa-folder-open-o', 'admin::category', 0, NULL, NULL, NULL, NULL),
(17, 2, 0, 'lang::supplier.admin.title', 'fa-user-secret', 'admin::supplier', 0, NULL, NULL, NULL, NULL),
(18, 2, 0, 'lang::brand.admin.title', 'fa-bank', 'admin::brand', 0, NULL, NULL, NULL, NULL),
(19, 2, 0, 'lang::attribute_group.admin.title', 'fa-bars', 'admin::attribute_group', 0, NULL, NULL, NULL, NULL),
(20, 3, 0, 'lang::customer.admin.title', 'fa-user', 'admin::customer', 0, NULL, NULL, NULL, NULL),
(21, 3, 0, 'lang::subscribe.admin.title', 'fa-user-circle-o', 'admin::subscribe', 0, NULL, NULL, NULL, NULL),
(22, 4, 0, 'lang::block_content.admin.title', 'fa-newspaper-o', 'admin::block_content', 0, NULL, NULL, NULL, NULL),
(23, 4, 0, 'lang::admin.menu_titles.block_link', 'fa-chrome', 'admin::link', 0, NULL, NULL, NULL, NULL),
(24, 4, 0, 'lang::admin.menu_titles.template_manager', 'fa-columns', 'admin::template', 0, NULL, NULL, NULL, NULL),
(26, 5, 1, 'lang::store_info.admin.title', 'fa-h-square', 'admin::store_info', 0, NULL, NULL, NULL, NULL),
(27, 5, 4, 'lang::admin.menu_titles.email_setting', 'fa-envelope', '', 0, NULL, NULL, NULL, NULL),
(28, 27, 0, 'lang::email.admin.title', 'fa-cog', 'admin::email', 0, NULL, NULL, NULL, NULL),
(29, 27, 0, 'lang::email_template.admin.title', 'fa-bars', 'admin::email_template', 0, NULL, NULL, NULL, NULL),
(30, 5, 5, 'lang::admin.menu_titles.localisation', 'fa-shirtsinbulk', '', 0, NULL, NULL, NULL, NULL),
(31, 30, 0, 'lang::language.admin.title', 'fa-pagelines', 'admin::language', 0, NULL, NULL, NULL, NULL),
(32, 30, 0, 'lang::currency.admin.title', 'fa-dollar', 'admin::currency', 0, NULL, NULL, NULL, NULL),
(33, 7, 101, 'lang::banner.admin.title', 'fa-image', 'admin::banner', 0, NULL, NULL, NULL, NULL),
(34, 5, 5, 'lang::backup.admin.title', 'fa-save', 'admin::backup', 0, NULL, NULL, NULL, NULL),
(35, 8, 202, 'lang::admin.menu_titles.plugins', 'fa-puzzle-piece', '', 0, 'PLUGIN', NULL, NULL, NULL),
(37, 9, 302, 'lang::admin.menu_titles.report_manager', 'fa-pie-chart', '', 0, 'REPORT_MANAGER', NULL, NULL, NULL),
(38, 9, 0, 'lang::admin.menu_titles.admin', 'fa-sitemap', '', 0, 'ADMIN', NULL, NULL, NULL),
(39, 35, 0, 'plugin.Payment', 'fa-money', 'admin::plugin/payment', 0, NULL, NULL, NULL, NULL),
(40, 35, 0, 'plugin.Shipping', 'fa-ambulance', 'admin::plugin/shipping', 0, NULL, NULL, NULL, NULL),
(41, 35, 0, 'plugin.Total', 'fa-cog', 'admin::plugin/total', 0, NULL, NULL, NULL, NULL),
(42, 35, 100, 'plugin.Other', 'fa-circle-thin', 'admin::plugin/other', 0, NULL, NULL, NULL, NULL),
(43, 35, 0, 'plugin.Cms', 'fa-modx', 'admin::plugin/cms', 0, NULL, NULL, NULL, NULL),
(46, 38, 0, 'lang::admin.menu_titles.users', 'fa-users', 'admin::user', 0, NULL, NULL, NULL, NULL),
(47, 38, 0, 'lang::admin.menu_titles.roles', 'fa-user', 'admin::role', 0, NULL, NULL, NULL, NULL),
(48, 38, 0, 'lang::admin.menu_titles.permission', 'fa-ban', 'admin::permission', 0, NULL, NULL, NULL, NULL),
(49, 38, 0, 'lang::admin.menu_titles.menu', 'fa-bars', 'admin::menu', 0, NULL, NULL, NULL, NULL),
(50, 38, 0, 'lang::admin.menu_titles.operation_log', 'fa-history', 'admin::log', 0, NULL, NULL, NULL, NULL),
(52, 7, 103, 'lang::news.admin.title', 'fa-file-powerpoint-o', 'admin::news', 0, NULL, NULL, NULL, NULL),
(53, 5, 3, 'lang::setting.title', 'fa-cog', 'admin::setting', 0, NULL, NULL, NULL, NULL),
(54, 37, 0, 'lang::admin.menu_titles.report_product', 'fa-bars', 'admin::report/product', 0, NULL, NULL, NULL, NULL),
(55, 2, 100, 'lang::product.config_manager.title', 'fa fa-cog', 'admin::product_config', 0, NULL, NULL, NULL, NULL),
(56, 3, 100, 'lang::customer.config_manager.title', 'fa fa-cog', 'admin::customer_config', 0, NULL, NULL, NULL, NULL),
(57, 5, 2, 'lang::link.config_manager.title', 'fa-gg', 'admin::url_config', 0, NULL, NULL, NULL, NULL),
(58, 5, 5, 'lang::admin.menu_titles.cache_manager', 'fa-tripadvisor', 'admin::cache_config', 0, NULL, NULL, NULL, NULL),
(59, 9, 303, 'lang::admin.menu_titles.api_manager', 'fa-plug', 'admin::api_connection', 0, 'API_MANAGER', NULL, NULL, NULL),
(60, 5, 3, 'lang::maintain.config_manager.title', 'fa-flag', 'admin::maintain', 0, NULL, NULL, NULL, NULL),
(61, 2, 4, 'lang::tax.admin.admin_title', 'fa-calendar-minus-o', 'admin::tax', 0, NULL, NULL, NULL, NULL),
(62, 2, 5, 'lang::weight.admin.title', 'fa-balance-scale', 'admin::weight_unit', 0, NULL, NULL, NULL, NULL),
(63, 2, 6, 'lang::length.admin.title', 'fa-minus', 'admin::length_unit', 0, NULL, NULL, NULL, NULL),
(64, 7, 102, 'Plugins/Cms/Content::Content.cms_manager', 'fa-coffee', NULL, 0, 'Content', NULL, NULL, NULL),
(65, 64, 0, 'Plugins/Cms/Content::Content.cms_category', 'fa-folder-open-o', 'route::admin_cms_category.index', 0, NULL, NULL, NULL, NULL),
(66, 64, 0, 'Plugins/Cms/Content::Content.cms_content', 'fa-copy', 'route::admin_cms_content.index', 0, NULL, NULL, NULL, NULL),
(68, 7, 0, 'Dự án', 'fa-institution', 'admin::duan', 0, NULL, NULL, '2020-06-19 02:09:49', '2020-06-19 02:09:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_admin_menu_permission`
--

CREATE TABLE `sc_admin_menu_permission` (
  `menu_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_admin_permission`
--

CREATE TABLE `sc_admin_permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_uri` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_admin_permission`
--

INSERT INTO `sc_admin_permission` (`id`, `name`, `slug`, `http_uri`, `created_at`, `updated_at`) VALUES
(1, 'Admin manager', 'admin.manager', 'GET::sc_admin/user,GET::sc_admin/role,GET::sc_admin/permission,ANY::sc_admin/log/*,ANY::sc_admin/menu/*', '2020-05-22 02:25:22', NULL),
(2, 'Dashboard', 'dashboard', 'GET::sc_admin', '2020-05-22 02:25:22', NULL),
(3, 'Auth manager', 'auth.full', 'ANY::sc_admin/auth/*', '2020-05-22 02:25:22', NULL),
(4, 'Setting manager', 'setting.full', '\r\n                    ANY::sc_admin/store_info/*,\r\n                    ANY::sc_admin/setting/*,\r\n                    ANY::sc_admin/url_config/*,\r\n                    ANY::sc_admin/product_config/*,\r\n                    ANY::sc_admin/customer_config/*,\r\n                    ANY::sc_admin/cache_config/*,\r\n                    ANY::sc_admin/email/*,\r\n                    ANY::sc_admin/email_template/*,\r\n                    ANY::sc_admin/language/*,\r\n                    ANY::sc_admin/currency/*,\r\n                    ANY::sc_admin/backup/*,\r\n                    ANY::sc_admin/api_connection/*,\r\n                    ANY::sc_admin/maintain/*,\r\n                    ANY::sc_admin/tax/*\r\n                ', '2020-05-22 02:25:22', NULL),
(5, 'Upload management', 'upload.full', 'ANY::sc_admin/uploads/*', '2020-05-22 02:25:22', NULL),
(6, 'Plugin manager', 'plugin.full', 'ANY::sc_admin/plugin/*', '2020-05-22 02:25:22', NULL),
(8, 'CMS manager', 'cms.full', 'ANY::sc_admin/page/*,ANY::sc_admin/banner/*,ANY::sc_admin/cms_category/*,ANY::sc_admin/cms_content/*,ANY::sc_admin/news/*', '2020-05-22 02:25:22', NULL),
(11, 'Discount manager', 'discount.full', 'ANY::sc_admin/shop_discount/*', '2020-05-22 02:25:22', NULL),
(14, 'Shipping status', 'shipping_status.full', 'ANY::sc_admin/shipping_status/*', '2020-05-22 02:25:22', NULL),
(15, 'Payment  status', 'payment_status.full', 'ANY::sc_admin/payment_status/*', '2020-05-22 02:25:22', NULL),
(17, 'Customer manager', 'customer.full', 'ANY::sc_admin/customer/*,ANY::sc_admin/subscribe/*', '2020-05-22 02:25:22', NULL),
(18, 'Order status', 'order_status.full', 'ANY::sc_admin/order_status/*', '2020-05-22 02:25:22', NULL),
(19, 'Product manager', 'product.full', '\r\n                ANY::sc_admin/category/*,\r\n                ANY::sc_admin/supplier/*,\r\n                ANY::sc_admin/brand/*,\r\n                ANY::sc_admin/attribute_group/*,\r\n                ANY::sc_admin/product/,\r\n                ANY::sc_admin/weight_unit/*,\r\n                ANY::sc_admin/length_unit/*\r\n                ', '2020-05-22 02:25:22', NULL),
(20, 'Order Manager', 'order.full', 'ANY::sc_admin/order/*', '2020-05-22 02:25:22', NULL),
(21, 'Report manager', 'report.full', 'ANY::sc_admin/report/*', '2020-05-22 02:25:22', NULL),
(22, 'Template manager', 'template.full', 'ANY::sc_admin/block_content/*,ANY::sc_admin/link/*,ANY::sc_admin/template/*', '2020-05-22 02:25:22', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_admin_role`
--

CREATE TABLE `sc_admin_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_admin_role`
--

INSERT INTO `sc_admin_role` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2020-05-22 02:25:22', NULL),
(2, 'Group only View', 'view.all', '2020-05-22 02:25:22', NULL),
(3, 'Manager', 'manager', '2020-05-22 02:25:22', NULL),
(4, 'Cms manager', 'cms', '2020-05-22 02:25:22', NULL),
(5, 'Accountant', 'accountant', '2020-05-22 02:25:22', NULL),
(6, 'Marketing', 'maketing', '2020-05-22 02:25:22', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_admin_role_menu`
--

CREATE TABLE `sc_admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_admin_role_menu`
--

INSERT INTO `sc_admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 38, '2020-05-22 02:25:22', NULL),
(2, 38, '2020-05-22 02:25:22', NULL),
(3, 38, '2020-05-22 02:25:22', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_admin_role_permission`
--

CREATE TABLE `sc_admin_role_permission` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_admin_role_permission`
--

INSERT INTO `sc_admin_role_permission` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(3, 1, '2020-05-22 02:25:23', NULL),
(3, 2, '2020-05-22 02:25:23', NULL),
(3, 3, '2020-05-22 02:25:23', NULL),
(3, 4, '2020-05-22 02:25:23', NULL),
(3, 5, '2020-05-22 02:25:23', NULL),
(3, 8, '2020-05-22 02:25:23', NULL),
(3, 11, '2020-05-22 02:25:23', NULL),
(3, 14, '2020-05-22 02:25:23', NULL),
(3, 15, '2020-05-22 02:25:23', NULL),
(3, 17, '2020-05-22 02:25:23', NULL),
(3, 18, '2020-05-22 02:25:23', NULL),
(3, 19, '2020-05-22 02:25:23', NULL),
(3, 20, '2020-05-22 02:25:23', NULL),
(3, 21, '2020-05-22 02:25:23', NULL),
(3, 22, '2020-05-22 02:25:23', NULL),
(4, 3, '2020-05-22 02:25:23', NULL),
(4, 5, '2020-05-22 02:25:23', NULL),
(4, 8, '2020-05-22 02:25:23', NULL),
(5, 2, '2020-05-22 02:25:23', NULL),
(5, 3, '2020-05-22 02:25:23', NULL),
(5, 20, '2020-05-22 02:25:23', NULL),
(5, 21, '2020-05-22 02:25:23', NULL),
(6, 2, '2020-05-22 02:25:23', NULL),
(6, 3, '2020-05-22 02:25:23', NULL),
(6, 5, '2020-05-22 02:25:23', NULL),
(6, 8, '2020-05-22 02:25:23', NULL),
(6, 11, '2020-05-22 02:25:23', NULL),
(6, 14, '2020-05-22 02:25:23', NULL),
(6, 15, '2020-05-22 02:25:23', NULL),
(6, 17, '2020-05-22 02:25:23', NULL),
(6, 18, '2020-05-22 02:25:23', NULL),
(6, 19, '2020-05-22 02:25:23', NULL),
(6, 20, '2020-05-22 02:25:23', NULL),
(6, 21, '2020-05-22 02:25:23', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_admin_role_user`
--

CREATE TABLE `sc_admin_role_user` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_admin_role_user`
--

INSERT INTO `sc_admin_role_user` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_admin_store`
--

CREATE TABLE `sc_admin_store` (
  `id` int(10) UNSIGNED NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logofooter` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_active` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `office` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` text CHARACTER SET utf8,
  `instagram` text CHARACTER SET utf8,
  `youtube` text CHARACTER SET utf8
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_admin_store`
--

INSERT INTO `sc_admin_store` (`id`, `logo`, `logofooter`, `phone`, `long_phone`, `email`, `time_active`, `address`, `office`, `warehouse`, `template`, `facebook`, `instagram`, `youtube`) VALUES
(1, 'http://127.0.0.1:8000/data/logo/LOGO-01.png', 'http://127.0.0.1:8000/data/logo/scart-mid.png', '0123456789', 'Support: 0987654321', 'admin-demo@s-cart.org', '', '123st - abc - xyz', NULL, NULL, 'noithat', 'dwvoqAVWWQA', NULL, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_admin_store_description`
--

CREATE TABLE `sc_admin_store_description` (
  `config_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maintain_content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_admin_store_description`
--

INSERT INTO `sc_admin_store_description` (`config_id`, `lang`, `title`, `description`, `keyword`, `maintain_content`) VALUES
(1, 'en', 'Demo S-cart : Free Laravel eCommerce for Business', 'Free website shopping cart for business', '', '<center><img src=\"/images/maintenance.png\" />\r\n<h3><span style=\"color:#e74c3c;\"><strong>Sorry! We are currently doing site maintenance!</strong></span></h3>\r\n</center>'),
(1, 'vi', 'Chào mừng bạn đên với nội thất nha trang', 'Laravel shopping cart for business', '', '<center><img src=\"/images/maintenance.png\" />\r\n<h3><span style=\"color:#e74c3c;\"><strong>Xin lỗi! Hiện tại website đang bảo trì!</strong></span></h3>\r\n</center>');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_admin_user`
--

CREATE TABLE `sc_admin_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_admin_user`
--

INSERT INTO `sc_admin_user` (`id`, `username`, `password`, `name`, `email`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$pCQphhkfgIFt2I.6nkLXgOSDZciMnUqA4D8AHU/umX5KNadoPxzK2', 'Administrator', 'demo-admin@s-cart.org', '/admin/avatar/user.jpg', NULL, '2020-05-22 02:25:23', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_admin_user_permission`
--

CREATE TABLE `sc_admin_user_permission` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_api_connection`
--

CREATE TABLE `sc_api_connection` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apiconnection` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apikey` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire` date DEFAULT NULL,
  `last_active` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_api_connection`
--

INSERT INTO `sc_api_connection` (`id`, `description`, `apiconnection`, `apikey`, `expire`, `last_active`, `status`) VALUES
(1, 'Demo api connection', 'appmobile', '5ec73817e3df1', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_cms_category`
--

CREATE TABLE `sc_cms_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_cms_category_description`
--

CREATE TABLE `sc_cms_category_description` (
  `category_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_cms_content`
--

CREATE TABLE `sc_cms_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_cms_content_description`
--

CREATE TABLE `sc_cms_content_description` (
  `cms_content_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_cms_image`
--

CREATE TABLE `sc_cms_image` (
  `id` int(10) UNSIGNED NOT NULL,
  `content_id` int(11) NOT NULL DEFAULT '0',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_duan`
--

CREATE TABLE `sc_duan` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `html` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_duan`
--

INSERT INTO `sc_duan` (`id`, `image`, `html`, `status`, `created_at`, `updated_at`) VALUES
(2, 'http://127.0.0.1:8000/data/banner/slider-01.jpg', 'KASBDkjasdjkbsadf', 1, '2020-06-19 02:22:30', '2020-06-19 02:22:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_attribute_group`
--

CREATE TABLE `sc_shop_attribute_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'radio,select,checkbox'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_attribute_group`
--

INSERT INTO `sc_shop_attribute_group` (`id`, `name`, `status`, `sort`, `type`) VALUES
(1, 'Color', 1, 1, 'radio'),
(2, 'Size', 1, 2, 'select');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_banner`
--

CREATE TABLE `sc_shop_banner` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `html` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `click` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_banner`
--

INSERT INTO `sc_shop_banner` (`id`, `image`, `url`, `target`, `html`, `status`, `sort`, `click`, `type`, `created_at`, `updated_at`) VALUES
(2, 'http://127.0.0.1:8000/data/banner/slider-01.jpg', NULL, '_self', 'Bộ sưu tập nội thất căn hộ', 1, 0, 0, 0, NULL, '2020-06-18 04:13:50'),
(3, 'http://127.0.0.1:8000/data/banner/slider-02.jpg', NULL, NULL, 'Bộ sưu tập nội thất căn hộ', 1, 0, 0, 0, '2020-06-18 04:12:04', '2020-06-18 04:13:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_block_content`
--

CREATE TABLE `sc_shop_block_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_block_content`
--

INSERT INTO `sc_shop_block_content` (`id`, `name`, `position`, `page`, `type`, `text`, `status`, `sort`) VALUES
(1, 'Facebook code', 'top', '*', 'html', '<div id=\"fb-root\"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = \'//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.8&appId=934208239994473\';\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, \'script\', \'facebook-jssdk\'));\r\n</script>', 1, 0),
(2, 'Google Analytics', 'header', '*', 'html', '<!-- Global site tag (gtag.js) - Google Analytics -->\r\n<script async src=\"https://www.googletagmanager.com/gtag/js?id=UA-128658138-1\"></script>\r\n<script>\r\n  window.dataLayer = window.dataLayer || [];\r\n  function gtag(){dataLayer.push(arguments);}\r\n  gtag(\'js\', new Date());\r\n  gtag(\'config\', \'UA-128658138-1\');\r\n</script>', 1, 0),
(3, 'Product special', 'left', 'product_list', 'view', 'product_special', 1, 1),
(4, 'Brands', 'left', 'item_list', 'view', 'brands_left', 1, 3),
(5, 'Banner home', 'banner_top', 'shop_home', 'view', 'banner_image', 1, 0),
(6, 'Categories', 'left', 'product_list,shop_cart', 'view', 'categories', 1, 4),
(7, 'Product last view', 'left', '', 'view', 'product_lastview', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_brand`
--

CREATE TABLE `sc_shop_brand` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_brand`
--

INSERT INTO `sc_shop_brand` (`id`, `name`, `alias`, `image`, `url`, `status`, `sort`) VALUES
(1, 'Husq', 'husq', '/data/brand/01-181x52.png', '', 1, 0),
(2, 'Ideal', 'ideal', '/data/brand/02-181x52.png', '', 1, 0),
(3, 'Apex', 'apex', '/data/brand/03-181x52.png', '', 1, 0),
(4, 'CST', 'cst', '/data/brand/04-181x52.png', '', 1, 0),
(5, 'Klein', 'klein', '/data/brand/05-181x52.png', '', 1, 0),
(6, 'Metabo', 'metabo', '/data/brand/06-181x52.png', '', 1, 0),
(7, 'Avatar', 'avatar', '/data/brand/07-181x52.png', '', 1, 0),
(8, 'Brand KA', 'brand-ka', '/data/brand/08-181x52.png', '', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_category`
--

CREATE TABLE `sc_shop_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `top` int(11) DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_category`
--

INSERT INTO `sc_shop_category` (`id`, `image`, `alias`, `parent`, `top`, `status`, `sort`) VALUES
(1, '/data/category/img-40.jpg', 'electronics', 0, 1, 1, 0),
(2, '/data/category/img-44.jpg', 'clothing-wears', 0, 1, 1, 0),
(3, '/data/category/img-42.jpg', 'mobile', 1, 1, 1, 0),
(4, '/data/category/img-18.jpg', 'accessaries-extras', 0, 1, 1, 0),
(5, '/data/category/img-14.jpg', 'computers', 1, 1, 1, 0),
(6, '/data/category/img-14.jpg', 'tablets', 1, 0, 1, 0),
(7, '/data/category/img-40.jpg', 'appliances', 1, 0, 1, 0),
(8, '/data/category/img-14.jpg', 'men-clothing', 2, 0, 1, 0),
(9, '/data/category/img-18.jpg', 'women-clothing', 2, 1, 1, 0),
(10, '/data/category/img-14.jpg', 'kid-wear', 2, 0, 1, 0),
(11, '/data/category/img-40.jpg', 'mobile-accessaries', 4, 0, 1, 0),
(12, '/data/category/img-42.jpg4', 'women-accessaries', 4, 0, 1, 3),
(13, '/data/category/img-40.jpg', 'men-accessaries', 4, 0, 1, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_category_description`
--

CREATE TABLE `sc_shop_category_description` (
  `category_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_category_description`
--

INSERT INTO `sc_shop_category_description` (`category_id`, `lang`, `title`, `keyword`, `description`) VALUES
(1, 'en', 'Electronics', '', ''),
(1, 'vi', 'Thiết bị điện tử', '', ''),
(2, 'en', 'Clothing & Wears', '', ''),
(2, 'vi', 'Quần áo', '', ''),
(3, 'en', 'Mobile', '', ''),
(3, 'vi', 'Điện thoại', '', ''),
(4, 'en', 'Accessaries & Extras', '', ''),
(4, 'vi', 'Phụ kiện ', '', ''),
(5, 'en', 'Computers', '', ''),
(5, 'vi', 'Máy tính', '', ''),
(6, 'en', 'Tablets', '', ''),
(6, 'vi', 'Máy tính bảng', '', ''),
(7, 'en', 'Appliances', '', ''),
(7, 'vi', 'Thiết bị', '', ''),
(8, 'en', 'Men\'s Clothing', '', ''),
(8, 'vi', 'Quần áo nam', '', ''),
(9, 'en', 'Women\'s Clothing', '', ''),
(9, 'vi', 'Quần áo nữ', '', ''),
(10, 'en', 'Kid\'s Wear', '', ''),
(10, 'vi', 'Đồ trẻ em', '', ''),
(11, 'en', 'Mobile Accessaries', '', ''),
(11, 'vi', 'Phụ kiện điện thoại', '', ''),
(12, 'en', 'Women\'s Accessaries', '', ''),
(12, 'vi', 'Phụ kiện nữ', '', ''),
(13, 'en', 'Men\'s Accessaries', '', ''),
(13, 'vi', 'Phụ kiện nam', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_country`
--

CREATE TABLE `sc_shop_country` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_country`
--

INSERT INTO `sc_shop_country` (`id`, `code`, `name`) VALUES
(1, 'AL', 'Albania'),
(2, 'DZ', 'Algeria'),
(3, 'DS', 'American Samoa'),
(4, 'AD', 'Andorra'),
(5, 'AO', 'Angola'),
(6, 'AI', 'Anguilla'),
(7, 'AQ', 'Antarctica'),
(8, 'AG', 'Antigua and Barbuda'),
(9, 'AR', 'Argentina'),
(10, 'AM', 'Armenia'),
(11, 'AW', 'Aruba'),
(12, 'AU', 'Australia'),
(13, 'AT', 'Austria'),
(14, 'AZ', 'Azerbaijan'),
(15, 'BS', 'Bahamas'),
(16, 'BH', 'Bahrain'),
(17, 'BD', 'Bangladesh'),
(18, 'BB', 'Barbados'),
(19, 'BY', 'Belarus'),
(20, 'BE', 'Belgium'),
(21, 'BZ', 'Belize'),
(22, 'BJ', 'Benin'),
(23, 'BM', 'Bermuda'),
(24, 'BT', 'Bhutan'),
(25, 'BO', 'Bolivia'),
(26, 'BA', 'Bosnia and Herzegovina'),
(27, 'BW', 'Botswana'),
(28, 'BV', 'Bouvet Island'),
(29, 'BR', 'Brazil'),
(30, 'IO', 'British Indian Ocean Territory'),
(31, 'BN', 'Brunei Darussalam'),
(32, 'BG', 'Bulgaria'),
(33, 'BF', 'Burkina Faso'),
(34, 'BI', 'Burundi'),
(35, 'KH', 'Cambodia'),
(36, 'CM', 'Cameroon'),
(37, 'CA', 'Canada'),
(38, 'CV', 'Cape Verde'),
(39, 'KY', 'Cayman Islands'),
(40, 'CF', 'Central African Republic'),
(41, 'TD', 'Chad'),
(42, 'CL', 'Chile'),
(43, 'CN', 'China'),
(44, 'CX', 'Christmas Island'),
(45, 'CC', 'Cocos (Keeling) Islands'),
(46, 'CO', 'Colombia'),
(47, 'KM', 'Comoros'),
(48, 'CG', 'Congo'),
(49, 'CK', 'Cook Islands'),
(50, 'CR', 'Costa Rica'),
(51, 'HR', 'Croatia (Hrvatska)'),
(52, 'CU', 'Cuba'),
(53, 'CY', 'Cyprus'),
(54, 'CZ', 'Czech Republic'),
(55, 'DK', 'Denmark'),
(56, 'DJ', 'Djibouti'),
(57, 'DM', 'Dominica'),
(58, 'DO', 'Dominican Republic'),
(59, 'TP', 'East Timor'),
(60, 'EC', 'Ecuador'),
(61, 'EG', 'Egypt'),
(62, 'SV', 'El Salvador'),
(63, 'GQ', 'Equatorial Guinea'),
(64, 'ER', 'Eritrea'),
(65, 'EE', 'Estonia'),
(66, 'ET', 'Ethiopia'),
(67, 'FK', 'Falkland Islands (Malvinas)'),
(68, 'FO', 'Faroe Islands'),
(69, 'FJ', 'Fiji'),
(70, 'FI', 'Finland'),
(71, 'FR', 'France'),
(72, 'FX', 'France, Metropolitan'),
(73, 'GF', 'French Guiana'),
(74, 'PF', 'French Polynesia'),
(75, 'TF', 'French Southern Territories'),
(76, 'GA', 'Gabon'),
(77, 'GM', 'Gambia'),
(78, 'GE', 'Georgia'),
(79, 'DE', 'Germany'),
(80, 'GH', 'Ghana'),
(81, 'GI', 'Gibraltar'),
(82, 'GK', 'Guernsey'),
(83, 'GR', 'Greece'),
(84, 'GL', 'Greenland'),
(85, 'GD', 'Grenada'),
(86, 'GP', 'Guadeloupe'),
(87, 'GU', 'Guam'),
(88, 'GT', 'Guatemala'),
(89, 'GN', 'Guinea'),
(90, 'GW', 'Guinea-Bissau'),
(91, 'GY', 'Guyana'),
(92, 'HT', 'Haiti'),
(93, 'HM', 'Heard and Mc Donald Islands'),
(94, 'HN', 'Honduras'),
(95, 'HK', 'Hong Kong'),
(96, 'HU', 'Hungary'),
(97, 'IS', 'Iceland'),
(98, 'IN', 'India'),
(99, 'IM', 'Isle of Man'),
(100, 'ID', 'Indonesia'),
(101, 'IR', 'Iran (Islamic Republic of)'),
(102, 'IQ', 'Iraq'),
(103, 'IE', 'Ireland'),
(104, 'IL', 'Israel'),
(105, 'IT', 'Italy'),
(106, 'CI', 'Ivory Coast'),
(107, 'JE', 'Jersey'),
(108, 'JM', 'Jamaica'),
(109, 'JP', 'Japan'),
(110, 'JO', 'Jordan'),
(111, 'KZ', 'Kazakhstan'),
(112, 'KE', 'Kenya'),
(113, 'KI', 'Kiribati'),
(114, 'KP', 'Korea,Democratic People\'s Republic of'),
(115, 'KR', 'Korea, Republic of'),
(116, 'XK', 'Kosovo'),
(117, 'KW', 'Kuwait'),
(118, 'KG', 'Kyrgyzstan'),
(119, 'LA', 'Lao People\'s Democratic Republic'),
(120, 'LV', 'Latvia'),
(121, 'LB', 'Lebanon'),
(122, 'LS', 'Lesotho'),
(123, 'LR', 'Liberia'),
(124, 'LY', 'Libyan Arab Jamahiriya'),
(125, 'LI', 'Liechtenstein'),
(126, 'LT', 'Lithuania'),
(127, 'LU', 'Luxembourg'),
(128, 'MO', 'Macau'),
(129, 'MK', 'Macedonia'),
(130, 'MG', 'Madagascar'),
(131, 'MW', 'Malawi'),
(132, 'MY', 'Malaysia'),
(133, 'MV', 'Maldives'),
(134, 'ML', 'Mali'),
(135, 'MT', 'Malta'),
(136, 'MH', 'Marshall Islands'),
(137, 'MQ', 'Martinique'),
(138, 'MR', 'Mauritania'),
(139, 'MU', 'Mauritius'),
(140, 'TY', 'Mayotte'),
(141, 'MX', 'Mexico'),
(142, 'FM', 'Micronesia, Federated States of'),
(143, 'MD', 'Moldova, Republic of'),
(144, 'MC', 'Monaco'),
(145, 'MN', 'Mongolia'),
(146, 'ME', 'Montenegro'),
(147, 'MS', 'Montserrat'),
(148, 'MA', 'Morocco'),
(149, 'MZ', 'Mozambique'),
(150, 'MM', 'Myanmar'),
(151, 'NA', 'Namibia'),
(152, 'NR', 'Nauru'),
(153, 'NP', 'Nepal'),
(154, 'NL', 'Netherlands'),
(155, 'AN', 'Netherlands Antilles'),
(156, 'NC', 'New Caledonia'),
(157, 'NZ', 'New Zealand'),
(158, 'NI', 'Nicaragua'),
(159, 'NE', 'Niger'),
(160, 'NG', 'Nigeria'),
(161, 'NU', 'Niue'),
(162, 'NF', 'Norfolk Island'),
(163, 'MP', 'Northern Mariana Islands'),
(164, 'NO', 'Norway'),
(165, 'OM', 'Oman'),
(166, 'PK', 'Pakistan'),
(167, 'PW', 'Palau'),
(168, 'PS', 'Palestine'),
(169, 'PA', 'Panama'),
(170, 'PG', 'Papua New Guinea'),
(171, 'PY', 'Paraguay'),
(172, 'PE', 'Peru'),
(173, 'PH', 'Philippines'),
(174, 'PN', 'Pitcairn'),
(175, 'PL', 'Poland'),
(176, 'PT', 'Portugal'),
(177, 'PR', 'Puerto Rico'),
(178, 'QA', 'Qatar'),
(179, 'RE', 'Reunion'),
(180, 'RO', 'Romania'),
(181, 'RU', 'Russian Federation'),
(182, 'RW', 'Rwanda'),
(183, 'KN', 'Saint Kitts and Nevis'),
(184, 'LC', 'Saint Lucia'),
(185, 'VC', 'Saint Vincent and the Grenadines'),
(186, 'WS', 'Samoa'),
(187, 'SM', 'San Marino'),
(188, 'ST', 'Sao Tome and Principe'),
(189, 'SA', 'Saudi Arabia'),
(190, 'SN', 'Senegal'),
(191, 'RS', 'Serbia'),
(192, 'SC', 'Seychelles'),
(193, 'SL', 'Sierra Leone'),
(194, 'SG', 'Singapore'),
(195, 'SK', 'Slovakia'),
(196, 'SI', 'Slovenia'),
(197, 'SB', 'Solomon Islands'),
(198, 'SO', 'Somalia'),
(199, 'ZA', 'South Africa'),
(200, 'GS', 'South Georgia South Sandwich Islands'),
(201, 'SS', 'South Sudan'),
(202, 'ES', 'Spain'),
(203, 'LK', 'Sri Lanka'),
(204, 'SH', 'St. Helena'),
(205, 'PM', 'St. Pierre and Miquelon'),
(206, 'SD', 'Sudan'),
(207, 'SR', 'Suriname'),
(208, 'SJ', 'Svalbard and Jan Mayen Islands'),
(209, 'SZ', 'Swaziland'),
(210, 'SE', 'Sweden'),
(211, 'CH', 'Switzerland'),
(212, 'SY', 'Syrian Arab Republic'),
(213, 'TW', 'Taiwan'),
(214, 'TJ', 'Tajikistan'),
(215, 'TZ', 'Tanzania, United Republic of'),
(216, 'TH', 'Thailand'),
(217, 'TG', 'Togo'),
(218, 'TK', 'Tokelau'),
(219, 'TO', 'Tonga'),
(220, 'TT', 'Trinidad and Tobago'),
(221, 'TN', 'Tunisia'),
(222, 'TR', 'Turkey'),
(223, 'TM', 'Turkmenistan'),
(224, 'TC', 'Turks and Caicos Islands'),
(225, 'TV', 'Tuvalu'),
(226, 'UG', 'Uganda'),
(227, 'UA', 'Ukraine'),
(228, 'AE', 'United Arab Emirates'),
(229, 'GB', 'United Kingdom'),
(230, 'US', 'United States'),
(231, 'UM', 'United States minor outlying islands'),
(232, 'UY', 'Uruguay'),
(233, 'UZ', 'Uzbekistan'),
(234, 'VU', 'Vanuatu'),
(235, 'VA', 'Vatican City State'),
(236, 'VE', 'Venezuela'),
(237, 'VN', 'Vietnam'),
(238, 'VG', 'Virgin Islands (British)'),
(239, 'VI', 'Virgin Islands (U.S.)'),
(240, 'WF', 'Wallis and Futuna Islands'),
(241, 'EH', 'Western Sahara'),
(242, 'YE', 'Yemen'),
(243, 'ZR', 'Zaire'),
(244, 'ZM', 'Zambia'),
(245, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_currency`
--

CREATE TABLE `sc_shop_currency` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double(8,2) NOT NULL,
  `precision` tinyint(4) NOT NULL DEFAULT '2',
  `symbol_first` tinyint(4) NOT NULL DEFAULT '0',
  `thousands` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_currency`
--

INSERT INTO `sc_shop_currency` (`id`, `name`, `code`, `symbol`, `exchange_rate`, `precision`, `symbol_first`, `thousands`, `status`, `sort`) VALUES
(1, 'USD Dola', 'USD', '$', 1.00, 0, 1, ',', 0, 0),
(2, 'VietNam Dong', 'VND', '₫', 20.00, 0, 0, ',', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_discount`
--

CREATE TABLE `sc_shop_discount` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reward` int(11) NOT NULL DEFAULT '2',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'point' COMMENT 'point - Point; percent - %',
  `data` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limit` int(11) NOT NULL DEFAULT '1',
  `used` int(11) NOT NULL DEFAULT '0',
  `login` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_discount_user`
--

CREATE TABLE `sc_shop_discount_user` (
  `user_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `log` text COLLATE utf8mb4_unicode_ci,
  `used_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_email_template`
--

CREATE TABLE `sc_shop_email_template` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_email_template`
--

INSERT INTO `sc_shop_email_template` (`id`, `name`, `group`, `text`, `status`) VALUES
(1, 'Reset password', 'forgot_password', '<h1 style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#2f3133;font-size:19px;font-weight:bold;margin-top:0;text-align:left\">{{$title}}</h1>\r\n<p style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#74787e;font-size:16px;line-height:1.5em;margin-top:0;text-align:left\">{{$reason_sendmail}}</p>\r\n                    <table class=\"action\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;margin:30px auto;padding:0;text-align:center;width:100%\">\r\n                      <tbody><tr>\r\n                        <td align=\"center\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box\">\r\n                          <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box\">\r\n                            <tbody><tr>\r\n                              <td align=\"center\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box\">\r\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box\">\r\n                                  <tbody><tr>\r\n                                    <td style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box\">\r\n                                      <a href=\"{{$reset_link}}\" class=\"button button-primary\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;border-radius:3px;color:#fff;display:inline-block;text-decoration:none;background-color:#3097d1;border-top:10px solid #3097d1;border-right:18px solid #3097d1;border-bottom:10px solid #3097d1;border-left:18px solid #3097d1\" target=\"_blank\">{{$reset_button}}</a>\r\n                                    </td>\r\n                                  </tr>\r\n                                </tbody>\r\n                              </table>\r\n                              </td>\r\n                            </tr>\r\n                          </tbody>\r\n                        </table>\r\n                        </td>\r\n                      </tr>\r\n                    </tbody>\r\n                  </table>\r\n                    <p style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#74787e;font-size:16px;line-height:1.5em;margin-top:0;text-align:left\">\r\n                      {{$note_sendmail}}\r\n                    </p>\r\n                    <table class=\"subcopy\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;border-top:1px solid #edeff2;margin-top:25px;padding-top:25px\">\r\n                    <tbody><tr>\r\n                      <td style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box\">\r\n                        <p style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#74787e;line-height:1.5em;margin-top:0;text-align:left;font-size:12px\">{{$note_access_link}}: <a href=\"{{$reset_link}}\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#3869d4\" target=\"_blank\">{{$reset_link}}</a></p>\r\n                          </td>\r\n                        </tr>\r\n                      </tbody>\r\n                    </table>', 1),
(2, 'Welcome new customer', 'welcome_customer', '<h1 style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#2f3133;font-size:19px;font-weight:bold;margin-top:0;text-align:center\">{{$title}}</h1>\r\n<p style=\"text-align:center;\">Welcome to my site!</p>', 1),
(3, 'Send form contact to admin', 'contact_to_admin', '<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tr>\r\n        <td>\r\n            <b>Name</b>: {{$name}}<br>\r\n            <b>Email</b>: {{$email}}<br>\r\n            <b>Phone</b>: {{$phone}}<br>\r\n        </td>\r\n    </tr>\r\n</table>\r\n<hr>\r\n<p style=\"text-align: center;\">Content:<br>\r\n<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\r\n    <tr>\r\n        <td>{{$content}}</td>\r\n    </tr>\r\n</table>', 1),
(4, 'New order to admin', 'order_success_to_admin', '<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\r\n                        <tr>\r\n                            <td>\r\n                                <b>Order ID</b>: {{$orderID}}<br>\r\n                                <b>Customer name</b>: {{$toname}}<br>\r\n                                <b>Email</b>: {{$email}}<br>\r\n                                <b>Address</b>: {{$address}}<br>\r\n                                <b>Phone</b>: {{$phone}}<br>\r\n                                <b>Order note</b>: {{$comment}}\r\n                            </td>\r\n                        </tr>\r\n                    </table>\r\n                    <hr>\r\n                    <p style=\"text-align: center;\">Order detail:<br>\r\n                    ===================================<br></p>\r\n                    <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" border=\"1\">\r\n                        {{$orderDetail}}\r\n                        <tr>\r\n                            <td colspan=\"2\"></td>\r\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Sub total</td>\r\n                            <td colspan=\"2\" align=\"right\">{{$subtotal}}</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"2\"></td>\r\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Shipping fee</td>\r\n                            <td colspan=\"2\" align=\"right\">{{$shipping}}</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"2\"></td>\r\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Discount</td>\r\n                            <td colspan=\"2\" align=\"right\">{{$discount}}</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"2\"></td>\r\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Total</td>\r\n                            <td colspan=\"2\" align=\"right\">{{$total}}</td>\r\n                        </tr>\r\n                    </table>', 1),
(5, 'New order to customr', 'order_success_to_customer', '<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\r\n                        <tr>\r\n                            <td>\r\n                                <b>Order ID</b>: {{$orderID}}<br>\r\n                                <b>Customer name</b>: {{$toname}}<br>\r\n                                <b>Address</b>: {{$address}}<br>\r\n                                <b>Phone</b>: {{$phone}}<br>\r\n                                <b>Order note</b>: {{$comment}}\r\n                            </td>\r\n                        </tr>\r\n                    </table>\r\n                    <hr>\r\n                    <p style=\"text-align: center;\">Order detail:<br>\r\n                    ===================================<br></p>\r\n                    <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" border=\"1\">\r\n                        {{$orderDetail}}\r\n                        <tr>\r\n                            <td colspan=\"2\"></td>\r\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Sub total</td>\r\n                            <td colspan=\"2\" align=\"right\">{{$subtotal}}</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"2\"></td>\r\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Shipping fee</td>\r\n                            <td colspan=\"2\" align=\"right\">{{$shipping}}</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"2\"></td>\r\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Discount</td>\r\n                            <td colspan=\"2\" align=\"right\">{{$discount}}</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"2\"></td>\r\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Total</td>\r\n                            <td colspan=\"2\" align=\"right\">{{$total}}</td>\r\n                        </tr>\r\n                    </table>', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_language`
--

CREATE TABLE `sc_shop_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) DEFAULT '0' COMMENT 'Layout RTL',
  `sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_language`
--

INSERT INTO `sc_shop_language` (`id`, `name`, `code`, `icon`, `status`, `rtl`, `sort`) VALUES
(1, 'English', 'en', '/data/language/flag_uk.png', 0, 0, 1),
(2, 'Tiếng Việt', 'vi', '/data/language/flag_vn.png', 1, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_layout_page`
--

CREATE TABLE `sc_shop_layout_page` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_layout_page`
--

INSERT INTO `sc_shop_layout_page` (`id`, `key`, `name`) VALUES
(1, 'shop_home', 'Home page'),
(2, 'product_list', 'Product list'),
(3, 'product_detail', 'Product detail'),
(4, 'shop_cart', 'Shop cart'),
(5, 'shop_auth', 'Account auth'),
(6, 'shop_profile', 'Account profile'),
(7, 'item_list', 'Item list'),
(8, 'news_list', 'News list'),
(9, 'news_detail', 'News detail'),
(10, 'shop_page', 'Page detail'),
(11, 'shop_contact', 'Contact page');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_layout_position`
--

CREATE TABLE `sc_shop_layout_position` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_layout_position`
--

INSERT INTO `sc_shop_layout_position` (`id`, `key`, `name`) VALUES
(1, 'meta', 'Meta'),
(2, 'header', 'Header'),
(3, 'top', 'Top'),
(4, 'bottom', 'Bottom'),
(5, 'footer', 'Footer'),
(6, 'left', 'Column left'),
(7, 'right', 'Column right'),
(8, 'banner_top', 'Banner top');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_length`
--

CREATE TABLE `sc_shop_length` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_length`
--

INSERT INTO `sc_shop_length` (`id`, `name`, `description`) VALUES
(1, 'mm', 'Millimeter'),
(2, 'cm', 'Centimeter'),
(3, 'm', 'Meter'),
(4, 'in', 'Inch');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_link`
--

CREATE TABLE `sc_shop_link` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_link`
--

INSERT INTO `sc_shop_link` (`id`, `name`, `url`, `target`, `group`, `module`, `status`, `sort`) VALUES
(1, 'lang::front.contact', 'route::page.detail::contact', '_self', 'menu', '', 1, 3),
(2, 'lang::front.about', 'route::page.detail::about', '_self', 'menu', '', 1, 4),
(3, 'lang::front.my_profile', '/member/login.html', '_self', 'footer', '', 1, 5),
(4, 'lang::front.compare_page', '/compare.html', '_self', 'footer', '', 1, 4),
(5, 'lang::front.wishlist_page', 'route::wishlist', '_self', 'footer', '', 1, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_news`
--

CREATE TABLE `sc_shop_news` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_news`
--

INSERT INTO `sc_shop_news` (`id`, `image`, `alias`, `sort`, `status`, `created_at`, `updated_at`) VALUES
(1, 'http://127.0.0.1:8000/data/content/img-22.jpg', 'tra-thao-moc-8-loai-tot-cho-suc-khoe-ma-ban-nen-dung', 0, 1, '2020-06-17 06:51:09', '2020-06-17 06:51:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_news_description`
--

CREATE TABLE `sc_shop_news_description` (
  `shop_news_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_news_description`
--

INSERT INTO `sc_shop_news_description` (`shop_news_id`, `lang`, `title`, `keyword`, `description`, `content`) VALUES
(1, 'vi', 'Trà Thảo Mộc: 8 Loại Tốt Cho Sức Khỏe Mà Bạn Nên Dùng', 'Trà Thảo Mộc: 8 Loại Tốt Cho Sức Khỏe Mà Bạn Nên Dùng', 'gWAGSZ', 'AFGAWVA');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_order`
--

CREATE TABLE `sc_shop_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `subtotal` int(11) DEFAULT '0',
  `shipping` int(11) DEFAULT '0',
  `discount` int(11) DEFAULT '0',
  `payment_status` int(11) NOT NULL DEFAULT '1',
  `shipping_status` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '0',
  `tax` int(11) DEFAULT '0',
  `total` int(11) DEFAULT '0',
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double(8,2) DEFAULT NULL,
  `received` int(11) DEFAULT '0',
  `balance` int(11) DEFAULT '0',
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ward` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'VN',
  `company` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_order`
--

INSERT INTO `sc_shop_order` (`id`, `user_id`, `subtotal`, `shipping`, `discount`, `payment_status`, `shipping_status`, `status`, `tax`, `total`, `currency`, `exchange_rate`, `received`, `balance`, `first_name`, `last_name`, `address1`, `address2`, `address`, `province`, `district`, `ward`, `country`, `company`, `postcode`, `phone`, `email`, `comment`, `payment_method`, `shipping_method`, `user_agent`, `ip`, `transaction`, `created_at`, `updated_at`) VALUES
(1, 1, 5000, 2000, 0, 1, 1, 1, 0, 7000, 'USD', 1.00, 0, 7000, 'Naruto', 'Kun', 'ADDRESS 1', 'ADDRESS 2', NULL, 'Điện Biên', 'Huyện Nậm Pồ', 'Xã Pa Tần', 'VN', NULL, NULL, '667151172', 'test@test.com', 'ok', 'Cash', 'ShippingStandard', NULL, NULL, NULL, '2020-05-22 02:25:27', NULL),
(2, 0, 3000000, 0, 0, 1, 1, 1, 300000, 3300000, 'VND', 20.00, 0, 3300000, 'EHSEDHEW', 'EHESSHG', 'sxhwss', 'faszgafa', NULL, 'Điện Biên', 'Huyện Nậm Pồ', 'Xã Pa Tần', 'DZ', '', '', '0979397925', 'phivinhcong@gmail.com', 'ehshszzhsgsa', 'Cash', 'ShippingStandard', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '127.0.0.1', NULL, '2020-06-18 09:11:26', '2020-06-18 09:11:26'),
(3, 0, 100000, 400, 0, 1, 1, 1, 10000, 110400, 'VND', 20.00, 0, 110400, 'EHSEDHEW', 'EHESSHG', 'sxhwss', 'faszgafa', NULL, 'Điện Biên', 'Huyện Nậm Pồ', 'Xã Pa Tần', 'DZ', '', '', '0979397925', 'phivinhcong@gmail.com', 'ehshszzhsgsa', 'Cash', 'ShippingStandard', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '127.0.0.1', NULL, '2020-06-18 09:12:42', '2020-06-18 09:12:42'),
(4, 0, 60000, 400, 0, 1, 1, 1, 6000, 66400, 'VND', 20.00, 0, 66400, 'Noelia Batz', 'Keeling', '', '', 'afbsvbhvuc', 'Điện Biên', 'Huyện Nậm Pồ', 'Xã Pa Tần', 'VN', '', '', '0979397925', 'phivinhcong@gmail.com', '', 'Cash', 'ShippingStandard', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '127.0.0.1', NULL, '2020-06-22 04:46:57', '2020-06-22 04:46:57'),
(5, 0, 100000, 400, 0, 1, 1, 1, 10000, 110400, 'VND', 20.00, 0, 110400, 'Noelia Batz', 'Keeling', '', '', 'afbsvbhvuc', 'Sơn La', 'Huyện Thuận Châu', 'Xã Phỏng Lái', 'VN', '', '', '0979397925', 'phivinhcong@gmail.com', '', 'Cash', 'ShippingStandard', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '127.0.0.1', NULL, '2020-06-22 04:59:40', '2020-06-22 04:59:40'),
(6, 2, 100000, 400, 0, 1, 1, 1, 10000, 110400, 'VND', 20.00, 0, 110400, 'Noelia Batz', 'Keeling', '', '', 'afbsvbhvuc', 'Thái Bình', 'Thành phố Thái Bình', 'Phường Đề Thám', 'VN', '', '', '0979397925', 'phivinhcong@gmail.com', '', 'Cash', 'ShippingStandard', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '127.0.0.1', NULL, '2020-06-22 05:36:30', '2020-06-22 05:36:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_order_detail`
--

CREATE TABLE `sc_shop_order_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  `qty` int(11) NOT NULL DEFAULT '0',
  `total_price` int(11) NOT NULL DEFAULT '0',
  `tax` int(11) NOT NULL DEFAULT '0',
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double(8,2) DEFAULT NULL,
  `attribute` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_order_detail`
--

INSERT INTO `sc_shop_order_detail` (`id`, `order_id`, `product_id`, `name`, `price`, `qty`, `total_price`, `tax`, `sku`, `currency`, `exchange_rate`, `attribute`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Easy Polo Black Edition 1', 5000, 1, 5000, 0, 'ABCZZ', 'USD', 1.00, '[]', NULL, NULL),
(2, 2, 14, 'Easy Polo Black Edition 14', 300000, 1, 300000, 30000, 'LCD12864-3D', 'VND', 20.00, '[]', '2020-06-18 09:11:26', '2020-06-18 09:11:26'),
(3, 2, 6, 'Easy Polo Black Edition 6', 300000, 4, 1200000, 120000, 'TMC2208', 'VND', 20.00, '[]', '2020-06-18 09:11:26', '2020-06-18 09:11:26'),
(4, 2, 3, 'Easy Polo Black Edition 3', 300000, 5, 1500000, 150000, 'CLOCKFAN1', 'VND', 20.00, '[]', '2020-06-18 09:11:26', '2020-06-18 09:11:26'),
(5, 3, 1, 'Easy Polo Black Edition 1', 100000, 1, 100000, 10000, 'ABCZZ', 'VND', 20.00, '[]', '2020-06-18 09:12:42', '2020-06-18 09:12:42'),
(6, 4, 2, 'Easy Polo Black Edition 2', 60000, 1, 60000, 6000, 'LEDFAN1', 'VND', 20.00, '[]', '2020-06-22 04:46:57', '2020-06-22 04:46:57'),
(7, 5, 1, 'Easy Polo Black Edition 1', 100000, 1, 100000, 10000, 'ABCZZ', 'VND', 20.00, '[]', '2020-06-22 04:59:40', '2020-06-22 04:59:40'),
(8, 6, 1, 'Easy Polo Black Edition 1', 100000, 1, 100000, 10000, 'ABCZZ', 'VND', 20.00, '[]', '2020-06-22 05:36:30', '2020-06-22 05:36:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_order_history`
--

CREATE TABLE `sc_shop_order_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `content` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `add_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_order_history`
--

INSERT INTO `sc_shop_order_history` (`id`, `order_id`, `content`, `admin_id`, `user_id`, `order_status_id`, `add_date`) VALUES
(1, 1, 'New order', 0, 1, 1, '2020-05-22 09:25:27'),
(2, 2, 'New order', 0, 0, 1, '2020-06-18 16:11:26'),
(3, 3, 'New order', 0, 0, 1, '2020-06-18 16:12:42'),
(4, 4, 'New order', 0, 0, 1, '2020-06-22 11:46:57'),
(5, 5, 'New order', 0, 0, 1, '2020-06-22 11:59:40'),
(6, 6, 'New order', 0, 2, 1, '2020-06-22 12:36:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_order_status`
--

CREATE TABLE `sc_shop_order_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_order_status`
--

INSERT INTO `sc_shop_order_status` (`id`, `name`) VALUES
(1, 'New'),
(2, 'Processing'),
(3, 'Hold'),
(4, 'Canceled'),
(5, 'Done'),
(6, 'Failed');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_order_total`
--

CREATE TABLE `sc_shop_order_total` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  `text` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_order_total`
--

INSERT INTO `sc_shop_order_total` (`id`, `order_id`, `title`, `code`, `value`, `text`, `sort`, `created_at`, `updated_at`) VALUES
(1, 1, 'Subtotal', 'subtotal', 5000, NULL, 1, NULL, NULL),
(2, 1, 'Shipping', 'shipping', 2000, NULL, 10, NULL, NULL),
(3, 1, 'Discount', 'discount', 0, NULL, 20, NULL, NULL),
(4, 1, 'Total', 'total', 7000, NULL, 100, NULL, NULL),
(5, 1, 'Received', 'received', 0, NULL, 200, NULL, NULL),
(6, 2, 'Tiền hàng', 'subtotal', 3000000, '3,000,000₫', 1, '2020-06-18 09:11:26', NULL),
(7, 2, 'Thuế', 'tax', 300000, '300,000₫', 2, '2020-06-18 09:11:26', NULL),
(8, 2, 'Vận chuyển cơ bản', 'shipping', 0, '0₫', 10, '2020-06-18 09:11:26', NULL),
(9, 2, 'Giảm giá', 'discount', 0, '0', 20, '2020-06-18 09:11:26', NULL),
(10, 2, 'Tổng tiền', 'total', 3300000, '3,300,000₫', 100, '2020-06-18 09:11:26', NULL),
(11, 2, 'Đã nhận', 'received', 0, '0', 200, '2020-06-18 09:11:26', NULL),
(12, 3, 'Tiền hàng', 'subtotal', 100000, '100,000₫', 1, '2020-06-18 09:12:42', NULL),
(13, 3, 'Thuế', 'tax', 10000, '10,000₫', 2, '2020-06-18 09:12:42', NULL),
(14, 3, 'Vận chuyển cơ bản', 'shipping', 400, '400₫', 10, '2020-06-18 09:12:42', NULL),
(15, 3, 'Giảm giá', 'discount', 0, '0', 20, '2020-06-18 09:12:42', NULL),
(16, 3, 'Tổng tiền', 'total', 110400, '110,400₫', 100, '2020-06-18 09:12:42', NULL),
(17, 3, 'Đã nhận', 'received', 0, '0', 200, '2020-06-18 09:12:42', NULL),
(18, 4, 'Tiền hàng', 'subtotal', 60000, '60,000₫', 1, '2020-06-22 04:46:57', NULL),
(19, 4, 'Thuế', 'tax', 6000, '6,000₫', 2, '2020-06-22 04:46:57', NULL),
(20, 4, 'Vận chuyển cơ bản', 'shipping', 400, '400₫', 10, '2020-06-22 04:46:57', NULL),
(21, 4, 'Giảm giá', 'discount', 0, '0', 20, '2020-06-22 04:46:57', NULL),
(22, 4, 'Tổng tiền', 'total', 66400, '66,400₫', 100, '2020-06-22 04:46:57', NULL),
(23, 4, 'Đã nhận', 'received', 0, '0', 200, '2020-06-22 04:46:57', NULL),
(24, 5, 'Tiền hàng', 'subtotal', 100000, '100,000₫', 1, '2020-06-22 04:59:40', NULL),
(25, 5, 'Thuế', 'tax', 10000, '10,000₫', 2, '2020-06-22 04:59:40', NULL),
(26, 5, 'Vận chuyển cơ bản', 'shipping', 400, '400₫', 10, '2020-06-22 04:59:40', NULL),
(27, 5, 'Giảm giá', 'discount', 0, '0', 20, '2020-06-22 04:59:40', NULL),
(28, 5, 'Tổng tiền', 'total', 110400, '110,400₫', 100, '2020-06-22 04:59:40', NULL),
(29, 5, 'Đã nhận', 'received', 0, '0', 200, '2020-06-22 04:59:40', NULL),
(30, 6, 'Tiền hàng', 'subtotal', 100000, '100,000₫', 1, '2020-06-22 05:36:30', NULL),
(31, 6, 'Thuế', 'tax', 10000, '10,000₫', 2, '2020-06-22 05:36:30', NULL),
(32, 6, 'Vận chuyển cơ bản', 'shipping', 400, '400₫', 10, '2020-06-22 05:36:30', NULL),
(33, 6, 'Giảm giá', 'discount', 0, '0', 20, '2020-06-22 05:36:30', NULL),
(34, 6, 'Tổng tiền', 'total', 110400, '110,400₫', 100, '2020-06-22 05:36:30', NULL),
(35, 6, 'Đã nhận', 'received', 0, '0', 200, '2020-06-22 05:36:30', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_page`
--

CREATE TABLE `sc_shop_page` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_page`
--

INSERT INTO `sc_shop_page` (`id`, `image`, `alias`, `status`) VALUES
(1, '', 'about', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_page_description`
--

CREATE TABLE `sc_shop_page_description` (
  `page_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_page_description`
--

INSERT INTO `sc_shop_page_description` (`page_id`, `lang`, `title`, `keyword`, `description`, `content`) VALUES
(1, 'en', 'About', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n'),
(1, 'vi', 'Giới thiệu', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_password_resets`
--

CREATE TABLE `sc_shop_password_resets` (
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_payment_status`
--

CREATE TABLE `sc_shop_payment_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_payment_status`
--

INSERT INTO `sc_shop_payment_status` (`id`, `name`) VALUES
(1, 'Unpaid'),
(2, 'Partial payment'),
(3, 'Paid'),
(4, 'Refurn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_product`
--

CREATE TABLE `sc_shop_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `upc` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'upc code',
  `ean` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ean code',
  `jan` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jan code',
  `isbn` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'isbn code',
  `mpn` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'mpn code',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int(11) DEFAULT '0',
  `supplier_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT '0',
  `cost` int(11) DEFAULT '0',
  `stock` int(11) DEFAULT '0',
  `sold` int(11) DEFAULT '0',
  `minimum` int(11) DEFAULT '0',
  `weight_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` int(11) DEFAULT '0',
  `length_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `length` int(11) DEFAULT '0',
  `width` int(11) DEFAULT '0',
  `height` int(11) DEFAULT '0',
  `kind` tinyint(4) DEFAULT '0' COMMENT '0:single, 1:bundle, 2:group',
  `virtual` tinyint(4) DEFAULT '0' COMMENT '0:physical, 1:download, 2:only view, 3: Service',
  `tax_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '0:No-tax, auto: Use tax default',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `view` int(11) NOT NULL DEFAULT '0',
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_lastview` datetime DEFAULT NULL,
  `date_available` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_product`
--

INSERT INTO `sc_shop_product` (`id`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `image`, `brand_id`, `supplier_id`, `price`, `cost`, `stock`, `sold`, `minimum`, `weight_class`, `weight`, `length_class`, `length`, `width`, `height`, `kind`, `virtual`, `tax_id`, `status`, `sort`, `view`, `alias`, `date_lastview`, `date_available`, `created_at`, `updated_at`) VALUES
(1, 'ABCZZ', NULL, NULL, NULL, NULL, NULL, '/data/product/img-1.jpg', 1, '1', 15000, 10000, 96, 4, 0, '', 0, '', 0, 0, 0, 0, 0, 'auto', 1, 0, 47, 'demo-alias-name-product-1', '2020-06-22 12:38:43', '2020-06-22', NULL, '2020-06-22 05:38:43'),
(2, 'LEDFAN1', NULL, NULL, NULL, NULL, NULL, '/data/product/img-4.jpg', 1, '1', 15000, 10000, 99, 1, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 3, 'demo-alias-name-product-2', '2020-06-22 11:22:11', NULL, NULL, '2020-06-22 04:46:57'),
(3, 'CLOCKFAN1', NULL, NULL, NULL, NULL, NULL, '/data/product/img-11.jpg', 2, '1', 15000, 10000, 95, 5, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 10, 'demo-alias-name-product-3', '2020-06-18 15:59:19', NULL, NULL, '2020-06-18 09:11:26'),
(4, 'CLOCKFAN2', NULL, NULL, NULL, NULL, NULL, '/data/product/img-14.jpg', 3, '1', 15000, 10000, 100, 0, 10, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 0, 'demo-alias-name-product-4', NULL, NULL, NULL, NULL),
(5, 'CLOCKFAN3', NULL, NULL, NULL, NULL, NULL, '/data/product/img-15.jpg', 1, '1', 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 1, 'demo-alias-name-product-5', '2020-06-18 15:59:33', NULL, NULL, '2020-06-18 08:59:33'),
(6, 'TMC2208', NULL, NULL, NULL, NULL, NULL, '/data/product/img-16.jpg', 1, '1', 15000, 10000, 96, 4, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 21, 'demo-alias-name-product-6', '2020-06-18 15:59:27', NULL, NULL, '2020-06-18 09:11:26'),
(7, 'FILAMENT', NULL, NULL, NULL, NULL, NULL, '/data/product/img-17.jpg', 2, '1', 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 0, 'demo-alias-name-product-7', NULL, NULL, NULL, NULL),
(8, 'A4988', NULL, NULL, NULL, NULL, NULL, '/data/product/img-18.jpg', 2, '1', 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 0, 'demo-alias-name-product-8', NULL, NULL, NULL, NULL),
(9, 'ANYCUBIC-P', NULL, NULL, NULL, NULL, NULL, '/data/product/img-20.jpg', 2, '1', 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 0, 'demo-alias-name-product-9', NULL, NULL, NULL, NULL),
(10, '3DHLFD-P', NULL, NULL, NULL, NULL, NULL, '/data/product/img-21.jpg', 4, '1', 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 1, 'demo-alias-name-product-10', '2020-06-18 15:59:30', NULL, NULL, '2020-06-18 08:59:30'),
(11, 'SS495A', NULL, NULL, NULL, NULL, NULL, '/data/product/img-22.jpg', 2, '1', 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 2, 'demo-alias-name-product-11', '2020-06-18 15:41:45', NULL, NULL, '2020-06-18 08:41:45'),
(12, '3D-CARBON1.75', NULL, NULL, NULL, NULL, NULL, '/data/product/img-23.jpg', 2, '1', 15000, 10000, 100, 0, 5, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 0, 'demo-alias-name-product-12', NULL, NULL, NULL, NULL),
(13, '3D-GOLD1.75', NULL, NULL, NULL, NULL, NULL, '/data/product/img-34.jpg', 3, '1', 10000, 5000, 0, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 30, 'demo-alias-name-product-13', '2020-06-18 15:50:17', NULL, NULL, '2020-06-18 08:50:17'),
(14, 'LCD12864-3D', NULL, NULL, NULL, NULL, NULL, '/data/product/img-13.jpg', 3, '1', 15000, 10000, 99, 1, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 0, 'demo-alias-name-product-14', NULL, NULL, NULL, '2020-06-18 09:11:26'),
(15, 'LCD2004-3D', NULL, NULL, NULL, NULL, NULL, '/data/product/img-41.jpg', 3, '1', 15000, 10000, 100, 0, 10, NULL, 0, NULL, 0, 0, 0, 1, 0, 'auto', 1, 0, 0, 'demo-alias-name-product-15', NULL, NULL, NULL, NULL),
(16, 'RAMPS1.5-3D', NULL, NULL, NULL, NULL, NULL, '/data/product/img-42.jpg', 2, '1', 0, 0, 0, 0, 0, NULL, 0, NULL, 0, 0, 0, 2, 0, 'auto', 1, 0, 0, 'demo-alias-name-product-16', NULL, NULL, NULL, NULL),
(17, 'ALOKK1-AY', NULL, NULL, NULL, NULL, NULL, '/data/product/img-26.jpg', 3, '1', 15000, 10000, 100, 0, 5, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 3, 'demo-alias-name-product-17', '2020-06-18 15:51:11', NULL, NULL, '2020-06-18 08:51:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_product_attribute`
--

CREATE TABLE `sc_shop_product_attribute` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `add_price` int(11) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_product_attribute`
--

INSERT INTO `sc_shop_product_attribute` (`id`, `name`, `attribute_group_id`, `product_id`, `add_price`, `sort`, `status`) VALUES
(1, 'Blue', 1, 17, 50, 0, 1),
(2, 'White', 1, 17, 0, 0, 1),
(3, 'S', 2, 17, 20, 0, 1),
(4, 'XL', 2, 17, 30, 0, 1),
(5, 'Blue', 1, 10, 150, 0, 1),
(6, 'Red', 1, 10, 0, 0, 1),
(7, 'S', 2, 10, 0, 0, 1),
(8, 'M', 2, 10, 0, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_product_build`
--

CREATE TABLE `sc_shop_product_build` (
  `build_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_product_build`
--

INSERT INTO `sc_shop_product_build` (`build_id`, `product_id`, `quantity`) VALUES
(15, 6, 1),
(15, 7, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_product_category`
--

CREATE TABLE `sc_shop_product_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_product_category`
--

INSERT INTO `sc_shop_product_category` (`product_id`, `category_id`) VALUES
(1, 6),
(1, 10),
(1, 13),
(2, 13),
(3, 11),
(4, 11),
(5, 11),
(6, 11),
(7, 12),
(8, 10),
(9, 6),
(10, 11),
(11, 10),
(12, 9),
(13, 5),
(14, 11),
(15, 6),
(16, 9),
(17, 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_product_description`
--

CREATE TABLE `sc_shop_product_description` (
  `product_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_product_description`
--

INSERT INTO `sc_shop_product_description` (`product_id`, `lang`, `name`, `keyword`, `description`, `content`) VALUES
(1, 'vi', 'Easy Polo Black Edition 1', NULL, '22” class screen full LED TV\r\nHight precision lens provides a clearer picture and a better view.\r\nWith stand: 50.23”W x 30.1”H x 15.5”D\r\nDispay type: Resolution: 1170 x 768\r\nMotion Rate: 130', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.22&rdquo; class screen full LED TV<br />\r\nHight precision lens provides a clearer picture and a better view.<br />\r\nWith stand: 50.23&rdquo;W x 30.1&rdquo;H x 15.5&rdquo;D<br />\r\nDispay type: Resolution: 1170 x 768<br />\r\nMotion Rate: 130</p>'),
(2, 'en', 'Easy Polo Black Edition 2', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(2, 'vi', 'Easy Polo Black Edition 2', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(3, 'en', 'Easy Polo Black Edition 3', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(3, 'vi', 'Easy Polo Black Edition 3', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(4, 'en', 'Easy Polo Black Edition 4', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(4, 'vi', 'Easy Polo Black Edition 4', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(5, 'en', 'Easy Polo Black Edition 5', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(5, 'vi', 'Easy Polo Black Edition 5', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(6, 'en', 'Easy Polo Black Edition 6', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(6, 'vi', 'Easy Polo Black Edition 6', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(7, 'en', 'Easy Polo Black Edition 7', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(7, 'vi', 'Easy Polo Black Edition 7', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(8, 'en', 'Easy Polo Black Edition 8', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(8, 'vi', 'Easy Polo Black Edition 8', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(9, 'en', 'Easy Polo Black Edition 9', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(9, 'vi', 'Easy Polo Black Edition 9', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(10, 'en', 'Easy Polo Black Edition 10', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(10, 'vi', 'Easy Polo Black Edition 10', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(11, 'en', 'Easy Polo Black Edition 11', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(11, 'vi', 'Easy Polo Black Edition 11', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(12, 'en', 'Easy Polo Black Edition 12', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(12, 'vi', 'Easy Polo Black Edition 12', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(13, 'en', 'Easy Polo Black Edition 13', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(13, 'vi', 'Easy Polo Black Edition 13', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(14, 'en', 'Easy Polo Black Edition 14', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(14, 'vi', 'Easy Polo Black Edition 14', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(15, 'en', 'Easy Polo Black Edition 15', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(15, 'vi', 'Easy Polo Black Edition 15', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(16, 'en', 'Easy Polo Black Edition 16', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(16, 'vi', 'Easy Polo Black Edition 16', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(17, 'en', 'Easy Polo Black Edition 17', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(17, 'vi', 'Easy Polo Black Edition 17', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_product_group`
--

CREATE TABLE `sc_shop_product_group` (
  `group_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_product_group`
--

INSERT INTO `sc_shop_product_group` (`group_id`, `product_id`) VALUES
(16, 1),
(16, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_product_image`
--

CREATE TABLE `sc_shop_product_image` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_product_image`
--

INSERT INTO `sc_shop_product_image` (`id`, `image`, `product_id`) VALUES
(3, '/data/product/img-22.jpg', 11),
(4, '/data/product/img-23.jpg', 2),
(5, '/data/product/img-14.jpg', 11),
(6, '/data/product/img-12.jpg', 5),
(7, '/data/product/img-11.jpg', 5),
(8, '/data/product/img-9.jpg', 2),
(9, '/data/product/img-19.jpg', 2),
(10, '/data/product/img-21.jpg', 9),
(11, '/data/product/img-22.jpg', 8),
(12, '/data/product/img-20.jpg', 7),
(13, '/data/product/img-26.jpg', 7),
(14, '/data/product/img-27.jpg', 5),
(15, '/data/product/img-40.jpg', 4),
(16, '/data/product/img-14.jpg', 15),
(17, '/data/product/img-23.jpg', 15),
(18, '/data/product/img-12.jpg', 17),
(19, '/data/product/img-11.jpg', 17),
(20, '/data/product/img-32.jpg', 17),
(27, '/data/product/img-32.jpg', 1),
(28, '/data/product/img-33.jpg', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_product_promotion`
--

CREATE TABLE `sc_shop_product_promotion` (
  `product_id` int(11) NOT NULL,
  `price_promotion` int(11) NOT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status_promotion` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_product_promotion`
--

INSERT INTO `sc_shop_product_promotion` (`product_id`, `price_promotion`, `date_start`, `date_end`, `status_promotion`, `created_at`, `updated_at`) VALUES
(1, 5000, NULL, NULL, 1, '2020-06-18 07:52:15', '2020-06-18 07:52:15'),
(2, 3000, NULL, NULL, 1, NULL, NULL),
(11, 600, NULL, NULL, 1, NULL, NULL),
(13, 4000, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_sessions`
--

CREATE TABLE `sc_shop_sessions` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_shipping_standard`
--

CREATE TABLE `sc_shop_shipping_standard` (
  `id` int(10) UNSIGNED NOT NULL,
  `fee` int(11) NOT NULL,
  `shipping_free` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_shipping_standard`
--

INSERT INTO `sc_shop_shipping_standard` (`id`, `fee`, `shipping_free`) VALUES
(1, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_shipping_status`
--

CREATE TABLE `sc_shop_shipping_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_shipping_status`
--

INSERT INTO `sc_shop_shipping_status` (`id`, `name`) VALUES
(1, 'Not sent'),
(2, 'Sending'),
(3, 'Shipping done');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_shoppingcart`
--

CREATE TABLE `sc_shop_shoppingcart` (
  `identifier` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_subscribe`
--

CREATE TABLE `sc_shop_subscribe` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_supplier`
--

CREATE TABLE `sc_shop_supplier` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_supplier`
--

INSERT INTO `sc_shop_supplier` (`id`, `name`, `alias`, `email`, `phone`, `image`, `address`, `url`, `status`, `sort`) VALUES
(1, 'ABC distributor', 'abc-distributor', 'abc@abc.com', '012496657567', '/data/supplier/supplier.png', '', '', 1, 0),
(2, 'XYZ distributor', 'xyz-distributor', 'xyz@xyz.com', '012496657567', '/data/supplier/supplier.png', '', '', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_tax`
--

CREATE TABLE `sc_shop_tax` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_tax`
--

INSERT INTO `sc_shop_tax` (`id`, `name`, `value`) VALUES
(1, 'Tax default (10%)', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_user`
--

CREATE TABLE `sc_shop_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:women, 1:men',
  `birthday` date DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_id` int(11) NOT NULL DEFAULT '0',
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'VN',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `group` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_user`
--

INSERT INTO `sc_shop_user` (`id`, `first_name`, `last_name`, `email`, `sex`, `birthday`, `password`, `address_id`, `postcode`, `address1`, `address2`, `company`, `country`, `phone`, `remember_token`, `status`, `group`, `created_at`, `updated_at`) VALUES
(1, 'Naruto', 'Kun', 'test@test.com', 0, NULL, '$2y$10$0y6wjLwaO9/qdvpr9BbnFeFtVZtaKk1lCeRgt5ulcXAnfkgecSo7e', 0, '70000', 'HCM', 'HCM city', 'KTC', 'VN', '0667151172', NULL, 1, 1, '2020-05-22 02:25:27', NULL),
(2, 'abcd', 'ffâSFA', 'abcd@gmail.com', 0, NULL, '$2y$10$l2QNkSfpF0W8GO1C94ujBeGS1jE0VwcTcfeikT5SOHJ4WihZZlSNy', 1, NULL, 'sGásgAfga', 'fafágsas', NULL, 'DS', '09793979722', NULL, 1, 1, '2020-06-20 04:28:30', '2020-06-20 04:28:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_user_address`
--

CREATE TABLE `sc_shop_user_address` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'VN',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_user_address`
--

INSERT INTO `sc_shop_user_address` (`id`, `user_id`, `first_name`, `last_name`, `postcode`, `address1`, `address2`, `country`, `phone`) VALUES
(1, 2, 'abcd', 'ffâSFA', '', 'sGásgAfga', 'fafágsas', 'DS', '09793979722');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sc_shop_weight`
--

CREATE TABLE `sc_shop_weight` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sc_shop_weight`
--

INSERT INTO `sc_shop_weight` (`id`, `name`, `description`) VALUES
(1, 'g', 'Gram'),
(2, 'kg', 'Kilogram'),
(3, 'lb', 'Pound '),
(4, 'oz', 'Ounce ');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sc_admin_config`
--
ALTER TABLE `sc_admin_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_admin_config_key_unique` (`key`),
  ADD KEY `sc_admin_config_code_index` (`code`);

--
-- Chỉ mục cho bảng `sc_admin_log`
--
ALTER TABLE `sc_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sc_admin_log_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `sc_admin_menu`
--
ALTER TABLE `sc_admin_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_admin_menu_key_unique` (`key`);

--
-- Chỉ mục cho bảng `sc_admin_menu_permission`
--
ALTER TABLE `sc_admin_menu_permission`
  ADD PRIMARY KEY (`menu_id`,`permission_id`),
  ADD KEY `sc_admin_menu_permission_menu_id_permission_id_index` (`menu_id`,`permission_id`);

--
-- Chỉ mục cho bảng `sc_admin_permission`
--
ALTER TABLE `sc_admin_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_admin_permission_name_unique` (`name`),
  ADD UNIQUE KEY `sc_admin_permission_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `sc_admin_role`
--
ALTER TABLE `sc_admin_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_admin_role_name_unique` (`name`),
  ADD UNIQUE KEY `sc_admin_role_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `sc_admin_role_menu`
--
ALTER TABLE `sc_admin_role_menu`
  ADD PRIMARY KEY (`role_id`,`menu_id`),
  ADD KEY `sc_admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Chỉ mục cho bảng `sc_admin_role_permission`
--
ALTER TABLE `sc_admin_role_permission`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `sc_admin_role_permission_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Chỉ mục cho bảng `sc_admin_role_user`
--
ALTER TABLE `sc_admin_role_user`
  ADD KEY `sc_admin_role_user_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Chỉ mục cho bảng `sc_admin_store`
--
ALTER TABLE `sc_admin_store`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sc_admin_store_description`
--
ALTER TABLE `sc_admin_store_description`
  ADD PRIMARY KEY (`config_id`,`lang`),
  ADD KEY `sc_admin_store_description_lang_index` (`lang`);

--
-- Chỉ mục cho bảng `sc_admin_user`
--
ALTER TABLE `sc_admin_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_admin_user_username_unique` (`username`),
  ADD UNIQUE KEY `sc_admin_user_email_unique` (`email`);

--
-- Chỉ mục cho bảng `sc_admin_user_permission`
--
ALTER TABLE `sc_admin_user_permission`
  ADD PRIMARY KEY (`user_id`,`permission_id`),
  ADD KEY `sc_admin_user_permission_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Chỉ mục cho bảng `sc_api_connection`
--
ALTER TABLE `sc_api_connection`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_api_connection_apiconnection_unique` (`apiconnection`);

--
-- Chỉ mục cho bảng `sc_cms_category`
--
ALTER TABLE `sc_cms_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_cms_category_alias_unique` (`alias`);

--
-- Chỉ mục cho bảng `sc_cms_category_description`
--
ALTER TABLE `sc_cms_category_description`
  ADD PRIMARY KEY (`category_id`,`lang`);

--
-- Chỉ mục cho bảng `sc_cms_content`
--
ALTER TABLE `sc_cms_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_cms_content_alias_unique` (`alias`);

--
-- Chỉ mục cho bảng `sc_cms_content_description`
--
ALTER TABLE `sc_cms_content_description`
  ADD PRIMARY KEY (`cms_content_id`,`lang`);

--
-- Chỉ mục cho bảng `sc_cms_image`
--
ALTER TABLE `sc_cms_image`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sc_duan`
--
ALTER TABLE `sc_duan`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sc_shop_attribute_group`
--
ALTER TABLE `sc_shop_attribute_group`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sc_shop_banner`
--
ALTER TABLE `sc_shop_banner`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sc_shop_block_content`
--
ALTER TABLE `sc_shop_block_content`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sc_shop_brand`
--
ALTER TABLE `sc_shop_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_brand_alias_unique` (`alias`);

--
-- Chỉ mục cho bảng `sc_shop_category`
--
ALTER TABLE `sc_shop_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_category_alias_unique` (`alias`);

--
-- Chỉ mục cho bảng `sc_shop_category_description`
--
ALTER TABLE `sc_shop_category_description`
  ADD PRIMARY KEY (`category_id`,`lang`),
  ADD KEY `sc_shop_category_description_lang_index` (`lang`);

--
-- Chỉ mục cho bảng `sc_shop_country`
--
ALTER TABLE `sc_shop_country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_country_code_unique` (`code`);

--
-- Chỉ mục cho bảng `sc_shop_currency`
--
ALTER TABLE `sc_shop_currency`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_currency_code_unique` (`code`);

--
-- Chỉ mục cho bảng `sc_shop_discount`
--
ALTER TABLE `sc_shop_discount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_discount_code_unique` (`code`);

--
-- Chỉ mục cho bảng `sc_shop_email_template`
--
ALTER TABLE `sc_shop_email_template`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sc_shop_language`
--
ALTER TABLE `sc_shop_language`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_language_code_unique` (`code`);

--
-- Chỉ mục cho bảng `sc_shop_layout_page`
--
ALTER TABLE `sc_shop_layout_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_layout_page_key_unique` (`key`);

--
-- Chỉ mục cho bảng `sc_shop_layout_position`
--
ALTER TABLE `sc_shop_layout_position`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_layout_position_key_unique` (`key`);

--
-- Chỉ mục cho bảng `sc_shop_length`
--
ALTER TABLE `sc_shop_length`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_length_name_unique` (`name`);

--
-- Chỉ mục cho bảng `sc_shop_link`
--
ALTER TABLE `sc_shop_link`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sc_shop_news`
--
ALTER TABLE `sc_shop_news`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_news_alias_unique` (`alias`);

--
-- Chỉ mục cho bảng `sc_shop_news_description`
--
ALTER TABLE `sc_shop_news_description`
  ADD PRIMARY KEY (`shop_news_id`,`lang`);

--
-- Chỉ mục cho bảng `sc_shop_order`
--
ALTER TABLE `sc_shop_order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sc_shop_order_detail`
--
ALTER TABLE `sc_shop_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sc_shop_order_history`
--
ALTER TABLE `sc_shop_order_history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sc_shop_order_status`
--
ALTER TABLE `sc_shop_order_status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sc_shop_order_total`
--
ALTER TABLE `sc_shop_order_total`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sc_shop_page`
--
ALTER TABLE `sc_shop_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_page_alias_unique` (`alias`);

--
-- Chỉ mục cho bảng `sc_shop_page_description`
--
ALTER TABLE `sc_shop_page_description`
  ADD PRIMARY KEY (`page_id`,`lang`),
  ADD KEY `sc_shop_page_description_lang_index` (`lang`);

--
-- Chỉ mục cho bảng `sc_shop_password_resets`
--
ALTER TABLE `sc_shop_password_resets`
  ADD KEY `sc_shop_password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `sc_shop_payment_status`
--
ALTER TABLE `sc_shop_payment_status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sc_shop_product`
--
ALTER TABLE `sc_shop_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_product_sku_unique` (`sku`),
  ADD UNIQUE KEY `sc_shop_product_alias_unique` (`alias`),
  ADD KEY `sc_shop_product_brand_id_index` (`brand_id`),
  ADD KEY `sc_shop_product_supplier_id_index` (`supplier_id`),
  ADD KEY `sc_shop_product_kind_index` (`kind`),
  ADD KEY `sc_shop_product_virtual_index` (`virtual`),
  ADD KEY `sc_shop_product_tax_id_index` (`tax_id`),
  ADD KEY `sc_shop_product_status_index` (`status`);

--
-- Chỉ mục cho bảng `sc_shop_product_attribute`
--
ALTER TABLE `sc_shop_product_attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sc_shop_product_attribute_product_id_attribute_group_id_index` (`product_id`,`attribute_group_id`);

--
-- Chỉ mục cho bảng `sc_shop_product_build`
--
ALTER TABLE `sc_shop_product_build`
  ADD PRIMARY KEY (`build_id`,`product_id`);

--
-- Chỉ mục cho bảng `sc_shop_product_category`
--
ALTER TABLE `sc_shop_product_category`
  ADD PRIMARY KEY (`product_id`,`category_id`);

--
-- Chỉ mục cho bảng `sc_shop_product_description`
--
ALTER TABLE `sc_shop_product_description`
  ADD PRIMARY KEY (`product_id`,`lang`),
  ADD KEY `sc_shop_product_description_lang_index` (`lang`);

--
-- Chỉ mục cho bảng `sc_shop_product_group`
--
ALTER TABLE `sc_shop_product_group`
  ADD PRIMARY KEY (`group_id`,`product_id`);

--
-- Chỉ mục cho bảng `sc_shop_product_image`
--
ALTER TABLE `sc_shop_product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sc_shop_product_image_product_id_index` (`product_id`);

--
-- Chỉ mục cho bảng `sc_shop_product_promotion`
--
ALTER TABLE `sc_shop_product_promotion`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `sc_shop_sessions`
--
ALTER TABLE `sc_shop_sessions`
  ADD UNIQUE KEY `sc_shop_sessions_id_unique` (`id`);

--
-- Chỉ mục cho bảng `sc_shop_shipping_standard`
--
ALTER TABLE `sc_shop_shipping_standard`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sc_shop_shipping_status`
--
ALTER TABLE `sc_shop_shipping_status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sc_shop_shoppingcart`
--
ALTER TABLE `sc_shop_shoppingcart`
  ADD KEY `sc_shop_shoppingcart_identifier_instance_index` (`identifier`,`instance`);

--
-- Chỉ mục cho bảng `sc_shop_subscribe`
--
ALTER TABLE `sc_shop_subscribe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_subscribe_email_unique` (`email`);

--
-- Chỉ mục cho bảng `sc_shop_supplier`
--
ALTER TABLE `sc_shop_supplier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_supplier_alias_unique` (`alias`);

--
-- Chỉ mục cho bảng `sc_shop_tax`
--
ALTER TABLE `sc_shop_tax`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sc_shop_user`
--
ALTER TABLE `sc_shop_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_user_email_unique` (`email`),
  ADD KEY `sc_shop_user_address_id_index` (`address_id`);

--
-- Chỉ mục cho bảng `sc_shop_user_address`
--
ALTER TABLE `sc_shop_user_address`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sc_shop_weight`
--
ALTER TABLE `sc_shop_weight`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_weight_name_unique` (`name`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT cho bảng `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `sc_admin_config`
--
ALTER TABLE `sc_admin_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT cho bảng `sc_admin_log`
--
ALTER TABLE `sc_admin_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=652;
--
-- AUTO_INCREMENT cho bảng `sc_admin_menu`
--
ALTER TABLE `sc_admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT cho bảng `sc_admin_permission`
--
ALTER TABLE `sc_admin_permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT cho bảng `sc_admin_role`
--
ALTER TABLE `sc_admin_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `sc_admin_store`
--
ALTER TABLE `sc_admin_store`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `sc_admin_user`
--
ALTER TABLE `sc_admin_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `sc_api_connection`
--
ALTER TABLE `sc_api_connection`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `sc_cms_category`
--
ALTER TABLE `sc_cms_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sc_cms_content`
--
ALTER TABLE `sc_cms_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sc_cms_image`
--
ALTER TABLE `sc_cms_image`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sc_duan`
--
ALTER TABLE `sc_duan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `sc_shop_attribute_group`
--
ALTER TABLE `sc_shop_attribute_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `sc_shop_banner`
--
ALTER TABLE `sc_shop_banner`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `sc_shop_block_content`
--
ALTER TABLE `sc_shop_block_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT cho bảng `sc_shop_brand`
--
ALTER TABLE `sc_shop_brand`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT cho bảng `sc_shop_category`
--
ALTER TABLE `sc_shop_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT cho bảng `sc_shop_country`
--
ALTER TABLE `sc_shop_country`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;
--
-- AUTO_INCREMENT cho bảng `sc_shop_currency`
--
ALTER TABLE `sc_shop_currency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `sc_shop_discount`
--
ALTER TABLE `sc_shop_discount`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sc_shop_email_template`
--
ALTER TABLE `sc_shop_email_template`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT cho bảng `sc_shop_language`
--
ALTER TABLE `sc_shop_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `sc_shop_layout_page`
--
ALTER TABLE `sc_shop_layout_page`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT cho bảng `sc_shop_layout_position`
--
ALTER TABLE `sc_shop_layout_position`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT cho bảng `sc_shop_length`
--
ALTER TABLE `sc_shop_length`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT cho bảng `sc_shop_link`
--
ALTER TABLE `sc_shop_link`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT cho bảng `sc_shop_news`
--
ALTER TABLE `sc_shop_news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `sc_shop_order`
--
ALTER TABLE `sc_shop_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `sc_shop_order_detail`
--
ALTER TABLE `sc_shop_order_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT cho bảng `sc_shop_order_history`
--
ALTER TABLE `sc_shop_order_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `sc_shop_order_status`
--
ALTER TABLE `sc_shop_order_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `sc_shop_order_total`
--
ALTER TABLE `sc_shop_order_total`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT cho bảng `sc_shop_page`
--
ALTER TABLE `sc_shop_page`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `sc_shop_payment_status`
--
ALTER TABLE `sc_shop_payment_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT cho bảng `sc_shop_product`
--
ALTER TABLE `sc_shop_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT cho bảng `sc_shop_product_attribute`
--
ALTER TABLE `sc_shop_product_attribute`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT cho bảng `sc_shop_product_image`
--
ALTER TABLE `sc_shop_product_image`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT cho bảng `sc_shop_shipping_standard`
--
ALTER TABLE `sc_shop_shipping_standard`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `sc_shop_shipping_status`
--
ALTER TABLE `sc_shop_shipping_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `sc_shop_subscribe`
--
ALTER TABLE `sc_shop_subscribe`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sc_shop_supplier`
--
ALTER TABLE `sc_shop_supplier`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `sc_shop_tax`
--
ALTER TABLE `sc_shop_tax`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `sc_shop_user`
--
ALTER TABLE `sc_shop_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `sc_shop_user_address`
--
ALTER TABLE `sc_shop_user_address`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `sc_shop_weight`
--
ALTER TABLE `sc_shop_weight`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
