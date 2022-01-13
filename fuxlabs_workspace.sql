-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2022 at 11:16 AM
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
-- Database: `fuxlabs_workspace`
--

-- --------------------------------------------------------

--
-- Table structure for table `ws_code_notes`
--

CREATE TABLE `ws_code_notes` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(48) NOT NULL,
  `code_id` int(11) UNSIGNED NOT NULL,
  `format` varchar(16) NOT NULL,
  `line_number` int(11) UNSIGNED DEFAULT NULL,
  `selection` text NOT NULL,
  `minidoc_ref` varchar(60) NOT NULL,
  `comment` text NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ws_collections`
--

CREATE TABLE `ws_collections` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(48) NOT NULL,
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
  `slug` varchar(48) NOT NULL,
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
  `slug` varchar(48) NOT NULL,
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
  `slug` varchar(48) NOT NULL,
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

--
-- Dumping data for table `ws_diagrams`
--

INSERT INTO `ws_diagrams` (`id`, `slug`, `image`, `image_id`, `delete_hash`, `name`, `size`, `mime`, `collection`, `privacy`, `favorited`, `added_in`, `username`) VALUES
(1, 'X5X2UXthzy5xWI9kA3RoR71xDWedPzRQAT10', 'https://i.imgur.com/9ds377T.png', '9ds377T', 'cUNX7OKypjga7tY', 'ws_licenses', 14696, 'image/png', 0, 'public', 'false', '2021-12-11 15:33:36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ws_hashes`
--

CREATE TABLE `ws_hashes` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(48) NOT NULL,
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
  `slug` varchar(48) NOT NULL,
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
  `slug` varchar(48) NOT NULL,
  `sql_file` varchar(36) NOT NULL,
  `json_file` varchar(36) NOT NULL,
  `name` varchar(48) NOT NULL,
  `driver` varchar(16) NOT NULL,
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

INSERT INTO `ws_models` (`id`, `slug`, `sql_file`, `json_file`, `name`, `driver`, `metadata`, `favorited`, `privacy`, `diagram`, `collection`, `added_in`, `username`) VALUES
(1, 'ezyAAGDD0GfCFIkBnEknrPJQySyn9I7WnTcz', 'YeCudYPxz9CBRAdNAOl7e1aSIvMhs3SETtTh', 'KX3gyUq2bdhanbzAty3cNzFByGwIYUM1H9Wa', 'ws_licenses', 'mysql', '{\"engine\":\"InnoDB\",\"comment\":\"Hello world\",\"temporary\":\"N\",\"collation\":\"utf8_general_ci\",\"row_format\":\"Dynamic\",\"auto_increment\":\"52\", \"charset\": \"utf8\"}', 'false', 'public', 1, 0, '2021-11-01 14:39:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ws_models_linked`
--

CREATE TABLE `ws_models_linked` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(48) NOT NULL,
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
  `slug` varchar(48) NOT NULL,
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
  `slug` varchar(48) NOT NULL,
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
-- Table structure for table `ws_sqlminidoc_bookmarks`
--

CREATE TABLE `ws_sqlminidoc_bookmarks` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(48) NOT NULL,
  `item_id` int(11) UNSIGNED NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ws_sql_minidoc`
--

CREATE TABLE `ws_sql_minidoc` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(48) NOT NULL,
  `name` varchar(36) NOT NULL,
  `content` text NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_in` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_sql_minidoc`
--

INSERT INTO `ws_sql_minidoc` (`id`, `slug`, `name`, `content`, `added_in`, `updated_in`) VALUES
(1, 'JUf0fIfvzeefsqgs9zH3ze1tuhhd1HUGXkxz', 'create table', 'The CREATE TABLE statement is used to create a new table in a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(2, 'xtecZYyJ7wXqj7KKGSrYjRpKshQS5eviQrcRPp', 'create temporary table', 'The CREATE TEMPORARY TABLE data type is used to store the CREATE TEMPORARY TABLE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(3, 'qYsIb23rqSY10CnLUbmsQbPsJA5PFAaORP3qQsXtl75O3', 'drop table', 'The DROP TABLE statement is used to delete a table from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(4, 'UGW7crYwN5VgZuu4kOADBrbENPDOTTlW24T8gL35L6gpZ', 'insert into', 'The INSERT INTO statement is used to insert new rows into a table.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(5, 'u7cq72n0l73ekXHDUq5jV7y0IjIxz1QXnMnikoCybNmsZ', 'rename table', 'The RENAME TABLE statement is used to rename a table in a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(6, 'XB803xSDdp9mjXtcEj7fdL2CxzSQRGUXgmKtmY', 'truncate table', 'The TRUNCATE TABLE statement is used to empty a table.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(7, 'x24PCLgZbvmnzNU7JTuNBTSbaDyIWobIdo6DLHZCP0', 'select', 'The SELECT statement is used to retrieve rows from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(8, 'smhsfpt5KI2CrH2HEXOih9Qup8FlAsicQUUvBf4', 'update', 'The UPDATE statement is used to update rows in a table.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(9, 'is9fzhJFvyzpWar0UVdDHXE9z53kRHTROodT6', 'delete', 'The DELETE statement is used to delete rows from a table.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(10, '3uuFWA4aObjINErFXrLUjOqZpJPpfCrUQDCbOwrjGgVeI', 'create index', 'The CREATE INDEX statement is used to create an index on a table.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(11, 'iLFolBXemawkkt9H8Bxk0PmeKqhzevaD42whaA', 'drop index', 'The DROP INDEX statement is used to delete an index from a table.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(12, 'SBXWq2dYEQ6bZSak29bsUW4WKneByEIjtA4ptiaFXgpYlg4', 'create view', 'The CREATE VIEW statement is used to create a new view in a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(13, 'HBqwdWTq08u497zZNsItlHBoo0RCb6Nhn6qsnjInVU', 'drop view', 'The DROP VIEW statement is used to delete a view from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(14, 'Utl2RnQzi40j8Iw5a1bclwWUidtoiq0goasQQRZ', 'alter user', 'The ALTER USER statement is used to change the password for a user.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(15, 'uEwJGRilBANiVk5x6aDH39ESQsAwivyuMXkVf7jg', 'alter database', 'The ALTER DATABASE statement is used to change the password for a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(16, 'iye8J1lqv93qQ1548N9zRiz7YJobgwEGJq2BX7jz1UbBxmgM', 'alter table', 'The ALTER TABLE statement is used to change the structure of a table.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(17, 'ydbPkLHXJhlJgoiQOFoUAgf1PVIAj7m6liNaU', 'alter index', 'The ALTER INDEX statement is used to change the structure of an index.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(18, 'Te9uoCdLI3Ns0SzpI4CFwxe2L2IUAV5VCYu0xfN8vfb', 'alter view', 'The ALTER VIEW statement is used to change the structure of a view.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(19, 'EsnXOJ12lgxPJbXIGy6Ng37NQXuk4E9FWDSqGaG3wC4', 'alter event', 'The ALTER EVENT statement is used to change the structure of an event.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(20, '57HuX2kh3hvTJdTKizn4LTitx8jeAWThMvJMRwzMRhyHC', 'alter routine', 'The ALTER ROUTINE statement is used to change the structure of a stored procedure or function.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(21, 'FEY7XKHnnqyTxCDELS2vm9v0zryMQcipTeUCZNSby2XF', 'create procedure', 'The CREATE PROCEDURE statement is used to create a new stored procedure in a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(22, 'ohhu3cyKOvKLD6hJRQ7g3GVVPnUxgAuNiv48FcmSQYjuq', 'drop procedure', 'The DROP PROCEDURE statement is used to delete a stored procedure from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(23, 'TJCyRRvKVDmsGyd3s968XjFwaHBL4ojjxWrMMPBbM', 'create function', 'The CREATE FUNCTION statement is used to create a new stored function in a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(24, 'Xfhpi4dP4avLUW6Oqd5QtCu100ufJhXQgrEP2j8n', 'drop function', 'The DROP FUNCTION statement is used to delete a stored function from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(25, 'ZDDZOH57IYTNzvsQtfRJg5bjV3hsm0lUyNkjNuCpv', 'create trigger', 'The CREATE TRIGGER statement is used to create a new trigger in a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(26, 'COnW7FhxMWb09zPECPScUJPHSoeiZhiiS3eFdcFpgIUBCH5K', 'drop trigger', 'The DROP TRIGGER statement is used to delete a trigger from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(27, 'D33dP2gZlYx0LyfcuxJkfBE1tcaj90PCK6LnAPI6rH', 'create sequence', 'The CREATE SEQUENCE statement is used to create a new sequence in a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(28, 'tIfjN198v8eFPUUDLUdnY7bHVAfZVXRW8xWm0tNg', 'drop sequence', 'The DROP SEQUENCE statement is used to delete a sequence from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(29, 'USxfzFhyG9cUkZ5uExgTWdh1sBXz5Gts41ZZd4atT', 'create domain', 'The CREATE DOMAIN statement is used to create a new domain in a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(30, 'SoKf5od98AsNBxYSgSiFRNzgTJkumgWwPdxzEyS0kU', 'drop table if exists', 'The DROP TABLE IF EXISTS statement is used to delete a table from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(31, 'gFbTNHSCoNJJ6G6qiXIGlSMGJpTXoTrIjJqkuYQAxO9UR', 'drop view if exists', 'The DROP VIEW IF EXISTS statement is used to delete a view from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(32, 'yMsUyUX34ONZzcZfOYVYnYmybJ6NEpYPjc3hLk', 'drop database if exists', 'The DROP DATABASE IF EXISTS statement is used to delete a database from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(33, 'lx2VFsC0M1DJTzW9IPPinlJ6yCG9WOnbbJIRomM9', 'drop event if exists', 'The DROP EVENT IF EXISTS statement is used to delete an event from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(34, 'bSfjtjf1Fz6AVw78487UYIltEmPXuhtwWnRb7', 'drop trigger if exists', 'The DROP TRIGGER IF EXISTS statement is used to delete a trigger from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(35, 'iRqHruCJUFH7yIkabeiYqK6YN4j05l95bRjVCnul', 'drop sequence if exists', 'The DROP SEQUENCE IF EXISTS statement is used to delete a sequence from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(36, '04WkYRGJ4Ih8AXo3sbuf50Cn2zS0YZOcfqPa', 'drop domain if exists', 'The DROP DOMAIN IF EXISTS statement is used to delete a domain from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(37, 'Z3MuXq1Ikde67fkhf4DHpmFphfX6VX5PrEbW', 'drop procedure if exists', 'The DROP PROCEDURE IF EXISTS statement is used to delete a stored procedure from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(38, 'I0jLKfMxmMxaXHVsHrf1j6NMGHrK8mrDbHVH', 'drop domain', 'The DROP DOMAIN statement is used to delete a domain from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(39, 'f9neJdvRHengZ4wooBv4euQNVusAqEFxNykRh', 'create schema', 'The CREATE SCHEMA statement is used to create a new schema in a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(40, 'JXCRPxJyhpBS93Lz1QGV3SbLPDVRRiOFpyny2', 'drop schema', 'The DROP SCHEMA statement is used to delete a schema from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(41, 'vcgPMKBLnCENSSMl0pL1UpeJjI4QGZHsnsixTu1', 'create user', 'The CREATE USER statement is used to create a new user in a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(42, 'qzW1W63GY9HgBLN5ZIbzxnVH8VIipqw0q2t9NUMt4A', 'drop user', 'The DROP USER statement is used to delete a user from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(43, 'cSLDFloyUaf5eP2bWX3PWxf5RRK2IR9MVjxSixm0YMGBrz', 'create role', 'The CREATE ROLE statement is used to create a new role in a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(44, 'Pzn59J0EwxnMNfmKH6gqQ2B7Y3IGa9EkubhBLpR6g4LjO6Z', 'drop role', 'The DROP ROLE statement is used to delete a role from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(45, 'tZsYmFWhmFJFG6g07gd87H8ZEvp4KtayHQ4lD', 'create language', 'The CREATE LANGUAGE statement is used to create a new language in a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(46, 'y5lOO67OvHBYC80IdAPIgW2gBFvUKqyMN1BsYCsHlu6wfF', 'drop language', 'The DROP LANGUAGE statement is used to delete a language from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(47, 'l7HZsOTmcnrmvnzkRqyI9vbJtdwxc9Ab1JGSU', 'create type', 'The CREATE TYPE statement is used to create a new type in a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(48, 'WpLQ8nRf2l5f8IJPx6oSFjv8Ot8lXlOexgN1SN5Gk', 'drop type', 'The DROP TYPE statement is used to delete a type from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(49, 'qNH4Tk9jyT0z9qEHKFvST2EeQCwpibwMstOFPxD0wbg3oJM7', 'create operator', 'The CREATE OPERATOR statement is used to create a new operator in a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(50, 'PfkwFukucsWJ9JmfDhqzZ6AQLhpOw0NHtOQQNG', 'drop operator', 'The DROP OPERATOR statement is used to delete an operator from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(51, 'dc4kqIENCfU5nPgOFv35Q6W58QF9huDCTpHolnIkubTdiBN', 'create aggregate', 'The CREATE AGGREGATE statement is used to create a new aggregate in a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(52, 'yAnGwAIUFZErkrV1mBF3a9SjsaHdPIzFoe3u32j3JA', 'drop aggregate', 'The DROP AGGREGATE statement is used to delete an aggregate from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(53, 'LChwZPFurEpFkrGK9Zeu0V4vwSsJyqxEWF43Y2XD9n1Xq', 'create cast', 'The CREATE CAST statement is used to create a new cast in a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(54, 'U22Grd4NDTHSZeGIf88SrcWBaMfNX2crxc2bR0Ubvh13L', 'drop cast', 'The DROP CAST statement is used to delete a cast from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(55, '7j1hOwVrrEy5MDlxPnYMotunTS1kkLPpPsY5', 'create operator class', 'The CREATE OPERATOR CLASS statement is used to create a new operator class in a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(56, '75uiKOhfmB1h4dOduEAoz9fhQBxvn4CzJ6HVZvs5h0gU99y', 'drop operator class', 'The DROP OPERATOR CLASS statement is used to delete an operator class from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(57, 'hkZbnOPND3hHoCbYQY7bgKwN6n7QP6MXVcGie69eGiKMX', 'create operator family', 'The CREATE OPERATOR FAMILY statement is used to create a new operator family in a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(58, 'pD9IgysbTxzM6vR1Vv4KhEfgUnFbbBFE9DpOZpi2', 'drop operator family', 'The DROP OPERATOR FAMILY statement is used to delete an operator family from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(59, 'k5twGRqExNsDZPJR0Kdf0IICrRf1rpQz1M2IK4a', 'create conversion', 'The CREATE CONVERSION statement is used to create a new conversion in a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(60, 'CxhILpXiWF3JBM5HBKaBtRuSpBug5FilLE9CFsv6x6hYI6k', 'drop conversion', 'The DROP CONVERSION statement is used to delete a conversion from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(61, 'rjaQi7wp2vebUYcfm4B8qs7XGYD5KvoZncE2gj3ejwszz1v', 'create collation', 'The CREATE COLLATION statement is used to create a new collation in a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(62, 'g6PBDEvuCFwn6ZBueVe528MGGW8u46fQ7XHgbH', 'drop collation', 'The DROP COLLATION statement is used to delete a collation from a database.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(63, 'tI6YbtoGJbXSqkL4PcrDb3UvrWuRNKksX24uWffDsup0', 'int', 'The INT data type is used to store integers.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(64, 'pPfQtZ1rhVSG3u3v24ReV9oTieqw3JcC8GkSbzyyxc2Qbapv', 'bigint', 'The BIGINT data type is used to store integers with a size of at least 8 bytes.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(65, 'bTLGUrhu1MDf3FP45DRgQ8iBLqoCB8MNN6kifRE0QWo', 'smallint', 'The SMALLINT data type is used to store integers with a size of at least 2 bytes.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(66, 's6UJQg74WkayAU5SGdNyPYiApUprloxBHcaVan', 'tinyint', 'The TINYINT data type is used to store integers with a size of at least 1 byte.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(67, 'FsLVrqgbvFWEyMfdoStPqN4gHRB8Ob52euqSk5uqeMmMB', 'bit', 'The BIT data type is used to store bit strings.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(68, 'djdrPtJfdhBn6QCQBZwKQZXYREM26BHvFnMjJMF9Rcz', 'varchar', 'The VARCHAR data type is used to store strings with a maximum length of 255 characters.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(69, 'VlY8oKdfhSkPEGMd73M20sdzqm484GsNMvvCv', 'char', 'The CHAR data type is used to store strings with a maximum length of 1 character.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(70, 'rI5DUoLEE9BThYuL6m2FboQo7UIJJfiLcBKynwT', 'text', 'The TEXT data type is used to store strings with a maximum length of 65,535 characters.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(71, 'VLcg3G99XRYIVooEeT3sDtX2sdLDRIlYOp52rqUBwQQQKVUh', 'numeric', 'The NUMERIC data type is used to store fixed-point numbers with a maximum of 18 digits to the right of the decimal point.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(72, '5Hhc0Y86znHJnAbmC1ANCcuPIhAZ8qulEthOuPdEOAcbo', 'decimal', 'The DECIMAL data type is used to store fixed-point numbers with a maximum of 18 digits to the right of the decimal point.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(73, 'iXcwANy9Ji69lHQpXdIPmwoHk2a5xy8VWKWnLCpDu3R', 'money', 'The MONEY data type is used to store monetary amounts with a maximum of 4 digits to the right of the decimal point.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(74, 'MaY1re6CHGMOn9pjmcocKMz3epeDNhueNHREM4', 'smallmoney', 'The SMALLMONEY data type is used to store monetary amounts with a maximum of 2 digits to the right of the decimal point.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(75, 'c4FNVfG2nI1i3Td77v2kRts4X9Cgq66jUOkazfCaE0iAc08', 'float', 'The FLOAT data type is used to store floating-point numbers with a maximum of 53 digits to the right of the decimal point.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(76, '6fXSNe6n8Kds3SP8D6kpIJqq60VSRlxSPy8x5QvV2o', 'real', 'The REAL data type is used to store floating-point numbers with a maximum of 24 digits to the right of the decimal point.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(77, 'wrmObbAf17XDNfmtRKAHURCTjuWF7fjwZx2WXgzj4', 'double', 'The DOUBLE data type is used to store floating-point numbers with a maximum of 53 digits to the right of the decimal point.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(78, 'IzR2EXjRw1Oji6ngCFN591husoEOLTO9jGNBwL', 'date', 'The DATE data type is used to store dates.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(79, 'y6pKsuEBlGYAoTNgkBSfLjNCPyt6RaYQQJ7lJE70', 'time', 'The TIME data type is used to store time values.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(80, 'jI3nfx7mZGFA69097RWsipp5TZjthNyqkYfNktjSZpC6dmj', 'datetime', 'The DATETIME data type is used to store date and time values.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(81, '0AAq8peWOWQI8815sQBVegf5YGI59MTRawwXhQSZcUtB', 'datetimeoffset', 'The DATETIMEOFFSET data type is used to store date and time values with a precision of 1 to 7 digits.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(82, 'L2H0UtSMYXX22OUUvEAjvgAkNcbQGpEnQj8Vd4', 'smalldatetime', 'The SMALLDATETIME data type is used to store date and time values with a precision of 1 to 4 digits.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(83, 'qXB8yXDn0I74IDYwyxI51Mww9OC9qm9np547dqoyAHAlvF', 'timestamp', 'The TIMESTAMP data type is used to store date and time values with a precision of 1 to 8 digits.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(84, 'iIEwspc8YIq6JbcH3phyCaxPYJdjrUxQTtLM3zdB4', 'varbinary', 'The VARBINARY data type is used to store variable-length binary data.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(85, 'XFcteVTwPZGE7gnnEBbjalZYl3ijuOJRPiZhxN4GMV87JPXF', 'image', 'The IMAGE data type is used to store image data.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(86, 'w695l2sgNXLq4BNSTv2ObtzPlR7g0SjvYI19exQKOlYcCpU', 'enum', 'The ENUM data type is used to store enumeration values.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(87, 'QLPATSmL6ngaJj6PbMmcxNNRhcyykNjc4HG6Rou', 'uniqueidentifier', 'The UNIQUEIDENTIFIER data type is used to store globally unique identifiers (GUIDs).', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(88, 'Xyz2hmcrkMpsLKZNYFGcGRBObIPVbm9QlfIDYY', 'sql_variant', 'The SQL_VARIANT data type is used to store data in a format that is specific to the data source.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(89, 'gsb2ZduWw28nzQRDGaWU0tDZExS1qMVDUCUZIo4IMLqU0wtW', 'xml', 'The XML data type is used to store XML data.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(90, 'iSYsxaSz8AmC8QdmsQ18cHyzdv7Mo4tzPKukuMfwEgg', 'table', 'The TABLE data type is used to store tables.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(91, 'xwS0KqxvufUNlaDh9Jse7b7wyBtHRaCJp4WVubZAgRpgBb', 'column', 'The COLUMN data type is used to store columns.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(92, 'wS8vJQyirWZRjikZFIS8zMRnzlupUlhB4Af7gTmoxFeswA', 'constraint', 'The CONSTRAINT data type is used to store constraints.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(93, 'hcZL4YInpK6xcMWRPjo1OAaGb3tem6dJTM8zNJOnU3BI2', 'default', 'The DEFAULT data type is used to store default values.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(94, '4HVQWbigkqgA6NgIdf6zjbdzkcQfjE88SGIPmK1', 'rule', 'The RULE data type is used to store rules.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(95, 'q0ieZuaCEb7vuEzrG1ncNEqWq4z630lrmXNUngTTLWv7Zf', 'trigger', 'The TRIGGER data type is used to store triggers.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(96, 'qRSjMhW2zGEKNEYAbbXkR9Qp3aLL2gs8wy2Dw5mphqPV3Gl', 'view', 'The VIEW data type is used to store views.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(97, 'd1RNpcOeC31du43Ix5ohNQtk1OAMsLvzvluxRuf', 'index', 'The INDEX data type is used to store indexes.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(98, 'jyuYlp1L0BdPjJWZZqI0SZF0XTCoBboQEBpQzg', 'primary', 'The PRIMARY data type is used to store primary keys.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(99, 'vlV7Dv6RkCahxWOE72K7j6FKfLzaUoymk7rTe8KVbMX', 'foreign', 'The FOREIGN data type is used to store foreign keys.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(100, 'lZUge8kLxm14fbiGAVdrQ4gywmozC02iiVcHn4W', 'references', 'The REFERENCES data type is used to store foreign keys.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(101, 'Kiw8GckKuCez13kvnu0hsS4L4fKEh6s0SRxXH20kn0', 'check', 'The CHECK data type is used to store check constraints.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(102, 'M4zyNzvVJFMkbGUR1DwWNeMZlogCwBR3UMO9', 'unique', 'The UNIQUE data type is used to store unique constraints.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(103, 'c8NkdQqXAzzPmkYAWdFOIGCch2EielFEPgj4sZ', 'not', 'The NOT data type is used to store NOT constraints.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(104, 'V1gIbEMqdCpX5ivVr6mGJZGs7d9cRdIKHlhJGD', 'null', 'The NULL data type is used to store NULL constraints.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(105, 'r71UxV86ZvxSSlFXZere85XJplfOBSCrEqWhwK7fDC52IB0K', 'primary key', 'The PRIMARY KEY data type is used to store primary keys.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(106, 'cNZkKj1Uz1c1lykT8uiL6YpD2ZxJ68VmLbVL7tnrh026UyV', 'foreign key', 'The FOREIGN KEY data type is used to store foreign keys.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(107, 'lI5xGcLr3AWA3sJlOH4KhMKvuJ5RoAXmVP6of7Bz1vNHA', 'check constraint', 'The CHECK CONSTRAINT data type is used to store check constraints.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(108, 'JtB4SbiLlh1RZKWCrrFN7NtitxNWrLzd9ozFkh', 'unique constraint', 'The UNIQUE CONSTRAINT data type is used to store unique constraints.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(109, '5Zceg3bR9aUVydk9qAdHDNku4GhKREQBXDuRWUKZRGI4No0', 'not null', 'The NOT NULL data type is used to store NOT NULL constraints.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(110, 'tCiKMre5X7Dbboq2sBf3uZVGK1ospTXkN842UgzjQTKGBaof', 'null constraint', 'The NULL CONSTRAINT data type is used to store NULL constraints.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(111, 'MeO2EYDAwZxd1wsPfFFuQKEjnkFI1dQf8pATUlQCHLb', 'primary key constraint', 'The PRIMARY KEY CONSTRAINT data type is used to store primary keys.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(112, 'dFOf3gSUdse8EpKq767nSkyFutllI6aK4neRvzDsGti', 'foreign key constraint', 'The FOREIGN KEY CONSTRAINT data type is used to store foreign keys.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(113, 'YmqafraesxRyWc3ZZW6fG1Hk7eSiylW5miSU0lm0ULyBHO', 'unique key constraint', 'The UNIQUE KEY CONSTRAINT data type is used to store unique constraints.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(114, 'ieEGAM0SWigl92N4N3O131zQhx8OaiGnmr2YYZlVWmn', 'not null constraint', 'The NOT NULL CONSTRAINT data type is used to store NOT NULL constraints.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(115, 'phyW0FIIN5diCqSwDzFAGE3H5eI2qb3JKm2OHWtixclC7', 'null key constraint', 'The NULL CONSTRAINT data type is used to store NULL constraints.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(116, 'xRIkUg0GGaXJLzVSdrzT7886hx3V5fE2HuchJeDw3', 'unsigned', 'The UNSIGNED data type is used to store unsigned integers.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(117, 'ujVnmGjQcgz00tFugW8aO8pS73rKq9tkeJ2RP', 'signed', 'The SIGNED data type is used to store signed integers.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(118, 'i1oJutcJDifwgCjXaxYmZmq4EUEwXoDJsGOx9', 'zerofill', 'The ZEROFILL data type is used to store integers with a size of at least 1 byte.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(119, 'GNLS9oUHGU5fvVxZhLySGeXDc3d55maQEgf27KEa', 'autoincrement', 'The AUTOINCREMENT data type is used to store integers with a size of at least 1 byte.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(120, 'aqZa2sb88mxDTxm0N68Q6nmfLboIIJRZBbWK', 'collate', 'The COLLATE data type is used to store strings with a maximum length of 255 characters.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(121, '6WBG8neGvIfWnAhv9d2qzkXsjzztzUnIJRXBhw', 'collation', 'The COLLATION data type is used to store strings with a maximum length of 255 characters.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(122, '4KrktR2Rkz4Wxl3cKutbDyq0XCfH3xRF1VpQ59yqC', 'character set', 'The CHARACTER SET data type is used to store strings with a maximum length of 255 characters.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(123, 'iLNJlMICWCBTlJISZ2CZyUFporkHYPRW4JAVf1t7Su', 'current_timestamp', 'The CURRENT_TIMESTAMP data type is used to store the current date and time.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(124, '42mxiswPBZeE3yGbpJJAHLMV52cQYtfffuH9v1K', 'current_date', 'The CURRENT_DATE data type is used to store the current date.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(125, 'bzZaFjWwjAaGWR9PamhkKBrcOdTInD1Ay5pSn', 'current_time', 'The CURRENT_TIME data type is used to store the current time.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(126, 'yeQZNbxuDqG8rppfJVUh9bddpCUDxdDJIY1KnRCo0hijb', 'current_user', 'The CURRENT_USER data type is used to store the current user.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(127, 'ec73T0KfXVfJiOUz6DxdbxjRRIVgceqYACPdhcJDLU54iCa', 'localtime', 'The LOCALTIME data type is used to store the local time.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(128, 'yfdnxoHNSsufbekLdSI6J8deirIUMC3HGav37K', 'localtimestamp', 'The LOCALTIMESTAMP data type is used to store the local date and time.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(129, '6UQm42nEcKRdC4qJnX8068kG8IoRlm5Vwr2vtI6OPf338U', 'on update', 'The ON UPDATE data type is used to store the ON UPDATE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(130, '6jsn3iFYr2h0r4VBZnEcD7MpUup5Icgo3cyc3yATBVMyCvt', 'now', 'The NOW data type is used to store the current date and time.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(131, 'gf3c7FwuH39K3kIGihVNsp3zKpukm3OzFzyKPi2a8Q080E', 'utc_date', 'The UTC_DATE data type is used to store the UTC date.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(132, 'wf1zEHDV4wLof75SmYHf9DxpkDYtgbBWHo2t2biISUJ', 'utc_time', 'The UTC_TIME data type is used to store the UTC time.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(133, 'rleepiUyHKCuZkrAXljNqRilH5urFc0XTuzG', 'utc_timestamp', 'The UTC_TIMESTAMP data type is used to store the UTC date and time.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(134, 'ESwlmAKQgK8Mb0vVYIheIl5E5zN6O7ZEKJyXoedL', 'user', 'The USER data type is used to store the current user.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(135, 'g6NwEj2lDy0R3nsJLM85ixSQZ4SApe565O6iCctmRLwFFb', 'values', 'The VALUES data type is used to store the VALUES clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(136, 'ypuf7z26mgKlSu3O35DOC2bwOHPBGtQ5VmbG', 'year', 'The YEAR data type is used to store years.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(137, 'HOc8r578a1bJCsqKrZaYNcooz0DwLQ90M9Dg', 'insert', 'The INSERT data type is used to store the INSERT clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(138, 'NT1wpoU8iPCfpUgU8f0cndo083k7pePkx3ckm5XD88owG', 'into', 'The INTO data type is used to store the INTO clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(139, 'dRaWBHj3K2TVDMeef3v8M8aG8uwGnUCyAuogizTfqMZ', 'drop', 'The DROP data type is used to store the DROP clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(140, 'wRRlYtA9I1RfIR9IKwSiy9v6hgx9RYFKvQWMsjVmq6nOha', 'if', 'The IF data type is used to store the IF clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(141, '8cRgEk1tNGAUuVtsdxW9ksqZ3AgTDVj5ZvQSu', 'set', 'The SET data type is used to store the SET clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(142, 'r5mCrsL5THO3rsCnLtEdWV6pPVth2veHgjfQlpZC13BlSF7x', 'exists', 'The EXISTS data type is used to store the EXISTS clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(143, 'oyuB6lYGlweU2syNWleN63NFGpnagfo7fEcZFdxEmta', 'on update current_timestamp', 'The ON UPDATE CURRENT_TIMESTAMP data type is used to store the ON UPDATE CURRENT_TIMESTAMP clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(144, 'jSYElhmao1aLACzZzngTJ0tssFcigeHUF4Juf0apVcQHWXg', 'current_timestamp on update current_', 'The CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP data type is used to store the CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(145, 'RCyzgz323jIK1v3cMvNhYxNsDPPMRUyuas8L455QtS8K', 'aria', 'The ARIA data type is used to store the ARIA clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(146, 'DRjJ3rNu9QSdX2lfel2pXEg64wvzreGdJJVdLCPNmMo1o', 'csv', 'The CSV data type is used to store the CSV clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(147, 'GfIAVCqM0bghKR1NpFfd3SYpo4gTH6NCm2Z6CUmMx', 'mrg_myisam', 'The MRG_MYISAM data type is used to store the MRG_MYISAM clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(148, 'UtjZyUpW86I0A08H1HzAnmtOWtd3rHw4yRim2qA1iZORSP', 'sequence', 'The SEQUENCE data type is used to store the SEQUENCE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(149, '2KshBhmpirLlWEzFwQ35NgpUwutwjGwkjm0p', 'innodb', 'The INNODB data type is used to store the INNODB engine.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(150, 'X5Sb1qK3ag8DpvzphV2OA0E6hWG4k0sZ6dDgkpHQvIArl', 'myisam', 'The MYISAM data type is used to store the MYISAM engine.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(151, 'BuiWTWmusJzA1oup28ySJyZXZuHJxrghJT5CE6CjK', 'memory', 'The MEMORY data type is used to store the MEMORY engine.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(152, 'xjGDZZaBLFN5NmIHBWx2brHMrgNUijIPv2IF', 'merge', 'The MERGE data type is used to store the MERGE engine.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(153, 'y67qkVyyiB2c4fC57GzZ7t9FXSD6ckTVN0d5ACqr', 'hash', 'The HASH data type is used to store the HASH engine.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(154, 'WqZht5I9PZfqfo5LbjmIQpxZiwvqcY2u4QRU', 'rtree', 'The RTREE data type is used to store the RTREE engine.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(155, 'wjsLF2JgRIuCE1gXqaEjhxfs7MPEzgYBMSsL', 'federated', 'The FEDERATED data type is used to store the FEDERATED engine.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(156, 'IhS06WxAIqBMH5JZdeteGRFvA6wuzBiz7XZuMytGi', 'engine', 'The ENGINE data type is used to store the ENGINE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(157, '979nuf0Lh7mOIWFoncGyodsx6uUVNWQa7YQbMD', 'default charset', 'The DEFAULT CHARSET data type is used to store the DEFAULT CHARSET clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(158, 'JBw4BV4ka3ELJOrLiCswssGpAwHKz5wWS6Gakzb6CDFRA6', 'default character set', 'The DEFAULT CHARACTER SET data type is used to store the DEFAULT CHARACTER SET clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(159, 'C46aWmd8nG0FS3FTArQaYSHKTpTLDPGwqO4dhUGmas6fpOW', 'default collation', 'The DEFAULT COLLATION data type is used to store the DEFAULT COLLATION clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(160, 'SlDfiPRwdkw8G9MXr4fOCnZ5oLJcmgKVs9UE', 'default character set collation', 'The DEFAULT CHARACTER SET COLLATION data type is used to store the DEFAULT CHARACTER SET COLLATION clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(161, 'xyDAe8RaxjnNfcWwazh0tRmGmqWRu8dBnIoCstPZaoG2c', 'row format', 'The ROW FORMAT data type is used to store the ROW FORMAT clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(162, 'JN1tYQhOE5J6dfPqPSgi4pfnbhQitz5DTASgi3KwJK6SBsm3', 'key block size', 'The KEY BLOCK SIZE data type is used to store the KEY BLOCK SIZE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(163, 'GC5eUwHaDVZcSrTdYkxVuFHyFyn0XO7v0H7E', 'comment', 'The COMMENT data type is used to store the COMMENT clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(164, 'OGIX2cK26wrXjNc00KUDbTxROPg10S4jgB1DLBQkKcf9p', 'auto_increment', 'The AUTO_INCREMENT data type is used to store the AUTO_INCREMENT clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(165, 'ziY2tkRG694MpN8KQ3S2TDoEht6u4nGlICFl38VYA6', 'view definition', 'The VIEW DEFINITION data type is used to store the VIEW DEFINITION clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(166, 'vxI4k8VMXCNL3QaGIqCbm1AE5NFLIuDZj4ObbV0ZPn', 'create', 'The CREATE data type is used to store the CREATE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(167, 'ZtYoslB0uYzonw3DKIrA1LErvEkUGp8rKYi6DWxJotK', 'temporary', 'The TEMPORARY data type is used to store the TEMPORARY clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(168, 'UAF1MfXtFj5Q1IZzUmWKqXSEZmZQZ7JxhjH7ea05Z9mXNz4', 'if not exists', 'The IF NOT EXISTS data type is used to store the IF NOT EXISTS clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(169, 'yBS9fAng9pupLw7RfEwLK97ZuqxNGxdhaTa9Nk6DA', 'replace', 'The REPLACE data type is used to store the REPLACE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(170, 'LwthsdvzQdpNR4OrPqLOMLyKm1pUYe5Q1qbqGRVyAkg9', 'with', 'The WITH data type is used to store the WITH clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(171, 'Q60OJaQgY9G0d8aSVfdwmmncsBEpDjj2L3VoU1N8lVK', 'if exists', 'The IF EXISTS data type is used to store the IF EXISTS clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(172, 'R2SAEEiOZ6lltczo17On5pEGEdycHmF3j6A17', 'key', 'The KEY data type is used to store the KEY clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(173, 'qIWJKb5yu89pRzRfj1CDI0nrU5RBJmQjSbvSNP4Ug7OCm', 'charset', 'The CHARSET data type is used to store the CHARSET clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(174, 'GTmcPBqI2enDZR4asqDzhklL0uRR7OrtWMWVQ9Ts35CeDR', 'show databases', 'The SHOW DATABASES data type is used to store the SHOW DATABASES clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(175, 'WOftOLWwTkSoXsZ2HjT8LXiye4ZX78obMLCmyvxMmFzgDo', 'show tables', 'The SHOW TABLES data type is used to store the SHOW TABLES clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(176, 'PYrHGIyrJZcm6B6BIwFMuyr6xpcFkFO3JoyHxm', 'show columns', 'The SHOW COLUMNS data type is used to store the SHOW COLUMNS clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(177, 'JObbfsEhxTEq3HfOw4x0YKTUBsvE2SGwwtNIDNXQrrEpG', 'from', 'The FROM data type is used to store the FROM clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(178, 'EsAL303FRY4DL6hya8XH4dNtyuurLTFFRFqS9uuY22JxgpF', 'all', 'The ALL data type is used to store the ALL clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(179, 'JcMO7sgfMKQReAr5xALYCS5TdEm0JUuksTJykW', 'distinct', 'The DISTINCT data type is used to store the DISTINCT clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(180, '7DTrnMMdgTKed9HyIyOryXeAjPdJr2Ldqep2n3ZyITEjVt', 'join', 'The JOIN data type is used to store the JOIN clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(181, 'GgY7vmZzDYrDeYk6IWXXgQaeJmdgruoiuBlWAdfy', 'straight_join', 'The STRAIGHT_JOIN data type is used to store the STRAIGHT_JOIN clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(182, 'MIRDum8imxBi1AcUQgMsUkBhWEBa1yP4OeZZqo3AB9YIZA1c', 'left', 'The LEFT data type is used to store the LEFT clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(183, 'dE9lNAuVhTCb1EyaaOXxaW1REjt2lDsEVHFs9', 'right', 'The RIGHT data type is used to store the RIGHT clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(184, 'rgLNTTDAi1u9L8BZoHLruMnnjKifBVptxJPS0PHFxe05rq', 'inner', 'The INNER data type is used to store the INNER clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(185, 'IeTkqF5vYh1PRprA48W566PLVnwePbXuQj8OISx', 'outer', 'The OUTER data type is used to store the OUTER clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(186, 'yaGKJe2HrczQExI8pGqeqZDqQkjFMTUAUldo', 'cross', 'The CROSS data type is used to store the CROSS clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(187, 'XATa8sL01sTdXscWUWwb6Drw9UEGhoSLgzu4wWF5', 'natural', 'The NATURAL data type is used to store the NATURAL clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(188, 'w8Y9V4KtY3X4MP9Dblxwhk4Yd8a3ADu0bLwwYTIL0meQ4nq1', 'use', 'The USE data type is used to store the USE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(189, 'Q7e32M5yDd3HjElOXqF9vZPQheDxaPexhQIe1LCT', 'force', 'The FORCE data type is used to store the FORCE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(190, 'IWetv1zJckrRulylRvYpf7t5pzQSDIRNyozIzwG', 'ignore', 'The IGNORE data type is used to store the IGNORE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(191, 'SjKdvfSnHICPqNU2hDZtxE7QD61WaDL9bk50B8dy0', 'on duplicate key update', 'The ON DUPLICATE KEY UPDATE data type is used to store the ON DUPLICATE KEY UPDATE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(192, 'E5Ju6dblHWlL91o2Zx2G1gr3ch3B6MYX9XiSx', 'show create table', 'The SHOW CREATE TABLE data type is used to store the SHOW CREATE TABLE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(193, 'DiOi4Lo3nfOw7T0Ih1rfyq2zu4DcpUTwBEULcBNTzTH', 'show create view', 'The SHOW CREATE VIEW data type is used to store the SHOW CREATE VIEW clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(194, 'odF05cTQLXVjSzDMguKkLgLKnPebWOPHgOGm', 'show create procedure', 'The SHOW CREATE PROCEDURE data type is used to store the SHOW CREATE PROCEDURE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(195, 'QjGbiFwrB3mYniW7857z8D4KOXc7DDBO6twooUB', 'show create function', 'The SHOW CREATE FUNCTION data type is used to store the SHOW CREATE FUNCTION clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(196, 'd4WQQjUI2DnO2AGnljwYxlwPm6OLx6Vnrcmtg3gWkuyFOYU', 'show create event', 'The SHOW CREATE EVENT data type is used to store the SHOW CREATE EVENT clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(197, '7p9E8QvPgsCUtQI3ShwtXBsAPTG7oPzjaPTyLcQ02IVpOiLx', 'show create trigger', 'The SHOW CREATE TRIGGER data type is used to store the SHOW CREATE TRIGGER clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(198, 'wZuCtxlKHpnff9XILjy42skx78vdIGK4AzPDWQJf5', 'show create user', 'The SHOW CREATE USER data type is used to store the SHOW CREATE USER clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(199, 'GCwBB192L0EjnzeyW2d1Xq1TJN96JxOsM34I', 'show create grant', 'The SHOW CREATE GRANT data type is used to store the SHOW CREATE GRANT clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(200, '1Z5Fd25DF59xoWmKS8uOwlTVASC7rv0cj4WP3V5', 'show create routine', 'The SHOW CREATE ROUTINE data type is used to store the SHOW CREATE ROUTINE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(201, 'suopJJAT6HdMVkslyjXK88cd7pGpfV02NITDMM3eo0XXyjk', 'show create table space', 'The SHOW CREATE TABLE SPACE data type is used to store the SHOW CREATE TABLE SPACE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(202, 'ND6BAUiWiYQj3NwnlG6JuY0KIwC7JSte1GVtdre7Vy1d', 'show create index', 'The SHOW CREATE INDEX data type is used to store the SHOW CREATE INDEX clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(203, 'lid63VPapU2rY87lKsZWnqpRhsHEMiyuPGqFc9', 'show create role', 'The SHOW CREATE ROLE data type is used to store the SHOW CREATE ROLE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(204, 'X9f5VgeYzjCpvnS8yhq1ID7uIMoeVs5zJVcFif7', 'show create resource group', 'The SHOW CREATE RESOURCE GROUP data type is used to store the SHOW CREATE RESOURCE GROUP clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(205, '8DeVqOD8ekr01ELbdXXp1zr8Hh8EA6f6kzXYEejo5hhbD', 'show status', 'The SHOW STATUS data type is used to store the SHOW STATUS clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(206, 'aGtjFsEq4bCA3MwhBS7PgfMZu1I3sSqqX5Bk3aYVTsfp2lwL', 'show variables', 'The SHOW VARIABLES data type is used to store the SHOW VARIABLES clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(207, 'NOTnl1ygv70ezyar5IHivRUnIQCHwzZKJwSzfyhe6xsoG', 'show session status', 'The SHOW SESSION STATUS data type is used to store the SHOW SESSION STATUS clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(208, 'fDnA23K9vyvfL4b8g4V1i5yj11ay31xHuIjPhpM', 'show engine', 'The SHOW ENGINE data type is used to store the SHOW ENGINE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(209, 'XiLwCI67QBBL5UBCjYqURKdhnW5Z8bw5ld7UkV', 'show engine status', 'The SHOW ENGINE STATUS data type is used to store the SHOW ENGINE STATUS clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(210, 'evTdggmyqnIZaJIO37Z0zG5Lhkgt8VqVzFdJfawR7xc5sBF', 'show engine variables', 'The SHOW ENGINE VARIABLES data type is used to store the SHOW ENGINE VARIABLES clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(211, 'Nz7Offui8nMUo6b5hhz2ShFTwyzpupLMI4cXaijWM', 'show table status', 'The SHOW TABLE STATUS data type is used to store the SHOW TABLE STATUS clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(212, 'vVMqAj3Q4RKlcV7Cs0Mo8CQR5uQ9K6GZ02d9CnIH', 'show triggers', 'The SHOW TRIGGERS data type is used to store the SHOW TRIGGERS clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(213, 'zgVQaoE3Ehpk0MKadfRcfMZb4rJ0vk8tzq6SRlhc', 'show full columns', 'The SHOW FULL COLUMNS data type is used to store the SHOW FULL COLUMNS clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(214, 'IUVJ4yTLtmNPvhdk0SNhfYO20vqE5Rr2g6FdK', 'show full columns from', 'The SHOW FULL COLUMNS FROM data type is used to store the SHOW FULL COLUMNS FROM clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(215, 'q791r6YrZEHoroCIUV5qjuQJxDAuybjB24tL', 'show processlist', 'The SHOW PROCESSLIST data type is used to store the SHOW PROCESSLIST clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(216, 'uJUlMIbkHjt2Y3B4ZFHqlMh7NPEGU5gbd0QTw', 'show full processlist', 'The SHOW FULL PROCESSLIST data type is used to store the SHOW FULL PROCESSLIST clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(217, 'WH08xxr7OS6GYuM7MscAFGjwn4vvONJ8g75rsV3hR', 'show open tables', 'The SHOW OPEN TABLES data type is used to store the SHOW OPEN TABLES clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(218, 'aHMDgcXKriYACixIEGff3k1DUbB62CNt7yyprMBR', 'show open tables in', 'The SHOW OPEN TABLES IN data type is used to store the SHOW OPEN TABLES IN clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(219, 'X4A0i1pcOvuMDtoZLv3ysGmXvES9z2YHBLBO', 'show open tables from', 'The SHOW OPEN TABLES FROM data type is used to store the SHOW OPEN TABLES FROM clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(220, 'LIW8z06ktd0GZb2iuCdX37L5YBpo2H2GJXY3JYh1ccfAYPDJ', 'dump', 'The DUMP data type is used to store the DUMP clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(221, '3K08n6jS9R8iwqPyMBQaKYophb7q1WQ9SKPsHKNbf6Ed1dPf', 'create primary key', 'The CREATE PRIMARY KEY data type is used to store the CREATE PRIMARY KEY clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(222, 'xv9oX3KJjPPtSWRQtcgw451qqPa4z9Rr7P3y', 'create unique key', 'The CREATE UNIQUE KEY data type is used to store the CREATE UNIQUE KEY clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(223, '5UkUTFQMYBGAerU8bJzKuheSx2JzHqTCIDkMw7sfyBx1Jf', 'create spatial index', 'The CREATE SPATIAL INDEX data type is used to store the CREATE SPATIAL INDEX clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(224, 'EagtKJ3p4DIYIMccGmP6x6dPxgSe7U96SlEo', 'create fulltext index', 'The CREATE FULLTEXT INDEX data type is used to store the CREATE FULLTEXT INDEX clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(225, 'a8LUhVgw7xToef9vL6dGAlEA62M243ZSpwbqppPQ', 'alter table add column', 'The ALTER TABLE ADD COLUMN data type is used to store the ALTER TABLE ADD COLUMN clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(226, 'AxabZDZt2zUcL4bfnjZ0gGbGPxhJomaI1r5xS92mVaL45L7h', 'alter table drop column', 'The ALTER TABLE DROP COLUMN data type is used to store the ALTER TABLE DROP COLUMN clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(227, 'dryxCR0aIoo6Ws5ufYZ2U2z3GWYWs4W89doadyaI1VSudvi7', 'alter table change column', 'The ALTER TABLE CHANGE COLUMN data type is used to store the ALTER TABLE CHANGE COLUMN clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(228, 'mTYNtuwgqCT1nSzFauSzWOkCM2PiQ0bHQChbBkGK1DRqn', 'show engines', 'The SHOW ENGINES data type is used to store the SHOW ENGINES clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(229, 'MrHO7x78Gg60NWDWoWmmMRID4E29QSS3SyjNYKGzaVQNZQy', 'show global status', 'The SHOW GLOBAL STATUS data type is used to store the SHOW GLOBAL STATUS clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(230, 'fpxV6eYZSlnUrYxZ5yGbraE1JpR0813rFQhL', 'show collation', 'The SHOW COLLATION data type is used to store the SHOW COLLATION clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(231, '1tdA1tSxxmfqG2A4Hu4GK8QLvolSTPA27mZT2Zd2Vm7n', 'show character set', 'The SHOW CHARACTER SET data type is used to store the SHOW CHARACTER SET clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(232, 'dwojPEJ8flDCLSKDl8PEg1Qwp6e6414GMMaAimAV4', 'show master status', 'The SHOW MASTER STATUS data type is used to store the SHOW MASTER STATUS clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(233, 'p2WmpSMPILHARjO7Nw4RBO9hOIRZaiYWaAgNx', 'show slave status', 'The SHOW SLAVE STATUS data type is used to store the SHOW SLAVE STATUS clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(234, 'JPZLZSxtCmpg74GgQCQAdjVJ5JoJVBtiYiL99sYizn77L1', 'show status variables', 'The SHOW STATUS VARIABLES data type is used to store the SHOW STATUS VARIABLES clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(235, 'XTijna99hsnzsO9lVFqXU2GFPFtXmSD67R2t3HhMDSXbi2Zw', 'show session variables', 'The SHOW SESSION VARIABLES data type is used to store the SHOW SESSION VARIABLES clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(236, 'h20zXJiqB2YyeQA5uNN8Ncb8hR1E0arHeIEV0', 'show global variables', 'The SHOW GLOBAL VARIABLES data type is used to store the SHOW GLOBAL VARIABLES clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(237, 'VFSXjIPRWeJp85USd7WrtvejqwBCf98MgZrd2', 'row', 'The ROW data type is used to store the ROW clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(238, 'ybEyatFoRqfEXR8tmuS0GvknZvqt3HsVW2shOKyxt', 'row_count', 'The ROW_COUNT data type is used to store the ROW_COUNT clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(239, 'WW62iLS63cT56YvRxRz9mvi8YyzRqSXz1Trm1z1Yr2', 'colunms', 'The COLUMNS data type is used to store the COLUMNS clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(240, 'z9yor5BdFybLY9vbAz4rcQs45Rre4Iy1c5W6eQgxvo4Yp', 'column_name', 'The COLUMN_NAME data type is used to store the COLUMN_NAME clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(241, 'JbXmavGmEJIhIrMr828InCI1KYQGDHt2gtrJ', 'column_type', 'The COLUMN_TYPE data type is used to store the COLUMN_TYPE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(242, 'l6vz4oJU7nX4dxZCvZIZxm6DDmEV8Roq3ppx6Z', 'column_default', 'The COLUMN_DEFAULT data type is used to store the COLUMN_DEFAULT clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(243, 'DL2OPCU1oTlVhtDxBS7PsnbXJLpEZco5GhU3meNTQodav4', 'column_key', 'The COLUMN_KEY data type is used to store the COLUMN_KEY clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(244, '5BY6sA3Cj4t1ut0WurbnTT5AcXUrIuG0vOjmQCRjbm', 'column_comment', 'The COLUMN_COMMENT data type is used to store the COLUMN_COMMENT clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(245, 'MfzAbm2UIvSbplybYOeRWAgMx9j6oa6tKas2hdqXgpot4Fl', 'column_extra', 'The COLUMN_EXTRA data type is used to store the COLUMN_EXTRA clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(246, 'uMYzBQ2kqCWohsaxtwpqVMNt9y1B0hgQjRgl0CQUtnS1', 'column_count', 'The COLUMN_COUNT data type is used to store the COLUMN_COUNT clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(247, 'teZBfP0xB9bpxZjF5kGTvQ5RwcZr0YQ4tq8i9c9HPqqRtm', 'column_types', 'The COLUMN_TYPES data type is used to store the COLUMN_TYPES clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(248, '9aNEsp8rC8vj20f1BAW7ASXNAphpovZfIGoxPJUCI9', 'column_type_name', 'The COLUMN_TYPE_NAME data type is used to store the COLUMN_TYPE_NAME clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(249, 'XUA5xBpY8Ju8Plu7DW52gPqN4ETb0ty2F53ib7hCybqhr', 'column_type_length', 'The COLUMN_TYPE_LENGTH data type is used to store the COLUMN_TYPE_LENGTH clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(250, 'iJOx3exIDERwHhd2mFt6zHJVbYhhrePT2nwTcT', 'column_type_precision', 'The COLUMN_TYPE_PRECISION data type is used to store the COLUMN_TYPE_PRECISION clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(251, 'D4CqnLIqSuXcsqByaL3Klwe3yaqm3tm3uE250KF8SHA', 'column_type_scale', 'The COLUMN_TYPE_SCALE data type is used to store the COLUMN_TYPE_SCALE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(252, 'AMbBCCz5EIcvQgjPmAYuMgSu7CgqIq3CWMiXz', 'column_type_unsigned', 'The COLUMN_TYPE_UNSIGNED data type is used to store the COLUMN_TYPE_UNSIGNED clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(253, 'G00UGpW1ULeBNgysXXYMuVRJJ7iHf81ka5PWCmDSMLng', 'column_type_zerofill', 'The COLUMN_TYPE_ZEROFILL data type is used to store the COLUMN_TYPE_ZEROFILL clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(254, 'AHMZFC0xtqIzdqk2ONIgvMJycoTP1ZcKnRyhkLseX', 'column_type_null', 'The COLUMN_TYPE_NULL data type is used to store the COLUMN_TYPE_NULL clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(255, 'WQhdZcdwpXIjsSoFQ5LQJkmh2Uo2J021nlfOldgG5vUP7', 'column_type_auto_increment', 'The COLUMN_TYPE_AUTO_INCREMENT data type is used to store the COLUMN_TYPE_AUTO_INCREMENT clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(256, 'XQS48AVzWomu8AMzyP1GL2eREq3MlZ1BthmK7vPse', 'column_type_primary_key', 'The COLUMN_TYPE_PRIMARY_KEY data type is used to store the COLUMN_TYPE_PRIMARY_KEY clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(257, '9iw9HX6yFRL065qT2CCOnbUqClri4dMbyZwYWh', 'column_type_unique_key', 'The COLUMN_TYPE_UNIQUE_KEY data type is used to store the COLUMN_TYPE_UNIQUE_KEY clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(258, '6qqXfwMLCg4phO5ap5djpv0PP1JcY1je55kPtd3d5iS', 'column_type_multiple_key', 'The COLUMN_TYPE_MULTIPLE_KEY data type is used to store the COLUMN_TYPE_MULTIPLE_KEY clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(259, 'K0fvm6HA6N5iiWY7a99i2IUG7Ecf29d13OdLF5XhSTaX', 'column_type_index', 'The COLUMN_TYPE_INDEX data type is used to store the COLUMN_TYPE_INDEX clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(260, '0QQLrb4TIzBChb25G6i48PNOJaN61WIc58zdsjd', 'column_type_fulltext', 'The COLUMN_TYPE_FULLTEXT data type is used to store the COLUMN_TYPE_FULLTEXT clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(261, '2UgHp78NfksUd3Y8whqtOqBkabhfhgs1r2wEalfB4', 'column_type_unique', 'The COLUMN_TYPE_UNIQUE data type is used to store the COLUMN_TYPE_UNIQUE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(262, 'toVX32ZJYpWvX0BdoauRbXWom0dtauDUYuUOq154VuZMY', 'column_type_nullable', 'The COLUMN_TYPE_NULLABLE data type is used to store the COLUMN_TYPE_NULLABLE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(263, 'a0z7QWBCLliKPR6bXunAjIqJxAFOuesEg0Q21Zdu', 'cross join', 'The CROSS JOIN data type is used to store the CROSS JOIN clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(264, '3VIUo7FmVq4J2tpIPU3fkwNX8DiCiYO0O89C3dMIZd', 'natural join', 'The NATURAL JOIN data type is used to store the NATURAL JOIN clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(265, 'cCHr818Jt08lq8IS6GIArUdbJlVFYeJZ4atlibylK', 'left join', 'The LEFT JOIN data type is used to store the LEFT JOIN clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46');
INSERT INTO `ws_sql_minidoc` (`id`, `slug`, `name`, `content`, `added_in`, `updated_in`) VALUES
(266, 'vhQACO85cVAHmg0k74PFwzIpE6Y82Bwdhag41oRMNkJgEp6', 'right join', 'The RIGHT JOIN data type is used to store the RIGHT JOIN clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(267, 'e38zk4aFzpwtXZVVbRDlADGjmwTex6KzCGuqq6i7D', 'inner join', 'The INNER JOIN data type is used to store the INNER JOIN clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(268, 'km4KjQ74Vu0NHy26H0ScJ2NVXtRlAbQR7V9XrdWVIr9qk', 'outer join', 'The OUTER JOIN data type is used to store the OUTER JOIN clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(269, 'q04HvnleYu9SEif6C0KhhINI9ePaaTXG1guU', 'on', 'The ON data type is used to store the ON clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(270, 'GFxE2QcJP4zo2TnLWbyswKufc1wU0QgOjvFFrxuG2m9', 'using', 'The USING data type is used to store the USING clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(271, 'B5di48piHrw1T6bER6kdYGTkwIi5AQG1dFC2SWkm', 'where', 'The WHERE data type is used to store the WHERE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(272, '42NjfKfr4TZyMHWBcV6pt7uDr7dF1PjtvQVJamUJxXoSrRO', 'group by', 'The GROUP BY data type is used to store the GROUP BY clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(273, '39VpIm0aedy9nyT3iBXT6uNHVyZMZZlo2bh96tagCOeXp6bb', 'having', 'The HAVING data type is used to store the HAVING clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(274, 'j4Y9uyAfX4dLlU2dRORRXD3DrweOJetfcRgnSk798f9N', 'order by', 'The ORDER BY data type is used to store the ORDER BY clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(275, 't4n68Of1pAP0KdGqNZFKKwwm4MchIqZ58F5iSpYJ5aoyoc', 'limit', 'The LIMIT data type is used to store the LIMIT clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(276, 'Q2X2Vp3F4fYeFLwqqNTxRyzlVVIMHIdqceEF', 'offset', 'The OFFSET data type is used to store the OFFSET clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(277, '3XrP8KrEyTWsxMxiNtKrAj0QTq7JpefSUCFFRdL9P', 'for update', 'The FOR UPDATE data type is used to store the FOR UPDATE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(278, 'u3DV1b6kCiQnsSW8VY5tB2YUtPWEX4vt0lBwQE6yv06', 'lock in share mode', 'The LOCK IN SHARE MODE data type is used to store the LOCK IN SHARE MODE clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(279, 'BNC61WtDZtTnJ6je07bkHsLNvi6H6SKOgCb4xdONBmZffRa', 'union', 'The UNION data type is used to store the UNION clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(280, 'onjLou07nw9RtXtrTpm4v3oLONeHsbP3fC1My0l69', 'union all', 'The UNION ALL data type is used to store the UNION ALL clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(281, 'T9DRebJf9B735WjB5ojN1G58RxlRmgdSU0EgtpEbECPyBE', 'intersect', 'The INTERSECT data type is used to store the INTERSECT clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(282, '2VNWZkLWDR5a6R5uflAe7gPxDUoA4dVCIzYd5idwvHGMbJ', 'except', 'The EXCEPT data type is used to store the EXCEPT clause.', '2022-01-07 09:57:46', '2022-01-07 09:57:46'),
(283, 'JweIDCoobAwe5qCvByz6zhG2ozB5yzcfbl1sBRieSGyIK1', 'create temporary table if not exists', 'The CREATE TEMPORARY TABLE IF NOT EXISTS data type is used to store the CREATE TEMPORARY TABLE IF NOT EXISTS clause.', '2022-01-07 09:57:47', '2022-01-07 09:57:47'),
(284, 'yj6D2Oi474yw8QkgoW994BHjrqNQez659CLV', 'drop temporary table', 'The DROP TEMPORARY TABLE data type is used to store the DROP TEMPORARY TABLE clause.', '2022-01-07 09:57:47', '2022-01-07 09:57:47'),
(285, 'x3hLHA3Lc9GIdpyvUckc9SzZQCstKb9uKvjWe8ePs', 'drop temporary', 'The DROP TEMPORARY data type is used to store the DROP TEMPORARY clause.', '2022-01-07 09:57:47', '2022-01-07 09:57:47'),
(286, '100cc0SF84Lz57vi4MMO2I9MzfmY6dQvA3Q5gHtLup38S', 'create temporary', 'The CREATE TEMPORARY data type is used to store the CREATE TEMPORARY clause.', '2022-01-07 09:57:47', '2022-01-07 09:57:47'),
(287, 'RaoX5u0EmWypmndYVJnChwtS0rpBKuKI2CIwa4wrSR509i', 'analyze', 'The ANALYZE data type is used to store the ANALYZE clause.', '2022-01-07 09:57:47', '2022-01-07 09:57:47'),
(288, 'X95KWgOyTVanb0wz58NFxLwl3PHjq17QcAhUxuOTX', 'optimize', 'The OPTIMIZE data type is used to store the OPTIMIZE clause.', '2022-01-07 09:57:47', '2022-01-07 09:57:47'),
(289, 'TKrbAjkZFmAQEKTlDkKZxlp90tyjOI98xJXfISq3', 'repair', 'The REPAIR data type is used to store the REPAIR clause.', '2022-01-07 09:57:47', '2022-01-07 09:57:47'),
(290, '8cbAwaZ7cZvMDVeFAQ1rHnY0EEnksT4rjlmgffU35WrU', 'truncate', 'The TRUNCATE data type is used to store the TRUNCATE clause.', '2022-01-07 09:57:47', '2022-01-07 09:57:47'),
(291, 'xbtVFklSMADBVjVIDtX0Y2w9KUxsaLw6ZAah', 'analyze table', 'The ANALYZE TABLE data type is used to store the ANALYZE TABLE clause.', '2022-01-07 09:57:47', '2022-01-07 09:57:47'),
(292, 'zKn3RGFeSPVN5xE4l7tFx3nHQf4dP9OUX2A0Wl4hsSKD', 'optimize table', 'The OPTIMIZE TABLE data type is used to store the OPTIMIZE TABLE clause.', '2022-01-07 09:57:47', '2022-01-07 09:57:47'),
(293, '1bUC5BHjYaC5bq1ateBiLLJvMfJKwTpr2hijSkE3Lsexm', 'repair table', 'The REPAIR TABLE data type is used to store the REPAIR TABLE clause.', '2022-01-07 09:57:47', '2022-01-07 09:57:47'),
(294, 'qT0xK33NFgxnGYW0chwr0z01Dl6JuRYP47PDuD3P', 'check table', 'The CHECK TABLE data type is used to store the CHECK TABLE clause.', '2022-01-07 09:57:47', '2022-01-07 09:57:47'),
(295, 'j0FD6nb4WFTRC9ZhJj3vpz0qZpQsrHPbM2eI', 'checksum table', 'The CHECKSUM TABLE data type is used to store the CHECKSUM TABLE clause.', '2022-01-07 09:57:47', '2022-01-07 09:57:47'),
(296, 'ZoV8yNGwyfcamVgF33FyWT2otxwyRQPMxGlORDf', 'repair views', 'The REPAIR VIEWS data type is used to store the REPAIR VIEWS clause.', '2022-01-07 09:57:47', '2022-01-07 09:57:47'),
(297, 'L73UtOD5QUey83uJeho2ZVEPlZHHNa4tzVxf6MpuPypmr', 'repair view', 'The REPAIR VIEW data type is used to store the REPAIR VIEW clause.', '2022-01-07 09:57:47', '2022-01-07 09:57:47'),
(298, 'YVyqWtR4bJW0HeyVs4Y5Gsz72YszvYUJQ43Nnnn', 'check view', 'The CHECK VIEW data type is used to store the CHECK VIEW clause.', '2022-01-07 09:57:47', '2022-01-07 09:57:47'),
(299, '3vjLdsupcJ8oPNsH5Z98A8OWMiOqYn7gM02VZycizyc05', 'checksum view', 'The CHECKSUM VIEW data type is used to store the CHECKSUM VIEW clause.', '2022-01-07 09:57:47', '2022-01-07 09:57:47'),
(300, 'sjVxbH5CbkG0GXb3tzeMvKorstwxag7EYwKhivjJmGkA', 'like', 'The LIKE data type is used to store the LIKE clause.', '2022-01-07 21:11:08', '2022-01-07 21:11:08'),
(301, 'z1Wg4MR7ExPOTBjrbU8LDZOxvvnaFTZw7mIpNTmplXJg', 'nextval', 'The NEXTVAL data type is used to store the NEXTVAL clause.', '2022-01-12 04:21:14', '2022-01-12 04:21:14');

-- --------------------------------------------------------

--
-- Table structure for table `ws_sync`
--

CREATE TABLE `ws_sync` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(48) NOT NULL,
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
  `slug` varchar(48) NOT NULL,
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
  `slug` varchar(48) NOT NULL,
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
-- Indexes for table `ws_code_notes`
--
ALTER TABLE `ws_code_notes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

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
-- Indexes for table `ws_sqlminidoc_bookmarks`
--
ALTER TABLE `ws_sqlminidoc_bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `ws_sql_minidoc`
--
ALTER TABLE `ws_sql_minidoc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `name` (`name`);

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
-- AUTO_INCREMENT for table `ws_code_notes`
--
ALTER TABLE `ws_code_notes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `ws_sqlminidoc_bookmarks`
--
ALTER TABLE `ws_sqlminidoc_bookmarks`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_sql_minidoc`
--
ALTER TABLE `ws_sql_minidoc`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

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
