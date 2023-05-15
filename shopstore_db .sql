-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2023 at 02:45 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopstore_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `id_address` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `id_address`) VALUES
(1, 'diana', 'diana', 2),
(34, 'catalin', 'catalin', 79),
(69, 'Dana', 'dana@gigi.com', 1),
(79, 'vlad', 'vlad', 79),
(456, 'gigi', 'gigi', 45);

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `id` int(11) NOT NULL,
  `country` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `street` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`id`, `country`, `city`, `street`) VALUES
(1, 'romania', 'bucuresti', 'gheorghe manea '),
(2, 'romania', 'braila', 'morii'),
(45, 'romania', 'galati', 'calea brailei'),
(79, 'romania', 'bucharest', 'masina de paine');

-- --------------------------------------------------------

--
-- Table structure for table `producators`
--

CREATE TABLE `producators` (
  `id` int(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `birth_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `producators`
--

INSERT INTO `producators` (`id`, `name`, `email`, `birth_date`) VALUES
(1, 'MILWAUKE', 'milwuajke.ro@email.com', '2023-05-04'),
(2, 'MAKITA', 'makita.ro@email.com', '2013-05-02'),
(3, 'HITACHI', 'hitachi.ro@email.com', '2023-05-04'),
(4, 'PARKSIDE', 'parkside.ro@emial.ro', '2016-05-04'),
(5, 'BOSCH', 'bosch.ro@gmail.com', '2013-05-01'),
(6, 'UNIOR', 'unior.ro@emial.ro', '2000-05-20');

-- --------------------------------------------------------

--
-- Table structure for table `producators_products`
--

CREATE TABLE `producators_products` (
  `isbn_product` varchar(30) NOT NULL,
  `id_authors` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `producators_products`
--

INSERT INTO `producators_products` (`isbn_product`, `id_authors`) VALUES
('10', 4),
('333', 1),
('333', 4),
('34', 1),
('34', 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `isbn` varchar(30) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` float NOT NULL,
  `title` varchar(50) NOT NULL,
  `publish_date` date DEFAULT NULL,
  `box` enum('PLASTIC','POLYSTYRENE','ABS') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`isbn`, `stock`, `price`, `title`, `publish_date`, `box`) VALUES
('10', 1, 350, 'autofiletanta cu acumulator', '2020-05-05', 'ABS'),
('111', 5, 19, 'lopata', '2020-05-14', 'POLYSTYRENE'),
('12', 82, 300, 'polizor unghiular', '2020-05-01', 'PLASTIC'),
('222', 29, 343, 'palan', '2022-01-20', 'PLASTIC'),
('245', 20, 34565, 'picamer', '2001-01-20', 'ABS'),
('333', 5, 70, 'vibrator de cofraj', '2023-02-20', 'POLYSTYRENE'),
('34', 3, 345, 'bormasina', '2020-06-20', 'PLASTIC'),
('345', 9, 34, 'galeats', '2023-03-20', 'ABS');

-- --------------------------------------------------------

--
-- Table structure for table `shopping_carts`
--

CREATE TABLE `shopping_carts` (
  `id` bigint(20) NOT NULL,
  `client_id` int(11) NOT NULL,
  `last_edited` datetime NOT NULL,
  `status` enum('OPEN','CANCELLED','COMPLETED') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shopping_carts`
--

INSERT INTO `shopping_carts` (`id`, `client_id`, `last_edited`, `status`) VALUES
(1683921974190, 1, '2023-05-12 23:06:14', 'OPEN'),
(1683924706958, 69, '2023-05-12 23:51:46', 'OPEN'),
(1684087867123, 79, '2023-05-14 21:11:07', 'OPEN'),
(1684149483925, 34, '2023-05-15 14:18:03', 'OPEN');

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart_items`
--

CREATE TABLE `shopping_cart_items` (
  `isbn_product` varchar(30) NOT NULL,
  `id_shopping_cart` bigint(20) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shopping_cart_items`
--

INSERT INTO `shopping_cart_items` (`isbn_product`, `id_shopping_cart`, `quantity`) VALUES
('10', 1684087867123, 14),
('12', 1684149483925, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_customers_customer_address` (`id_address`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `producators`
--
ALTER TABLE `producators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `producators_products`
--
ALTER TABLE `producators_products`
  ADD PRIMARY KEY (`isbn_product`,`id_authors`),
  ADD KEY `fk_auth_book_authors` (`id_authors`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`isbn`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `shopping_carts`
--
ALTER TABLE `shopping_carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_id` (`client_id`);

--
-- Indexes for table `shopping_cart_items`
--
ALTER TABLE `shopping_cart_items`
  ADD PRIMARY KEY (`isbn_product`,`id_shopping_cart`),
  ADD KEY `fk_sci_sc` (`id_shopping_cart`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=457;

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `producators`
--
ALTER TABLE `producators`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_customers_customer_address` FOREIGN KEY (`id_address`) REFERENCES `customer_address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `producators_products`
--
ALTER TABLE `producators_products`
  ADD CONSTRAINT `fk_auth_book_authors` FOREIGN KEY (`id_authors`) REFERENCES `producators` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_auth_book_books` FOREIGN KEY (`isbn_product`) REFERENCES `products` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shopping_carts`
--
ALTER TABLE `shopping_carts`
  ADD CONSTRAINT `fk_shopping_carts_customers` FOREIGN KEY (`client_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shopping_cart_items`
--
ALTER TABLE `shopping_cart_items`
  ADD CONSTRAINT `fk_sci_products` FOREIGN KEY (`isbn_product`) REFERENCES `products` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sci_sc` FOREIGN KEY (`id_shopping_cart`) REFERENCES `shopping_carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
