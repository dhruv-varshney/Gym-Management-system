-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2021 at 02:51 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stargym`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`'root'`@`'localhost'` PROCEDURE `sample` (IN `id` VARCHAR(20))  NO SQL
select * from enrolls_to e,plan p WHERE uid=id and e.pid=p.pid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` varchar(20) NOT NULL,
  `streetName` varchar(40) NOT NULL,
  `state` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `zipcode` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `streetName`, `state`, `city`, `zipcode`) VALUES
('1529336794', '2069  Quarry Drive', 'NC', 'Greensboro', '27409'),
('1611927718', '456', 'karnataka', 'bangalore', '560078');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `pass_key` varchar(20) NOT NULL,
  `securekey` varchar(20) NOT NULL,
  `Full_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `pass_key`, `securekey`, `Full_name`) VALUES
('admin1', 'admin1', 'admin1', 'Star Gym');

-- --------------------------------------------------------

--
-- Table structure for table `enrolls_to`
--

CREATE TABLE `enrolls_to` (
  `et_id` int(5) NOT NULL,
  `pid` varchar(8) NOT NULL,
  `uid` varchar(20) NOT NULL,
  `paid_date` varchar(15) DEFAULT NULL,
  `expire` varchar(15) DEFAULT NULL,
  `renewal` varchar(15) DEFAULT NULL,
  `trans_id` varchar(20) DEFAULT NULL,
  `mode` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `enrolls_to`
--

INSERT INTO `enrolls_to` (`et_id`, `pid`, `uid`, `paid_date`, `expire`, `renewal`, `trans_id`, `mode`) VALUES
(2, 'POQKJC', '1611927718', '2021-01-29', '2021-02-25', 'no', '0001230056', 'upi'),
(3, 'POQKJC', '1611927718', '2021-01-29', '2021-03-01', 'yes', '9911661233', 'upi');

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `pid` varchar(8) NOT NULL,
  `planName` varchar(20) NOT NULL,
  `description` varchar(200) NOT NULL,
  `validity` varchar(20) NOT NULL,
  `amount` int(10) NOT NULL,
  `active` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`pid`, `planName`, `description`, `validity`, `amount`, `active`) VALUES
('POQKJC', 'Monthly Plan', 'A monthly subscription that unlocks the entire Gym Plan app and coach support on chat.', '1', 600, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `trainer_allocated`
--

CREATE TABLE `trainer_allocated` (
  `gid` int(5) NOT NULL,
  `Group_name` varchar(20) NOT NULL,
  `trainer_id` varchar(20) NOT NULL,
  `trainer_name` varchar(20) DEFAULT NULL,
  `contact` varchar(12) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `uid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `trainer_allocated`
--

INSERT INTO `trainer_allocated` (`gid`, `Group_name`, `trainer_id`, `trainer_name`, `contact`, `remarks`, `uid`) VALUES
(1, '', '', NULL, NULL, NULL, '1529336794'),
(2, '', '', NULL, NULL, NULL, '1611927718');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` varchar(20) NOT NULL,
  `username` varchar(40) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `dob` varchar(10) NOT NULL,
  `joining_date` varchar(10) NOT NULL,
  `trans_id` varchar(20) DEFAULT NULL,
  `mode` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `gender`, `mobile`, `email`, `dob`, `joining_date`, `trans_id`, `mode`) VALUES
('1611927718', 'harsh', 'Male', '9087678900', 'random@gmail.com', '2021-01-25', '2021-01-25', '0001230056', 'upi');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `format email` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
IF NEW.`email` NOT LIKE '%@%.com' THEN
SIGNAL SQLSTATE VALUE '45000'
SET MESSAGE_TEXT = '[table:users] - `email` column is not valid';
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `format number` BEFORE INSERT ON `users` FOR EACH ROW BEGIN 
 IF NEW.`mobile` NOT LIKE '__________' THEN
    SIGNAL SQLSTATE VALUE '45000'
      SET MESSAGE_TEXT = '[table:users] - `mobile` column is not valid';
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `workoutlog`
--

CREATE TABLE `workoutlog` (
  `wid` int(12) NOT NULL,
  `wname` varchar(45) DEFAULT NULL,
  `logid` varchar(200) DEFAULT NULL,
  `memid` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `s_time` varchar(20) NOT NULL,
  `e_time` varchar(20) NOT NULL,
  `remark` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `workoutlog`
--

INSERT INTO `workoutlog` (`wid`, `wname`, `logid`, `memid`, `date`, `s_time`, `e_time`, `remark`) VALUES
(1, 'yoga', '123456', '1611927718', '2021-01-01', '11:45', '12:45', 'update');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD KEY `userID` (`id`) USING BTREE;

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`) USING BTREE;

--
-- Indexes for table `enrolls_to`
--
ALTER TABLE `enrolls_to`
  ADD PRIMARY KEY (`et_id`) USING BTREE,
  ADD KEY `user_ID` (`uid`) USING BTREE,
  ADD KEY `plan_ID_idx` (`pid`) USING BTREE;

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`pid`) USING BTREE,
  ADD KEY `pid` (`pid`) USING BTREE;

--
-- Indexes for table `trainer_allocated`
--
ALTER TABLE `trainer_allocated`
  ADD PRIMARY KEY (`gid`) USING BTREE,
  ADD KEY `userID_idx` (`uid`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`) USING BTREE,
  ADD UNIQUE KEY `email` (`email`) USING BTREE,
  ADD KEY `userid` (`userid`) USING BTREE;

--
-- Indexes for table `workoutlog`
--
ALTER TABLE `workoutlog`
  ADD PRIMARY KEY (`wid`) USING BTREE,
  ADD UNIQUE KEY `logid` (`logid`),
  ADD KEY `fkbl111` (`memid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `enrolls_to`
--
ALTER TABLE `enrolls_to`
  MODIFY `et_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trainer_allocated`
--
ALTER TABLE `trainer_allocated`
  MODIFY `gid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `workoutlog`
--
ALTER TABLE `workoutlog`
  MODIFY `wid` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enrolls_to`
--
ALTER TABLE `enrolls_to`
  ADD CONSTRAINT `fkbb` FOREIGN KEY (`pid`) REFERENCES `plan` (`pid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fkbb1` FOREIGN KEY (`uid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `workoutlog`
--
ALTER TABLE `workoutlog`
  ADD CONSTRAINT `fkbl111` FOREIGN KEY (`memid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
