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
-- Database: `fuxlabs_workspace`
--

-- --------------------------------------------------------

--
-- Table structure for table `ws_collections`
--

CREATE TABLE `ws_collections` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `name` varchar(48) NOT NULL,
  `collation` varchar(36) NOT NULL DEFAULT 'utf8_general_ci',
  `privacy` enum('public','private') NOT NULL DEFAULT 'public',
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_collections`
--

INSERT INTO `ws_collections` (`id`, `slug`, `name`, `collation`, `privacy`, `added_in`, `username`) VALUES
(1, 'X7a0pr0CITrNvgXHsRvYy5kbxHdlmkaFUkXY', 'fuxlabs_backend', 'utf8_general_ci', 'public', '2021-03-15 15:43:53', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ws_commits`
--

CREATE TABLE `ws_commits` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `origin_id` int(11) UNSIGNED NOT NULL,
  `target_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(16) NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ws_configs`
--

CREATE TABLE `ws_configs` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `name` varchar(16) NOT NULL,
  `value` text NOT NULL,
  `updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ws_contacts`
--

CREATE TABLE `ws_contacts` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `contact_id` int(11) UNSIGNED NOT NULL,
  `favorited` enum('true','false') NOT NULL DEFAULT 'false',
  `invite_accept` enum('true','false') NOT NULL DEFAULT 'false',
  `updated_in` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_contacts`
--

INSERT INTO `ws_contacts` (`id`, `slug`, `contact_id`, `favorited`, `invite_accept`, `updated_in`, `added_in`, `username`) VALUES
(1, 'WTqa5LprDypydzJaSW1lv6hm3CHl5MwZkaU5', 1, 'false', 'true', '2021-06-01 19:01:53', '2021-03-22 23:21:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ws_diagrams`
--

CREATE TABLE `ws_diagrams` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `image` varchar(48) NOT NULL,
  `image_id` varchar(36) NOT NULL,
  `delete_hash` varchar(48) DEFAULT NULL,
  `name` varchar(36) NOT NULL,
  `size` int(11) UNSIGNED NOT NULL,
  `mime` varchar(24) NOT NULL,
  `collection` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `privacy` enum('public','private') NOT NULL DEFAULT 'public',
  `favorited` enum('true','false') NOT NULL DEFAULT 'false',
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ws_hashes`
--

CREATE TABLE `ws_hashes` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `json_file` varchar(36) NOT NULL,
  `name` varchar(48) NOT NULL,
  `size` int(11) UNSIGNED NOT NULL,
  `type` varchar(18) NOT NULL,
  `favorited` enum('true','false') NOT NULL DEFAULT 'false',
  `privacy` enum('public','private','unlisted') NOT NULL DEFAULT 'public',
  `collection` int(11) UNSIGNED NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ws_history`
--

CREATE TABLE `ws_history` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `name` varchar(36) NOT NULL,
  `type` varchar(36) NOT NULL,
  `db` varchar(48) NOT NULL,
  `tbl` varchar(48) NOT NULL,
  `urls` text NOT NULL,
  `mime` varchar(36) NOT NULL,
  `size` int(11) UNSIGNED NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ws_models`
--

CREATE TABLE `ws_models` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `sql_file` varchar(36) NOT NULL,
  `json_file` varchar(36) NOT NULL,
  `name` varchar(48) NOT NULL,
  `metadata` text NOT NULL,
  `favorited` enum('true','false') NOT NULL DEFAULT 'false',
  `privacy` enum('public','private') NOT NULL DEFAULT 'public',
  `diagram` int(11) UNSIGNED NOT NULL,
  `collection` int(11) UNSIGNED NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_models`
--

INSERT INTO `ws_models` (`id`, `slug`, `sql_file`, `json_file`, `name`, `metadata`, `favorited`, `privacy`, `diagram`, `collection`, `added_in`, `username`) VALUES
(1, 'ezyAAGDD0GfCFIkBnEknrPJQySyn9I7WnTce', 'YeCudYPxz9CBRAdNAOl7e1aSIvMhs3SETtTh', 'KX3gyUq2bdhanbzAty3cNzFByGwIYUM1H9Wa', 'ws_licenses', '{\"engine\":\"InnoDB\",\"comment\":\"\",\"temporary\":\"N\",\"collation\":\"utf8_general_ci\",\"row_format\":\"Dynamic\",\"auto_increment\":\"52\"}', 'false', 'public', 0, 0, '2021-11-01 14:39:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ws_models_linked`
--

CREATE TABLE `ws_models_linked` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `origin` int(11) UNSIGNED NOT NULL,
  `target` int(11) UNSIGNED NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ws_notifications`
--

CREATE TABLE `ws_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `item` int(11) UNSIGNED NOT NULL,
  `type` varchar(16) NOT NULL,
  `metadata` text NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ws_share`
--

CREATE TABLE `ws_share` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `sql_file` varchar(36) NOT NULL,
  `json_file` varchar(36) NOT NULL,
  `name` varchar(36) NOT NULL,
  `type` varchar(16) NOT NULL,
  `metadata` text NOT NULL,
  `contact` int(11) UNSIGNED NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ws_sync`
--

CREATE TABLE `ws_sync` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `filename` varchar(36) NOT NULL,
  `prod_id` int(11) UNSIGNED NOT NULL,
  `params` text DEFAULT NULL,
  `token` text NOT NULL,
  `updated_in` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ws_tasks`
--

CREATE TABLE `ws_tasks` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(36) NOT NULL,
  `name` varchar(36) NOT NULL,
  `timer` varchar(30) NOT NULL,
  `task` text NOT NULL,
  `size` int(11) UNSIGNED NOT NULL,
  `collection` int(11) UNSIGNED NOT NULL,
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
  `token` varchar(64) NOT NULL,
  `name` varchar(36) NOT NULL,
  `expires_in` datetime DEFAULT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ws_collections`
--
ALTER TABLE `ws_collections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `ws_commits`
--
ALTER TABLE `ws_commits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ws_configs`
--
ALTER TABLE `ws_configs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `ws_contacts`
--
ALTER TABLE `ws_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `ws_diagrams`
--
ALTER TABLE `ws_diagrams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `imgur` (`image`),
  ADD UNIQUE KEY `file_name` (`image`),
  ADD UNIQUE KEY `image_id` (`image_id`),
  ADD UNIQUE KEY `delete_hash` (`delete_hash`);

--
-- Indexes for table `ws_hashes`
--
ALTER TABLE `ws_hashes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `json_file` (`json_file`);

--
-- Indexes for table `ws_history`
--
ALTER TABLE `ws_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `ws_models`
--
ALTER TABLE `ws_models`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `sql_file` (`sql_file`),
  ADD UNIQUE KEY `json_file` (`json_file`);

--
-- Indexes for table `ws_models_linked`
--
ALTER TABLE `ws_models_linked`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `ws_notifications`
--
ALTER TABLE `ws_notifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `ws_share`
--
ALTER TABLE `ws_share`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `file_id` (`sql_file`),
  ADD UNIQUE KEY `json_file` (`json_file`);

--
-- Indexes for table `ws_sync`
--
ALTER TABLE `ws_sync`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `filename` (`filename`);

--
-- Indexes for table `ws_tasks`
--
ALTER TABLE `ws_tasks`
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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ws_collections`
--
ALTER TABLE `ws_collections`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ws_commits`
--
ALTER TABLE `ws_commits`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_configs`
--
ALTER TABLE `ws_configs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_contacts`
--
ALTER TABLE `ws_contacts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ws_diagrams`
--
ALTER TABLE `ws_diagrams`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ws_hashes`
--
ALTER TABLE `ws_hashes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_history`
--
ALTER TABLE `ws_history`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_models`
--
ALTER TABLE `ws_models`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ws_models_linked`
--
ALTER TABLE `ws_models_linked`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_notifications`
--
ALTER TABLE `ws_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_share`
--
ALTER TABLE `ws_share`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_sync`
--
ALTER TABLE `ws_sync`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_tasks`
--
ALTER TABLE `ws_tasks`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_tokens`
--
ALTER TABLE `ws_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
