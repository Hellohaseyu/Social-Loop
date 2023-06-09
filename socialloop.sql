-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 20, 2022 at 01:44 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Social Loop`
--

-- --------------------------------------------------------

--
-- Table structure for table `content_i_follow`
--

DROP TABLE IF EXISTS `content_i_follow`;
CREATE TABLE IF NOT EXISTS `content_i_follow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) NOT NULL,
  `contentid` bigint(20) NOT NULL,
  `content_type` varchar(10) NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `contentid` (`contentid`),
  KEY `disabled` (`disabled`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL,
  `likes` text,
  `contentid` bigint(20) DEFAULT NULL,
  `following` text,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `contentid` (`contentid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `type`, `likes`, `contentid`, `following`) VALUES
(1, 'user', '{\"0\":{\"userid\":\"9031464344541888638\",\"date\":\"2022-01-19 14:02:58\"},\"2\":{\"userid\":\"6130964729282683\",\"date\":\"2022-01-20 11:58:23\"}}', 7777814096048559529, NULL),
(2, 'user', NULL, 9031464344541888638, '[{\"userid\":\"7777814096048559529\",\"date\":\"2022-01-19 14:02:58\"}]'),
(3, 'user', '[]', 6130964729282683, '[]'),
(4, 'user', '[{\"userid\":\"9968101549491\",\"date\":\"2022-01-20 12:52:12\"},{\"userid\":\"34228998529719577\",\"date\":\"2022-01-20 13:30:02\"},{\"userid\":\"500634178\",\"date\":\"2022-01-20 13:40:57\"}]', 257915693745488957, '[]'),
(5, 'user', '[{\"userid\":\"9968101549491\",\"date\":\"2022-01-20 12:51:13\"}]', 9968101549491, '[{\"userid\":\"257915693745488957\",\"date\":\"2022-01-20 12:52:13\"}]'),
(6, 'post', '[]', 14220, NULL),
(7, 'user', '[]', 34228998529719577, '[{\"userid\":\"257915693745488957\",\"date\":\"2022-01-20 13:30:02\"}]'),
(8, 'post', '[]', 6775628851384758543, NULL),
(9, 'post', '[]', 8616906, NULL),
(10, 'user', '[]', 500634178, '[{\"userid\":\"257915693745488957\",\"date\":\"2022-01-20 13:40:57\"}]'),
(11, 'post', '[]', 779686808014478562, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) NOT NULL,
  `activity` varchar(10) NOT NULL,
  `contentid` bigint(20) NOT NULL,
  `content_owner` bigint(20) NOT NULL,
  `content_type` varchar(10) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `contentid` (`contentid`),
  KEY `content_owner` (`content_owner`),
  KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `userid`, `activity`, `contentid`, `content_owner`, `content_type`, `date`) VALUES
(1, 9031464344541888638, 'follow', 7777814096048559529, 7777814096048559529, 'profile', '2022-01-19 14:01:22'),
(2, 9031464344541888638, 'follow', 7777814096048559529, 7777814096048559529, 'profile', '2022-01-19 14:02:58'),
(3, 6130964729282683, 'follow', 7777814096048559529, 7777814096048559529, 'profile', '2022-01-20 11:58:23'),
(4, 6130964729282683, 'follow', 257915693745488957, 257915693745488957, 'profile', '2022-01-20 12:01:40'),
(5, 257915693745488957, 'follow', 6130964729282683, 6130964729282683, 'profile', '2022-01-20 12:02:12'),
(6, 257915693745488957, 'follow', 6130964729282683, 6130964729282683, 'profile', '2022-01-20 12:02:41'),
(7, 9968101549491, 'like', 14220, 9968101549491, 'post', '2022-01-20 12:51:32'),
(8, 9968101549491, 'follow', 257915693745488957, 257915693745488957, 'profile', '2022-01-20 12:52:13'),
(9, 34228998529719577, 'like', 6775628851384758543, 34228998529719577, 'post', '2022-01-20 13:28:24'),
(10, 34228998529719577, 'follow', 257915693745488957, 257915693745488957, 'profile', '2022-01-20 13:30:02'),
(11, 5761734, 'like', 8616906, 5761734, 'post', '2022-01-20 13:33:33'),
(12, 500634178, 'like', 779686808014478562, 500634178, 'post', '2022-01-20 13:39:34'),
(13, 500634178, 'follow', 257915693745488957, 257915693745488957, 'profile', '2022-01-20 13:40:54'),
(14, 500634178, 'follow', 257915693745488957, 257915693745488957, 'profile', '2022-01-20 13:40:57');

-- --------------------------------------------------------

--
-- Table structure for table `notification_seen`
--

DROP TABLE IF EXISTS `notification_seen`;
CREATE TABLE IF NOT EXISTS `notification_seen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) NOT NULL,
  `notification_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `notification_id` (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification_seen`
--

INSERT INTO `notification_seen` (`id`, `userid`, `notification_id`) VALUES
(1, 257915693745488957, 4);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `postid` bigint(20) NOT NULL,
  `post` text NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `has_image` tinyint(1) NOT NULL DEFAULT '0',
  `is_profile_image` tinyint(1) NOT NULL DEFAULT '0',
  `is_cover_image` tinyint(1) NOT NULL DEFAULT '0',
  `parent` bigint(20) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` bigint(20) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `comments` int(11) NOT NULL DEFAULT '0',
  `tags` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `postid` (`postid`),
  KEY `date` (`date`),
  KEY `parent` (`parent`),
  KEY `userid` (`userid`),
  KEY `likes` (`likes`),
  KEY `comments` (`comments`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `postid`, `post`, `image`, `has_image`, `is_profile_image`, `is_cover_image`, `parent`, `date`, `userid`, `likes`, `comments`, `tags`) VALUES
(1, 73776188, '1', '', 0, 0, 0, 0, '2022-01-19 17:58:25', 7777814096048559529, 0, 0, '[]'),
(2, 2170398699040130, '1', 'uploads/7777814096048559529/WE8DwQHDT08gbj8.jpg', 1, 0, 0, 0, '2022-01-19 17:59:54', 7777814096048559529, 0, 0, '[]'),
(3, 65867527, '1', '', 0, 0, 0, 0, '2022-01-19 18:01:38', 7777814096048559529, 0, 0, '[]'),
(4, 7834765609, '4', '', 0, 0, 0, 0, '2022-01-19 18:09:38', 7777814096048559529, 0, 0, '[]'),
(5, 6232879, '5', '', 0, 0, 0, 0, '2022-01-19 18:09:40', 7777814096048559529, 0, 0, '[]'),
(6, 575939986594, '6', '', 0, 0, 0, 0, '2022-01-19 18:09:41', 7777814096048559529, 0, 0, '[]'),
(7, 5041742373899594835, '7', '', 0, 0, 0, 0, '2022-01-19 18:09:43', 7777814096048559529, 0, 0, '[]'),
(8, 10691035, '8', '', 0, 0, 0, 0, '2022-01-19 18:09:44', 7777814096048559529, 0, 0, '[]'),
(9, 1566989, '9', '', 0, 0, 0, 0, '2022-01-19 18:09:45', 7777814096048559529, 0, 0, '[]'),
(10, 482042855, '10', '', 0, 0, 0, 0, '2022-01-19 18:09:48', 7777814096048559529, 0, 0, '[]'),
(11, 3778184770349627, '11', '', 0, 0, 0, 0, '2022-01-19 18:09:52', 7777814096048559529, 0, 0, '[]'),
(12, 6004539601, '12', '', 0, 0, 0, 0, '2022-01-19 18:09:53', 7777814096048559529, 0, 0, '[]'),
(13, 135, '', 'uploads/7777814096048559529/5GGuIz7oHW8GOwR.jpg', 1, 1, 0, 0, '2022-01-19 18:10:43', 7777814096048559529, 0, 0, '[]'),
(14, 6858, '', 'uploads/7777814096048559529/XoqFKQLOyJsr4jZ.jpg', 1, 0, 1, 0, '2022-01-19 18:10:51', 7777814096048559529, 0, 0, '[]'),
(15, 48297481237, '', 'uploads/72436/DLoPZtiVxSlnNj6.jpg', 1, 1, 0, 0, '2022-01-20 09:05:50', 72436, 0, 0, '[]'),
(16, 579703508871, '', 'uploads/72436/D63vU1g1oQkpW1h.jpg', 1, 1, 0, 0, '2022-01-20 14:48:32', 72436, 0, 0, '[]'),
(17, 144146106575290982, 'hello\r\n', '', 0, 0, 0, 0, '2022-01-20 14:52:06', 72436, 0, 0, '[]'),
(18, 2505996892429, '', 'uploads/257915693745488957/TPRFsvSO6dmJ98A.jpg', 1, 1, 0, 0, '2022-01-20 15:40:59', 257915693745488957, 0, 0, '[]'),
(19, 9591404460760, '', 'uploads/257915693745488957/bsARW8MKV2uwbav.jpg', 1, 1, 0, 0, '2022-01-20 15:41:53', 257915693745488957, 0, 0, '[]'),
(20, 6677568724769, '', 'uploads/9968101549491/4DxxcsEeZj2ArBp.jpg', 1, 1, 0, 0, '2022-01-20 16:50:45', 9968101549491, 0, 0, '[]'),
(22, 6430344088367, 'hello\r\n', '', 0, 0, 0, 0, '2022-01-20 17:00:49', 9968101549491, 0, 0, '[]'),
(23, 6775628851384758543, 'Hello', '', 0, 0, 0, 0, '2022-01-20 17:28:21', 34228998529719577, 0, 1, '[]'),
(24, 4154454763025, 'hi', '', 0, 0, 0, 6775628851384758543, '2022-01-20 17:28:34', 34228998529719577, 0, 0, '[]'),
(25, 2566098878, '', 'uploads/34228998529719577/pvhB0t2BJFekgg6.jpg', 1, 1, 0, 0, '2022-01-20 17:28:54', 34228998529719577, 0, 0, '[]'),
(27, 8616906, 'Hi', '', 0, 0, 0, 0, '2022-01-20 17:33:20', 5761734, 0, 1, '[]'),
(28, 8969, 'Hello', '', 0, 0, 0, 8616906, '2022-01-20 17:33:41', 5761734, 0, 0, '[]'),
(29, 12476895842420, '', 'uploads/5761734/OtKhkAgHkF7emQM.jpg', 1, 1, 0, 0, '2022-01-20 17:34:01', 5761734, 0, 0, '[]'),
(31, 779686808014478562, 'Hi', '', 0, 0, 0, 0, '2022-01-20 17:39:25', 500634178, 0, 1, '[]'),
(32, 639959260927484, 'comment', '', 0, 0, 0, 779686808014478562, '2022-01-20 17:39:45', 500634178, 0, 0, '[]'),
(33, 544052866577336, '', 'uploads/500634178/L19VcIzZjusjPVO.jpg', 1, 1, 0, 0, '2022-01-20 17:40:01', 500634178, 0, 0, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `profile_image` varchar(500) DEFAULT NULL,
  `cover_image` varchar(500) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `online` int(11) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `url_address` varchar(100) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `about` text,
  `tag_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `date` (`date`),
  KEY `online` (`online`),
  KEY `email` (`email`),
  KEY `url_address` (`url_address`),
  KEY `likes` (`likes`),
  KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userid`, `first_name`, `last_name`, `gender`, `profile_image`, `cover_image`, `date`, `online`, `email`, `password`, `url_address`, `likes`, `about`, `tag_name`) VALUES
(4, 257915693745488957, 'Kat', 'Arcega', 'Female', 'uploads/257915693745488957/bsARW8MKV2uwbav.jpg', NULL, '2022-01-20 15:35:39', 0, 'kat@yahoo.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'kat.arcega', 3, NULL, 'katarcega'),
(9, 500634178, 'Argel', 'Arega', 'Male', 'uploads/500634178/L19VcIzZjusjPVO.jpg', 'uploads/500634178/PJOugbCrcvW0EG7.jpg', '2022-01-20 17:38:04', 0, 'argel@yahoo.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'argel.arega', 0, NULL, 'argelarega');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
