-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 12, 2022 at 06:18 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `impact`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `Customer_Id` int(11) NOT NULL,
  `Cust_Name` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `Salesman_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`Customer_Id`, `Cust_Name`, `City`, `grade`, `Salesman_Id`) VALUES
(3001, 'Brad Guzan', 'London', NULL, 5005),
(3002, 'Nick Rimando', 'New york', 100, 5001),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3007, 'Brad Davis', 'New york', 200, 5001),
(3008, 'Julian Green', 'London', 300, 5002),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003);

-- --------------------------------------------------------

--
-- Table structure for table `Salesman`
--

CREATE TABLE `Salesman` (
  `Salesman_Id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `City` varchar(100) NOT NULL,
  `Commission` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Salesman`
--

INSERT INTO `Salesman` (`Salesman_Id`, `Name`, `City`, `Commission`) VALUES
(5001, 'James Hoog', 'New York', '0.15'),
(5002, 'Nail Knite', 'Paris', '0.13'),
(5003, 'Lauson Hen', 'San Jose', '0.12'),
(5005, 'Pit Alex', 'London', '0.11'),
(5006, 'Mc lyon', 'Paris', '0.14'),
(5007, 'Paul Adam', 'Rome', '0.13');

-- --------------------------------------------------------

--
-- Table structure for table `USER_DETAILS`
--

CREATE TABLE `USER_DETAILS` (
  `USER_ID` int(11) NOT NULL,
  `USERNAME` varchar(100) DEFAULT NULL,
  `CONTACT_NUMBER` bigint(10) NOT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `CREATE_DATE_TIME` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `USER_DETAILS`
--

INSERT INTO `USER_DETAILS` (`USER_ID`, `USERNAME`, `CONTACT_NUMBER`, `PASSWORD`, `CREATE_DATE_TIME`) VALUES
(1, '\"ANIL\"', 7894561230, 'fc8e2a6b7f43dc90180dad8dfb405c8572333093', '2022-06-12 21:40:51'),
(2, '\"ANKITH\"', 8794561202, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '2022-06-12 21:43:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`Customer_Id`),
  ADD KEY `Salesman_Id` (`Salesman_Id`);

--
-- Indexes for table `Salesman`
--
ALTER TABLE `Salesman`
  ADD PRIMARY KEY (`Salesman_Id`);

--
-- Indexes for table `USER_DETAILS`
--
ALTER TABLE `USER_DETAILS`
  ADD PRIMARY KEY (`USER_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Customer`
--
ALTER TABLE `Customer`
  ADD CONSTRAINT `Customer_ibfk_1` FOREIGN KEY (`Salesman_Id`) REFERENCES `Salesman` (`Salesman_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--Task 4 :SQL Assignment
--Write a SQL statement to find the list of customers who appointed a salesman for their jobs and gets a commission from the company for more than 12%. 
select A.* from Customer A left join Salesman B on A.Salesman_Id=B.Salesman_Id where B.Commission > (12/100);



