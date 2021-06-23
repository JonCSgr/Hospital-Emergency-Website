-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2021 at 10:27 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs370`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `password` varchar(250) DEFAULT NULL,
  `username` varchar(250) NOT NULL,
  `firstname` varchar(250) DEFAULT NULL,
  `lastname` varchar(250) DEFAULT NULL,
  `speciality` varchar(250) DEFAULT NULL,
  `type` varchar(250) DEFAULT 'Doctor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`password`, `username`, `firstname`, `lastname`, `speciality`, `type`) VALUES
('11', 'a', 'pikachu', 'pika', 'electric', 'Doctor'),
('a', 'aa', 'squirtle', 'sqirt', 'water', 'Doctor'),
('a', 'aaa', 'charmander', 'char', 'fire', 'Doctor'),
('a', 'aaaa', 'bullbasaur', 'bulba', 'plant', 'Doctor'),
('a', 'aaaaa', 'caterpie', 'pie', 'insect', 'Doctor'),
('33', 'cc2', 'charmander', 'char', 'fire', 'Doctor'),
('55', 'cc3', 'caterpie', 'pie', 'insect', 'Doctor'),
('44', 'ff', 'bullbasaur', 'bulba', 'plant', 'Doctor'),
('11', 'pp', 'pikachu', 'pika', 'electric', 'Doctor'),
('22', 'ss', 'squirtle', 'sqirt', 'water', 'Doctor');

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `name` varchar(250) DEFAULT NULL,
  `dosage` int(11) DEFAULT NULL,
  `type` varchar(250) DEFAULT NULL,
  `usefor` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`name`, `dosage`, `type`, `usefor`) VALUES
('rarecandy', 1, 'pill', 'lvlup'),
('revive', 1000, 'injectopn', 'icdeadppl'),
('restore', 500, 'potion', 'healpls'),
('elixir', 500, 'potion', 'kotlgiffmana'),
('vitamin', 500, 'pill', 'getstronk'),
('rarecandy', 1, 'pill', 'lvlup'),
('revive', 1000, 'injectopn', 'icdeadppl'),
('restore', 500, 'potion', 'healpls'),
('elixir', 500, 'potion', 'kotlgiffmana'),
('vitamin', 500, 'pill', 'getstronk');

-- --------------------------------------------------------

--
-- Table structure for table `efimeries`
--

CREATE TABLE `efimeries` (
  `username` varchar(250) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `firstname` varchar(250) DEFAULT NULL,
  `lastname` varchar(250) DEFAULT NULL,
  `speciality` varchar(250) DEFAULT NULL,
  `type` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `efimeries`
--

INSERT INTO `efimeries` (`username`, `date`, `firstname`, `lastname`, `speciality`, `type`) VALUES
('bb', '2021-01-14', 'butterfree', 'free', 'No Speciality', 'staff'),
('cc1', '2021-01-14', 'caterpie', 'pie', 'insect', 'Doctor'),
('cc2', '2021-01-14', 'charmander', 'char', 'fire', 'Doctor'),
('pp', '2021-01-14', 'pikachu', 'pika', 'electric', 'Doctor'),
('ss', '2021-01-14', 'squirtle', 'sqirt', 'water', 'Doctor'),
('cc3', '2021-01-13', 'caterpie', 'pie', 'insect', 'Doctor'),
('ff', '2021-01-14', 'bullbasaur', 'bulba', 'plant', 'Doctor'),
('cc', '2021-01-14', 'charizard', 'char', 'No Speciality', 'staff'),
('ii', '2021-01-14', 'ivysaur', 'saur', 'No Speciality', 'Nurse'),
('mm', '2021-01-14', 'mewtwo', 'mew', 'No Speciality', 'staff'),
('ww', '2021-01-14', 'wartortle', 'tortle', 'No Speciality', 'Nurse'),
('b', '2021-01-14', 'raichu', 'rai', 'No Speciality', 'Nurse'),
('bbb', '2021-01-14', 'charmilion', 'char', 'No Speciality', 'Nurse'),
('bbbb', '2021-01-14', 'ivysaur', 'saur', 'No Speciality', 'Nurse'),
('c', '2021-01-14', 'mewtwo', 'mew', 'No Speciality', 'staff'),
('ccc', '2021-01-14', 'charizard', 'char', 'No Speciality', 'staff');

-- --------------------------------------------------------

--
-- Table structure for table `nurses`
--

CREATE TABLE `nurses` (
  `username` varchar(250) NOT NULL,
  `password` varchar(250) DEFAULT NULL,
  `firstname` varchar(250) DEFAULT NULL,
  `lastname` varchar(250) DEFAULT NULL,
  `type` varchar(250) DEFAULT 'Nurse',
  `speciality` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nurses`
--

INSERT INTO `nurses` (`username`, `password`, `firstname`, `lastname`, `type`, `speciality`) VALUES
('b', '1', 'raichu', 'rai', 'Nurse', 'none'),
('bb', '2', 'wartortle', 'tortle', 'Nurse', 'none'),
('bbb', '3', 'charmilion', 'char', 'Nurse', 'none'),
('bbbb', '4', 'ivysaur', 'saur', 'Nurse', 'none'),
('bbbbb', '5', 'metapod', 'meta', 'Nurse', 'none'),
('cc', '3', 'charmilion', 'char', 'Nurse', 'none'),
('ii', '4', 'ivysaur', 'saur', 'Nurse', 'none'),
('mm', '5', 'metapod', 'meta', 'Nurse', 'none'),
('rr', '1', 'raichu', 'rai', 'Nurse', 'none'),
('ww', '2', 'wartortle', 'tortle', 'Nurse', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `patient_data`
--

CREATE TABLE `patient_data` (
  `password` varchar(250) DEFAULT NULL,
  `firstName` varchar(250) DEFAULT NULL,
  `lastName` varchar(250) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `insurance` varchar(250) DEFAULT NULL,
  `chronic_conditions` varchar(250) DEFAULT NULL,
  `amka` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_data`
--

INSERT INTO `patient_data` (`password`, `firstName`, `lastName`, `address`, `insurance`, `chronic_conditions`, `amka`) VALUES
('123', 'dsfsa', 'dfdas', 'fas', 'fasdfa', 'dfas', 'Patata'),
('fsadfsda', 'fasd', 'fasdfas', 'dfasdfa', 'adfasf', 'asfd', 'afasd'),
('dfadfa', 'dsfas', 'asdfasdf', 'asdf', 'dfasfas', 'fas', 'dfasf'),
('1234', '1234', '1234', '1234', '1234', '1234', '1234'),
('aaaaaaa', 'aaaaaaa', 'aaaaaaa', 'aaaaaaa', 'aaaaaaa', 'aaaaaaa', 'aaaaaaa'),
('12345 ', '12345', '12345', '12345', '12345 ', '12345 ', '12345 '),
('afafafafa', 'afafafafa', 'afafafafa', 'afafafafa', 'afafafafa', 'afafafafa', 'afafafafa'),
('asdasd', 'asdasd', 'asdasdasdasd', 'asdasd', 'asdasd', 'asdasd', 'asdasd'),
('111', NULL, NULL, NULL, NULL, NULL, 'mm'),
('dasdasdas', 'fadsf', 'asf', 'afaf', 'adsf', 'asdfadf', 'asdadada');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `username` varchar(250) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `firstName` varchar(250) DEFAULT NULL,
  `lastname` varchar(250) DEFAULT NULL,
  `type` varchar(250) DEFAULT 'staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`username`, `password`, `firstName`, `lastname`, `type`) VALUES
('mm', '111', 'mewtwo', 'mew', 'staff'),
('bb', '222', 'blastoise', 'blast', 'staff'),
('cc', '333', 'charizard', 'char', 'staff'),
('vv', '444', 'venosaur', 'veno', 'staff'),
('bb', '555', 'butterfree', 'free', 'staff'),
('c', '111', 'mewtwo', 'mew', 'staff'),
('cc', '222', 'blastoise', 'blast', 'staff'),
('ccc', '333', 'charizard', 'char', 'staff'),
('cccc', '444', 'venosaur', 'veno', 'staff'),
('ccccc', '555', 'butterfree', 'free', 'staff');

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `date` date DEFAULT NULL,
  `diagnose` varchar(250) DEFAULT NULL,
  `medical_exam` varchar(250) DEFAULT NULL,
  `therapy` varchar(250) DEFAULT NULL,
  `symptoms` varchar(250) DEFAULT NULL,
  `username` varchar(250) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `anafora` varchar(250) DEFAULT NULL,
  `nosilia` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visits`
--

INSERT INTO `visits` (`date`, `diagnose`, `medical_exam`, `therapy`, `symptoms`, `username`, `id`, `anafora`, `nosilia`) VALUES
('2021-01-13', NULL, NULL, NULL, 'asdfasdfsa', 'dfasfas', 3, NULL, NULL),
('2021-01-13', NULL, NULL, NULL, 'erotas', 'Patata', 4, NULL, NULL),
('2021-01-13', '', 'COVID-19_test', 'vitamin', '1234', '1234', 5, NULL, NULL),
('2021-01-13', NULL, NULL, NULL, 'aaaaaaa', 'aaaaaaa', 6, NULL, NULL),
('2021-01-13', NULL, NULL, NULL, 'fsdfs', 'aaaaaaa', 7, NULL, NULL),
('2021-01-13', NULL, NULL, NULL, 'dsafa', 'aaaaaaa', 8, NULL, NULL),
('2021-01-13', '', 'COVID-19_test', NULL, '12345', '12345 ', 9, NULL, NULL),
('2021-01-13', '', 'COVID-19_test', NULL, 'afafafafa', 'afafafafa', 10, NULL, NULL),
('2021-01-13', '', 'COVID-19_test', NULL, 'asdasd', 'asdasd', 11, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `efimeries`
--
ALTER TABLE `efimeries`
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `nurses`
--
ALTER TABLE `nurses`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
