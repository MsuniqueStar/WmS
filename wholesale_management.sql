-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 06, 2018 at 01:23 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wholesale_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(30) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryName`) VALUES
(1, 'Washing Powder'),
(2, 'Cosmetics'),
(3, 'Stationary'),
(4, 'Garments');

-- --------------------------------------------------------

--
-- Table structure for table `command`
--

CREATE TABLE IF NOT EXISTS `command` (
  `id` int(11) NOT NULL,
  `id_prouit` int(11) NOT NULL,
  `quantity` int(100) NOT NULL,
  `dat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(100) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `command`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_information`
--

CREATE TABLE IF NOT EXISTS `customer_information` (
  `CustomerID` varchar(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Password` varchar(15) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_information`
--

INSERT INTO `customer_information` (`CustomerID`, `Name`, `Address`, `Phone`, `Password`) VALUES
('C11', 'admin', 'ujire', '7901012908', 'admin'),
('C12', 'Ananya', 'NR PURA', '7901012908', '123'),
('C13', 'Athmika', 'XWR', '7077102278', '123'),
('C14', 'Ashika', 'bg', '9456765456', 'ashika'),
('C15', 'Rama', 'sagar', '9564567876', 'rama'),
('C16', 'anu', 'ujire', '97646489', 'anu');

-- --------------------------------------------------------

--
-- Table structure for table `depleted_product`
--

CREATE TABLE IF NOT EXISTS `depleted_product` (
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depleted_product`
--

INSERT INTO `depleted_product` (`ProductID`, `Quantity`) VALUES
(56, 30);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `TransactionID` int(11) NOT NULL,
  `Amount_Paid` int(11) NOT NULL,
  `Mode` varchar(30) NOT NULL,
  `Transaction_Date` int(11) NOT NULL,
  PRIMARY KEY (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`TransactionID`, `Amount_Paid`, `Mode`, `Transaction_Date`) VALUES
(22, 7770, 'debit card', 2018),
(25, 10000, 'cash', 2018),
(27, 4700, 'cash', 2017),
(28, 1500, 'debit card', 2018),
(29, 8000, 'Debit Card', 2018),
(31, 2500, 'cash', 2018),
(34, 0, '', 2018);

-- --------------------------------------------------------

--
-- Table structure for table `picture`
--

CREATE TABLE IF NOT EXISTS `picture` (
  `ProductID` int(11) NOT NULL,
  `picture` varchar(20) NOT NULL,
  UNIQUE KEY `ProductID` (`ProductID`),
  UNIQUE KEY `ProductID_2` (`ProductID`),
  KEY `ProductID_3` (`ProductID`),
  KEY `ProductID_4` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `picture`
--

INSERT INTO `picture` (`ProductID`, `picture`) VALUES
(1, '2.jpg'),
(2, '1.JPG'),
(4, '6.png'),
(6, '3.png');

-- --------------------------------------------------------

--
-- Table structure for table `price_list`
--

CREATE TABLE IF NOT EXISTS `price_list` (
  `ProductID` int(11) NOT NULL,
  `USP` int(11) NOT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `price_list`
--

INSERT INTO `price_list` (`ProductID`, `USP`) VALUES
(0, 550),
(1, 70),
(2, 100),
(3, 55),
(4, 150),
(5, 300),
(6, 120),
(7, 150),
(12, 15),
(13, 0),
(33, 2),
(45, 0),
(54, 50),
(55, 44),
(56, 200),
(999, 77);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `ProductID` int(11) NOT NULL,
  `Pname` varchar(30) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  `Quantity_in_stock` int(11) NOT NULL,
  `UnitPrice` int(11) NOT NULL,
  `ReorderLevel` int(11) NOT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `product_ibfk_2` (`CategoryID`),
  KEY `product_ibfk_3` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `Pname`, `CategoryID`, `SupplierID`, `Quantity_in_stock`, `UnitPrice`, `ReorderLevel`) VALUES
(1, 'Nirma', 1, 1, 30, 500, 10),
(2, 'Surf', 1, 1, 85, 70, 10),
(3, 'Pond Powder', 2, 2, 65, 40, 10),
(4, 'Garnier Cream', 2, 2, 105, 110, 8),
(5, 'Parker Pen', 3, 2, 130, 250, 10),
(6, 'straightner', 1, 2, 60, 10, 10);

--
-- Triggers `product`
--
DROP TRIGGER IF EXISTS `supplier_check`;
DELIMITER //
CREATE TRIGGER `supplier_check` BEFORE INSERT ON `product`
 FOR EACH ROW BEGIN
Declare finished integer default 0;
Declare cust varchar(30);
declare flag integer default 0;
Declare c1 cursor for select supplierID from supplier_information;
DECLARE CONTINUE HANDLER 
FOR NOT FOUND SET finished = 1;

if NEW.Quantity_in_stock < NEW.ReorderLevel THEN
insert into depleted_product(ProductID,Quantity) values(NEW.ProductID, NEW.Quantity_in_stock);
end if;

open c1;
get_cust: LOOP
Fetch c1 into cust;
if finished=1 then 
leave get_cust; 
end if;
if cust=NEW.SupplierID then 
set flag=1;
end if;
end loop get_cust;
close c1;
if flag=0 then
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Supplier does not exist';
END if;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `depleted_check_update`;
DELIMITER //
CREATE TRIGGER `depleted_check_update` BEFORE UPDATE ON `product`
 FOR EACH ROW BEGIN
Declare finished integer default 0;
Declare cust varchar(30);
declare flag integer default 0;
Declare c1 cursor for select ProductID from depleted_product;
DECLARE CONTINUE HANDLER 
FOR NOT FOUND SET finished = 1;

if NEW.Quantity_in_stock < NEW.ReorderLevel THEN
insert into depleted_product(ProductID,Quantity) values(NEW.ProductID,NEW.Quantity_in_stock);


else
open c1;
get_cust: LOOP
Fetch c1 into cust;
if finished=1 then 
leave get_cust; 
end if;
if cust=NEW.ProductID then 
set finished=1;
set flag=1;
end if;
end loop get_cust;
close c1;
if flag=1 then
Delete from depleted_product where ProductID=NEW.ProductID;
END if;
end if;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_information`
--

CREATE TABLE IF NOT EXISTS `supplier_information` (
  `SupplierID` int(11) NOT NULL,
  `SName` varchar(30) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_information`
--

INSERT INTO `supplier_information` (`SupplierID`, `SName`, `Address`, `Phone`) VALUES
(1, 'Ramesh kumar', 'Ujire', '9876543210'),
(2, 'Rajkumar', 'dharmastala', '987654329 ');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_detail`
--

CREATE TABLE IF NOT EXISTS `transaction_detail` (
  `TransactionID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Discount` int(11) NOT NULL DEFAULT '0',
  `Total_Amount` int(11) NOT NULL,
  `Trans_Init_Date` date NOT NULL,
  PRIMARY KEY (`TransactionID`,`ProductID`),
  KEY `td_ibfk_2` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_detail`
--

INSERT INTO `transaction_detail` (`TransactionID`, `ProductID`, `Quantity`, `Discount`, `Total_Amount`, `Trans_Init_Date`) VALUES
(22, 1, 20, 0, 1400, '2016-11-17'),
(22, 2, 30, 0, 3000, '2016-11-17'),
(25, 3, 20, 0, 1100, '2016-11-17'),
(25, 4, 20, 0, 3000, '2016-11-17'),
(27, 1, 20, 0, 1400, '2016-11-15'),
(27, 2, 20, 0, 2000, '2016-11-15'),
(27, 3, 20, 0, 1100, '2016-11-15'),
(28, 4, 10, 0, 1500, '2016-11-16'),
(29, 2, 20, 0, 2000, '2018-11-29'),
(29, 5, 20, 0, 6000, '2018-11-29'),
(31, 1, 20, 0, 1400, '2018-11-30'),
(31, 3, 20, 0, 1100, '2018-11-30'),
(34, 1, 20, 0, 1400, '2018-12-06');

--
-- Triggers `transaction_detail`
--
DROP TRIGGER IF EXISTS `max_min_quantity`;
DELIMITER //
CREATE TRIGGER `max_min_quantity` BEFORE INSERT ON `transaction_detail`
 FOR EACH ROW BEGIN
declare var1 int;
declare var2 int;
select ReorderLevel into var1 from Product where ProductID = NEW.ProductID;
select Quantity_in_stock into var2 from Product where ProductID = NEW.ProductID;
if new.Quantity<var1 THEN
   signal sqlstate '45000' set message_text = 'Less than min quantity';
end if;
if new.Quantity>var2 THEN
   signal sqlstate '45000' set message_text = 'More than max quantity';
end if;
update product set Quantity_in_stock = Quantity_in_stock - NEW.Quantity where ProductID = NEW.ProductID;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `max_min_quantity_update`;
DELIMITER //
CREATE TRIGGER `max_min_quantity_update` BEFORE UPDATE ON `transaction_detail`
 FOR EACH ROW BEGIN
declare var1 int;
declare var2 int;

select ReorderLevel into var1 from Product where ProductID = NEW.ProductID;
select Quantity_in_stock into var2 from Product where ProductID = NEW.ProductID;
if new.Quantity<var1 THEN
   signal sqlstate '45000' set message_text = 'Less than min quantity';
end if;
if new.Quantity>var2 THEN
   signal sqlstate '45000' set message_text = 'More than max quantity';
end if;
update product set Quantity_in_stock = Quantity_in_stock - NEW.Quantity where ProductID=NEW.ProductID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_information`
--

CREATE TABLE IF NOT EXISTS `transaction_information` (
  `TransactionID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` varchar(30) NOT NULL,
  `Trans_Init_Date` date NOT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `ti_ibfk_1` (`CustomerID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `transaction_information`
--

INSERT INTO `transaction_information` (`TransactionID`, `CustomerID`, `Trans_Init_Date`) VALUES
(22, 'C12', '2018-01-03'),
(25, 'C11', '2016-11-17'),
(27, 'C13', '2016-11-15'),
(28, 'C13', '2016-11-16'),
(29, 'C15', '2018-11-29'),
(31, 'C16', '2018-11-30'),
(34, 'C12', '2018-12-06'),
(35, 'C12', '2018-11-06');

--
-- Triggers `transaction_information`
--
DROP TRIGGER IF EXISTS `customer_check`;
DELIMITER //
CREATE TRIGGER `customer_check` BEFORE INSERT ON `transaction_information`
 FOR EACH ROW BEGIN
Declare finished integer default 0;
Declare cust varchar(30);
declare flag integer default 0;
Declare c1 cursor for select customerID from customer_information;
DECLARE CONTINUE HANDLER 
FOR NOT FOUND SET finished = 1;
open c1;
get_cust: LOOP
Fetch c1 into cust;
if finished=1 then 
leave get_cust; 
end if;
if cust=NEW.CustomerID then 
set flag=1;
end if;
end loop get_cust;
close c1;
if flag=0 then
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Customer does not exist';
END if;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `customer_check_update`;
DELIMITER //
CREATE TRIGGER `customer_check_update` BEFORE UPDATE ON `transaction_information`
 FOR EACH ROW BEGIN
Declare finished integer default 0;
Declare cust varchar(30);
declare flag integer default 0;
Declare c1 cursor for select customerID from customer_information;
DECLARE CONTINUE HANDLER 
FOR NOT FOUND SET finished = 1;
open c1;
get_cust: LOOP
Fetch c1 into cust;
if finished=1 then 
leave get_cust; 
end if;
if cust=NEW.CustomerID then 
set flag=1;
end if;
end loop get_cust;
close c1;
if flag=0 then
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Customer does not exist';
END if;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `decrease_quantity`;
DELIMITER //
CREATE TRIGGER `decrease_quantity` BEFORE DELETE ON `transaction_information`
 FOR EACH ROW BEGIN

Declare finished integer default 0;
Declare cust integer;
Declare quant integer default 0;
Declare c1 cursor for select ProductID from transaction_detail where TransactionID=OLD.TransactionID;
DECLARE CONTINUE HANDLER 
FOR NOT FOUND SET finished = 1;

CREATE TEMPORARY TABLE IF NOT EXISTS my_temp_table
SELECT ProductID, Quantity from transaction_detail where TransactionID=OLD.TransactionID;
open c1;
get_cust: LOOP
Fetch c1 into cust;
if finished=1 then 
leave get_cust; 
end if;
Select Quantity into quant from my_temp_table where ProductID=cust; 
Update Product set quantity_in_stock=quantity_in_stock+quant where ProductID=cust;
end loop;
close c1;
Delete from transaction_detail where transactionID=OLD.TransactionID;
END
//
DELIMITER ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`SupplierID`) REFERENCES `supplier_information` (`SupplierID`);

--
-- Constraints for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD CONSTRAINT `td_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `transaction_information`
--
ALTER TABLE `transaction_information`
  ADD CONSTRAINT `ti_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer_information` (`CustomerID`);
