-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2022 at 07:52 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ipproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` varchar(20) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_password`) VALUES
('1', '123'),
('2', '234');

-- --------------------------------------------------------

--
-- Table structure for table `elections`
--

CREATE TABLE `elections` (
  `election_id` int(10) NOT NULL,
  `election_name` varchar(50) NOT NULL,
  `election_status` varchar(20) NOT NULL,
  `result` varchar(50) NOT NULL,
  `admin_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `elections`
--

INSERT INTO `elections` (`election_id`, `election_name`, `election_status`, `result`, `admin_id`) VALUES
(1, 'abc', '', '', ''),
(2, 'bcd', '', '', ''),
(3, 'bdf', '', '', ''),
(4, 'agh', '', '', ''),
(5, 'national elections', '', '', ''),
(6, 'state election', '', '', ''),
(7, 'local election', '', '', ''),
(8, 'charles', '', '', ''),
(9, 'abcd', '', '', ''),
(10, 'yoyo', '', '', ''),
(11, 'justin', '', '', ''),
(12, 'chandler', '', '', ''),
(13, 'TONY', '', '', ''),
(14, 'COWBOY', '', '', ''),
(15, 'ROSE', '', '', ''),
(16, 'cookie', '', '', ''),
(18, 'rua', '', '', ''),
(20, 'shogun', '', '', ''),
(21, 'trojan', '', '', ''),
(22, 'ghjngn', '', '', ''),
(23, 'zxdfg', '', '', ''),
(24, 'omionon', '', '', ''),
(25, 'presedential election', '', '', ''),
(26, 'moinonini', '', '', ''),
(27, 'bububi', '', '', ''),
(28, 'iihubhbh', '', '', ''),
(29, 'hvhvhvv', '', '', ''),
(30, 'yvyvy', '', '', ''),
(31, 'inindinewidnei', '', '', ''),
(32, 'ininibec', '', '', ''),
(33, 'iniwnciwbc', '', '', ''),
(55, 'adarsh', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `parties`
--

CREATE TABLE `parties` (
  `party_id` int(20) NOT NULL,
  `party_name` varchar(50) NOT NULL,
  `vote_count` bigint(255) NOT NULL,
  `election_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parties`
--

INSERT INTO `parties` (`party_id`, `party_name`, `vote_count`, `election_id`) VALUES
(1, 'bjp', 24, 1),
(2, 'congress', 5, 1),
(3, 'ggp', 26, 2),
(4, 'abc', 0, 0),
(5, 'ufc', 0, 0),
(6, 'pfl', 0, 2),
(7, 'jre', 0, 2),
(8, 'elon', 1, 2),
(9, 'ejo', 0, 2),
(9, 'ejo', 0, 2),
(10, 'bbb', 0, 2),
(11, 'ccc', 0, 2),
(12, 'ddd', 0, 2),
(14, 'eee', 0, 2),
(15, 'ggg', 2, 2),
(16, 'jjj', 1, 2),
(17, 'abcd', 2, 2),
(18, 'pqrs', 2, 3),
(19, 'pqi', 0, 3),
(78, 'bsp', 0, 25),
(34, 'ghjuif', 0, 7),
(56, 'arjav desai', 0, 55);

-- --------------------------------------------------------

--
-- Table structure for table `vote`
--

CREATE TABLE `vote` (
  `voter_id` int(20) NOT NULL,
  `election_id` int(20) NOT NULL,
  `voted_party` varchar(50) NOT NULL,
  `'21'` int(11) DEFAULT NULL,
  `'req.body.election_id'` int(11) DEFAULT NULL,
  `'24'` int(11) DEFAULT NULL,
  `'%25%'` int(11) DEFAULT NULL,
  `'%26%'` int(11) DEFAULT NULL,
  `'30'` int(11) DEFAULT NULL,
  `'31.replace(/\'/gi,\'\')'` int(11) DEFAULT NULL,
  `'32'` int(11) DEFAULT NULL,
  `'33'` int(11) DEFAULT NULL,
  `'2'` int(11) NOT NULL,
  `'28'` int(11) DEFAULT NULL,
  `'29'` int(11) DEFAULT NULL,
  `'55'` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `voter`
--

CREATE TABLE `voter` (
  `voter_id` varchar(10) NOT NULL,
  `name` text NOT NULL,
  `surname` text NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `voter`
--

INSERT INTO `voter` (`voter_id`, `name`, `surname`, `password`) VALUES
('1', 'jon', 'jones', '123'),
('2', 'michael ', 'bisping', '123'),
('3', 'arjav', 'desai', '234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `elections`
--
ALTER TABLE `elections`
  ADD PRIMARY KEY (`election_id`);

--
-- Indexes for table `voter`
--
ALTER TABLE `voter`
  ADD PRIMARY KEY (`voter_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
