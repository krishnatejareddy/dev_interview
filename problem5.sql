-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 13, 2016 at 09:42 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shredz_task`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
`cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `product_id`, `product_quantity`, `added_on`) VALUES
(1, 1, 2, 6, '2016-03-12 22:36:19'),
(2, 1, 3, 9, '2016-03-12 22:36:19');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`cat_id` int(11) NOT NULL,
  `cat_name` varchar(11) NOT NULL,
  `is_in_use` int(11) NOT NULL DEFAULT '1',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `is_in_use`, `added_on`) VALUES
(1, 'Men', 1, '2016-03-12 22:53:10'),
(2, 'Women', 1, '2016-03-12 22:53:16');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
`order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_confirmation` text NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_quantity` int(11) NOT NULL,
  `price_whileordering` double NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_confirmation`, `product_id`, `order_quantity`, `price_whileordering`, `order_date`) VALUES
(1, 1, '00SFSR36536CS', 2, 6, 29.99, '2016-03-13 21:38:42'),
(2, 1, '00SFSR36536CS', 3, 9, 24.99, '2016-03-13 21:38:42');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
`id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `product_name` text NOT NULL,
  `product_desc` text NOT NULL,
  `product_sku` text NOT NULL,
  `product_price_per_unit` double NOT NULL,
  `product_isin_stock` tinyint(1) NOT NULL,
  `product_posted_on` datetime NOT NULL,
  `product_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `product_recent_purchased_on` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `cat_id`, `product_name`, `product_desc`, `product_sku`, `product_price_per_unit`, `product_isin_stock`, `product_posted_on`, `product_updated_on`, `product_recent_purchased_on`) VALUES
(1, 1, '30 DAY QUICK WEIGHT LOSS', 'The SHREDZ® 30 Day Quick Weight Loss* Results Plan + Supplements for her™ is an innovative solution designed specifically for women who are looking to Lose weight*, revitalize their body, and stand out at the same time with exercises, detailed guides, and supplements. The 30 Day Weight Loss* Plan for Her™ is also accompanied by our thermogenic SHREDZ® BURNER formulated for women, our TONER with patented ingredients, our maximum strength DETOX, our workout intensifying BCAA + Glutamine supplement, and comes with a FREE Transformation Guide for Her. The Accelerated 30 Day Weight Loss* Plan also comes with our delicious Thermogenic Protein Made for Women', 'DOTD-30DFM-DBPNKS', 175, 45, '2016-03-10 00:00:00', '2016-03-12 22:34:53', '0000-00-00 00:00:00'),
(2, 1, 'PROTEIN BARS - FOR MEN', 'Take it anywhere, eat it anytime! The Shredz Protein Bar is a naturally flavored, on-the-go meal that can help you reach your daily macronutrient goals and sustain your energy level. It’s got a baked, soft cookie center and tastes too good to be this healthy!The Shredz bar provides quality protein, complex carbohydrate and healthy fats to support your body’s nutritional needs while satisfying your cravings!', 'CORE-PBCD', 29.99, 39, '2016-03-12 04:20:32', '2016-03-12 22:34:20', '0000-00-00 00:00:00'),
(3, 2, 'PROTEIN BARS - FOR WOMEN\r\n', 'Take it anywhere, eat it anytime! The Shredz Protein Bar is a naturally flavored, on-the-go meal that can help you reach your daily macronutrient goals and sustain your energy level. It’s got a baked, soft cookie center and tastes too good to be this healthy!The Shredz bar provides quality protein, complex carbohydrate and healthy fats to support your body’s nutritional needs while satisfying your cravings!', 'MFW-PBCD', 24.99, 25, '2016-03-12 04:20:32', '2016-03-12 22:34:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`user_id` int(11) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `user_name` text NOT NULL,
  `user_email` varchar(11) NOT NULL,
  `user_created_on` datetime NOT NULL,
  `user_last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `is_admin`, `user_name`, `user_email`, `user_created_on`, `user_last_login`) VALUES
(1, 0, 'krishna', 'krishna.mon', '2016-03-11 05:36:23', '2016-03-12 22:23:50'),
(2, 1, 'Travis', 'travis@shre', '2016-03-12 06:19:11', '2016-03-12 22:55:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
 ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
