-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2023 at 10:42 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hpms`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `username` varchar(250) DEFAULT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `age` int(11) NOT NULL,
  `doctor` varchar(250) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`username`, `firstname`, `lastname`, `email`, `age`, `doctor`, `time`) VALUES
('victor', 'Victor', 'Kimiti', 'vivian.nkatha21@students.dkut.ac.ke', 43, 'Dr. David - Optician ', '2023-03-24 09:15:00'),
('Vivian', 'Vivian', 'Nkatha', 'v@gmail.com', 20, 'Dr. David - Optician ', '2023-03-10 18:50:00'),
('eammon', 'Eammon', 'Kiprotich', 'eam@e.e', 20, 'Dr. John - Neurosurgeon ', '2023-03-23 19:42:00');

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE `diagnosis` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `patient` varchar(250) NOT NULL,
  `doctor` varchar(250) NOT NULL,
  `illness` varchar(250) NOT NULL,
  `diagnosis` text NOT NULL,
  `symptoms` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`symptoms`)),
  `treatment` varchar(250) NOT NULL,
  `treatmentdesc` varchar(250) NOT NULL,
  `drugname` varchar(250) NOT NULL,
  `drugdosage` text NOT NULL,
  `fees` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `diagnosis`
--

INSERT INTO `diagnosis` (`id`, `username`, `patient`, `doctor`, `illness`, `diagnosis`, `symptoms`, `treatment`, `treatmentdesc`, `drugname`, `drugdosage`, `fees`) VALUES
(1, 'victor', 'Victor Kimiti', 'Dr. David - Optician ', 'Myopia', ' Patient presents with all the symptoms of short-sightedness and glasses are recommended while other means (laser eye surgery) are being sought after.', '[\"Blurriness\"]', '[\"Spectacles (commonly known as glasses)\"]', '[\"Use of convex glasses.\"]', '[\"Eye drops (Acinephrin)\"]', '[\"Once a day before sleep.\"]', 3400),
(2, 'Vivian', 'Vivian Nkatha', 'Dr. David - Optician ', 'Jokes', 'The patient has a hysterical laughing condition.', '[\"funny\"]', '[\"Laughter\"]', '[\"Loud noises from the mouth.\"]', '[\"Sadness\"]', '[\"once every time laughter occurs\"]', 0);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `specialty` varchar(255) NOT NULL,
  `isAdmin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `username`, `email`, `firstname`, `lastname`, `password`, `age`, `specialty`, `isAdmin`) VALUES
(1, 'david', 'dedan01@example.com', 'David', 'Mburu', '1234', 40, 'Optician', 'false'),
(2, 'John', 'jd@3vc.c', 'John', 'Denge', '1234', 56, 'Neurosurgeon', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `name`, `email`, `password`, `age`, `firstname`, `lastname`) VALUES
(1, 'victor', 'viki@nem.com', '1234', 20, 'Victor', 'Kimiti'),
(2, 'vivian', 'viv@viv.c', '1234', 20, 'Vivian', 'Nkatha'),
(3, 'eammon', 'eam@e.e', '1234', 20, 'Eammon', 'Kiprotich');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
