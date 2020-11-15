-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 12, 2020 at 07:04 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kipawa`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `courseID` varchar(20) NOT NULL,
  `cName` varchar(50) NOT NULL,
  `depertmentID` varchar(20) DEFAULT NULL,
  `employeeID` varchar(20) DEFAULT NULL,
  `level` varchar(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `classfication` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseID`, `cName`, `depertmentID`, `employeeID`, `level`, `credit`, `classfication`) VALUES
('ELE06101', 'Operating Test Equipment', 'ELE', 'KICTC-STA-0004-2020', '6', 12, 'c'),
('ITT05101', 'Operating Systems', 'ICT', 'KICTC-STA-0005-2020', '5', 9, 'c'),
('ITT05102', 'Computer Maintenance and Repairs', 'ICT', 'KICTC-STA-0005-2020', '5', 12, 'c'),
('ITT05106', 'Computing Mathematics', 'ICT', 'KICTC-STA-0009-2020', '5', 8, 'f'),
('ITT06101', 'Object Oriented Programming', 'ICT', 'KICTC-STA-0007-2020', '6', 12, 'c'),
('ITT06102', 'Web Technologies', 'ICT', 'KICTC-STA-0005-2020', '6', 12, 'c'),
('ITT06103', 'System Analysis and Design', 'ICT', 'KICTC-STA-0008-2020', '6', 12, 'c'),
('ITT06104', 'System Adminstration and Security', 'ICT', 'KICTC-STA-0009-2020', '6', 14, 'f');

-- --------------------------------------------------------

--
-- Table structure for table `courseprogram`
--

CREATE TABLE `courseprogram` (
  `id` int(11) NOT NULL,
  `courseID` varchar(20) CHARACTER SET latin1 NOT NULL,
  `programID` varchar(20) CHARACTER SET latin1 NOT NULL,
  `level` varchar(11) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courseprogram`
--

INSERT INTO `courseprogram` (`id`, `courseID`, `programID`, `level`) VALUES
(11, 'ITT06101', 'OD-ICT', '6'),
(12, 'ITT06102', 'OD-ICT', '6'),
(13, 'ITT06103', 'OD-ICT', '6'),
(14, 'ITT06104', 'OD-ICT', '6'),
(15, 'ITT05101', 'TC-ICT', '5'),
(16, 'ITT05102', 'TC-ICT', '5'),
(17, 'ITT05106', 'TC-ICT', '5'),
(18, 'ELE06101', 'BT-ELE', '6');

-- --------------------------------------------------------

--
-- Table structure for table `coursework`
--

CREATE TABLE `coursework` (
  `id` int(11) NOT NULL,
  `courseID` varchar(20) NOT NULL,
  `score` varchar(5) DEFAULT NULL,
  `remarks` varchar(4) DEFAULT NULL,
  `regno` varchar(30) DEFAULT NULL,
  `coID` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT '	'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coursework`
--

INSERT INTO `coursework` (`id`, `courseID`, `score`, `remarks`, `regno`, `coID`) VALUES
(20, 'ITT05102', '33', 'pass', 'KICTC-CER-006-2020', 'ITT051022020'),
(21, 'ITT05102', '14', 'fail', 'KICTC-CER-007-2020', 'ITT051022020'),
(22, 'ITT05102', '22', 'pass', 'KICTC-CER-016-2020', 'ITT051022020'),
(23, 'ITT05101', '12', 'fail', 'KICTC-CER-006-2020', 'ITT051012020'),
(24, 'ITT05101', '14', 'fail', 'KICTC-CER-007-2020', 'ITT051012020'),
(25, 'ITT05101', '20', 'pass', 'KICTC-CER-016-2020', 'ITT051012020'),
(26, 'ITT06102', '11', 'fail', 'KICTC-DIP-003-2020', 'ITT061022020');

-- --------------------------------------------------------

--
-- Table structure for table `courseworkstate`
--

CREATE TABLE `courseworkstate` (
  `coID` varchar(20) NOT NULL,
  `costateID` varchar(20) NOT NULL,
  `coaccess` varchar(20) NOT NULL,
  `costatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `depertmentID` varchar(20) NOT NULL,
  `dName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`depertmentID`, `dName`) VALUES
('ELE', 'Electronics'),
('ICT', 'Information Communication Technology'),
('MNG', 'Management');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeID` varchar(20) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(55) DEFAULT NULL,
  `file` varchar(110) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `depertmentID` varchar(20) DEFAULT NULL,
  `phoneno` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeID`, `fname`, `mname`, `lname`, `email`, `file`, `gender`, `depertmentID`, `phoneno`) VALUES
('KICTC-STA-0001-2020', 'mboya', 'francis', 'felix', 'mboya@gmail.com', 'KICTC-STA-0001-2020.png', 'male', 'MNG', '0675511084'),
('KICTC-STA-0003-2020', 'EMMANUEL', 'MNGUMI', 'TUNZO', 'mboya3@gmail.com', 'KICTC-STA-0003-2020.png', 'Male', 'ICT', '0714102201'),
('KICTC-STA-0004-2020', 'RICKY', 'T', 'SAMBO', 'mboya4@gmail.com', 'KICTC-STA-0004-2020.png', 'Male', 'ELE', '0755656565'),
('KICTC-STA-0005-2020', 'EFRAIMU ', 'M ', 'MULENGELA', 'mboya5@gmail.com', 'KICTC-STA-0005-2020.png', 'Male', 'ICT', '0674523210'),
('KICTC-STA-0006-2020', 'OCTAVIAN ', 'S', 'WILLIUM', 'mboya6@gmail.com', 'KICTC-STA-0006-2020.png', 'Male', 'ELE', '0765233421'),
('KICTC-STA-0007-2020', 'EVELINE', 'JOHN', 'MARO', 'mboya7@gmail.com', 'KICTC-STA-0007-2020.png', 'Female', 'ICT', '0687342512'),
('KICTC-STA-0008-2020', 'SUBE', 'JOSEPH', 'MSHANA', 'mboya8@gmail.com', 'KICTC-STA-0008-2020.png', 'Male', 'ICT', '0756442345'),
('KICTC-STA-0009-2020', 'OMARY', 'KATUNZI', 'JOSEPHAT', 'mboya9@gmail.com', 'KICTC-STA-0009-2020.png', 'Male', 'ICT', '0756442346'),
('KICTC-STA-0074-2020', 'JOHN', 'HAMIS', 'URASA', 'joh@GMAIL.COM', 'KICTC-STA-0074-2020.png', 'Male', 'MNG', '09865433567');

-- --------------------------------------------------------

--
-- Table structure for table `hmessager`
--

CREATE TABLE `hmessager` (
  `id` int(11) NOT NULL,
  `messageB` varchar(50) NOT NULL,
  `messageH` varchar(350) NOT NULL,
  `status` varchar(7) NOT NULL,
  `employeeID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hmessages`
--

CREATE TABLE `hmessages` (
  `id` int(11) NOT NULL,
  `messageB` varchar(50) NOT NULL,
  `messageH` varchar(350) NOT NULL,
  `status` varchar(7) NOT NULL,
  `regno` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hmessaget`
--

CREATE TABLE `hmessaget` (
  `id` int(11) NOT NULL,
  `messageB` varchar(50) NOT NULL,
  `messageH` varchar(350) NOT NULL,
  `status` varchar(7) NOT NULL,
  `employeeID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `email` varchar(55) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`email`, `password`) VALUES
('joh@GMAIL.COM', 'URASA'),
('kweka10@gmail.com', 'Issa'),
('kweka11@gmail.com', 'Mwanalus'),
('kweka12@gmail.com', 'Nkya'),
('kweka13@gmail.com', 'Urrasa'),
('kweka14@gmail.com', 'Nnko'),
('kweka15@gmail.com', 'Massawe'),
('kweka16@gmail.com', 'Lusajo'),
('kweka17@gmail.com', 'Mwalongo'),
('kweka18@gmail.com', 'Athumani'),
('kweka19@gmail.com', 'Simbo'),
('kweka1@gmail.com', 'Dayo'),
('kweka20@gmail.com', 'Pallangyo'),
('kweka21@gmail.com', 'Jose'),
('kweka22@gmail.com', 'Mkone'),
('kweka23@gmail.com', 'shoo'),
('kweka24@gmail.com', 'Shayo'),
('kweka25@gmail.com', 'Materu'),
('kweka26@gmail.com', 'Mahela'),
('kweka27@gmail.com', 'Mgaya'),
('kweka28@gmail.com', 'Athumani'),
('kweka29@gmail.com', 'John'),
('kweka2@gmail.com', 'Abdallah'),
('kweka30@gmail.com', 'Gonza'),
('kweka31@gmail.com', 'Mtaka'),
('kweka32@gmail.com', 'Boko'),
('kweka3@gmail.com', 'Swai'),
('kweka4@gmail.com', 'Nnko'),
('kweka5@gmail.com', 'Dayo'),
('kweka6@gmail.com', 'Mtui'),
('kweka7@gmail.com', 'Dayo'),
('kweka8@gmail.com', 'Ndosi'),
('kweka9@gmail.com', 'Mushi'),
('mboya3@gmail.com', 'TUNZO'),
('mboya4@gmail.com', 'SAMBO'),
('mboya5@gmail.com', 'MULENGELA'),
('mboya6@gmail.com', 'WILLIUM'),
('mboya7@gmail.com', 'MARO'),
('mboya8@gmail.com', 'MSHANA'),
('mboya9@gmail.com', 'JOSEPHAT'),
('mboya@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `loginst`
--

CREATE TABLE `loginst` (
  `OID` int(11) NOT NULL,
  `email` varchar(55) CHARACTER SET latin1 NOT NULL,
  `ostate` varchar(10) CHARACTER SET latin1 NOT NULL DEFAULT 'offline'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loginst`
--

INSERT INTO `loginst` (`OID`, `email`, `ostate`) VALUES
(5, 'mboya@gmail.com', 'offline');

-- --------------------------------------------------------

--
-- Table structure for table `loginstate`
--

CREATE TABLE `loginstate` (
  `loginID` int(11) NOT NULL,
  `email` varchar(55) CHARACTER SET latin1 NOT NULL,
  `loginstatus` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loginstate`
--

INSERT INTO `loginstate` (`loginID`, `email`, `loginstatus`) VALUES
(5, 'mboya@gmail.com', 'disabled');

-- --------------------------------------------------------

--
-- Table structure for table `pmessageh`
--

CREATE TABLE `pmessageh` (
  `id` int(11) NOT NULL,
  `messageH` varchar(50) NOT NULL,
  `messageB` varchar(350) NOT NULL,
  `employID` varchar(20) NOT NULL,
  `status` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pmessager`
--

CREATE TABLE `pmessager` (
  `id` int(11) NOT NULL,
  `messageH` varchar(50) NOT NULL,
  `messageB` varchar(350) NOT NULL,
  `employID` varchar(20) NOT NULL,
  `status` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pmessaget`
--

CREATE TABLE `pmessaget` (
  `id` int(11) NOT NULL,
  `messageH` varchar(50) NOT NULL,
  `messageB` varchar(350) NOT NULL,
  `employeeID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `programID` varchar(20) NOT NULL,
  `pName` varchar(250) NOT NULL,
  `durationINYear` int(11) NOT NULL,
  `depertmentID` varchar(20) DEFAULT NULL,
  `level` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`programID`, `pName`, `durationINYear`, `depertmentID`, `level`) VALUES
('BT-ELE', 'Basic Technician Certificate in Electronics', 1, 'ELE', '4'),
('BT-ICT', 'Basic Technician Certificate in ICT', 1, 'ICT', '4'),
('BT-MFT', 'Basic Technician Certificate in Multimedia and Film Technology', 1, 'ICT', '4'),
('OD-ELE', 'Ordinary Diploma in Electronics', 1, 'ELE', '6'),
('OD-ICT', 'Ordinary Diploma in ICT', 1, 'ICT', '6'),
('OD-MFT', 'Ordinary Diploma in Multimedia and Film Technology', 1, 'ICT', '6'),
('TC-ELE', 'Technician Certificate in Electronics', 1, 'ELE', '5'),
('TC-ICT', ' Technician Certificate in ICT', 1, 'ICT', '5'),
('TC-MFT', ' Technician Certificate in Multimedia and Film Technology', 1, 'ICT', '5');

-- --------------------------------------------------------

--
-- Table structure for table `regstate`
--

CREATE TABLE `regstate` (
  `regID` int(11) NOT NULL,
  `regno` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `seID` varchar(20) DEFAULT NULL,
  `regstatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `courseID` varchar(20) DEFAULT NULL,
  `regno` varchar(30) NOT NULL,
  `score` varchar(5) NOT NULL,
  `grade` varchar(2) NOT NULL,
  `coID` varchar(20) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `courseID`, `regno`, `score`, `grade`, `coID`) VALUES
(2, 'ITT05101', 'KICTC-CER-006-2020', '86', 'A', 'ITT051012020'),
(3, 'ITT05101', 'KICTC-CER-007-2020', '14', 'F', 'ITT051012020'),
(4, 'ITT05101', 'KICTC-CER-016-2020', '20', 'F', 'ITT051012020'),
(8, 'ITT05102', 'KICTC-CER-006-2020', '66', 'B+', 'ITT051022020'),
(9, 'ITT05102', 'KICTC-CER-007-2020', '14', 'F', 'ITT051022020'),
(10, 'ITT05102', 'KICTC-CER-016-2020', '20', 'F', 'ITT051022020'),
(11, 'ITT06102', 'KICTC-DIP-003-2020', '11', 'F', 'ITT061022020');

-- --------------------------------------------------------

--
-- Table structure for table `resultstate`
--

CREATE TABLE `resultstate` (
  `reID` varchar(20) NOT NULL,
  `restateID` varchar(20) NOT NULL,
  `reaccess` varchar(20) NOT NULL,
  `restatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rmessageh`
--

CREATE TABLE `rmessageh` (
  `id` int(11) NOT NULL,
  `messageB` varchar(50) NOT NULL,
  `messageH` varchar(350) NOT NULL,
  `status` varchar(7) NOT NULL,
  `employeeID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rmessages`
--

CREATE TABLE `rmessages` (
  `id` int(11) NOT NULL,
  `messageB` varchar(50) NOT NULL,
  `messageH` varchar(350) NOT NULL,
  `status` varchar(7) NOT NULL,
  `regno` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rmessaget`
--

CREATE TABLE `rmessaget` (
  `id` int(11) NOT NULL,
  `messageB` varchar(50) NOT NULL,
  `messageH` varchar(350) NOT NULL,
  `status` varchar(7) NOT NULL,
  `employeeID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `sID` int(11) NOT NULL,
  `seName` varchar(20) NOT NULL,
  `courseID` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`sID`, `seName`, `courseID`) VALUES
(1, '1', 'ITT 04101');

-- --------------------------------------------------------

--
-- Table structure for table `semisterstate`
--

CREATE TABLE `semisterstate` (
  `seID` varchar(20) NOT NULL,
  `sestateID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `statusID` int(11) NOT NULL,
  `statusName` varchar(20) NOT NULL,
  `email` varchar(55) NOT NULL,
  `lstate` varchar(20) NOT NULL DEFAULT 'enabled'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`statusID`, `statusName`, `email`, `lstate`) VALUES
(5, 'admin', 'mboya@gmail.com', 'disabled'),
(24, 'hod', 'mboya3@gmail.com', 'enabled'),
(25, 'hod', 'mboya4@gmail.com', 'enabled'),
(26, 'teacher', 'mboya5@gmail.com', 'enabled'),
(27, 'teacher', 'mboya6@gmail.com', 'enabled'),
(28, 'teacher', 'mboya7@gmail.com', 'enabled'),
(355, 'student', 'kweka1@gmail.com', 'enabled'),
(356, 'student', 'kweka2@gmail.com', 'enabled'),
(357, 'student', 'kweka3@gmail.com', 'enabled'),
(358, 'student', 'kweka4@gmail.com', 'enabled'),
(359, 'student', 'kweka5@gmail.com', 'enabled'),
(360, 'student', 'kweka6@gmail.com', 'enabled'),
(361, 'student', 'kweka7@gmail.com', 'enabled'),
(362, 'student', 'kweka8@gmail.com', 'enabled'),
(363, 'student', 'kweka9@gmail.com', 'enabled'),
(364, 'student', 'kweka10@gmail.com', 'enabled'),
(365, 'student', 'kweka11@gmail.com', 'enabled'),
(366, 'student', 'kweka12@gmail.com', 'enabled'),
(367, 'student', 'kweka13@gmail.com', 'enabled'),
(368, 'student', 'kweka14@gmail.com', 'enabled'),
(369, 'student', 'kweka15@gmail.com', 'enabled'),
(370, 'student', 'kweka16@gmail.com', 'enabled'),
(371, 'student', 'kweka17@gmail.com', 'enabled'),
(372, 'student', 'kweka18@gmail.com', 'enabled'),
(373, 'student', 'kweka19@gmail.com', 'enabled'),
(374, 'student', 'kweka20@gmail.com', 'enabled'),
(375, 'student', 'kweka22@gmail.com', 'enabled'),
(376, 'student', 'kweka23@gmail.com', 'enabled'),
(377, 'student', 'kweka24@gmail.com', 'enabled'),
(378, 'student', 'kweka25@gmail.com', 'enabled'),
(379, 'student', 'kweka26@gmail.com', 'enabled'),
(380, 'student', 'kweka27@gmail.com', 'enabled'),
(381, 'student', 'kweka28@gmail.com', 'enabled'),
(382, 'student', 'kweka29@gmail.com', 'enabled'),
(383, 'student', 'kweka30@gmail.com', 'enabled'),
(384, 'student', 'kweka31@gmail.com', 'enabled'),
(385, 'student', 'kweka32@gmail.com', 'enabled'),
(386, 'student', 'kweka21@gmail.com', 'enabled'),
(388, 'teacher', 'mboya8@gmail.com', 'enabled'),
(389, 'teacher', 'mboya9@gmail.com', 'enabled'),
(390, 'principal', 'joh@GMAIL.COM', 'enabled');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `regno` varchar(30) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) NOT NULL,
  `depertmentID` varchar(20) DEFAULT NULL,
  `programID` varchar(20) DEFAULT NULL,
  `year` year(4) NOT NULL,
  `level` varchar(11) NOT NULL,
  `email` varchar(55) DEFAULT NULL,
  `file` varchar(110) NOT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `state` varchar(20) NOT NULL,
  `regDate` varchar(25) NOT NULL,
  `phoneno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`regno`, `fname`, `mname`, `lname`, `depertmentID`, `programID`, `year`, `level`, `email`, `file`, `gender`, `state`, `regDate`, `phoneno`) VALUES
('KICTC-CER-001-2020', 'Amani', 'Ivan', 'Dayo', 'ITT', 'BT-ICT', 2018, '4', 'kweka1@gmail.com', 'KICTC-CER-001-2020.png', 'Male', 'Approved', '12/22/2018', 759191200),
('KICTC-CER-002-2020', 'Abdallah', 'Hussein', 'Abdallah', 'ITT', 'BT-ICT', 2018, '4', 'kweka2@gmail.com', 'KICTC-CER-002-2020.png', 'Male', 'Approved', '12/24/2018', 79191202),
('KICTC-CER-003-2020', 'Shaibu', 'Jakaranda', 'Swai', 'ELE', 'BT-ELE', 2018, '4', 'kweka3@gmail.com', 'KICTC-CER-003-2020.png', 'Male', 'Approved', '12/26/2018', 79191204),
('KICTC-CER-004-2020', 'Baraka', 'Justice', 'Nnko', 'ITT', 'BT-ICT', 2018, '4', 'kweka4@gmail.com', 'KICTC-CER-004-2020.png', 'Male', 'Approved', '12/28/2018', 79191206),
('KICTC-CER-005-2020', 'Amani', 'Ivan', 'Dayo', 'ITT', 'BT-ICT', 2018, '4', 'kweka5@gmail.com', 'KICTC-CER-005-2020.png', 'Male', 'Approved', '12/22/2018', 759191200),
('KICTC-CER-006-2020', 'Antony', 'Juva', 'Mtui', 'ITT', 'TC-ICT', 2018, '5', 'kweka6@gmail.com', 'KICTC-CER-006-2020.png', 'Male', 'Approved', '12/22/2018', 759191200),
('KICTC-CER-007-2020', 'Amani', 'Ivan', 'Dayo', 'ITT', 'TC-ICT', 2018, '5', 'kweka7@gmail.com', 'KICTC-CER-007-2020.png', 'Male', 'Approved', '12/22/2018', 759191200),
('KICTC-CER-008-2020', 'Justice', 'Hussein', 'Ndosi', 'ITT', 'TC-MFT', 2018, '5', 'kweka8@gmail.com', 'KICTC-CER-008-2020.png', 'Male', 'Approved', '12/24/2018', 79191202),
('KICTC-CER-009-2020', 'Nicholous', 'Jackson', 'Mushi', 'ELE', 'TC-ELE', 2018, '5', 'kweka9@gmail.com', 'KICTC-CER-009-2020.png', 'Male', 'Approved', '12/24/2018', 79191202),
('KICTC-CER-010-2020', 'Abdallah', 'Hussein', 'Issa', 'ELE', 'TC-ELE', 2018, '5', 'kweka10@gmail.com', 'KICTC-CER-010-2020.png', 'Male', 'Approved', '12/24/2018', 79191202),
('KICTC-CER-011-2020', 'Ahmed', 'John', 'Mwanalus', 'ELE', 'BT-ELE', 2018, '4', 'kweka11@gmail.com', 'KICTC-CER-011-2020.png', 'Male', 'Approved', '12/26/2018', 79191204),
('KICTC-CER-012-2020', 'Mohamed', 'Abubakar', 'Nkya', 'ELE', 'BT-ELE', 2018, '4', 'kweka12@gmail.com', 'KICTC-CER-012-2020.png', 'Male', 'Approved', '12/26/2018', 79191204),
('KICTC-CER-013-2020', 'Hardson', 'Herman', 'Urrasa', 'ELE', 'TC-ELE', 2018, '5', 'kweka13@gmail.com', 'KICTC-CER-013-2020.png', 'Male', 'Approved', '12/26/2018', 79191204),
('KICTC-CER-014-2020', 'Baraka', 'Justice', 'Nnko', 'ITT', 'TC-MFT', 2018, '5', 'kweka14@gmail.com', 'KICTC-CER-014-2020.png', 'Male', 'Approved', '12/28/2018', 79191206),
('KICTC-CER-015-2020', 'Hemedi', 'Noel', 'Massawe', 'ITT', 'BT-MFT', 2018, '5', 'kweka15@gmail.com', 'KICTC-CER-015-2020.png', 'Male', 'Approved', '12/28/2018', 79191206),
('KICTC-CER-016-2020', 'Benjamin', 'Asukile', 'Lusajo', 'ITT', 'TC-ICT', 2018, '5', 'kweka16@gmail.com', 'KICTC-CER-016-2020.png', 'Male', 'Approved', '12/28/2018', 79191206),
('KICTC-DIP-001-2020', 'Nickson', 'Kibabage', 'Mwalongo', 'ELE', 'OD-ELE', 2018, '6', 'kweka17@gmail.com', 'KICTC-DIP-001-2020.png', 'Male', 'Approved', '12/29/2018', 79191207),
('KICTC-DIP-002-2020', 'Halima', 'Mkongowe', 'Athumani', 'ITT', 'OD-MFT', 2018, '6', 'kweka18@gmail.com', 'KICTC-DIP-002-2020.png', 'female', 'Approved', '12/25/2018', 79191203),
('KICTC-DIP-003-2020', 'Sara', 'Felix', 'Simbo', 'ITT', 'OD-ICT', 2018, '6', 'kweka19@gmail.com', 'KICTC-DIP-003-2020.png', 'female', 'Approved', '12/27/2018', 79191205),
('KICTC-DIP-004-2020', 'Eliasi', 'Eframeni', 'Pallangyo', 'ITT', 'OD-MFT', 2018, '6', 'kweka20@gmail.com', 'KICTC-DIP-004-2020.png', 'Male', 'Approved', '12/29/2018', 79191207),
('KICTC-DIP-005-2020', 'Upendo', 'Jabiri', 'Mkone', 'ELE', 'OD-ELE', 2018, '6', 'kweka22@gmail.com', 'KICTC-DIP-005-2020.png', 'female', 'Approved', '12/23/2018', 79191201),
('KICTC-DIP-006-2020', 'Merry', 'Jumanne', 'shoo', 'ELE', 'OD-ELE', 2018, '6', 'kweka23@gmail.com', 'KICTC-DIP-006-2020.png', 'female', 'Approved', '12/23/2018', 79191201),
('KICTC-DIP-007-2020', 'Anna', 'A', 'Shayo', 'ELE', 'OD-ELE', 2018, '6', 'kweka24@gmail.com', 'KICTC-DIP-007-2020.png', 'female', 'Approved', '12/23/2018', 79191201),
('KICTC-DIP-008-2020', 'Neema', 'Azziz', 'Materu', 'ELE', 'OD-ELE', 2018, '6', 'kweka25@gmail.com', 'KICTC-DIP-008-2020.png', 'female', 'Approved', '12/23/2018', 79191201),
('KICTC-DIP-009-2020', 'Elvida', 'J', 'Mahela', 'ITT', 'OD-MFT', 2018, '6', 'kweka26@gmail.com', 'KICTC-DIP-009-2020.png', 'female', 'Approved', '12/25/2018', 79191203),
('KICTC-DIP-010-2020', 'Martha', 'Chriss', 'Mgaya', 'ITT', 'OD-MFT', 2018, '6', 'kweka27@gmail.com', 'KICTC-DIP-010-2020.png', 'female', 'Approved', '12/25/2018', 79191203),
('KICTC-DIP-011-2020', 'Neema', 'Shaban', 'Athumani', 'ITT', 'OD-ICT', 2018, '6', 'kweka28@gmail.com', 'KICTC-DIP-011-2020.png', 'female', 'Approved', '12/25/2018', 79191203),
('KICTC-DIP-012-2020', 'Heavenlight', 'Raphael', 'John', 'ITT', 'OD-ICT', 2018, '6', 'kweka29@gmail.com', 'KICTC-DIP-012-2020.png', 'female', 'Approved', '12/27/2018', 79191205),
('KICTC-DIP-013-2020', 'Gissele', 'Felix', 'Gonza', 'ITT', 'OD-ICT', 2018, '6', 'kweka30@gmail.com', 'KICTC-DIP-013-2020.png', 'female', 'Approved', '12/27/2018', 79191205),
('KICTC-DIP-014-2020', 'Noela', 'Antony', 'Mtaka', 'ITT', 'OD-MFT', 2018, '6', 'kweka31@gmail.com', 'KICTC-DIP-014-2020.png', 'female', 'Approved', '12/27/2018', 79191205),
('KICTC-DIP-015-2020', 'John', 'Raphael', 'Boko', 'ITT', 'OD-MFT', 2018, '6', 'kweka32@gmail.com', 'KICTC-DIP-015-2020.png', 'Male', 'Approved', '12/29/2018', 79191207),
('KICTC-DIP-016-2020', 'Miquison', 'Luis', 'Jose', 'ITT', 'OD-MFT', 2018, '6', 'kweka21@gmail.com', 'KICTC-DIP-016-2020.png', 'Male', 'Approved', '12/29/2018', 79191207);

-- --------------------------------------------------------

--
-- Table structure for table `studentviewco`
--

CREATE TABLE `studentviewco` (
  `stateView` varchar(20) NOT NULL,
  `coID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `studentviewco`
--

INSERT INTO `studentviewco` (`stateView`, `coID`) VALUES
('yes', 'ITT051022020'),
('yes', 'ITT051012020'),
('no', 'ITT061022020');

-- --------------------------------------------------------

--
-- Table structure for table `tmessageh`
--

CREATE TABLE `tmessageh` (
  `id` int(11) NOT NULL,
  `messageB` varchar(50) NOT NULL,
  `messageH` varchar(350) NOT NULL,
  `status` varchar(7) NOT NULL,
  `employeeID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmessages`
--

CREATE TABLE `tmessages` (
  `id` int(11) NOT NULL,
  `messageB` varchar(50) NOT NULL,
  `messageH` varchar(350) NOT NULL,
  `status` varchar(7) NOT NULL,
  `regno` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`courseID`),
  ADD KEY `depertmentID` (`depertmentID`,`employeeID`),
  ADD KEY `course_ibfk_2` (`employeeID`);

--
-- Indexes for table `courseprogram`
--
ALTER TABLE `courseprogram`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courseID` (`courseID`),
  ADD KEY `programID` (`programID`);

--
-- Indexes for table `coursework`
--
ALTER TABLE `coursework`
  ADD PRIMARY KEY (`id`),
  ADD KEY `regno` (`regno`),
  ADD KEY `coursework_ibfk_3` (`courseID`),
  ADD KEY `coID` (`coID`) USING BTREE;

--
-- Indexes for table `courseworkstate`
--
ALTER TABLE `courseworkstate`
  ADD KEY `courseworkstate_ibfk_1` (`coID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`depertmentID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeID`),
  ADD KEY `statusid` (`email`,`depertmentID`),
  ADD KEY `depertmentID` (`depertmentID`);

--
-- Indexes for table `hmessager`
--
ALTER TABLE `hmessager`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hmessager_ibfk_1` (`employeeID`);

--
-- Indexes for table `hmessages`
--
ALTER TABLE `hmessages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hmessages_ibfk_1` (`regno`);

--
-- Indexes for table `hmessaget`
--
ALTER TABLE `hmessaget`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hmessaget_ibfk_1` (`employeeID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `loginst`
--
ALTER TABLE `loginst`
  ADD PRIMARY KEY (`OID`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `loginstate`
--
ALTER TABLE `loginstate`
  ADD PRIMARY KEY (`loginID`),
  ADD KEY `loginState_ibfk_1` (`email`);

--
-- Indexes for table `pmessageh`
--
ALTER TABLE `pmessageh`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employID` (`employID`);

--
-- Indexes for table `pmessager`
--
ALTER TABLE `pmessager`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employID` (`employID`);

--
-- Indexes for table `pmessaget`
--
ALTER TABLE `pmessaget`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employID` (`employeeID`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`programID`),
  ADD KEY `c` (`depertmentID`);

--
-- Indexes for table `regstate`
--
ALTER TABLE `regstate`
  ADD PRIMARY KEY (`regID`),
  ADD KEY `regno` (`regno`,`seID`),
  ADD KEY `seID` (`seID`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courseID` (`courseID`,`regno`),
  ADD KEY `regno` (`regno`);

--
-- Indexes for table `resultstate`
--
ALTER TABLE `resultstate`
  ADD PRIMARY KEY (`reID`);

--
-- Indexes for table `rmessageh`
--
ALTER TABLE `rmessageh`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rmessageh_ibfk_1` (`employeeID`);

--
-- Indexes for table `rmessages`
--
ALTER TABLE `rmessages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rmessages_ibfk_1` (`regno`);

--
-- Indexes for table `rmessaget`
--
ALTER TABLE `rmessaget`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employID` (`employeeID`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`sID`),
  ADD KEY `semester_ibfk_1` (`courseID`);

--
-- Indexes for table `semisterstate`
--
ALTER TABLE `semisterstate`
  ADD PRIMARY KEY (`seID`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`statusID`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`regno`),
  ADD KEY `depertmentID` (`depertmentID`,`programID`,`email`),
  ADD KEY `ph1` (`programID`),
  ADD KEY `ph2` (`email`);

--
-- Indexes for table `studentviewco`
--
ALTER TABLE `studentviewco`
  ADD KEY `coID` (`coID`);

--
-- Indexes for table `tmessageh`
--
ALTER TABLE `tmessageh`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tmessageh_ibfk_1` (`employeeID`);

--
-- Indexes for table `tmessages`
--
ALTER TABLE `tmessages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tmessages_ibfk_1` (`regno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courseprogram`
--
ALTER TABLE `courseprogram`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `coursework`
--
ALTER TABLE `coursework`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `hmessager`
--
ALTER TABLE `hmessager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hmessages`
--
ALTER TABLE `hmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hmessaget`
--
ALTER TABLE `hmessaget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loginst`
--
ALTER TABLE `loginst`
  MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `loginstate`
--
ALTER TABLE `loginstate`
  MODIFY `loginID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pmessageh`
--
ALTER TABLE `pmessageh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pmessager`
--
ALTER TABLE `pmessager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pmessaget`
--
ALTER TABLE `pmessaget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `regstate`
--
ALTER TABLE `regstate`
  MODIFY `regID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `rmessageh`
--
ALTER TABLE `rmessageh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rmessages`
--
ALTER TABLE `rmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rmessaget`
--
ALTER TABLE `rmessaget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `sID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `statusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=391;

--
-- AUTO_INCREMENT for table `tmessageh`
--
ALTER TABLE `tmessageh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmessages`
--
ALTER TABLE `tmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_2` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `course_ibfk_3` FOREIGN KEY (`depertmentID`) REFERENCES `department` (`depertmentID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `courseprogram`
--
ALTER TABLE `courseprogram`
  ADD CONSTRAINT `courseprogram_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `courseprogram_ibfk_2` FOREIGN KEY (`programID`) REFERENCES `program` (`programID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coursework`
--
ALTER TABLE `coursework`
  ADD CONSTRAINT `coursework_ibfk_2` FOREIGN KEY (`regno`) REFERENCES `student` (`regno`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coursework_ibfk_3` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courseworkstate`
--
ALTER TABLE `courseworkstate`
  ADD CONSTRAINT `courseworkstate_ibfk_1` FOREIGN KEY (`coID`) REFERENCES `coursework` (`coID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`depertmentID`) REFERENCES `department` (`depertmentID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`email`) REFERENCES `login` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hmessager`
--
ALTER TABLE `hmessager`
  ADD CONSTRAINT `hmessager_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hmessages`
--
ALTER TABLE `hmessages`
  ADD CONSTRAINT `hmessages_ibfk_1` FOREIGN KEY (`regno`) REFERENCES `student` (`regno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hmessaget`
--
ALTER TABLE `hmessaget`
  ADD CONSTRAINT `hmessaget_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `loginst`
--
ALTER TABLE `loginst`
  ADD CONSTRAINT `loginST_ibfk_1` FOREIGN KEY (`email`) REFERENCES `login` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `loginstate`
--
ALTER TABLE `loginstate`
  ADD CONSTRAINT `loginState_ibfk_1` FOREIGN KEY (`email`) REFERENCES `login` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pmessageh`
--
ALTER TABLE `pmessageh`
  ADD CONSTRAINT `pmessageh_ibfk_1` FOREIGN KEY (`employID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pmessager`
--
ALTER TABLE `pmessager`
  ADD CONSTRAINT `pmessager_ibfk_1` FOREIGN KEY (`employID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pmessaget`
--
ALTER TABLE `pmessaget`
  ADD CONSTRAINT `pmessaget_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `program`
--
ALTER TABLE `program`
  ADD CONSTRAINT `c` FOREIGN KEY (`depertmentID`) REFERENCES `department` (`depertmentID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `regstate`
--
ALTER TABLE `regstate`
  ADD CONSTRAINT `regState_ibfk_1` FOREIGN KEY (`regno`) REFERENCES `student` (`regno`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `regState_ibfk_2` FOREIGN KEY (`seID`) REFERENCES `semisterstate` (`seID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`regno`) REFERENCES `student` (`regno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rmessageh`
--
ALTER TABLE `rmessageh`
  ADD CONSTRAINT `rmessageh_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `status_ibfk_1` FOREIGN KEY (`email`) REFERENCES `login` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`email`) REFERENCES `login` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`programID`) REFERENCES `program` (`programID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `studentviewco`
--
ALTER TABLE `studentviewco`
  ADD CONSTRAINT `studentviewco_ibfk_1` FOREIGN KEY (`coID`) REFERENCES `coursework` (`coID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
