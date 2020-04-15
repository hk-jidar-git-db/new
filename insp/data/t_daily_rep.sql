-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2020 at 11:23 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fdl`
--

--
-- Dumping data for table `t_daily_rep`
--

REPLACE INTO `t_daily_rep` (`projid`, `rep_date`, `hotel_tel`, `hotel_fax`, `room_no`, `report`) VALUES
(1, '2020-04-08', '930-941-6360', '804-803-2369', '205', '(CNN)A 99-year-old British war veteran has raised more than £4.8 million ($6 million) for the country\'s National Health Service (NHS) as he aims to complete 100 laps of his garden, aided by a walking frame.\n\nTom Moore, who will turn 100 on April 30, began the challenge last Thursday to raise money for NHS Charities Together, which raises funds for UK hospitals, including for staff, volunteers and patients affected by the coronavirus crisis.\n99-year-old WWII veteran who survived coronavirus gets guard of honor from nurses\n99-year-old WWII veteran who survived coronavirus gets guard of honor from nurses\nHe had originally set a target of raising £1,000 ($1,257) by his 100th birthday and walks 10 laps each day in his garden, in Yorkshire, northern England.\nBut within 24 hours he exceeded that target and donations continue to flood in.\nThe veteran plans to complete 100 laps by the end of Thursday.\nMoore trained as a civil engineer before being enlisted in the British Army during World War II, where he served in India, Indonesia and Britain. He later became the managing director of a concrete manufacturer.\nHis daughter, Hannah Ingram-Moore, told CNN that her father had been exercising daily following a recent partial hip replacement and she suggested he challenge himself to do it daily in order to raise funds.');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
