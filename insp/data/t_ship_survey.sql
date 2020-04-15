-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2020 at 11:42 AM
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
-- Dumping data for table `t_ship_survey`
--

REPLACE INTO `t_ship_survey` (`projid`, `vessel_type`, `call_sign`, `loading_port`, `loading_rate`, `date_place_built`, `IMO`, `loading_date`, `hr_from`, `hr_to`, `discharge_rate`, `charter`, `loading_style`, `discharge_style`, `steve`, `limits`, `cargo_type`, `no_pallets`, `measure`, `w_each`, `t_measur`, `t_w`, `p_remarks`, `s_limits`, `lc`, `bl`) VALUES
(1, 'Street Scene	', 'Mirtazapine', 'Dru Joubert	', '25%', 'Predovic, Kautzer and ', '4845280000', '2020-04-01', '0120', '0430', '35%', 'Modern software development requires realistic and representative test data. DATPROF Privacy masks your test data and generates synthetic da', 'data and generates synthetic data. Your customer data is protected, but software teams can still use representative test data.', ' partners who may combine it with other information that you’ve provided to them or that they’ve collected from your use of their services. ', 'Consistent over multiple applications and databases', 'Partial shipment', 'Siddhartha', '1200', '120cm', '500kg', '2500cm', '5000kg', 'Predovic, Kautzer and Mayer	', 'Under Deck', '568381214-3', '4189604119');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
