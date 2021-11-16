-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2021 at 07:33 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fuxlabs_account`
--

-- --------------------------------------------------------

--
-- Table structure for table `ws_clients`
--

CREATE TABLE `ws_clients` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(240) NOT NULL,
  `userkey` varchar(64) NOT NULL,
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

INSERT INTO `ws_clients` (`id`, `email`, `userkey`, `username`, `pass`, `name`, `gender`, `ip`, `confirmed`, `added_in`) VALUES
(1, 'zeJaI9euJTUx80e69Ufei8PP7pxR8xxZdOTYdZBXeAM=', '80fe19f9e3be91c376c733760138471c6e5dfb561d458bab', 'NsxCMBc404XIaf39WUrZqw==', '$argon2i$v=19$m=65536,t=4,p=1$Lm9ZSEtPZU9oWHY4M0xOdA$eZy8pzb4PcCFnAy49bqdRQVwOlrZZ4AJ7jakI5kAbGM', 'Emily Silva', 'female', 'QE0aYbZmQ4JO36gTXNNumQ==', 'true', '2019-11-02 23:40:52');

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
-- Table structure for table `ws_tokens`
--

CREATE TABLE `ws_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `token` int(64) NOT NULL,
  `expires_in` datetime DEFAULT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
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
-- Indexes for table `ws_clients`
--
ALTER TABLE `ws_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `userkey` (`userkey`);

--
-- Indexes for table `ws_devices`
--
ALTER TABLE `ws_devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `uuid` (`uuid`);

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
-- Indexes for table `ws_sessions`
--
ALTER TABLE `ws_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `ws_subscriptions`
--
ALTER TABLE `ws_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `ws_tokens`
--
ALTER TABLE `ws_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `token` (`token`);

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
-- AUTO_INCREMENT for table `ws_clients`
--
ALTER TABLE `ws_clients`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ws_devices`
--
ALTER TABLE `ws_devices`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_sessions`
--
ALTER TABLE `ws_sessions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_subscriptions`
--
ALTER TABLE `ws_subscriptions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_tokens`
--
ALTER TABLE `ws_tokens`
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
