-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2017 at 12:18 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new_elearning`
--

-- --------------------------------------------------------

--
-- Table structure for table `el_field_tambahan`
--

CREATE TABLE `el_field_tambahan` (
  `id` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `value` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_field_tambahan`
--

INSERT INTO `el_field_tambahan` (`id`, `nama`, `value`) VALUES
('session-updates', 'Session Updates', '');

-- --------------------------------------------------------

--
-- Table structure for table `el_kelas`
--

CREATE TABLE `el_kelas` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `urutan` int(11) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=aktif 0=tidak'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_kelas`
--

INSERT INTO `el_kelas` (`id`, `nama`, `parent_id`, `urutan`, `aktif`) VALUES
(1, 'TEKNIK INFORMATIKA', NULL, 1, 1),
(2, 'KELAS TI-A', 1, 2, 1),
(3, 'KELAS TI-B', 1, 3, 1),
(4, 'KELAS TI-C', 1, 4, 1),
(5, 'KELAS TI-D', 1, 5, 1),
(6, 'TEKNIK ELEKTRO', NULL, 6, 1),
(7, 'KELAS ELEKTRO-A', 6, 7, 1),
(8, 'KELAS ELEKTRO-B', 6, 8, 1),
(9, 'KELAS ELEKTRO-C', 6, 9, 1),
(10, 'KELAS ELEKTRO-D', 6, 10, 1),
(11, 'TEKNIK LISTRIK', NULL, 11, 1),
(12, 'KELAS LISTRIK-A', 11, 12, 1),
(13, 'KELAS LISTRIK-B', 11, 13, 1),
(14, 'KELAS LISTRIK-C', 11, 14, 1),
(15, 'KELAS LISTRIK-D', 11, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_kelas_siswa`
--

CREATE TABLE `el_kelas_siswa` (
  `id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `aktif` tinyint(1) NOT NULL COMMENT '0 jika bukan, 1 jika ya'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_kelas_siswa`
--

INSERT INTO `el_kelas_siswa` (`id`, `kelas_id`, `siswa_id`, `aktif`) VALUES
(1, 4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_komentar`
--

CREATE TABLE `el_komentar` (
  `id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `materi_id` int(11) NOT NULL,
  `tampil` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=tidak,1=tampil',
  `konten` text,
  `tgl_posting` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `el_login`
--

CREATE TABLE `el_login` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `siswa_id` int(11) DEFAULT NULL,
  `pengajar_id` int(11) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL COMMENT '0=tidak,1=ya',
  `reset_kode` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_login`
--

INSERT INTO `el_login` (`id`, `username`, `password`, `siswa_id`, `pengajar_id`, `is_admin`, `reset_kode`) VALUES
(1, 'rahmandayat123@gmail.com', '2e292486b7716b0fecc6b0ddda7aa16f', NULL, 1, 1, NULL),
(2, 'madani@gmail.com', '8f8a33be7f11f4c5aa922aee2aac44b4', 1, NULL, 0, 'd0dd443838c9ccd27cad70443e72e6cb'),
(3, 'jumi@mail.com', '227db8e2f1713dfbdcf073108351bb97', NULL, 2, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `el_login_log`
--

CREATE TABLE `el_login_log` (
  `id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `lasttime` datetime NOT NULL,
  `agent` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_login_log`
--

INSERT INTO `el_login_log` (`id`, `login_id`, `lasttime`, `agent`) VALUES
(1, 1, '2016-12-29 11:31:06', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(2, 1, '2016-12-29 11:32:13', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(3, 1, '2016-12-29 11:36:01', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(4, 1, '2017-01-01 17:09:48', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(5, 1, '2017-01-01 18:05:19', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(6, 1, '2017-01-03 12:27:28', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(7, 1, '2017-01-03 12:35:03', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(8, 1, '2017-01-03 12:36:50', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(9, 1, '2017-01-03 12:40:51', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(10, 1, '2017-01-03 12:42:19', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(11, 1, '2017-01-03 13:07:28', '{"is_mobile":1,"browser":"Safari 601.1","platform":"Mac OS X","agent_string":"Mozilla\\/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit\\/601.1.46 (KHTML, like Gecko) Version\\/9.0 Mobile\\/13B143 Safari\\/601.1","ip":"::1"}'),
(12, 1, '2017-01-03 13:18:24', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(13, 1, '2017-01-03 14:01:31', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(14, 1, '2017-01-03 14:17:40', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(15, 1, '2017-01-03 14:20:32', '{"is_mobile":1,"browser":"Safari 601.1","platform":"Mac OS X","agent_string":"Mozilla\\/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit\\/601.1.46 (KHTML, like Gecko) Version\\/9.0 Mobile\\/13B143 Safari\\/601.1","ip":"::1"}'),
(16, 1, '2017-01-03 14:24:12', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(17, 1, '2017-01-03 14:39:54', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(18, 1, '2017-01-04 11:07:10', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(19, 1, '2017-01-04 11:23:07', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(20, 1, '2017-01-04 11:37:34', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(21, 1, '2017-01-04 11:53:10', '{"is_mobile":0,"browser":"Chrome 51.0.2704.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.79 Safari\\/537.36 Edge\\/14.14393","ip":"::1"}'),
(22, 1, '2017-01-04 12:07:20', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(23, 1, '2017-01-04 12:27:24', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(24, 1, '2017-01-04 12:33:20', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(25, 1, '2017-01-04 12:37:47', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(26, 1, '2017-01-04 14:06:48', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(27, 1, '2017-01-04 14:28:05', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(28, 1, '2017-01-06 16:34:56', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(29, 1, '2017-01-06 17:09:46', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(30, 1, '2017-01-11 11:45:36', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(31, 1, '2017-01-11 11:48:41', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(32, 1, '2017-01-11 13:01:00', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(33, 1, '2017-01-11 13:21:54', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(34, 1, '2017-01-11 13:31:38', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(35, 1, '2017-01-11 13:57:28', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(36, 1, '2017-01-11 14:03:08', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(37, 1, '2017-01-11 14:08:26', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(38, 1, '2017-01-11 14:10:47', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(39, 1, '2017-01-11 14:29:21', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(40, 1, '2017-01-11 14:32:40', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(41, 1, '2017-01-11 14:33:39', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(42, 1, '2017-01-11 15:04:45', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(43, 1, '2017-01-11 15:36:42', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(44, 1, '2017-01-11 15:45:20', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(45, 1, '2017-01-11 15:47:55', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(46, 2, '2017-01-11 15:48:37', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(47, 2, '2017-01-11 16:02:04', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(48, 1, '2017-01-11 16:09:41', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(49, 1, '2017-01-12 13:20:23', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(50, 1, '2017-01-12 14:19:51', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(51, 1, '2017-01-12 14:32:59', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(52, 1, '2017-01-12 15:24:09', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(53, 1, '2017-01-12 15:26:40', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(54, 1, '2017-01-12 16:17:47', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(55, 1, '2017-01-12 16:20:11', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(56, 1, '2017-01-12 16:22:52', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(57, 1, '2017-01-12 16:24:06', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(58, 1, '2017-01-12 16:31:44', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(59, 2, '2017-01-12 16:49:01', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(60, 1, '2017-01-12 16:55:10', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(61, 1, '2017-01-12 16:57:35', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(62, 3, '2017-01-12 16:58:18', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(63, 2, '2017-01-12 17:00:27', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(64, 3, '2017-01-12 17:01:10', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(65, 1, '2017-01-13 13:43:44', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(66, 1, '2017-01-14 11:39:43', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(67, 1, '2017-01-14 12:04:42', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(68, 1, '2017-01-14 12:20:43', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(69, 1, '2017-01-14 12:25:34', '{"is_mobile":0,"browser":"Chrome 51.0.2704.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.79 Safari\\/537.36 Edge\\/14.14393","ip":"::1"}'),
(70, 1, '2017-01-14 12:26:19', '{"is_mobile":0,"browser":"Chrome 51.0.2704.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.79 Safari\\/537.36 Edge\\/14.14393","ip":"::1"}'),
(71, 1, '2017-01-14 12:46:24', '{"is_mobile":0,"browser":"Chrome 51.0.2704.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.79 Safari\\/537.36 Edge\\/14.14393","ip":"::1"}'),
(72, 1, '2017-01-14 15:17:38', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(73, 1, '2017-01-14 15:49:59', '{"is_mobile":0,"browser":"Chrome 51.0.2704.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.79 Safari\\/537.36 Edge\\/14.14393","ip":"::1"}'),
(74, 1, '2017-01-14 15:58:45', '{"is_mobile":0,"browser":"Chrome 51.0.2704.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.79 Safari\\/537.36 Edge\\/14.14393","ip":"::1"}'),
(75, 1, '2017-01-14 16:01:38', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(76, 2, '2017-01-14 16:23:39', '{"is_mobile":0,"browser":"Chrome 51.0.2704.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.79 Safari\\/537.36 Edge\\/14.14393","ip":"::1"}'),
(77, 1, '2017-01-14 16:24:47', '{"is_mobile":0,"browser":"Chrome 51.0.2704.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.79 Safari\\/537.36 Edge\\/14.14393","ip":"::1"}'),
(78, 1, '2017-01-16 14:51:08', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(79, 1, '2017-01-16 15:12:11', '{"is_mobile":0,"browser":"Chrome 51.0.2704.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.79 Safari\\/537.36 Edge\\/14.14393","ip":"::1"}'),
(80, 1, '2017-01-16 15:18:11', '{"is_mobile":0,"browser":"Chrome 55.0.2883.87","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36","ip":"::1"}'),
(81, 1, '2017-01-16 15:36:09', '{"is_mobile":0,"browser":"Chrome 51.0.2704.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.79 Safari\\/537.36 Edge\\/14.14393","ip":"::1"}'),
(82, 1, '2017-01-16 16:08:27', '{"is_mobile":0,"browser":"Chrome 51.0.2704.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.79 Safari\\/537.36 Edge\\/14.14393","ip":"::1"}'),
(83, 1, '2017-01-16 16:20:17', '{"is_mobile":0,"browser":"Chrome 51.0.2704.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.79 Safari\\/537.36 Edge\\/14.14393","ip":"::1"}'),
(84, 1, '2017-01-16 16:23:16', '{"is_mobile":0,"browser":"Chrome 51.0.2704.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.79 Safari\\/537.36 Edge\\/14.14393","ip":"::1"}'),
(85, 1, '2017-01-16 16:26:37', '{"is_mobile":0,"browser":"Chrome 51.0.2704.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.79 Safari\\/537.36 Edge\\/14.14393","ip":"::1"}'),
(86, 1, '2017-01-16 16:27:56', '{"is_mobile":0,"browser":"Chrome 51.0.2704.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.79 Safari\\/537.36 Edge\\/14.14393","ip":"::1"}');

-- --------------------------------------------------------

--
-- Table structure for table `el_mapel`
--

CREATE TABLE `el_mapel` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `info` text,
  `aktif` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = ya, 0 = tidak'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_mapel`
--

INSERT INTO `el_mapel` (`id`, `nama`, `info`, `aktif`) VALUES
(1, 'ADMINISTRASI JARINGAN', '', 1),
(2, 'CITRA DIGITAL', '', 1),
(3, 'KECERDASAN BUATAN', '', 1),
(4, 'PEMROGRAMAN WEB', '', 1),
(5, 'MATEMATIKA', '', 1),
(6, 'BAHASA INGGRIS', '', 1),
(7, 'AGAMA', '', 1),
(8, 'ADMINISTRASI DATABASE', '', 1),
(9, 'ALGORITMA & PEMROGRAMAN', '', 1),
(10, 'SISTEM OPERASI', '', 1),
(11, 'STRUKTUR DATA', '', 1),
(12, 'MANAJEMEN PROYEK', '', 1),
(13, 'INTERAKSI MANUSIA & KOMPUTER', '', 1),
(14, 'KETERAMPILAN KOMPUTER', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_mapel_ajar`
--

CREATE TABLE `el_mapel_ajar` (
  `id` int(11) NOT NULL,
  `hari_id` tinyint(1) NOT NULL COMMENT '1=senin,2=selasa,3=rabu,4=kamis,5=jum''at,6=sabtu,7=minggu',
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `pengajar_id` int(11) NOT NULL,
  `mapel_kelas_id` int(11) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = aktif 0 = tidak'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_mapel_ajar`
--

INSERT INTO `el_mapel_ajar` (`id`, `hari_id`, `jam_mulai`, `jam_selesai`, `pengajar_id`, `mapel_kelas_id`, `aktif`) VALUES
(1, 1, '08:30:00', '10:40:00', 1, 3, 1),
(2, 2, '00:00:08', '00:00:13', 1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_mapel_kelas`
--

CREATE TABLE `el_mapel_kelas` (
  `id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_mapel_kelas`
--

INSERT INTO `el_mapel_kelas` (`id`, `kelas_id`, `mapel_id`, `aktif`) VALUES
(1, 2, 1, 1),
(2, 2, 2, 1),
(3, 2, 3, 1),
(4, 3, 7, 1),
(5, 3, 8, 1),
(6, 3, 9, 1),
(7, 3, 10, 1),
(8, 3, 11, 1),
(9, 3, 12, 1),
(10, 3, 13, 1),
(11, 2, 4, 1),
(12, 2, 5, 1),
(13, 2, 6, 1),
(14, 2, 7, 1),
(15, 2, 9, 1),
(16, 2, 10, 1),
(17, 2, 11, 1),
(18, 2, 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_materi`
--

CREATE TABLE `el_materi` (
  `id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `pengajar_id` int(11) DEFAULT NULL,
  `siswa_id` int(11) DEFAULT NULL,
  `judul` varchar(255) NOT NULL,
  `konten` text,
  `file` text,
  `tgl_posting` datetime NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_materi`
--

INSERT INTO `el_materi` (`id`, `mapel_id`, `pengajar_id`, `siswa_id`, `judul`, `konten`, `file`, `tgl_posting`, `publish`, `views`) VALUES
(1, 1, 1, NULL, 'ADMINISTRASI JARINGAN', '<p>Buat rangkuman tentang perkembangan jaringan</p>\r\n<p>1. Tulis tangan</p>\r\n<p>2. Menggunakan dua bahasa : Indonesia & Inggris</p>\r\n<p>3. Minimal 3 lembar</p>', NULL, '2017-01-14 15:14:09', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_materi_kelas`
--

CREATE TABLE `el_materi_kelas` (
  `id` int(11) NOT NULL,
  `materi_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_materi_kelas`
--

INSERT INTO `el_materi_kelas` (`id`, `materi_id`, `kelas_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_messages`
--

CREATE TABLE `el_messages` (
  `id` int(11) NOT NULL,
  `type_id` tinyint(1) NOT NULL COMMENT '1=inbox,2=outbox',
  `content` text NOT NULL,
  `owner_id` int(11) NOT NULL,
  `sender_receiver_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `opened` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=belum,1=sudah'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_messages`
--

INSERT INTO `el_messages` (`id`, `type_id`, `content`, `owner_id`, `sender_receiver_id`, `date`, `opened`) VALUES
(1, 2, '<p>sayang</p>', 3, 2, '2017-01-12 16:59:53', 1),
(3, 2, '<p>hmm..</p>', 2, 3, '2017-01-12 17:00:42', 1),
(4, 1, '<p>hmm..</p>', 3, 2, '2017-01-12 17:00:42', 0);

-- --------------------------------------------------------

--
-- Table structure for table `el_nilai_tugas`
--

CREATE TABLE `el_nilai_tugas` (
  `id` int(11) NOT NULL,
  `nilai` float NOT NULL,
  `tugas_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `el_pengajar`
--

CREATE TABLE `el_pengajar` (
  `id` int(11) NOT NULL,
  `nip` varchar(45) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(9) NOT NULL,
  `tempat_lahir` varchar(45) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `alamat` varchar(255) NOT NULL,
  `foto` text,
  `status_id` tinyint(1) NOT NULL COMMENT '0=pending, 1=aktif, 2=blok'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_pengajar`
--

INSERT INTO `el_pengajar` (`id`, `nip`, `nama`, `jenis_kelamin`, `tempat_lahir`, `tgl_lahir`, `alamat`, `foto`, `status_id`) VALUES
(1, 'E03140189', 'Hidayaturrahman SKom, MKom', 'Laki-laki', 'Rantau', '1996-06-01', 'jln. hayalan no 5', 'pengajar-hidayaturrahman.jpg', 1),
(2, 'D03140123', 'JUMI', 'Perempuan', 'Rantau', '1986-11-16', 'Jl. Kayu Tangi 2 No 4 RT 14', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_pengaturan`
--

CREATE TABLE `el_pengaturan` (
  `id` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_pengaturan`
--

INSERT INTO `el_pengaturan` (`id`, `nama`, `value`) VALUES
('email-server', 'Email server', 'no-reply@domain.com'),
('email-template-approve-pengajar', 'Approve pengajar (email pengajar)', '{"subject":"Pengaktifan Akun","body":"<p>Hai {$nama},<\\/p>\\n<p>Anda telah diterima sebagai pengajar pada {$nama_sekolah}, berikut informasi data diri anda:<\\/p>\\n<p>{$tabel_profil}<\\/p>\\n<p>Anda dapat login ke sistem E-Learning menggunakan username dan password yang telah anda buat saat pendaftaran, login pada url berikut : {$url_login}<\\/p>"}'),
('email-template-approve-siswa', 'Approve siswa (email siswa)', '{"subject":"Pengaktifan Akun","body":"<p>Hai {$nama},<\\/p>\\n<p>Anda telah diterima sebagai siswa pada {$nama_sekolah}, berikut informasi data diri anda:<\\/p>\\n<p>{$tabel_profil}<\\/p>\\n<p>Anda dapat login ke sistem E-Learning menggunakan username dan password yang telah anda buat saat pendaftaran, login pada url berikut : {$url_login}<\\/p>"}'),
('email-template-link-reset', 'Link Reset Password', '{"subject":"Reset Password","body":"<p>Hai,<\\/p>\\n<p>Anda mengirimkan permintaan untuk reset password anda, klik link berikut untuk memulai reset password : {$link_reset}<\\/p>"}'),
('email-template-register-pengajar', 'Register pengajar (email pengajar)', '{"subject":"Registrasi Berhasil","body":"<p>Hai {$nama},<\\/p>\\n<p>Terimakasih telah melakukan pendaftaran sebagai pengajar di E-Learning {$nama_sekolah}. Akun anda akan segera diaktifkan oleh admin.<\\/p>"}'),
('email-template-register-siswa', 'Register siswa (email siswa)', '{"subject":"Registrasi Berhasil","body":"<p>Hai {$nama},<\\/p>\\n<p>Terimakasih telah melakukan pendaftaran sebagai siswa di E-Learning {$nama_sekolah}. Akun anda akan segera diaktifkan oleh admin.<\\/p>"}'),
('info-registrasi', 'Info Registrasi', '<p>Silakan mendaftar sebagai mahasiswa atau pengajar (jika anda sebagai pengajar) dengan memilih sesuai tab berikut :</p>'),
('peraturan-elearning', 'Peraturan E-learning', ''),
('registrasi-pengajar', 'Registrasi Pengajar', '1'),
('registrasi-siswa', 'Registrasi Siswa', '1'),
('versi', 'Versi', 'asd'),
('jenjang', 'jenjang', 'SMA'),
('nama-sekolah', 'nama-sekolah', 'Politeknik Negeri Banjarmasin'),
('alamat', 'alamat', 'Jl. Brigdjen H. Hasan Basry, Pangeran, Banjarmasin Utara, Kota Banjarmasin Kelurahan 70123'),
('telp', 'telp', '(0511) 3305052'),
('install-success', 'install-success', '1'),
('status-registrasi-siswa', 'status-registrasi-siswa', '0'),
('status-registrasi-pengajar', 'status-registrasi-pengajar', '0'),
('smtp-host', 'smtp-host', ''),
('smtp-username', 'smtp-username', ''),
('smtp-pass', 'smtp-pass', ''),
('smtp-port', 'smtp-port', ''),
('edit-username-siswa', 'edit-username-siswa', '1'),
('edit-foto-siswa', 'edit-foto-siswa', '1'),
('info-slide-1', 'info-slide-1', ''),
('info-slide-2', 'info-slide-2', ''),
('info-slide-3', 'info-slide-3', ''),
('info-slide-4', 'info-slide-4', '');

-- --------------------------------------------------------

--
-- Table structure for table `el_pengumuman`
--

CREATE TABLE `el_pengumuman` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `konten` text NOT NULL,
  `tgl_tampil` date NOT NULL,
  `tgl_tutup` date NOT NULL,
  `tampil_siswa` tinyint(1) NOT NULL DEFAULT '1',
  `tampil_pengajar` tinyint(1) NOT NULL DEFAULT '1',
  `pengajar_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_pengumuman`
--

INSERT INTO `el_pengumuman` (`id`, `judul`, `konten`, `tgl_tampil`, `tgl_tutup`, `tampil_siswa`, `tampil_pengajar`, `pengajar_id`) VALUES
(1, 'PENGUMUMAN LIBUR NATAL & TAHUN BARU 2017', '<p>Diberitahukan kepada semua Mahasiswa</p>\r\n<p>Bahwa :</p>\r\n<ol>\r\n<li>Tidak ada aktivitas pekuliahan pada tanggal  14 - 21 Januari 2017 ( libur natal dan tahun baru )</li>\r\n<li>Aktivitas normal pada tanggal 22 Januari 2017</li>\r\n</ol>\r\n<p>Terima kasih atas perhatian dan kerjasamanya</p>\r\n<p> </p>\r\n<p>Hormat kami,</p>\r\n<p>Admin E-Learning</p>', '2017-01-14', '2017-01-21', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_pilihan`
--

CREATE TABLE `el_pilihan` (
  `id` int(11) NOT NULL,
  `pertanyaan_id` int(11) NOT NULL,
  `konten` text NOT NULL,
  `kunci` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=tidak',
  `urutan` int(11) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_pilihan`
--

INSERT INTO `el_pilihan` (`id`, `pertanyaan_id`, `konten`, `kunci`, `urutan`, `aktif`) VALUES
(1, 1, '<p>sama</p>', 1, 2, 1),
(2, 1, '<p>kd nah bingung</p>', 0, 3, 1),
(3, 2, '<p>64</p>', 0, 1, 1),
(4, 2, '<p>32</p>', 1, 2, 1),
(5, 2, '<p>8</p>', 0, 3, 1),
(6, 2, '<p>16</p>', 0, 4, 1),
(7, 3, '<p>10.0.0.0/24</p>', 0, 1, 1),
(8, 3, '<p>192.0.2.6/24</p>', 0, 2, 1),
(9, 3, '<p>10.1.1.0/24</p>', 0, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_siswa`
--

CREATE TABLE `el_siswa` (
  `id` int(11) NOT NULL,
  `nis` varchar(45) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(9) NOT NULL COMMENT 'Laki-laki dan Perempuan',
  `tempat_lahir` varchar(45) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `agama` char(7) DEFAULT NULL,
  `alamat` varchar(255) NOT NULL,
  `tahun_masuk` year(4) NOT NULL,
  `foto` text,
  `status_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=pending, 1=aktif, 2=blok, 3=alumni, 4=deleted'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_siswa`
--

INSERT INTO `el_siswa` (`id`, `nis`, `nama`, `jenis_kelamin`, `tempat_lahir`, `tgl_lahir`, `agama`, `alamat`, `tahun_masuk`, `foto`, `status_id`) VALUES
(1, 'E03140195', 'Madani F', 'Laki-laki', 'amuntai', '1996-06-05', 'ISLAM', 'jl kelayan', 2014, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_tugas`
--

CREATE TABLE `el_tugas` (
  `id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `pengajar_id` int(11) NOT NULL,
  `type_id` tinyint(1) NOT NULL COMMENT '1=upload,2=essay,3=ganda',
  `judul` varchar(255) NOT NULL,
  `durasi` int(11) DEFAULT NULL COMMENT 'lama pengerjaan dalam menit',
  `info` text,
  `aktif` tinyint(1) NOT NULL DEFAULT '0',
  `tgl_buat` datetime DEFAULT NULL,
  `tampil_siswa` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=tidak tampil di siswa, 1=tampil siswa'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_tugas`
--

INSERT INTO `el_tugas` (`id`, `mapel_id`, `pengajar_id`, `type_id`, `judul`, `durasi`, `info`, `aktif`, `tgl_buat`, `tampil_siswa`) VALUES
(1, 1, 1, 3, 'zz', 20, '', 0, '2016-12-29 11:49:56', 0);

-- --------------------------------------------------------

--
-- Table structure for table `el_tugas_kelas`
--

CREATE TABLE `el_tugas_kelas` (
  `id` int(11) NOT NULL,
  `tugas_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_tugas_kelas`
--

INSERT INTO `el_tugas_kelas` (`id`, `tugas_id`, `kelas_id`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `el_tugas_pertanyaan`
--

CREATE TABLE `el_tugas_pertanyaan` (
  `id` int(11) NOT NULL,
  `pertanyaan` text NOT NULL,
  `urutan` int(11) NOT NULL,
  `tugas_id` int(11) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_tugas_pertanyaan`
--

INSERT INTO `el_tugas_pertanyaan` (`id`, `pertanyaan`, `urutan`, `tugas_id`, `aktif`) VALUES
(1, '<p>untuk apa kelamin</p>', 1, 1, 0),
(2, '<p>Berapa banyak bit dalam alamat ipv4 ?</p>', 1, 1, 1),
(3, '<p>Berikut manakah ip yang termasuk dalam kategori test-net ?</p>', 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `essay`
--

CREATE TABLE `essay` (
  `id` int(11) NOT NULL,
  `jawaban` text NOT NULL,
  `pertanyaan_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `tugas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ganda`
--

CREATE TABLE `ganda` (
  `id` int(11) NOT NULL,
  `pilihan_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `tugas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `urutan` int(11) NOT NULL,
  `aktif` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=aktif 0=tidak'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kelas_siswa`
--

CREATE TABLE `kelas_siswa` (
  `id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `aktif` tinyint(4) NOT NULL COMMENT '0 jika bukan, 1 jika ya'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `siswa_id` int(11) DEFAULT NULL,
  `pengajar_id` int(11) DEFAULT NULL,
  `is_admin` int(11) NOT NULL COMMENT '0=tidak,1=ya',
  `reset_kode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `info` text,
  `aktif` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 = ya, 0 = tidak'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mapel_ajar`
--

CREATE TABLE `mapel_ajar` (
  `id` int(11) NOT NULL,
  `hari_id` tinyint(4) NOT NULL COMMENT '1=senin,2=selasa,3=rabu,4=kamis,5=jum''at,6=sabtu,7=minggu',
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `pengajar_id` int(11) NOT NULL,
  `mapel_kelas_id` int(11) NOT NULL,
  `aktif` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 = aktif 0 = tidak'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mapel_kelas`
--

CREATE TABLE `mapel_kelas` (
  `id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `pengajar_id` int(11) DEFAULT NULL,
  `siswa_id` int(11) DEFAULT NULL,
  `judul` varchar(255) NOT NULL,
  `konten` text,
  `file` text,
  `tgl_posting` datetime NOT NULL,
  `publish` tinyint(4) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `materi_kelas`
--

CREATE TABLE `materi_kelas` (
  `id` int(11) NOT NULL,
  `materi_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `nilai_tugas`
--

CREATE TABLE `nilai_tugas` (
  `id` int(11) NOT NULL,
  `nilai` float NOT NULL,
  `tugas_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pengajar`
--

CREATE TABLE `pengajar` (
  `id` int(11) NOT NULL,
  `nip` varchar(45) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(9) NOT NULL,
  `tempat_lahir` varchar(45) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `alamat` varchar(255) NOT NULL,
  `foto` text,
  `status_id` tinyint(4) NOT NULL COMMENT '0=pending, 1=aktif, 2=blok'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pilihan`
--

CREATE TABLE `pilihan` (
  `id` int(11) NOT NULL,
  `pertanyaan_id` int(11) NOT NULL,
  `konten` varchar(255) NOT NULL,
  `kunci` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=tidak\n1=ya',
  `urutan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` int(11) NOT NULL,
  `nis` varchar(45) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(9) NOT NULL COMMENT 'Laki-laki dan Perempuan',
  `tempat_lahir` varchar(45) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `agama` char(7) DEFAULT NULL,
  `alamat` varchar(255) NOT NULL,
  `tahun_masuk` year(4) NOT NULL,
  `foto` text,
  `status_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=pending, 1=aktif, 2=blok, 3=alumni, 4=deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `site_config`
--

CREATE TABLE `site_config` (
  `site_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telp` varchar(45) DEFAULT NULL,
  `date_format` varchar(20) DEFAULT 'F j, Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `id` int(11) NOT NULL,
  `mapel_ajar_id` int(11) NOT NULL,
  `type_id` tinyint(4) NOT NULL COMMENT '1=upload,2=essay,3=ganda',
  `judul` varchar(255) NOT NULL,
  `durasi` int(11) DEFAULT NULL COMMENT 'lama pengerjaan dalam menit',
  `info` text,
  `aktif` tinyint(4) NOT NULL DEFAULT '0',
  `tgl_buat` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tugas_pertanyaan`
--

CREATE TABLE `tugas_pertanyaan` (
  `id` int(11) NOT NULL,
  `pertanyaan` text NOT NULL,
  `urutan` int(11) NOT NULL,
  `tugas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

CREATE TABLE `upload` (
  `id` int(11) NOT NULL,
  `file` text NOT NULL,
  `tgl_upload` datetime NOT NULL,
  `tugas_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `el_field_tambahan`
--
ALTER TABLE `el_field_tambahan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_kelas`
--
ALTER TABLE `el_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_kelas_siswa`
--
ALTER TABLE `el_kelas_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_komentar`
--
ALTER TABLE `el_komentar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_login`
--
ALTER TABLE `el_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_login_log`
--
ALTER TABLE `el_login_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_mapel`
--
ALTER TABLE `el_mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_mapel_ajar`
--
ALTER TABLE `el_mapel_ajar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_mapel_kelas`
--
ALTER TABLE `el_mapel_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_materi`
--
ALTER TABLE `el_materi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_materi_kelas`
--
ALTER TABLE `el_materi_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_messages`
--
ALTER TABLE `el_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_nilai_tugas`
--
ALTER TABLE `el_nilai_tugas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_pengajar`
--
ALTER TABLE `el_pengajar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_pengaturan`
--
ALTER TABLE `el_pengaturan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_pengumuman`
--
ALTER TABLE `el_pengumuman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_pilihan`
--
ALTER TABLE `el_pilihan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_siswa`
--
ALTER TABLE `el_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_tugas`
--
ALTER TABLE `el_tugas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_tugas_kelas`
--
ALTER TABLE `el_tugas_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_tugas_pertanyaan`
--
ALTER TABLE `el_tugas_pertanyaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `essay`
--
ALTER TABLE `essay`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_essay_tugas_essay1_idx` (`pertanyaan_id`),
  ADD KEY `fk_essay_siswa1_idx` (`siswa_id`),
  ADD KEY `fk_essay_tugas1_idx` (`tugas_id`);

--
-- Indexes for table `ganda`
--
ALTER TABLE `ganda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ganda_pilihan1_idx` (`pilihan_id`),
  ADD KEY `fk_ganda_siswa1_idx` (`siswa_id`),
  ADD KEY `fk_ganda_tugas1_idx` (`tugas_id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelas_siswa`
--
ALTER TABLE `kelas_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kelas_siswa_kelas_idx` (`kelas_id`),
  ADD KEY `fk_kelas_siswa_siswa1_idx` (`siswa_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_login_siswa1_idx` (`siswa_id`),
  ADD KEY `fk_login_pengajar1_idx` (`pengajar_id`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel_ajar`
--
ALTER TABLE `mapel_ajar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mapel_ajar_pengajar1_idx` (`pengajar_id`),
  ADD KEY `fk_mapel_ajar_mapel_kelas1_idx` (`mapel_kelas_id`);

--
-- Indexes for table `mapel_kelas`
--
ALTER TABLE `mapel_kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mapel_kelas_kelas1_idx` (`kelas_id`),
  ADD KEY `fk_mapel_kelas_mapel1_idx` (`mapel_id`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_materi_pengajar1_idx` (`pengajar_id`),
  ADD KEY `fk_materi_siswa1_idx` (`siswa_id`),
  ADD KEY `fk_materi_mapel1_idx` (`mapel_id`);

--
-- Indexes for table `materi_kelas`
--
ALTER TABLE `materi_kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_materi_kelas_materi1_idx` (`materi_id`),
  ADD KEY `fk_materi_kelas_kelas1_idx` (`kelas_id`);

--
-- Indexes for table `nilai_tugas`
--
ALTER TABLE `nilai_tugas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_nilai_tugas1_idx` (`tugas_id`),
  ADD KEY `fk_nilai_siswa1_idx` (`siswa_id`);

--
-- Indexes for table `pengajar`
--
ALTER TABLE `pengajar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pilihan`
--
ALTER TABLE `pilihan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pilihan_tugas_pertanyaan1_idx` (`pertanyaan_id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tugas_mapel_ajar1_idx` (`mapel_ajar_id`);

--
-- Indexes for table `tugas_pertanyaan`
--
ALTER TABLE `tugas_pertanyaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tugas_essay_tugas1_idx` (`tugas_id`);

--
-- Indexes for table `upload`
--
ALTER TABLE `upload`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_upload_tugas1_idx` (`tugas_id`),
  ADD KEY `fk_upload_siswa1_idx` (`siswa_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `el_kelas`
--
ALTER TABLE `el_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `el_kelas_siswa`
--
ALTER TABLE `el_kelas_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `el_komentar`
--
ALTER TABLE `el_komentar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `el_login`
--
ALTER TABLE `el_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `el_login_log`
--
ALTER TABLE `el_login_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `el_mapel`
--
ALTER TABLE `el_mapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `el_mapel_ajar`
--
ALTER TABLE `el_mapel_ajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `el_mapel_kelas`
--
ALTER TABLE `el_mapel_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `el_materi`
--
ALTER TABLE `el_materi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `el_materi_kelas`
--
ALTER TABLE `el_materi_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `el_messages`
--
ALTER TABLE `el_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `el_nilai_tugas`
--
ALTER TABLE `el_nilai_tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `el_pengajar`
--
ALTER TABLE `el_pengajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `el_pengumuman`
--
ALTER TABLE `el_pengumuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `el_pilihan`
--
ALTER TABLE `el_pilihan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `el_siswa`
--
ALTER TABLE `el_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `el_tugas`
--
ALTER TABLE `el_tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `el_tugas_kelas`
--
ALTER TABLE `el_tugas_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `el_tugas_pertanyaan`
--
ALTER TABLE `el_tugas_pertanyaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `essay`
--
ALTER TABLE `essay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ganda`
--
ALTER TABLE `ganda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kelas_siswa`
--
ALTER TABLE `kelas_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mapel_ajar`
--
ALTER TABLE `mapel_ajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mapel_kelas`
--
ALTER TABLE `mapel_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `materi_kelas`
--
ALTER TABLE `materi_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `nilai_tugas`
--
ALTER TABLE `nilai_tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pengajar`
--
ALTER TABLE `pengajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pilihan`
--
ALTER TABLE `pilihan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tugas_pertanyaan`
--
ALTER TABLE `tugas_pertanyaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `upload`
--
ALTER TABLE `upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `essay`
--
ALTER TABLE `essay`
  ADD CONSTRAINT `fk_essay_siswa1` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_essay_tugas1` FOREIGN KEY (`tugas_id`) REFERENCES `tugas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_essay_tugas_essay1` FOREIGN KEY (`pertanyaan_id`) REFERENCES `tugas_pertanyaan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `ganda`
--
ALTER TABLE `ganda`
  ADD CONSTRAINT `fk_ganda_pilihan1` FOREIGN KEY (`pilihan_id`) REFERENCES `pilihan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ganda_siswa1` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ganda_tugas1` FOREIGN KEY (`tugas_id`) REFERENCES `tugas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `kelas_siswa`
--
ALTER TABLE `kelas_siswa`
  ADD CONSTRAINT `fk_kelas_siswa_kelas` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kelas_siswa_siswa1` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `fk_login_pengajar1` FOREIGN KEY (`pengajar_id`) REFERENCES `pengajar` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_login_siswa1` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `mapel_ajar`
--
ALTER TABLE `mapel_ajar`
  ADD CONSTRAINT `fk_mapel_ajar_mapel_kelas1` FOREIGN KEY (`mapel_kelas_id`) REFERENCES `mapel_kelas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mapel_ajar_pengajar1` FOREIGN KEY (`pengajar_id`) REFERENCES `pengajar` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `mapel_kelas`
--
ALTER TABLE `mapel_kelas`
  ADD CONSTRAINT `fk_mapel_kelas_kelas1` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mapel_kelas_mapel1` FOREIGN KEY (`mapel_id`) REFERENCES `mapel` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `materi`
--
ALTER TABLE `materi`
  ADD CONSTRAINT `fk_materi_mapel1` FOREIGN KEY (`mapel_id`) REFERENCES `mapel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_materi_pengajar1` FOREIGN KEY (`pengajar_id`) REFERENCES `pengajar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_materi_siswa1` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `materi_kelas`
--
ALTER TABLE `materi_kelas`
  ADD CONSTRAINT `fk_materi_kelas_kelas1` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_materi_kelas_materi1` FOREIGN KEY (`materi_id`) REFERENCES `materi` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `nilai_tugas`
--
ALTER TABLE `nilai_tugas`
  ADD CONSTRAINT `fk_nilai_siswa1` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nilai_tugas1` FOREIGN KEY (`tugas_id`) REFERENCES `tugas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pilihan`
--
ALTER TABLE `pilihan`
  ADD CONSTRAINT `fk_pilihan_tugas_pertanyaan1` FOREIGN KEY (`pertanyaan_id`) REFERENCES `tugas_pertanyaan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `tugas`
--
ALTER TABLE `tugas`
  ADD CONSTRAINT `fk_tugas_mapel_ajar1` FOREIGN KEY (`mapel_ajar_id`) REFERENCES `mapel_ajar` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `tugas_pertanyaan`
--
ALTER TABLE `tugas_pertanyaan`
  ADD CONSTRAINT `fk_tugas_essay_tugas1` FOREIGN KEY (`tugas_id`) REFERENCES `tugas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `upload`
--
ALTER TABLE `upload`
  ADD CONSTRAINT `fk_upload_siswa1` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_upload_tugas1` FOREIGN KEY (`tugas_id`) REFERENCES `tugas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
