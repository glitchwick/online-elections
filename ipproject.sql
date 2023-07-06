-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2022 at 10:21 PM
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
(6, 'state election', '', '', '');

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
(1, 'bjp', 20, 1),
(2, 'congress', 5, 1),
(3, 'ggp', 20, 2),
(4, 'abc', 0, 0),
(5, 'ufc', 0, 0),
(6, 'pfl', 0, 2),
(7, 'jre', 0, 2),
(8, 'elon', 0, 2),
(9, 'ejo', 0, 2),
(9, 'ejo', 0, 2),
(10, 'bbb', 0, 2),
(11, 'ccc', 0, 2),
(12, 'ddd', 0, 2),
(14, 'eee', 0, 2),
(15, 'ggg', 0, 2),
(16, 'jjj', 0, 2),
(17, 'abcd', 0, 2),
(18, 'pqrs', 0, 3),
(19, 'pqi', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `vote`
--

CREATE TABLE `vote` (
  `voter_id` int(20) NOT NULL,
  `election_id` int(20) NOT NULL,
  `voted_party` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `voter`
--

CREATE TABLE `voter` (
  `voter_id` varchar(10) NOT NULL,
  `name` text NOT NULL,
  `surname` text NOT NULL,
  `middle_name` text NOT NULL,
  `gender` text NOT NULL,
  `birthdate` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact_no` bigint(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `fingerprint` mediumblob DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `signed_up` tinyint(1) DEFAULT NULL,
  `voted_party` text DEFAULT NULL,
  `date&time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
