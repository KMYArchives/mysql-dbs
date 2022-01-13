-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2022 at 11:17 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fuxlabs_backend`
--

-- --------------------------------------------------------

--
-- Table structure for table `ws_admins`
--

CREATE TABLE `ws_admins` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` mediumtext NOT NULL,
  `pass` mediumtext NOT NULL,
  `access_level` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `admin_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_admins`
--

INSERT INTO `ws_admins` (`id`, `name`, `email`, `pass`, `access_level`, `added_in`, `admin_id`) VALUES
(1, 'César Silva', '5TU+4gIkhLbEaCmt2EWLz5dx9ryZmU0IAr8/TbjOwAs=', '$2y$10$4Mxqkox5Nrot76eh1wBSNefk.nloyo0GuNZ768/TdbJUFfydWnO6y', 4, '2020-06-07 13:53:48', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ws_clients`
--

CREATE TABLE `ws_clients` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(240) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `username` varchar(60) NOT NULL,
  `pass` text NOT NULL,
  `name` varchar(40) NOT NULL,
  `gender` enum('male','female','undefined') NOT NULL,
  `ip` varchar(64) NOT NULL,
  `confirmed` enum('true','false') NOT NULL DEFAULT 'false',
  `added_in` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_clients`
--

INSERT INTO `ws_clients` (`id`, `email`, `user_id`, `username`, `pass`, `name`, `gender`, `ip`, `confirmed`, `added_in`) VALUES
(1, 'zeJaI9euJTUx80e69Ufei8PP7pxR8xxZdOTYdZBXeAM=', '80fe19f9e3be91c376c733760138471c6e5dfb561d458bab', 'NsxCMBc404XIaf39WUrZqw==', '$argon2i$v=19$m=65536,t=4,p=1$Lm9ZSEtPZU9oWHY4M0xOdA$eZy8pzb4PcCFnAy49bqdRQVwOlrZZ4AJ7jakI5kAbGM', 'Emily Silva', 'female', 'QE0aYbZmQ4JO36gTXNNumQ==', 'true', '2019-11-02 23:40:52');

-- --------------------------------------------------------

--
-- Table structure for table `ws_coupons`
--

CREATE TABLE `ws_coupons` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `code` varchar(36) NOT NULL,
  `discount` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_unique_use` enum('true','false') NOT NULL DEFAULT 'true',
  `user_limit` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `prod_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `expires_in` varchar(24) NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `admin_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ws_devices`
--

CREATE TABLE `ws_devices` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `uuid` varchar(128) NOT NULL,
  `hostname` varchar(30) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `os` varchar(30) NOT NULL,
  `arch` varchar(16) NOT NULL,
  `cpu` varchar(30) NOT NULL,
  `model` varchar(30) NOT NULL,
  `type` varchar(16) NOT NULL,
  `favorited` enum('true','false') NOT NULL DEFAULT 'false',
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_devices`
--

INSERT INTO `ws_devices` (`id`, `slug`, `uuid`, `hostname`, `ip`, `os`, `arch`, `cpu`, `model`, `type`, `favorited`, `added_in`, `username`) VALUES
(1, 'K67UufL1qxcpt5v1TG6FhOSx1AxpeWO7jMTy', 'Oj4gHx5dkExvPs+lDHShkr5m7cDjWN1Rrp0bY+P/db96z4Fr6xU9nvcfdHmMf7AS', 'DESKTOP-F2TMTO9', 'uGSvtLur2jTVtmRyrXGb0w==', 'Microsoft Windows 10 Pro', 'x64', 'AMD Ryzen 3 3200G  Radeon Vega', 'Microsoft Windows 10 Pro', 'desktop', 'false', '2021-02-14 17:15:22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ws_features`
--

CREATE TABLE `ws_features` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `slug_title` varchar(48) NOT NULL,
  `title` varchar(48) NOT NULL,
  `content` varchar(255) NOT NULL,
  `icon` varchar(24) NOT NULL,
  `screenshot` int(11) UNSIGNED NOT NULL,
  `prod_id` int(11) UNSIGNED NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `admin_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ws_images`
--

CREATE TABLE `ws_images` (
  `id` int(11) NOT NULL,
  `slug` varchar(36) NOT NULL,
  `filename` varchar(36) NOT NULL,
  `prod_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `title` varchar(36) DEFAULT NULL,
  `type` varchar(24) NOT NULL,
  `preview` enum('true','false') NOT NULL DEFAULT 'false',
  `size` int(11) UNSIGNED NOT NULL,
  `admin_id` int(11) UNSIGNED NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_images`
--

INSERT INTO `ws_images` (`id`, `slug`, `filename`, `prod_id`, `name`, `title`, `type`, `preview`, `size`, `admin_id`, `added_in`) VALUES
(1, 'A7yIhvBoy2lwxh8AYRaAdbcwOvKFvbzF3SkD', 'OCwOaNPj4Fe9OASFaM70SucP0VDyLC.png', 1, 'icon-small.png', NULL, 'logo', 'false', 4567, 1, '2020-12-27 15:40:30'),
(2, '4iAENLhwoW86C5inuIqVq5dAcoxqYQx81KK1', 'QuQ6JzjIk8QvXQekCcQL46ESQQWXHy.png', 1, 'screenshot-01.png', 'List connection\'s', 'screenshots', 'true', 6452, 1, '2020-12-27 15:40:30'),
(3, 'gmITIRjyIJqJN5J6BuRemSZ1kwuD0NX1MxTg', 'aHR7jPTRnEPQfELtPO5Kk42jjtRZLh.png', 1, 'screenshot-02.png', 'List databases', 'screenshots', 'false', 10635, 1, '2021-01-02 16:04:37'),
(4, 'KIOAwhuAk3a8F1vcEDIplAXv9FVNiJLeJxg9', 'JyEKVefxJYBKssxqNB3lw6eTaotmWk.png', 1, 'screenshot-03.png', 'Create table code', 'screenshots', 'false', 18742, 1, '2021-01-02 16:04:37'),
(5, 'eAhm8pFTIElRgjbzhKH9g2XUDS8E3Twszdbs', 'oZsJnrSYxKStHqpxszWMEcAWq1JndZ.png', 1, 'screenshot-04.png', 'List tables', 'screenshots', 'false', 6558, 1, '2021-01-02 16:04:37'),
(6, 'qJDywwE87soKkyOZrO07dNytQ3zOapNmB5qq', 'vCKeLVo5kG4ChiyuEhQPOLnadWmeMX.png', 1, 'screenshot-05.png', 'Diagram', 'screenshots', 'false', 12076, 1, '2021-01-02 16:04:37'),
(7, '5ygwzAM7GxLv81v0b9aUdd9yaYL3pA1e8Eyl', '7zQLSm5ETzboYtCzDnzFtsR44WC2Tg.png', 1, 'screenshot-06.png', 'Clone table', 'screenshots', 'false', 14096, 1, '2021-01-02 16:04:37'),
(8, '8fgX5kxsJpQ6kVs1SwALaOZcdHxQGP7XDrlv', '5coJljVEFQ8zve2XPxyWuNQqvMte0d.png', 1, 'screenshot-07.png', 'Server details', 'screenshots', 'false', 10958, 1, '2021-01-02 16:04:37'),
(9, 'FqlXqmqc9QpauIqohyVwj0bd5POZFft3nE5m', 'Rpt4oGoOPQg2a5r4VvY7ZZohasjgLj.png', 1, 'screenshot-08.png', 'Create backup', 'screenshots', 'false', 9213, 1, '2021-01-02 16:04:37');

-- --------------------------------------------------------

--
-- Table structure for table `ws_keys_rules`
--

CREATE TABLE `ws_keys_rules` (
  `id` int(11) NOT NULL,
  `slug` varchar(36) NOT NULL,
  `prod_id` int(10) UNSIGNED NOT NULL,
  `trial` int(11) UNSIGNED NOT NULL DEFAULT 15,
  `prefix` varchar(11) DEFAULT NULL,
  `number_chunks` int(11) UNSIGNED NOT NULL DEFAULT 5,
  `chars_per_chunks` int(11) UNSIGNED NOT NULL DEFAULT 5,
  `includes_symbols` enum('true','false') NOT NULL DEFAULT 'false',
  `separate_chunk_text` varchar(5) NOT NULL DEFAULT '-',
  `max_devices` int(11) UNSIGNED NOT NULL DEFAULT 10,
  `types` mediumtext NOT NULL,
  `frequencies` mediumtext NOT NULL,
  `admin_id` int(11) UNSIGNED NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_keys_rules`
--

INSERT INTO `ws_keys_rules` (`id`, `slug`, `prod_id`, `trial`, `prefix`, `number_chunks`, `chars_per_chunks`, `includes_symbols`, `separate_chunk_text`, `max_devices`, `types`, `frequencies`, `admin_id`, `added_in`) VALUES
(1, 'POmlapnUZ8X3oHdgUr1i6w3t4ZouX72b9SE9', 1, 15, NULL, 5, 5, 'false', '-', 10, '', '[\"annually\",\"lifetime\"]', 1, '2020-06-14 12:24:54');

-- --------------------------------------------------------

--
-- Table structure for table `ws_licenses`
--

CREATE TABLE `ws_licenses` (
  `id` int(11) NOT NULL,
  `slug` varchar(36) NOT NULL,
  `serial_number` varchar(230) NOT NULL,
  `order_id` varchar(36) NOT NULL,
  `prod_id` int(11) UNSIGNED NOT NULL,
  `frequency` varchar(12) NOT NULL DEFAULT 'lifetime',
  `favorited` enum('true','false') NOT NULL DEFAULT 'false',
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_licenses`
--

INSERT INTO `ws_licenses` (`id`, `slug`, `serial_number`, `order_id`, `prod_id`, `frequency`, `favorited`, `added_in`, `username`) VALUES
(1, 'j4rPCBYkOKT0OUykTo5wci9FvZMiadNMWh8T', 'yV2Pjj20jUcBWBxRRmwhDfAUegRwN1iATjxPrUF0U7llpgr7fDZ3kK0OmKP6dF5HpvIUYD32nfRNmZ8qGAYfrg==', 'fXISewXUnLSQqpPcKf7YodNpYQRIX78Jl7Ay', 1, 'lifetime', 'false', '2020-12-13 07:10:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ws_linked`
--

CREATE TABLE `ws_linked` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug_item` varchar(36) NOT NULL,
  `license_id` int(11) UNSIGNED NOT NULL,
  `device_id` int(11) UNSIGNED NOT NULL,
  `trials` enum('true','false') NOT NULL DEFAULT 'false',
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_linked`
--

INSERT INTO `ws_linked` (`id`, `slug_item`, `license_id`, `device_id`, `trials`, `added_in`, `username`) VALUES
(1, 'yb4FOKujBoGaoYy7zP6Tqk5ki1oAq3xl7YRf', 1, 1, 'false', '2020-11-30 18:12:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ws_orders`
--

CREATE TABLE `ws_orders` (
  `id` int(11) NOT NULL,
  `slug` varchar(36) NOT NULL,
  `ch_id` varchar(36) NOT NULL,
  `txn_id` varchar(36) NOT NULL,
  `cus_id` varchar(36) NOT NULL,
  `card_id` varchar(36) NOT NULL,
  `prod_id` int(10) UNSIGNED NOT NULL,
  `amount` double(10,2) NOT NULL,
  `discount` varchar(36) DEFAULT NULL,
  `order_status` varchar(30) NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_orders`
--

INSERT INTO `ws_orders` (`id`, `slug`, `ch_id`, `txn_id`, `cus_id`, `card_id`, `prod_id`, `amount`, `discount`, `order_status`, `added_in`, `username`) VALUES
(1, 'fXISewXUnLSQqpPcKf7YodNpYQRIX78Jl7Ay', 'ch_1HxnmPB5Mh9Rw1zRW9XzLMzv', 'txn_1HxnmPB5Mh9Rw1zRr0bPc0rZ', 'cus_IYvdSmR6rhHUea', 'card_1HxnmNB5Mh9Rw1zRadCAyKFS', 1, 0.50, NULL, 'succeeded', '2020-12-13 07:10:05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ws_otp_code`
--

CREATE TABLE `ws_otp_code` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `code` varchar(12) NOT NULL,
  `type` enum('login','reset','confirm') NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `expires_in` datetime NOT NULL,
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ws_pages`
--

CREATE TABLE `ws_pages` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `featured` varchar(30) NOT NULL,
  `content` mediumtext NOT NULL,
  `tags` text NOT NULL,
  `access` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `publish` enum('true','false') NOT NULL DEFAULT 'false',
  `show_date_time` enum('true','false') NOT NULL DEFAULT 'false',
  `show_on_menu` enum('true','false') NOT NULL DEFAULT 'false',
  `prod_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `page_linked` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_in` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_pages`
--

INSERT INTO `ws_pages` (`id`, `slug`, `title`, `featured`, `content`, `tags`, `access`, `publish`, `show_date_time`, `show_on_menu`, `prod_id`, `page_linked`, `added_in`, `updated_in`, `admin_id`) VALUES
(1, 'about-us', 'About us', 'default.webp', '&lt;center&gt;&lt;h2&gt;Hello world&lt;/h2&gt;&lt;/center&gt;', '', 10000, 'true', 'false', 'false', 0, 0, '2019-11-17 02:46:25', '0000-00-00 00:00:00', 1),
(2, 'support', 'Support', 'default.webp', 'hjreuhbvej', '', 0, 'true', 'false', 'false', 0, 0, '2019-11-17 02:46:25', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ws_prices`
--

CREATE TABLE `ws_prices` (
  `id` int(11) NOT NULL,
  `slug` varchar(36) NOT NULL,
  `prod_id` int(11) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `currency` varchar(5) NOT NULL DEFAULT 'USD',
  `exchange` enum('true','false') NOT NULL DEFAULT 'true',
  `discount` enum('true','false') NOT NULL DEFAULT 'true',
  `refunds` enum('true','false') NOT NULL DEFAULT 'true',
  `updated_in` datetime NOT NULL DEFAULT current_timestamp(),
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `admin_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_prices`
--

INSERT INTO `ws_prices` (`id`, `slug`, `prod_id`, `price`, `currency`, `exchange`, `discount`, `refunds`, `updated_in`, `added_in`, `admin_id`) VALUES
(1, '0r6jWqOXMBmoqElB64G3qrsO0u06DW97PolM', 1, 100, 'usd', 'true', 'true', 'true', '2020-12-28 08:27:22', '2020-12-28 08:27:22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ws_products`
--

CREATE TABLE `ws_products` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug_item` varchar(36) NOT NULL,
  `name` varchar(36) NOT NULL,
  `slogan` varchar(255) NOT NULL,
  `status` enum('true','false') NOT NULL DEFAULT 'true',
  `admin_id` int(11) NOT NULL,
  `added_in_item` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_products`
--

INSERT INTO `ws_products` (`id`, `slug_item`, `name`, `slogan`, `status`, `admin_id`, `added_in_item`) VALUES
(1, 'dbackpro', 'DBack Pro', 'The most complete software of database backup on market', 'true', 1, '2020-02-08 04:41:43');

-- --------------------------------------------------------

--
-- Table structure for table `ws_sessions`
--

CREATE TABLE `ws_sessions` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `token` varchar(64) NOT NULL,
  `name` varchar(36) NOT NULL,
  `expires_in` datetime NOT NULL,
  `added_in` datetime NOT NULL,
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ws_setups`
--

CREATE TABLE `ws_setups` (
  `id` int(11) NOT NULL,
  `slug` varchar(36) NOT NULL,
  `prod_id` int(11) UNSIGNED NOT NULL,
  `file` varchar(36) NOT NULL,
  `setup` varchar(48) NOT NULL,
  `icon` varchar(36) NOT NULL,
  `version` varchar(15) NOT NULL,
  `channel` enum('stable','alpha','beta') NOT NULL DEFAULT 'stable',
  `platform` enum('windows','macos','linux') NOT NULL,
  `arch` varchar(12) NOT NULL,
  `min_os_version` varchar(16) DEFAULT NULL,
  `file_size` int(11) UNSIGNED NOT NULL,
  `enabled` enum('true','false') NOT NULL DEFAULT 'true',
  `admin_id` int(11) UNSIGNED NOT NULL,
  `updated_in` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `added_in` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_setups`
--

INSERT INTO `ws_setups` (`id`, `slug`, `prod_id`, `file`, `setup`, `icon`, `version`, `channel`, `platform`, `arch`, `min_os_version`, `file_size`, `enabled`, `admin_id`, `updated_in`, `added_in`) VALUES
(1, 'ZBGntjcOhMpbGLEWPmV6f73ZoA6nSncquahP', 1, 'dbackpro.exe', '3cuGQSBmnJPGtjjbmKx86Zlu8ts7SE10.exe', 'fab fa-windows', '1.0.0', 'stable', 'windows', 'x64', '8', 3112960, 'true', 1, NULL, '2020-06-25 12:54:30'),
(2, '30dlHsrMvB8s7NR6IJIpmzVKSLOgyMmMEj2R', 1, 'dbackpro.deb', 'Vpj7j3r0THEqiHk92T10WxEAYGaYAwYT.deb', 'fab fa-linux', '1.0.0', 'stable', 'linux', 'x64', NULL, 765432, 'true', 1, NULL, '2020-06-25 12:54:30');

-- --------------------------------------------------------

--
-- Table structure for table `ws_subscriptions`
--

CREATE TABLE `ws_subscriptions` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `service` varchar(30) NOT NULL,
  `pertiod` varchar(30) NOT NULL,
  `status` enum('actived','cancelled') NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ws_support`
--

CREATE TABLE `ws_support` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `title` varchar(36) NOT NULL,
  `file` varchar(36) NOT NULL,
  `category` varchar(36) DEFAULT NULL,
  `prod_id` int(11) UNSIGNED NOT NULL,
  `admin_id` int(11) UNSIGNED NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ws_trials`
--

CREATE TABLE `ws_trials` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `prod_id` int(11) UNSIGNED NOT NULL,
  `notify` enum('true','false') NOT NULL DEFAULT 'true',
  `expires_in` datetime NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_trials`
--

INSERT INTO `ws_trials` (`id`, `slug`, `prod_id`, `notify`, `expires_in`, `added_in`, `username`) VALUES
(1, 'SFuavzkV1iVJyxjz6k8g8LBOD0GZNAYI1moL', 1, 'true', '2021-05-21 06:16:08', '2021-04-21 01:16:32', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ws_admins`
--
ALTER TABLE `ws_admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ws_clients`
--
ALTER TABLE `ws_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `userkey` (`user_id`);

--
-- Indexes for table `ws_coupons`
--
ALTER TABLE `ws_coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `ws_devices`
--
ALTER TABLE `ws_devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `ws_features`
--
ALTER TABLE `ws_features`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `slug-title` (`slug_title`);

--
-- Indexes for table `ws_images`
--
ALTER TABLE `ws_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `image` (`filename`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `ws_keys_rules`
--
ALTER TABLE `ws_keys_rules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `prod_id` (`prod_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `ws_licenses`
--
ALTER TABLE `ws_licenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `serial_number` (`serial_number`),
  ADD UNIQUE KEY `order_id` (`order_id`);

--
-- Indexes for table `ws_linked`
--
ALTER TABLE `ws_linked`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug_item`);

--
-- Indexes for table `ws_orders`
--
ALTER TABLE `ws_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ws_otp_code`
--
ALTER TABLE `ws_otp_code`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `link_code` (`slug`);

--
-- Indexes for table `ws_pages`
--
ALTER TABLE `ws_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `ws_prices`
--
ALTER TABLE `ws_prices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `ws_products`
--
ALTER TABLE `ws_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug_item`);

--
-- Indexes for table `ws_sessions`
--
ALTER TABLE `ws_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `ws_setups`
--
ALTER TABLE `ws_setups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `ws_subscriptions`
--
ALTER TABLE `ws_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `ws_support`
--
ALTER TABLE `ws_support`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `title` (`title`),
  ADD UNIQUE KEY `file` (`file`);

--
-- Indexes for table `ws_trials`
--
ALTER TABLE `ws_trials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ws_admins`
--
ALTER TABLE `ws_admins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ws_clients`
--
ALTER TABLE `ws_clients`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ws_coupons`
--
ALTER TABLE `ws_coupons`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_devices`
--
ALTER TABLE `ws_devices`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ws_features`
--
ALTER TABLE `ws_features`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_images`
--
ALTER TABLE `ws_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ws_keys_rules`
--
ALTER TABLE `ws_keys_rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ws_licenses`
--
ALTER TABLE `ws_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `ws_linked`
--
ALTER TABLE `ws_linked`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ws_orders`
--
ALTER TABLE `ws_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ws_otp_code`
--
ALTER TABLE `ws_otp_code`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ws_pages`
--
ALTER TABLE `ws_pages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ws_prices`
--
ALTER TABLE `ws_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ws_products`
--
ALTER TABLE `ws_products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ws_sessions`
--
ALTER TABLE `ws_sessions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_setups`
--
ALTER TABLE `ws_setups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ws_subscriptions`
--
ALTER TABLE `ws_subscriptions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_support`
--
ALTER TABLE `ws_support`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_trials`
--
ALTER TABLE `ws_trials`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
