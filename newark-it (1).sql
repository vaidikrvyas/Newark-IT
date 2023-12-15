-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2023 at 03:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newark-it`
--

-- --------------------------------------------------------

--
-- Table structure for table `appears_in`
--

CREATE TABLE `appears_in` (
  `BID` int(11) NOT NULL,
  `PID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `PriceSold` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appears_in`
--

INSERT INTO `appears_in` (`BID`, `PID`, `Quantity`, `PriceSold`) VALUES
(1, 101, 2, 500.00),
(2, 102, 1, 800.00),
(3, 103, 3, 1200.00),
(4, 101, 1, 600.00),
(5, 102, 2, 950.00),
(6, 103, 1, 1200.00),
(7, 101, 3, 1350.00),
(8, 102, 1, 800.00),
(9, 103, 2, 2000.00),
(10, 101, 2, 900.00),
(11, 102, 3, 1200.00),
(12, 103, 1, 1000.00),
(13, 101, 1, 500.00),
(15, 101, 5, 10.00),
(16, 101, 1, 10.00),
(17, 101, 1, 10.00);

--
-- Triggers `appears_in`
--
DELIMITER $$
CREATE TRIGGER `decrease_quantity_after_appear` AFTER INSERT ON `appears_in` FOR EACH ROW BEGIN
    DECLARE product_quantity INT;
    
    -- Get the current quantity from the product table
    SELECT PQuantity INTO product_quantity
    FROM product
    WHERE PID = NEW.PID;

    -- Decrease the product quantity based on the inserted quantity in appears_in
    UPDATE product
    SET PQuantity = product_quantity - NEW.Quantity
    WHERE PID = NEW.PID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `basket`
--

CREATE TABLE `basket` (
  `BID` int(11) NOT NULL,
  `CID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `basket`
--

INSERT INTO `basket` (`BID`, `CID`) VALUES
(14, 12120),
(15, 12120),
(16, 12120),
(17, 12120),
(1, 38494),
(4, 38500),
(7, 38700),
(10, 38900),
(13, 39100),
(2, 64900),
(5, 64910),
(8, 65100),
(11, 65200),
(3, 68482),
(6, 68500),
(9, 68800),
(12, 69000);

-- --------------------------------------------------------

--
-- Table structure for table `computer`
--

CREATE TABLE `computer` (
  `PID` int(11) NOT NULL,
  `CPUType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `computer`
--

INSERT INTO `computer` (`PID`, `CPUType`) VALUES
(101, 'Intel Core i7'),
(103, 'AMD Ryzen 5');

-- --------------------------------------------------------

--
-- Table structure for table `credit_card`
--

CREATE TABLE `credit_card` (
  `CCNumber` varchar(255) NOT NULL,
  `SecNumber` varchar(255) NOT NULL,
  `OwnerName` varchar(255) NOT NULL,
  `CCType` varchar(255) NOT NULL,
  `BilAddress` varchar(255) NOT NULL,
  `ExpDate` date NOT NULL,
  `StoredCardCID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `credit_card`
--

INSERT INTO `credit_card` (`CCNumber`, `SecNumber`, `OwnerName`, `CCType`, `BilAddress`, `ExpDate`, `StoredCardCID`) VALUES
('1111222233334444', '123', 'John Doe', 'Visa', '123 Main St', '2023-12-31', 38494),
('1111222233335555', '456', 'Alice Johnson', 'Visa', '456 Oak St', '2024-05-31', 38500),
('1111222233336666', '234', 'David Miller', 'Visa', '202 Cedar St', '2024-11-30', 38700),
('1111222233337777', '345', 'Emma Harris', 'Visa', '505 Birch St', '2024-09-30', 38900),
('1111222233338888', '123', 'Jackson Martin', 'Visa', '808 Cedar St', '2025-05-31', 39100),
('4377489624259984', '602', 'Jane Smith', 'Visa', '323 Dr Martin Luther King Jr Blvd', '2023-12-30', 38494),
('4555444477889', '206', 'Vaidik Vyas', 'Mastercard', '20 Timberhill Driv', '2023-12-16', 12120),
('5555666677771111', '567', 'Sophia Davis', 'Mastercard', '303 Maple St', '2023-06-15', 65100),
('5555666677772222', '678', 'Oliver Lee', 'Mastercard', '606 Pine St', '2023-04-15', 65200),
('5555666677778888', '456', 'Jane Smith', 'Mastercard', '456 Oak St', '2024-06-30', 64900),
('5555666677779999', '789', 'Charlie Brown', 'Mastercard', '789 Pine St', '2025-08-30', 64910),
('62132132151351', '3212', 'Vaidik', 'Visa', '20 timberhill', '2023-12-28', 18731),
('9999888877772222', '890', 'James White', 'Amex', '404 Walnut St', '2025-02-28', 68800),
('9999888877773333', '901', 'Lily Anderson', 'Amex', '707 Oak St', '2022-12-31', 69000),
('9999888877774444', '012', 'Eva Williams', 'Amex', '101 Elm St', '2026-01-15', 68500),
('9999888877776666', '789', 'Bob Johnson', 'Amex', '789 Pine St', '2025-01-15', 68482);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CID` int(11) NOT NULL DEFAULT current_timestamp(),
  `FName` varchar(255) NOT NULL,
  `LName` varchar(255) NOT NULL,
  `EMail` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Password` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CID`, `FName`, `LName`, `EMail`, `Address`, `Phone`, `Status`, `Password`) VALUES
(12120, 'Vaidik', 'Vyas', 'vv466@njit.edu', '323 Dr Martin Luther King Jr Blvd', '9087204629', NULL, 'vaidik123'),
(18731, 'Vaidik', 'Vyas', 'vaidik@gmail.com', '323 Dr Martin Luther King Jr Blvd', '9876543210', NULL, 'abc'),
(37928, 'Vaidik', 'Vyas', 'vyasvaidik20@gmail.com', '323 Dr Martin Luther King Jr Blvd', '9087204629', NULL, '$2y$10$SOMI3DdG4'),
(38494, 'Jane', 'Smith', 'jane.smith@example.com', '456 Oak St', '5555678', 'Silver', 'js123'),
(38500, 'Alice', 'Johnson', 'alice.johnson@example.com', '456 Oak St', '555-2345', 'Gold', 'aj123'),
(38700, 'David', 'Miller', 'david.miller@example.com', '202 Cedar St', '555-5678', 'Silver', 'dm123'),
(38900, 'Emma', 'Harris', 'emma.harris@example.com', '505 Birch St', '555-8901', 'Silver', 'eh123'),
(39100, 'Jackson', 'Martin', 'jackson.martin@example.com', '808 Cedar St', '555-1234', 'Silver', 'jm123'),
(58153, 'Dhir', 'Patel', 'dp123@gmail.com', '36 kearny jersey city', '5554446622', NULL, 'dp456'),
(64900, 'John', 'Doe', 'john.doe@example.com', '123 Main St', '5551234', 'Gold', 'jd123'),
(64910, 'Charlie', 'Brown', 'charlie.brown@example.com', '789 Pine St', '555-3456', 'Silver', 'cb123'),
(65100, 'Sophia', 'Davis', 'sophia.davis@example.com', '303 Maple St', '555-6789', 'Gold', 'sd123'),
(65200, 'Oliver', 'Lee', 'oliver.lee@example.com', '606 Pine St', '555-9012', 'Gold', 'ol123'),
(68482, 'Bob', 'Johnson', 'bob.johnson@example.com', '789 Pine St', '5559012', 'Platinum', 'bj123'),
(68500, 'Eva', 'Williams', 'eva.williams@example.com', '101 Elm St', '555-4567', 'Platinum', 'ew123'),
(68800, 'James', 'White', 'james.white@example.com', '404 Walnut St', '555-7890', 'Platinum', 'jw123'),
(69000, 'Lily', 'Anderson', 'lily.anderson@example.com', '707 Oak St', '555-0123', 'Platinum', 'la123');

-- --------------------------------------------------------

--
-- Table structure for table `laptop`
--

CREATE TABLE `laptop` (
  `PID` int(11) NOT NULL,
  `BType` varchar(255) NOT NULL,
  `Weight` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laptop`
--

INSERT INTO `laptop` (`PID`, `BType`, `Weight`) VALUES
(101, 'Ultrabook', 2.50),
(103, 'Tower', 10.00);

-- --------------------------------------------------------

--
-- Stand-in structure for view `mostselling_q3`
-- (See below for the actual view)
--
CREATE TABLE `mostselling_q3` (
`PID` int(11)
,`PName` varchar(255)
,`count(a.PID)` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `offer_product`
--

CREATE TABLE `offer_product` (
  `PID` int(11) NOT NULL,
  `OfferPrice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `offer_product`
--

INSERT INTO `offer_product` (`PID`, `OfferPrice`) VALUES
(101, 450.00),
(102, 750.00),
(103, 1100.00);

-- --------------------------------------------------------

--
-- Table structure for table `printer`
--

CREATE TABLE `printer` (
  `PID` int(11) NOT NULL,
  `PrinterType` varchar(255) NOT NULL,
  `Resolution` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `printer`
--

INSERT INTO `printer` (`PID`, `PrinterType`, `Resolution`) VALUES
(102, 'Inkjet', '1200x1200 DPI');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `PID` int(11) NOT NULL,
  `PType` varchar(255) NOT NULL,
  `PName` varchar(255) NOT NULL,
  `PPrice` decimal(10,2) NOT NULL,
  `Description` text DEFAULT NULL,
  `PQuantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`PID`, `PType`, `PName`, `PPrice`, `Description`, `PQuantity`) VALUES
(101, 'Laptop', 'Laptop Model X', 600.00, 'High-performance laptop', 3),
(102, 'Printer', 'Inkjet Printer', 900.00, 'Color inkjet printer', 5),
(103, 'Computer', 'Desktop Computer', 1000.00, 'Powerful desktop computer', 8);

-- --------------------------------------------------------

--
-- Stand-in structure for view `q1`
-- (See below for the actual view)
--
CREATE TABLE `q1` (
`CCNumber` varchar(255)
,`total_amount` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `q2`
-- (See below for the actual view)
--
CREATE TABLE `q2` (
`CID` int(11)
,`FName` varchar(255)
,`LName` varchar(255)
,`total_spent` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `q4`
-- (See below for the actual view)
--
CREATE TABLE `q4` (
`PID` int(11)
,`PName` varchar(255)
,`NumberofCustomer` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `q5`
-- (See below for the actual view)
--
CREATE TABLE `q5` (
`CCNumber` varchar(255)
,`MaxBasketTotalAmount` decimal(42,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `q6`
-- (See below for the actual view)
--
CREATE TABLE `q6` (
`PType` varchar(255)
,`AVG(a.PriceSold)` decimal(14,6)
);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_address`
--

CREATE TABLE `shipping_address` (
  `CID` int(11) NOT NULL,
  `SAName` varchar(255) NOT NULL,
  `RecipientName` varchar(255) NOT NULL,
  `Street` varchar(255) NOT NULL,
  `SNumber` varchar(10) NOT NULL,
  `City` varchar(255) NOT NULL,
  `Zip` varchar(20) NOT NULL,
  `State` varchar(255) NOT NULL,
  `Country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipping_address`
--

INSERT INTO `shipping_address` (`CID`, `SAName`, `RecipientName`, `Street`, `SNumber`, `City`, `Zip`, `State`, `Country`) VALUES
(38494, 'Home', 'John Doe', '123 Main St', 'Apt 4B', 'Cityville', '12345', 'CA', 'USA'),
(38500, 'Home', 'Alice Johnson', '456 Oak St', 'Apt 5C', 'Cityville', '12345', 'CA', 'USA'),
(38700, 'Home', 'David Miller', '202 Cedar St', 'Apt 6B', 'Villagetown', '23456', 'CA', 'USA'),
(38900, 'Home', 'Emma Harris', '505 Birch St', 'Apt 3D', 'Towndale', '56789', 'CA', 'USA'),
(39100, 'Home', 'Jackson Martin', '808 Cedar St', 'Apt 7A', 'Cityville', '89012', 'CA', 'USA'),
(64900, 'Work', 'Jane Smith', '456 Oak St', 'Suite 301', 'Townsville', '56789', 'NY', 'USA'),
(64910, 'Work', 'Charlie Brown', '789 Pine St', 'Suite 302', 'Townsville', '56789', 'NY', 'USA'),
(65100, 'Work', 'Sophia Davis', '303 Maple St', 'Suite 202', 'Cityburgh', '34567', 'NY', 'USA'),
(65200, 'Work', 'Oliver Lee', '606 Pine St', 'Suite 105', 'Citytown', '67890', 'NY', 'USA'),
(68482, 'Office', 'Bob Johnson', '789 Pine St', 'Floor 10', 'Metropolis', '98765', 'TX', 'USA'),
(68500, 'Office', 'Eva Williams', '101 Elm St', 'Floor 15', 'Metropolis', '98765', 'TX', 'USA'),
(68800, 'Office', 'James White', '404 Walnut St', 'Floor 5', 'Metroville', '45678', 'TX', 'USA'),
(69000, 'Office', 'Lily Anderson', '707 Oak St', 'Floor 20', 'Central City', '78901', 'TX', 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `silver_and_above`
--

CREATE TABLE `silver_and_above` (
  `CID` int(11) NOT NULL,
  `CreditLine` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `silver_and_above`
--

INSERT INTO `silver_and_above` (`CID`, `CreditLine`) VALUES
(38494, 1000.00),
(38500, 1500.00),
(38700, 1200.00),
(38900, 2000.00),
(39100, 3500.00),
(64900, 2000.00),
(64910, 2500.00),
(65100, 1800.00),
(65200, 3000.00),
(68482, 5000.00),
(68500, 6000.00),
(68800, 4500.00),
(69000, 7000.00);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `BID` int(11) NOT NULL,
  `CCNumber` varchar(255) NOT NULL,
  `CID` int(11) NOT NULL,
  `SAName` varchar(255) NOT NULL,
  `TDate` date DEFAULT NULL,
  `TTag` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`BID`, `CCNumber`, `CID`, `SAName`, `TDate`, `TTag`) VALUES
(1, '1111222233334444', 38494, 'Home', '2023-12-17', 'Purchase'),
(2, '5555666677778888', 64900, 'Work', '2024-01-04', 'Purchase'),
(3, '9999888877776666', 68482, 'Office', '2023-12-21', 'Purchase'),
(4, '1111222233335555', 38500, 'Home', '2024-01-12', 'Purchase'),
(5, '5555666677779999', 64910, 'Work', '2023-12-15', 'Purchase'),
(6, '9999888877774444', 68500, 'Office', '2023-12-20', 'Purchase'),
(7, '1111222233336666', 38700, 'Home', '2024-01-12', 'Purchase'),
(8, '5555666677771111', 65100, 'Work', '2023-12-23', 'Purchase'),
(9, '9999888877772222', 68800, 'Office', '2023-12-29', 'Purchase'),
(10, '1111222233337777', 38900, 'Home', '2024-01-05', 'Purchase'),
(11, '5555666677772222', 65200, 'Work', '2023-12-18', 'Purchase'),
(12, '9999888877773333', 69000, 'Office', '2023-12-28', 'Purchase'),
(13, '1111222233338888', 39100, 'Home', '2024-01-10', 'Purchase');

-- --------------------------------------------------------

--
-- Structure for view `mostselling_q3`
--
DROP TABLE IF EXISTS `mostselling_q3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mostselling_q3`  AS SELECT `a`.`PID` AS `PID`, `p`.`PName` AS `PName`, count(`a`.`PID`) AS `count(a.PID)` FROM (((`transaction` `t` join `basket` `b`) join `appears_in` `a`) join `product` `p`) WHERE `t`.`BID` = `b`.`BID` AND `a`.`BID` = `b`.`BID` AND `p`.`PID` = `a`.`PID` AND `t`.`TDate` between '2022-01-01' and '2025-01-01' GROUP BY `p`.`PName`, `a`.`PID` ORDER BY count(`a`.`PID`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `q1`
--
DROP TABLE IF EXISTS `q1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `q1`  AS SELECT `c`.`CCNumber` AS `CCNumber`, sum(`o`.`PriceSold`) AS `total_amount` FROM ((`credit_card` `c` join `basket` `b` on(`c`.`StoredCardCID` = `b`.`CID`)) join `appears_in` `o` on(`b`.`BID` = `o`.`BID`)) GROUP BY `c`.`CCNumber` ;

-- --------------------------------------------------------

--
-- Structure for view `q2`
--
DROP TABLE IF EXISTS `q2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `q2`  AS SELECT `c`.`CID` AS `CID`, `c`.`FName` AS `FName`, `c`.`LName` AS `LName`, sum(`o`.`PriceSold`) AS `total_spent` FROM ((`customer` `c` join `basket` `b` on(`c`.`CID` = `b`.`CID`)) join `appears_in` `o` on(`b`.`BID` = `o`.`BID`)) GROUP BY `c`.`CID`, `c`.`FName`, `c`.`LName` ORDER BY sum(`o`.`PriceSold`) DESC LIMIT 0, 10 ;

-- --------------------------------------------------------

--
-- Structure for view `q4`
--
DROP TABLE IF EXISTS `q4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `q4`  AS SELECT `a`.`PID` AS `PID`, `p`.`PName` AS `PName`, count(distinct `t`.`CID`) AS `NumberofCustomer` FROM (((`transaction` `t` join `basket` `b`) join `appears_in` `a`) join `product` `p`) WHERE `t`.`BID` = `b`.`BID` AND `a`.`BID` = `b`.`BID` AND `p`.`PID` = `a`.`PID` AND `t`.`TDate` between '2022-01-01' and '2025-01-01' GROUP BY `p`.`PName`, `a`.`PID` ORDER BY count(distinct `t`.`CID`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `q5`
--
DROP TABLE IF EXISTS `q5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `q5`  AS SELECT `subquery`.`CCNumber` AS `CCNumber`, max(`subquery`.`totalAmount`) AS `MaxBasketTotalAmount` FROM (select `t`.`CCNumber` AS `CCNumber`,sum(`a`.`PriceSold` * `a`.`Quantity`) AS `totalAmount` from ((`transaction` `t` join `basket` `b` on(`t`.`BID` = `b`.`BID`)) join `appears_in` `a` on(`a`.`BID` = `b`.`BID`)) where `t`.`TDate` between '2022-10-10' and '2024-10-10' group by `t`.`CCNumber`,`b`.`BID`) AS `subquery` GROUP BY `subquery`.`CCNumber` ;

-- --------------------------------------------------------

--
-- Structure for view `q6`
--
DROP TABLE IF EXISTS `q6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `q6`  AS SELECT `p`.`PType` AS `PType`, avg(`a`.`PriceSold`) AS `AVG(a.PriceSold)` FROM (((`transaction` `t` join `basket` `b`) join `appears_in` `a`) join `product` `p`) WHERE `t`.`BID` = `b`.`BID` AND `a`.`BID` = `b`.`BID` AND `p`.`PID` = `a`.`PID` AND `t`.`TDate` between '2022-01-01' and '2025-01-01' GROUP BY `p`.`PType` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appears_in`
--
ALTER TABLE `appears_in`
  ADD PRIMARY KEY (`BID`,`PID`),
  ADD KEY `PID` (`PID`);

--
-- Indexes for table `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`BID`),
  ADD KEY `CID` (`CID`);

--
-- Indexes for table `computer`
--
ALTER TABLE `computer`
  ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `credit_card`
--
ALTER TABLE `credit_card`
  ADD PRIMARY KEY (`CCNumber`),
  ADD KEY `StoredCardCID` (`StoredCardCID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CID`);

--
-- Indexes for table `laptop`
--
ALTER TABLE `laptop`
  ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `offer_product`
--
ALTER TABLE `offer_product`
  ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `printer`
--
ALTER TABLE `printer`
  ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `shipping_address`
--
ALTER TABLE `shipping_address`
  ADD PRIMARY KEY (`CID`,`SAName`);

--
-- Indexes for table `silver_and_above`
--
ALTER TABLE `silver_and_above`
  ADD PRIMARY KEY (`CID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`BID`,`CCNumber`,`CID`,`SAName`),
  ADD KEY `CID` (`CID`,`SAName`),
  ADD KEY `CCNumber` (`CCNumber`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appears_in`
--
ALTER TABLE `appears_in`
  ADD CONSTRAINT `appears_in_ibfk_1` FOREIGN KEY (`BID`) REFERENCES `basket` (`BID`),
  ADD CONSTRAINT `appears_in_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `product` (`PID`);

--
-- Constraints for table `basket`
--
ALTER TABLE `basket`
  ADD CONSTRAINT `basket_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`);

--
-- Constraints for table `computer`
--
ALTER TABLE `computer`
  ADD CONSTRAINT `computer_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `product` (`PID`);

--
-- Constraints for table `credit_card`
--
ALTER TABLE `credit_card`
  ADD CONSTRAINT `credit_card_ibfk_1` FOREIGN KEY (`StoredCardCID`) REFERENCES `customer` (`CID`);

--
-- Constraints for table `laptop`
--
ALTER TABLE `laptop`
  ADD CONSTRAINT `laptop_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `product` (`PID`);

--
-- Constraints for table `offer_product`
--
ALTER TABLE `offer_product`
  ADD CONSTRAINT `offer_product_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `product` (`PID`);

--
-- Constraints for table `printer`
--
ALTER TABLE `printer`
  ADD CONSTRAINT `printer_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `product` (`PID`);

--
-- Constraints for table `shipping_address`
--
ALTER TABLE `shipping_address`
  ADD CONSTRAINT `shipping_address_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`);

--
-- Constraints for table `silver_and_above`
--
ALTER TABLE `silver_and_above`
  ADD CONSTRAINT `silver_and_above_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`CID`,`SAName`) REFERENCES `shipping_address` (`CID`, `SAName`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`CCNumber`) REFERENCES `credit_card` (`CCNumber`),
  ADD CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`BID`) REFERENCES `basket` (`BID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
