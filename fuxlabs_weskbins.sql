-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Ago-2020 às 22:13
-- Versão do servidor: 10.4.11-MariaDB-log
-- versão do PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `fuxlabs_weskbins`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `wk_clones`
--

CREATE TABLE `wk_clones` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `item` int(11) UNSIGNED NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `wk_code_notes`
--

CREATE TABLE `wk_code_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `position` text NOT NULL,
  `note` text NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `wk_comments`
--

CREATE TABLE `wk_comments` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `comment` text NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `wk_folders`
--

CREATE TABLE `wk_folders` (
  `id` int(11) NOT NULL,
  `slug` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `wk_messages`
--

CREATE TABLE `wk_messages` (
  `id` int(11) NOT NULL,
  `slug` varchar(32) NOT NULL,
  `to_user` int(11) UNSIGNED NOT NULL,
  `mesage` text NOT NULL,
  `added_in` int(11) NOT NULL,
  `username` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `wk_profile`
--

CREATE TABLE `wk_profile` (
  `id` int(11) NOT NULL,
  `name` varchar(36) NOT NULL,
  `resume` varchar(64) NOT NULL,
  `social` text NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` varchar(32) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `wk_reports`
--

CREATE TABLE `wk_reports` (
  `id` int(11) NOT NULL,
  `slug` varchar(64) NOT NULL,
  `reason` varchar(32) NOT NULL,
  `pos` varchar(32) DEFAULT NULL,
  `message` text NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `wk_snippets`
--

CREATE TABLE `wk_snippets` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `file` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `ext` varchar(12) NOT NULL,
  `folder` int(11) UNSIGNED DEFAULT NULL,
  `stats` int(11) UNSIGNED NOT NULL,
  `syntax` varchar(32) NOT NULL,
  `markeds` text NOT NULL,
  `wikipedia` text NOT NULL,
  `expires_in` enum('10 min','1 hour','1 day','1 week','2 weeks','1 month','1 year','never') NOT NULL DEFAULT 'never',
  `status` enum('public','private','unlisted') NOT NULL DEFAULT 'public',
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `wk_snippets`
--

INSERT INTO `wk_snippets` (`id`, `slug`, `file`, `name`, `ext`, `folder`, `stats`, `syntax`, `markeds`, `wikipedia`, `expires_in`, `status`, `added_in`, `updated_in`, `username`) VALUES
(1, '4brUus3n0ZcT6WZ51G1jUT02jH9XEGs3', '1cIpYOqe6rpYY67RgKPzOOA2ZjRzG8yv', 'test.txt', 'txt', 0, 0, 'PHP', '[0]', '[\"PHP\"]', 'never', 'public', '2020-07-31 18:46:31', '2020-07-31 18:46:31', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `wk_stars`
--

CREATE TABLE `wk_stars` (
  `id` int(11) NOT NULL,
  `slug` varchar(32) NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `added_in` datetime NOT NULL DEFAULT current_timestamp(),
  `username` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `wk_clones`
--
ALTER TABLE `wk_clones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Índices para tabela `wk_code_notes`
--
ALTER TABLE `wk_code_notes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Índices para tabela `wk_comments`
--
ALTER TABLE `wk_comments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Índices para tabela `wk_folders`
--
ALTER TABLE `wk_folders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Índices para tabela `wk_messages`
--
ALTER TABLE `wk_messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Índices para tabela `wk_profile`
--
ALTER TABLE `wk_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Índices para tabela `wk_reports`
--
ALTER TABLE `wk_reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Índices para tabela `wk_snippets`
--
ALTER TABLE `wk_snippets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `file_name` (`file`);

--
-- Índices para tabela `wk_stars`
--
ALTER TABLE `wk_stars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `wk_clones`
--
ALTER TABLE `wk_clones`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wk_code_notes`
--
ALTER TABLE `wk_code_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wk_comments`
--
ALTER TABLE `wk_comments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wk_folders`
--
ALTER TABLE `wk_folders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wk_messages`
--
ALTER TABLE `wk_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wk_profile`
--
ALTER TABLE `wk_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wk_reports`
--
ALTER TABLE `wk_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wk_snippets`
--
ALTER TABLE `wk_snippets`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `wk_stars`
--
ALTER TABLE `wk_stars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
