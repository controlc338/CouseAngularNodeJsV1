-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 14, 2019 at 11:07 AM
-- Server version: 5.5.62-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `admin_crystaltest3`
--

-- --------------------------------------------------------

--
-- Table structure for table `adjust_stock_log`
--

CREATE TABLE IF NOT EXISTS `adjust_stock_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `status` enum('use','remove') NOT NULL DEFAULT 'use',
  `approve_date` datetime DEFAULT NULL,
  `doc_code` varchar(100) DEFAULT NULL COMMENT 'เลขเอกสาร',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `adjust_stock_log_detail`
--

CREATE TABLE IF NOT EXISTS `adjust_stock_log_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `qty_before` double(15,4) NOT NULL,
  `qty_after` double(15,4) NOT NULL,
  `adjust_stock_log_id` int(11) NOT NULL,
  `qty_approve` double(15,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `adjust_stock_log_temp`
--

CREATE TABLE IF NOT EXISTS `adjust_stock_log_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `qty_before` double(15,4) NOT NULL,
  `qty_after` double(15,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `backgrounds`
--

CREATE TABLE IF NOT EXISTS `backgrounds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `background_default` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `barcode_config`
--

CREATE TABLE IF NOT EXISTS `barcode_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode_width` double(15,4) NOT NULL COMMENT 'ขนาด',
  `barcode_height` double(15,4) NOT NULL COMMENT 'ความสูง',
  `cols` int(11) NOT NULL COMMENT 'à¸ˆà¸³à¸™à¸§à¸™ à¸„à¸­à¸¥à¸±à¸¡à¸™à¹Œ',
  `rows` int(11) NOT NULL COMMENT 'à¸ˆà¸³à¸™à¸§à¸™à¹à¸–à¸§',
  `font_size` int(11) NOT NULL COMMENT 'à¸‚à¸™à¸²à¸”à¸•à¸±à¸§à¸­à¸±à¸à¸©à¸£',
  `alignment` enum('left','center','right') DEFAULT 'left' COMMENT 'à¸•à¸³à¹à¸«à¸™à¹ˆà¸‡à¸­à¸±à¸à¸©à¸£',
  `paper` enum('A4','A5','custom') DEFAULT 'A4' COMMENT 'à¸£à¸¹à¸›à¹à¸šà¸šà¸à¸£à¸°à¸”à¸²à¸©',
  `a4_oriendtation` varchar(50) DEFAULT NULL COMMENT 'à¹à¸™à¸§à¸™à¸­à¸™ à¹à¸™à¸§à¸•à¸±à¹‰à¸‡',
  `a5_oriendtation` varchar(50) DEFAULT NULL COMMENT 'à¹à¸™à¸§à¸™à¸­à¸™ à¹à¸™à¸§à¸•à¸±à¹‰à¸‡',
  `paper_width` int(11) DEFAULT NULL COMMENT 'à¸„à¸§à¸²à¸¡à¸à¸§à¹‰à¸²à¸‡à¸à¸£à¸°à¸”à¸²à¸©',
  `paper_height` int(11) DEFAULT NULL COMMENT 'à¸„à¸§à¸²à¸¡à¸ªà¸¹à¸‡à¸à¸£à¸°à¸”à¸²à¸©',
  `show_product_name` enum('yes','no') DEFAULT 'yes' COMMENT 'à¹à¸ªà¸”à¸‡à¸Šà¸·à¹ˆà¸­à¸ªà¸´à¸™à¸„à¹‰à¸²',
  `show_product_price` enum('yes','no') DEFAULT 'yes' COMMENT 'à¹à¸ªà¸”à¸‡à¸£à¸²à¸„à¸²à¸ªà¸´à¸™à¸„à¹‰à¸²',
  `show_product_price_send` enum('yes','no') DEFAULT 'yes' COMMENT 'à¹à¸ªà¸”à¸‡à¸£à¸²à¸„à¸²à¸ªà¹ˆà¸‡',
  `paper_landscape` varchar(2) DEFAULT '' COMMENT 'à¸à¸£à¸°à¸”à¸²à¸© à¹à¸™à¸§à¸™à¸­à¸™ à¹à¸™à¸§à¸•à¸±à¹‰à¸‡',
  `barcode_rotate` enum('horizontal','vertical') DEFAULT 'horizontal' COMMENT 'à¸£à¸¹à¸›à¹à¸šà¸šà¸à¸²à¸£à¸žà¸´à¸¡à¸žà¹Œà¸šà¸²à¸£à¹Œà¹‚à¸„à¹‰à¸”',
  `barcode_type` varchar(20) DEFAULT NULL COMMENT 'à¸›à¸£à¸°à¹€à¸ à¸— barcode',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `barcode_config`
--

INSERT INTO `barcode_config` (`id`, `barcode_width`, `barcode_height`, `cols`, `rows`, `font_size`, `alignment`, `paper`, `a4_oriendtation`, `a5_oriendtation`, `paper_width`, `paper_height`, `show_product_name`, `show_product_price`, `show_product_price_send`, `paper_landscape`, `barcode_rotate`, `barcode_type`) VALUES
(2, 0.5000, 1.0000, 10, 3, 9, 'center', 'A5', NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'p', 'horizontal', 'C39');

-- --------------------------------------------------------

--
-- Table structure for table `barcode_prices`
--

CREATE TABLE IF NOT EXISTS `barcode_prices` (
  `barcode` varchar(50) NOT NULL,
  `price` double(15,4) NOT NULL DEFAULT '0.0000',
  `name` varchar(255) DEFAULT NULL,
  `qty_sub_stock` int(5) NOT NULL DEFAULT '1',
  `barcode_fk` varchar(50) NOT NULL,
  `price_before` int(6) DEFAULT NULL COMMENT 'à¸£à¸²à¸„à¸²à¸—à¸¸à¸™',
  PRIMARY KEY (`barcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bill_format`
--

CREATE TABLE IF NOT EXISTS `bill_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_name` varchar(255) NOT NULL COMMENT 'ชนิดเอกสาร',
  `text1` varchar(10) NOT NULL COMMENT 'ช่องที่ 1',
  `text2` varchar(10) NOT NULL COMMENT 'ช่องที่ 2',
  `text3` varchar(10) NOT NULL COMMENT 'ช่องที่ 3',
  `text4` varchar(10) NOT NULL COMMENT 'ช่องที่ 4',
  `text5` varchar(10) NOT NULL COMMENT 'ช่องที่ 5',
  `text6` varchar(10) NOT NULL COMMENT 'ช่องที่ 6',
  `bill_code` varchar(50) NOT NULL DEFAULT 'all_bill',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `bill_format`
--

INSERT INTO `bill_format` (`id`, `bill_name`, `text1`, `text2`, `text3`, `text4`, `text5`, `text6`, `bill_code`) VALUES
(1, 'ใบเสร็จรับเงิน/ใบกำกับภาษี/ใบส่งสินค้า', 'INV-', 'Y', 'm', 'd', '####', '', 'all_bill'),
(2, 'ใบเบิกสินค้า', 'REQ-', 'Y', 'm', 'd', '####', '', 'req'),
(3, 'ใบรับสินค้า', 'RECV-', 'Y', 'm', '', '######', '', 'receive'),
(4, 'ใบโอนสินค้า', 'TRAN-', 'Y', 'm', 'd', '######', '', 'transfer'),
(5, 'ใบตรวจสอบยอดสินค้า', 'ADJ-', 'Y', 'm', 'd', '####', '', 'adj'),
(6, 'ใบวางบิล', 'BL-', 'Y', 'm', '', '###', '', 'drop_bill');

-- --------------------------------------------------------

--
-- Table structure for table `bill_pending`
--

CREATE TABLE IF NOT EXISTS `bill_pending` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_name` varchar(100) NOT NULL COMMENT 'ชื่อบิล',
  `branch_id` int(11) NOT NULL COMMENT 'รหัสสาขา',
  `channel_id` int(11) NOT NULL COMMENT 'รหัสช่องทางจำหน่าย',
  `member_id` int(11) DEFAULT NULL COMMENT 'รหัสลูกค้า',
  `sale_condition` varchar(50) NOT NULL COMMENT 'รูปแบบการขาย',
  `user_id` int(11) NOT NULL COMMENT 'รหัสผู้ขาย',
  `status` enum('pending','success','remove','delete') NOT NULL DEFAULT 'pending',
  `bill_sale_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bill_pending_detail`
--

CREATE TABLE IF NOT EXISTS `bill_pending_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(100) NOT NULL,
  `qty` double(15,4) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `bill_pending_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bill_running`
--

CREATE TABLE IF NOT EXISTS `bill_running` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_name` varchar(255) NOT NULL COMMENT 'ชนิดเอกสาร',
  `running_to` varchar(10) NOT NULL COMMENT 'ลำดับ',
  `running_month` int(2) NOT NULL COMMENT 'เดือน',
  `channel_id` int(11) DEFAULT NULL COMMENT 'รหัสช่องทางจำหน่าย',
  `branch_id` int(11) DEFAULT NULL COMMENT 'รหัสสาขา',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_image`
--

CREATE TABLE IF NOT EXISTS `catalog_image` (
  `catalog_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_image_name` varchar(255) DEFAULT NULL COMMENT 'ชื่อรูปภาพ',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'หมายเหตุ',
  `created_at` datetime DEFAULT NULL COMMENT 'วันที่บันทึก',
  `status` enum('use','delete') NOT NULL DEFAULT 'use' COMMENT 'สถานะการใช้งาน',
  `user_id` int(11) NOT NULL COMMENT 'ผู้บันทึก',
  PRIMARY KEY (`catalog_image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_register`
--

CREATE TABLE IF NOT EXISTS `catalog_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `market_id` text,
  `market_lv` text,
  `member_sex` text,
  `member_status` text,
  `member_rank` text,
  `member_name_th` text,
  `member_last_th` text,
  `member_name_eg` text,
  `member_last_eg` text,
  `member_card_id` text,
  `member_day` text,
  `member_month` text,
  `member_year` text,
  `m_add` text,
  `m_swine` text,
  `m_canton` text,
  `m_district` text,
  `m_province` text,
  `m_postcode` text,
  `m_tel` text,
  `m_email` text,
  `m_line` text,
  `ad_name` text,
  `ad_last` text,
  `ad_id` text,
  `ad_status` text,
  `parent_name` text,
  `bk_name` text,
  `bk_member` text,
  `bk_number` text,
  `rg_day` text,
  `rg_month` text,
  `rg_year` text,
  `rg_status` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `channel`
--

CREATE TABLE IF NOT EXISTS `channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'ชื่อช่องทางการจำหน่าย ภาษาไทย',
  `name_lao` varchar(255) DEFAULT NULL COMMENT 'ชื่อช่องทางการจำหน่าย ภาษาลาว',
  `name_eng` varchar(255) DEFAULT NULL COMMENT 'ชื่อช่องทางการจำหน่าย ภาษาอังกฤษ',
  `print_bill` varchar(255) NOT NULL DEFAULT '' COMMENT 'บิลที่ต้องการพิมพ์ เมื่อจบการขาย',
  `sale_condition` enum('one','many') NOT NULL DEFAULT 'one' COMMENT 'รูปแบบการขาย',
  `use_delimiter` enum('no','yes') NOT NULL DEFAULT 'yes' COMMENT 'ใช้ทศนิยมหรือไม่',
  `pay_type` enum('cash','credit') NOT NULL DEFAULT 'cash' COMMENT 'รูปแบบการชำระ',
  `channel_code` varchar(5) DEFAULT NULL COMMENT 'โค้ด ช่องทาง',
  `status` enum('use','delete') NOT NULL DEFAULT 'use',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `channel`
--

INSERT INTO `channel` (`id`, `name`, `name_lao`, `name_eng`, `print_bill`, `sale_condition`, `use_delimiter`, `pay_type`, `channel_code`, `status`) VALUES
(1, 'ขายหน้าร้าน', '-', '-', 'slip', 'one', 'yes', 'cash', NULL, 'use');

-- --------------------------------------------------------

--
-- Table structure for table `config_software`
--

CREATE TABLE IF NOT EXISTS `config_software` (
  `id` int(5) NOT NULL,
  `alert_min_stock` int(3) NOT NULL DEFAULT '1' COMMENT 'à¸ˆà¸³à¸™à¸§à¸™à¸„à¸‡à¹€à¸«à¸¥à¸·à¸­à¸•à¹ˆà¸³à¸ªà¸¸à¸”',
  `bill_slip_title` varchar(250) NOT NULL COMMENT 'à¸«à¸±à¸§à¸šà¸´à¸¥ à¸ªà¸ªà¸¥à¸´à¸›à¸à¸²à¸£à¸‚à¸²à¸¢',
  `bill_send_title` varchar(255) NOT NULL COMMENT 'à¸«à¸±à¸§à¸šà¸´à¸¥ à¹ƒà¸šà¸ªà¹ˆà¸‡à¸ªà¸´à¸™à¸„à¹‰à¸²',
  `bill_vat_title` varchar(255) NOT NULL COMMENT 'à¸«à¸±à¸§à¸šà¸´à¸¥ à¹ƒà¸šà¸à¸³à¸à¸±à¸šà¸ à¸²à¸©à¸µ',
  `bill_sale_title` varchar(255) NOT NULL COMMENT 'à¸«à¸±à¸§à¸šà¸´à¸¥ à¹ƒà¸šà¹€à¸ªà¸£à¹‡à¸ˆà¸£à¸±à¸šà¹€à¸‡à¸´à¸™',
  `bill_drop_title` varchar(255) NOT NULL COMMENT 'à¸«à¸±à¸§à¸šà¸´à¸¥ à¹ƒà¸šà¸§à¸²à¸‡à¸šà¸´à¸¥',
  `items_per_page` int(3) NOT NULL DEFAULT '10',
  `bill_slip_footer` text,
  `bill_send_footer` text,
  `bill_vat_footer` text,
  `bill_sale_footer` text,
  `bill_drop_footer` text,
  `score` int(3) DEFAULT NULL COMMENT 'à¸à¸µà¹ˆà¸šà¸²à¸—à¹€à¸›à¹‡à¸™ 1 à¹à¸•à¹‰à¸¡',
  `count_hour` int(11) DEFAULT NULL COMMENT 'à¸„à¹ˆà¸²à¸Šà¸±à¹ˆà¸§à¹‚à¸¡à¸‡',
  `sale_can_edit_price` enum('no','yes') DEFAULT 'no' COMMENT 'à¹ƒà¸«à¹‰à¹à¸„à¸Šà¹€à¸Šà¸µà¸¢à¸£à¹Œ à¹à¸à¹‰à¹„à¸‚à¸£à¸²à¸„à¸²à¸‚à¸²à¸¢à¹„à¸”à¹‰',
  `sale_can_add_sub_price` enum('no','yes') DEFAULT 'no' COMMENT 'à¹ƒà¸«à¹‰à¹à¸„à¸Šà¹€à¸Šà¸µà¸¢à¸£à¹Œ à¸„à¸´à¸”à¸ªà¹ˆà¸§à¸™à¸¥à¸”à¹„à¸”à¹‰',
  `sale_out_of_stock` enum('no','yes') DEFAULT 'no' COMMENT 'à¸‚à¸²à¸¢à¸ªà¸´à¸™à¸„à¹‰à¸²à¸«à¸¡à¸”à¸ªà¸•à¹‡à¸­à¸„à¹„à¸”à¹‰',
  `discount_per_record` enum('no','yes') NOT NULL DEFAULT 'no',
  `serial_port` varchar(10) NOT NULL DEFAULT 'COM1' COMMENT 'Serial PORT',
  `print_slip_after_end_sale` enum('no','yes') NOT NULL DEFAULT 'no' COMMENT 'พิมพ์สลิป หลังจบการขาย',
  `print_bill_after_end_sale` enum('no','yes') NOT NULL DEFAULT 'no' COMMENT 'พิมพ์ bill หลังจบการขาย',
  `bill_slip_title_lao` varchar(255) DEFAULT NULL COMMENT 'หัวบิล สลิป ภาษาลาว',
  `bill_slip_footer_lao` varchar(255) DEFAULT NULL COMMENT 'ด้านล่างของใบสลิป ภาษาลาว',
  `bill_send_title_lao` varchar(255) DEFAULT NULL COMMENT 'ใบส่งสินค้า ภาษาลาว',
  `bill_send_footer_lao` varchar(255) DEFAULT NULL COMMENT 'ท้ายใบส่งสินค้า ภาษาลาว',
  `bill_vat_title_lao` varchar(255) DEFAULT NULL COMMENT 'ใบกำกับภาษี ภาษาลาว',
  `bill_vat_footer_lao` varchar(255) DEFAULT NULL COMMENT 'ท้ายใบกำกับภาษี ภาษาลาว',
  `bill_sale_title_lao` varchar(255) DEFAULT NULL COMMENT 'ใบเสร็จ ภาษาลาว',
  `bill_sale_footer_lao` varchar(255) DEFAULT NULL COMMENT 'ท้ายใบเสร็จ ภาษาลาว',
  `bill_drop_title_lao` varchar(255) DEFAULT NULL COMMENT 'ใบวางบิล ภาษาลาว',
  `bill_drop_footer_lao` varchar(255) DEFAULT NULL COMMENT 'ท้ายใบวางบิล ภาษาลาว',
  `bill_slip_title_eng` varchar(255) DEFAULT NULL COMMENT 'ใบสลิป ภาษาอังกฤษ',
  `bill_slip_footer_eng` varchar(255) DEFAULT NULL COMMENT 'ท้ายใบสลิป ภาษาอังกฤษ',
  `bill_send_title_eng` varchar(255) DEFAULT NULL COMMENT 'ใบส่งสินค้า ภาษาอังกฤษ',
  `bill_send_footer_eng` varchar(255) DEFAULT NULL COMMENT 'ท้ายใบส่งสินค้า ภาษาอังกฤษ',
  `bill_vat_title_eng` varchar(255) DEFAULT NULL COMMENT 'ใบกำกับภาษี ภาษาอังกฤษ',
  `bill_vat_footer_eng` varchar(255) DEFAULT NULL COMMENT 'ท้ายใบกำกับภาษี ภาษาอังกฤษ',
  `bill_sale_title_eng` varchar(255) DEFAULT NULL COMMENT 'ใบเสร็จ ภาษาอังกฤษ',
  `bill_sale_footer_eng` varchar(255) DEFAULT NULL COMMENT 'ท้ายใบเสร็จ ภาษาอังกฤษ',
  `bill_drop_title_eng` varchar(255) DEFAULT NULL COMMENT 'ใบวางบิล ภาษาอังกฤษ',
  `bill_drop_footer_eng` varchar(255) DEFAULT NULL COMMENT 'ท้ายใบวางบิล ภาษาอังกฤษ',
  `use_sale_step` enum('no','yes') NOT NULL DEFAULT 'no' COMMENT 'เปิดใช้การขายแบบลำดับ',
  `sale_limit_of_stock` enum('no','yes') NOT NULL DEFAULT 'no' COMMENT 'ขายสินค้าหมดสต๊อค',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config_software`
--

INSERT INTO `config_software` (`id`, `alert_min_stock`, `bill_slip_title`, `bill_send_title`, `bill_vat_title`, `bill_sale_title`, `bill_drop_title`, `items_per_page`, `bill_slip_footer`, `bill_send_footer`, `bill_vat_footer`, `bill_sale_footer`, `bill_drop_footer`, `score`, `count_hour`, `sale_can_edit_price`, `sale_can_add_sub_price`, `sale_out_of_stock`, `discount_per_record`, `serial_port`, `print_slip_after_end_sale`, `print_bill_after_end_sale`, `bill_slip_title_lao`, `bill_slip_footer_lao`, `bill_send_title_lao`, `bill_send_footer_lao`, `bill_vat_title_lao`, `bill_vat_footer_lao`, `bill_sale_title_lao`, `bill_sale_footer_lao`, `bill_drop_title_lao`, `bill_drop_footer_lao`, `bill_slip_title_eng`, `bill_slip_footer_eng`, `bill_send_title_eng`, `bill_send_footer_eng`, `bill_vat_title_eng`, `bill_vat_footer_eng`, `bill_sale_title_eng`, `bill_sale_footer_eng`, `bill_drop_title_eng`, `bill_drop_footer_eng`, `use_sale_step`, `sale_limit_of_stock`) VALUES
(1, 20, 'ใบเสร็จรับเงิน', 'ใบส่งสินค้า', 'ใบกำกับภาษี', 'ใบเสร็จรับเงิน', 'ใบวางบิล', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'no', 'COM1', 'no', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `drawcash_logs`
--

CREATE TABLE IF NOT EXISTS `drawcash_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draw_date` datetime DEFAULT NULL,
  `draw_price` double(15,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(30) DEFAULT 'use',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

-- --------------------------------------------------------

--
-- Table structure for table `drop_bill_log`
--

CREATE TABLE IF NOT EXISTS `drop_bill_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_code` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `drop_bill_log_detail`
--

CREATE TABLE IF NOT EXISTS `drop_bill_log_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drop_bill_id` int(11) NOT NULL,
  `bill_sale_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exchange`
--

CREATE TABLE IF NOT EXISTS `exchange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thai_baht` double(15,4) DEFAULT NULL COMMENT 'เงินไทย',
  `lao_kip` double(15,4) DEFAULT NULL COMMENT 'เงินลาว',
  `dollar_us` double(15,4) DEFAULT NULL COMMENT 'เงินดอลล่า',
  `money_name` varchar(255) NOT NULL DEFAULT 'kip' COMMENT 'ชื่อหน่วยเงิน ประเทศที่ 3',
  `status` enum('on','off') DEFAULT 'on' COMMENT 'สถานะใช้อัตราการแปลกเปลี่ยน',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exchange`
--

INSERT INTO `exchange` (`id`, `thai_baht`, `lao_kip`, `dollar_us`, `money_name`, `status`) VALUES
(1, 35.0000, 8050.0000, 1.0000, 'kip', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `icommerce_bill_sale`
--

CREATE TABLE IF NOT EXISTS `icommerce_bill_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL COMMENT 'วันที่สั่งซื้อ',
  `customer_name` varchar(255) NOT NULL COMMENT 'ชื่อลูกค้า',
  `customer_tel` varchar(255) NOT NULL COMMENT 'เบอร์โทร',
  `customer_address` varchar(255) NOT NULL COMMENT 'ที่อยู่ในการจัดส่ง',
  `bill_sale_status` varchar(20) NOT NULL COMMENT 'สถานะบิล',
  `track_code` varchar(255) NOT NULL COMMENT 'รหัสติดตาม',
  `pay_date` date DEFAULT NULL COMMENT 'วันที่ชำระเงิน',
  `send_date` date DEFAULT NULL COMMENT 'วันที่จัดส่ง',
  `pack_date` date DEFAULT NULL COMMENT 'วันที่แพกสินค้า',
  `bill_remark` varchar(1000) DEFAULT NULL COMMENT 'หมายเหตุบิล',
  `microtime` varchar(255) NOT NULL COMMENT 'เสี้ยววินาทีในการสั่งซื้อ เพื่อไม่ให้ซ้ำกัน',
  `rancomcode` varchar(255) NOT NULL COMMENT 'รหัสตอนสั่งซื้อ เพื่อไม่ให้ซ้ำกัน',
  `confirm_date` date DEFAULT NULL COMMENT 'รหัสตอนสั่งซื้อ เพื่อไม่ให้ซ้ำกัน',
  `send_price` int(5) DEFAULT NULL COMMENT 'ค่าจัดส่ง',
  `inv_code` varchar(30) DEFAULT NULL COMMENT 'invoice code',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `icommerce_bill_sale_detail`
--

CREATE TABLE IF NOT EXISTS `icommerce_bill_sale_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icommerce_bill_sale_id` int(11) NOT NULL COMMENT 'รหัสบิล',
  `product_id` int(11) NOT NULL COMMENT 'รหัสสินค้า',
  `product_price` int(11) NOT NULL COMMENT 'ราคา',
  `qty` int(11) NOT NULL COMMENT 'จำนวนซื้อ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ir_pay_log`
--

CREATE TABLE IF NOT EXISTS `ir_pay_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farmer_id` int(11) NOT NULL,
  `bill_import_code` varchar(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `bill_no` varchar(50) NOT NULL,
  `drop_bill_no` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `keep_data`
--

CREATE TABLE IF NOT EXISTS `keep_data` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `bill_id` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `keep_data`
--

INSERT INTO `keep_data` (`id`, `bill_id`) VALUES
(1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `log_score_of_member`
--

CREATE TABLE IF NOT EXISTS `log_score_of_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT 'รหัสสมาชิก',
  `score` double(15,4) NOT NULL COMMENT 'จำนวนแต้ม',
  `topic` varchar(1000) NOT NULL COMMENT 'หัวข้อ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `member_group`
--

CREATE TABLE IF NOT EXISTS `member_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'ชื่อภาษาไทย',
  `name_lao` varchar(255) DEFAULT NULL COMMENT 'ชื่อภาษาลาว',
  `name_eng` varchar(255) DEFAULT NULL COMMENT 'ชื่อภาษาอังกฤษ',
  `reduce_percen` int(2) NOT NULL DEFAULT '0' COMMENT 'ส่วนลด x %',
  `status` enum('use','delete') NOT NULL DEFAULT 'use',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mod_running_bill_format`
--

CREATE TABLE IF NOT EXISTS `mod_running_bill_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_name` varchar(255) DEFAULT NULL COMMENT 'ชนิดเอกสาร',
  `foreword_name` varchar(10) DEFAULT NULL COMMENT 'คำนำหน้า',
  `text1` varchar(10) DEFAULT NULL COMMENT 'ช่องที่ 1',
  `text2` varchar(10) DEFAULT NULL COMMENT 'ช่องที่ 2',
  `text3` varchar(10) DEFAULT NULL COMMENT 'ช่องที่ 3',
  `text4` varchar(10) DEFAULT NULL COMMENT 'ช่องที่ 4',
  `text5` varchar(10) DEFAULT NULL COMMENT 'ช่องที่ 5',
  `bill_code` varchar(50) DEFAULT NULL COMMENT 'ชื่อรหัสบิล',
  `vat_split` enum('no','yes') NOT NULL DEFAULT 'no' COMMENT 'แยกแวท',
  `inv_split` enum('no','yes') NOT NULL DEFAULT 'no' COMMENT 'รันเลขบิลรวมกัน',
  `status` enum('use','delete') NOT NULL DEFAULT 'use' COMMENT 'สถานะการใช้งาน',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mod_running_bill_format`
--

INSERT INTO `mod_running_bill_format` (`id`, `bill_name`, `foreword_name`, `text1`, `text2`, `text3`, `text4`, `text5`, `bill_code`, `vat_split`, `inv_split`, `status`) VALUES
(1, 'ใบเสร็จรับเงิน', 'INV', 'y', 'm', 'd', '######', NULL, 'receipt', 'no', 'no', 'delete'),
(2, 'ใบเสร็จรับเงิน (ย่อ)', 'INVS', 'y', 'm', 'd', '######', NULL, 'receipt_short', 'no', 'no', 'delete'),
(3, 'ใบกำกับภาษี', 'TAX', 'y', 'm', 'd', '####', NULL, 'tax', 'no', 'no', 'delete'),
(4, 'ใบกำกับภาษี (ย่อ)', 'TAXS', 'y', 'm', 'd', '####', NULL, 'tax_short', 'no', 'no', 'delete'),
(5, 'ใบเสร็จรับเงิน-ใบส่งของ-ใบกำกับภาษี', 'ALL', 'y', 'm', 'd', '####', NULL, 'all_bill', 'no', 'no', 'delete');

-- --------------------------------------------------------

--
-- Table structure for table `mod_running_bill_running`
--

CREATE TABLE IF NOT EXISTS `mod_running_bill_running` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_name` varchar(255) DEFAULT NULL COMMENT 'ชนิดเอกสาร',
  `bill_code` varchar(255) DEFAULT NULL COMMENT 'รหัสรูปแบบชนิดเอกสาร',
  `running_to` varchar(10) DEFAULT NULL COMMENT 'ลำดับเลขบิล',
  `bill_sale_id` int(11) DEFAULT NULL COMMENT 'รหัสบิลขาย',
  `channel_id` int(11) DEFAULT NULL COMMENT 'รหัสข่องทางจำหน่าย',
  `branch_id` int(11) DEFAULT NULL COMMENT 'รหัสสาขา',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pays`
--

CREATE TABLE IF NOT EXISTS `pays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_type_id` int(5) NOT NULL COMMENT 'à¸£à¸«à¸±à¸ªà¸›à¸£à¸°à¹€à¸ à¸—',
  `name` varchar(255) NOT NULL COMMENT 'à¸£à¸²à¸¢à¸à¸²à¸£',
  `remark` varchar(255) DEFAULT NULL COMMENT 'à¸«à¸¡à¸²à¸¢à¹€à¸«à¸•à¸¸',
  `created_at` datetime NOT NULL COMMENT 'à¸§à¸±à¸™à¸—à¸µà¹ˆà¸šà¸±à¸™à¸—à¸¶à¸',
  `price` double(15,4) NOT NULL COMMENT 'จำนวนเงิน',
  `status` varchar(30) DEFAULT 'use',
  `pay_number` varchar(255) DEFAULT NULL COMMENT 'เลขที่ ',
  `pay_date_at` varchar(255) DEFAULT NULL COMMENT 'วันที่',
  `pay_receive_name` varchar(255) DEFAULT NULL COMMENT 'ชื่อผู้รับเงิน',
  `pay_tex` varchar(255) DEFAULT NULL COMMENT 'รหัสเลขเสียภาษี',
  `pay_add` varchar(255) DEFAULT NULL COMMENT 'ที่อยู่',
  `pay_tel` varchar(255) DEFAULT NULL COMMENT 'เบอร์โทร',
  `pay_list` varchar(255) DEFAULT NULL COMMENT 'รายการ',
  `pay_detail` varchar(255) DEFAULT NULL COMMENT 'รายละเอียด',
  `pay_qua` varchar(255) DEFAULT NULL COMMENT 'จำนวนที่ได้รับ',
  `pay_price` varchar(255) DEFAULT NULL COMMENT 'ราคา',
  `pay_get_price` varchar(255) DEFAULT NULL COMMENT 'ลงชื่อ ผู้จ่ายเงิน',
  `pay_approve` varchar(255) DEFAULT NULL COMMENT 'ผู้อนุมัติ',
  `pay_every_at` int(2) DEFAULT NULL COMMENT 'ต้องจ่ายทุกวันที่ xxx',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `pay_types`
--

CREATE TABLE IF NOT EXISTS `pay_types` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'ชื่อประเภทรายจ่าย',
  `remark` varchar(255) DEFAULT NULL COMMENT 'หมายเหตุ',
  `status` varchar(30) DEFAULT 'use',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `plug_ins`
--

CREATE TABLE IF NOT EXISTS `plug_ins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` enum('enable','disable') NOT NULL DEFAULT 'disable',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `plug_ins`
--

INSERT INTO `plug_ins` (`id`, `name`, `status`) VALUES
(1, 'auto_complete', 'disable'),
(2, 'keyboard_service', 'disable'),
(3, 'e_commerce', 'disable'),
(4, 'barcode_catalog', 'disable'),
(5, 'excel_service', 'disable'),
(6, 'print_service', 'disable');

-- --------------------------------------------------------

--
-- Table structure for table `po`
--

CREATE TABLE IF NOT EXISTS `po` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `status` enum('wait','success','cancel','delete') NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_tel` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_address` varchar(500) DEFAULT NULL,
  `quotation_code` varchar(255) DEFAULT NULL,
  `credit_day` int(3) DEFAULT NULL,
  `send_date` date DEFAULT NULL,
  `send_day` int(3) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `reduce_price` double(15,4) DEFAULT NULL,
  `vat_percen` int(2) DEFAULT NULL,
  `bill_status` int(1) NOT NULL DEFAULT '1' COMMENT 'สถานะบิล 0 = รอชำระ, 1 = ชำระแล้ว',
  `reduce_type` enum('baht','percen') NOT NULL DEFAULT 'baht' COMMENT 'ประเภทส่วนลด baht = ส่วนลดเป็นบาท, percen = ส่วนลดเป็นเปอร์เซ็น',
  `pay_date` datetime DEFAULT NULL COMMENT 'วันที่ชำระเงิน',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pocket_money`
--

CREATE TABLE IF NOT EXISTS `pocket_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `money` double(15,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `po_detail`
--

CREATE TABLE IF NOT EXISTS `po_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `po_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` double(15,4) NOT NULL,
  `price` double(15,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `price_per_group`
--

CREATE TABLE IF NOT EXISTS `price_per_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(6) DEFAULT NULL,
  `product_id` int(11) NOT NULL COMMENT 'รหัสสินค้า',
  `qty` int(5) NOT NULL COMMENT 'จำนวนที่ซื้อ',
  `price` double(15,4) NOT NULL COMMENT 'ราคาจำหน่าย',
  `status` enum('use','delete') NOT NULL DEFAULT 'use' COMMENT 'สถานะรายการ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `price_per_group_group`
--

CREATE TABLE IF NOT EXISTS `price_per_group_group` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `price` double(15,4) NOT NULL,
  `status` enum('use','delete') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ราคาสินค้าแบบเหมา - กลุ่ม' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `price_per_member_group`
--

CREATE TABLE IF NOT EXISTS `price_per_member_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_group_id` int(11) DEFAULT NULL COMMENT 'รหัส ประเภทสมาชิก',
  `product_id` int(11) DEFAULT NULL COMMENT 'รหัสสินค้า',
  `price` double(15,4) DEFAULT NULL COMMENT 'ราคาจำหน่าย',
  `channel_id` int(11) NOT NULL COMMENT 'รหัสช่องทางจำหน่าย',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_in_stock`
--

CREATE TABLE IF NOT EXISTS `product_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(50) NOT NULL COMMENT 'barcode สินค้า',
  `qty` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT 'จำนวนคงเหลือ',
  `branch_id` int(11) NOT NULL COMMENT 'รหัส สาขา/คลังสินค้า',
  `user_id` int(11) DEFAULT NULL COMMENT 'ผู้บันทึก',
  `stock_created_date` datetime NOT NULL COMMENT 'เวลาบันทึก',
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  KEY `barcode` (`barcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_prices`
--

CREATE TABLE IF NOT EXISTS `product_prices` (
  `order_field` int(2) NOT NULL,
  `product_barcode` varchar(20) NOT NULL,
  `qty` float(15,4) NOT NULL DEFAULT '0.0000',
  `price` float(15,4) NOT NULL DEFAULT '0.0000',
  `price_send` float(15,4) NOT NULL DEFAULT '0.0000',
  `qty_end` float(15,4) NOT NULL DEFAULT '0.0000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE IF NOT EXISTS `quotations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `customer_address` varchar(1000) NOT NULL,
  `customer_tel` varchar(50) DEFAULT NULL,
  `customer_fax` varchar(50) DEFAULT NULL,
  `customer_tax` varchar(13) DEFAULT NULL,
  `quotation_day` int(3) NOT NULL,
  `quotation_send_day` int(3) NOT NULL,
  `quotation_pay` enum('cash','credit') NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `vat` int(2) NOT NULL,
  `status` enum('use','remove') NOT NULL DEFAULT 'use' COMMENT 'สถานะรายการ',
  `vat_type` enum('no','in','out') DEFAULT NULL,
  `discount` double(16,2) NOT NULL DEFAULT '0.00',
  `note` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_details`
--

CREATE TABLE IF NOT EXISTS `quotation_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `remark` text,
  `old_price` double(15,4) NOT NULL,
  `qty` double(15,4) NOT NULL,
  `sub` double(15,4) NOT NULL,
  `is_vat` varchar(20) DEFAULT 'no',
  `price_vat` double(15,4) DEFAULT NULL,
  `sale_price` double(15,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

-- --------------------------------------------------------

--
-- Table structure for table `receive`
--

CREATE TABLE IF NOT EXISTS `receive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_code` varchar(50) NOT NULL COMMENT 'เลขเอกสาร',
  `req_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'ผู้ออกเอกสาร',
  `get_date` datetime NOT NULL,
  `remark` varchar(1000) DEFAULT NULL COMMENT 'หมายเหตุท้ายบิล',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `receive_detail`
--

CREATE TABLE IF NOT EXISTS `receive_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receive_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL COMMENT 'จำนวนที่ขอเบิก',
  `qty_get` int(11) NOT NULL COMMENT 'จำนวนที่ได้รับจริง',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `relax_type`
--

CREATE TABLE IF NOT EXISTS `relax_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT 'ชื่อประเภทการผ่อน',
  `price_baht` double(15,4) NOT NULL COMMENT 'ดอกเบี้ยเป็นบาท',
  `price_percen` double(15,4) NOT NULL COMMENT 'ดอกเบี้ยเป็นเปอร์เซนต์',
  `branch_id` int(11) NOT NULL COMMENT 'รหัส สาขา/คลังสินค้า',
  `over_day` int(2) DEFAULT NULL COMMENT 'ถ้าเกิน x วัน หลังทำสัญญาให้คิดดอกเบี้ย',
  `no_interest` int(1) DEFAULT NULL COMMENT 'ปิดยอดไม่เกิน x เดือน ไม่คิดดอกเบี้ย',
  `close_no_interest` enum('no','yes') NOT NULL DEFAULT 'no' COMMENT 'ส่วนลดจะลดให้ตอนปิดยอดเท่านั้น no = ไม่ให้ส่วนลด, yes = ให้ส่วนลด',
  `relax_step` enum('day','month') NOT NULL DEFAULT 'day' COMMENT 'รูปแบบการผ่อน รายวัน รายเดือน',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `req`
--

CREATE TABLE IF NOT EXISTS `req` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'เลขเอกสารใบขอเบิก',
  `created_date` datetime DEFAULT NULL COMMENT 'วันที่ออกเอกสาร',
  `user_id` int(11) NOT NULL COMMENT 'ผู้ออกเอกสาร',
  `branch_id` int(11) NOT NULL COMMENT 'สาขาที่ขอเก็บสินค้า',
  `req_status` enum('wait','get','cancel') NOT NULL DEFAULT 'wait' COMMENT 'สถานะใบเบิกสินค้า',
  `get_date` datetime DEFAULT NULL COMMENT 'วันที่รับสินค้า',
  `remark` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT 'หมายเหตุ',
  `from_branch_id` int(11) NOT NULL COMMENT 'จากสาขา',
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  KEY `get_date` (`get_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf16 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `req_detail`
--

CREATE TABLE IF NOT EXISTS `req_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `req_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(5) NOT NULL,
  `req_status` enum('wait','send','get','cancel') NOT NULL DEFAULT 'wait' COMMENT 'สถานะรายการ',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `req_id` (`req_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `role_detail`
--

CREATE TABLE IF NOT EXISTS `role_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_group_id` int(11) NOT NULL COMMENT 'รหัสกลุ่มผู้ใช้งานระบบ',
  `menu_id` int(11) NOT NULL COMMENT 'ชื่อเมนู',
  `is_main` enum('no','yes') NOT NULL DEFAULT 'no',
  `is_add` enum('no','yes') DEFAULT 'no' COMMENT 'สามารถ เพิ่มได้',
  `is_edit` enum('no','yes') DEFAULT 'no' COMMENT 'สามารถ แก้ไขได้',
  `is_delete` enum('no','yes') DEFAULT 'no' COMMENT 'สามารถ ลบได้',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `role_group`
--

CREATE TABLE IF NOT EXISTS `role_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'ชื่อกลุ่มผู้ใช้งานระบบ',
  `remark` varchar(255) DEFAULT NULL COMMENT 'หมายเหตุ',
  `status` varchar(30) DEFAULT 'use',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sale_temp`
--

CREATE TABLE IF NOT EXISTS `sale_temp` (
  `barcode` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `warranty` int(11) DEFAULT NULL,
  `promotion` int(1) DEFAULT '0' COMMENT '0=ไม่มีโปร,1=มีโปร',
  `promotion_group` int(6) DEFAULT NULL COMMENT 'null = ไม่มีโปรโมชั่นกลุ่ม',
  `promotion_discount_price` double(15,4) DEFAULT '0.0000',
  `discount_type` varchar(30) DEFAULT 'money',
  `discount_percent` int(3) DEFAULT '0',
  `discount` double(15,4) DEFAULT '0.0000',
  `price` double(15,4) DEFAULT NULL,
  `qty` double(15,4) DEFAULT NULL,
  `total` double(15,4) DEFAULT NULL,
  `qty_per_pack` int(5) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `pk_temp` varchar(50) NOT NULL DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `old_price` double(22,14) DEFAULT NULL COMMENT 'ราคาทุน',
  `sale_type` enum('sale','mobile') NOT NULL DEFAULT 'sale' COMMENT 'à¸£à¸¹à¸›à¹à¸šà¸šà¸à¸²à¸£à¸‚à¸²à¸¢',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'รหัส สมาชิก ที่ซื้อ',
  `name_lao` varchar(255) DEFAULT NULL COMMENT 'ชื่อสินค้า ภาษาลาว',
  `name_eng` varchar(255) DEFAULT NULL COMMENT 'ชื่อสินค้า ภาษาอังกฤษ',
  `vat_price` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT 'ภาษี',
  `vat_price2` double(15,4) NOT NULL DEFAULT '0.0000',
  `is_vat` enum('yes','no') DEFAULT NULL COMMENT 'มี vat หรือไม่',
  `old_price_product` double(22,14) NOT NULL DEFAULT '0.00000000000000' COMMENT 'ราคาเดิมของสินค้า',
  `reseller` enum('no','yes') NOT NULL DEFAULT 'no',
  `bill_pending_id` int(11) DEFAULT NULL COMMENT 'รหัสบิล ที่โดนพักบิล',
  `location` varchar(100) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL COMMENT 'หมายเหตุการขาย',
  `img` varchar(100) DEFAULT NULL,
  `is_rent` varchar(30) DEFAULT 'no',
  `will_send_date` datetime DEFAULT NULL,
  `quotation_id` int(11) DEFAULT NULL COMMENT 'รหัส ใบสั่งซื้อ',
  `sale_condition` varchar(5) DEFAULT NULL,
  `price_promotion` double(22,14) DEFAULT NULL COMMENT 'ราคาต่อชิ้นคิดจากโปรโมชั่น',
  `point` double(15,4) DEFAULT NULL COMMENT 'คะแนน ต่อการซื้อสินค้านี้ 1 ชิ้น',
  `product_free` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'สินค้า แถมฟรี',
  `product_not_vat` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'สินค้าไม่คิดแวท',
  PRIMARY KEY (`pk_temp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `spa_course`
--

CREATE TABLE IF NOT EXISTS `spa_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'ชื่อคอร์ส',
  `price_1` double(15,4) DEFAULT NULL COMMENT 'ราคา 1 ชั่วโมง',
  `price_1_5` double(15,4) DEFAULT NULL COMMENT 'ราคา 1.5 ชั่วโมง',
  `price_2` double(15,4) DEFAULT NULL COMMENT 'ราคา 2 ชั่วโมง',
  `price_2_5` double(15,4) DEFAULT NULL COMMENT 'ราคา 2.5 ชั่วโมง',
  `price_3` double(15,4) DEFAULT NULL COMMENT 'ราคา 3 ชั่วโมง',
  `price_3_5` double(15,4) DEFAULT NULL COMMENT 'ราคา 3.5 ชั่วโมง',
  `price_4` double(15,4) DEFAULT NULL COMMENT 'ราคา 4 ชั่วโมง',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'หมายเหตุ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `spa_emp`
--

CREATE TABLE IF NOT EXISTS `spa_emp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'ชื่อ',
  `tel` varchar(255) NOT NULL COMMENT 'เบอร์โทร',
  `emp_code` varchar(5) DEFAULT NULL COMMENT 'เลขประจำตัว',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'หมายเหตุ',
  `price` double(15,4) DEFAULT NULL COMMENT 'ค่าบริการของพนักงานนวด',
  `price_per_course` double(15,4) DEFAULT NULL COMMENT 'ค่าคอมมิชชั่นของพนักงานนวด',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `spa_room`
--

CREATE TABLE IF NOT EXISTS `spa_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_type_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'ชื่อ',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'หมายเหตุ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `spa_room_type`
--

CREATE TABLE IF NOT EXISTS `spa_room_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'ชื่อประเภทห้อง',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'หมายเหตุ',
  `price` int(4) DEFAULT NULL COMMENT 'ค่าห้อง',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `stock_import_change_log`
--

CREATE TABLE IF NOT EXISTS `stock_import_change_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL COMMENT 'รหัส สาขา',
  `user_id` int(11) NOT NULL COMMENT 'รหัสผู้ใช้ระบบ',
  `from_qty` double(15,4) NOT NULL COMMENT 'จำนวนเดิม',
  `to_qty` double(15,4) NOT NULL COMMENT 'จำนวนใหม่',
  `from_price` double(15,4) NOT NULL COMMENT 'ราคาเดิม',
  `to_price` double(15,4) NOT NULL COMMENT 'ราคาใหม่',
  `created_at` datetime NOT NULL COMMENT 'วันที่บันทึก',
  `bill_import_detail_id` int(11) NOT NULL COMMENT 'รหัสรายการ ของบิลรับเข้า',
  `discount` double(15,4) NOT NULL,
  `remark` varchar(1000) DEFAULT NULL COMMENT 'หมายเหตุ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `summary_score_of_member`
--

CREATE TABLE IF NOT EXISTS `summary_score_of_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL COMMENT 'รหัสสมาชิก',
  `score` double(15,4) DEFAULT NULL COMMENT 'จำนวนแต้ม',
  `price` double(15,4) DEFAULT NULL COMMENT 'ยอดซื้อ',
  `score_current` int(7) DEFAULT '0' COMMENT 'แต้ม ปัจจุบัน',
  `score_total` double(15,4) DEFAULT NULL COMMENT 'แต้มทั้งหมด',
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tax_at_pay`
--

CREATE TABLE IF NOT EXISTS `tax_at_pay` (
  `tax_at_pay_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสหักภาษี ณ ที่จ่าย',
  `pays_id` int(11) DEFAULT NULL COMMENT 'รหัสรายจ่าย',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'ชื่อลูกค้า/บริษัท',
  `customer_code` varchar(255) DEFAULT NULL COMMENT 'เลขประจำตัว (13หลัก)',
  `customer_tax_id` varchar(255) DEFAULT NULL COMMENT 'เลขประจำตัวผู้เสียภาษีอากร',
  `customer_address` varchar(255) DEFAULT NULL COMMENT 'ที่อยู่',
  `tax_number` varchar(255) DEFAULT NULL COMMENT 'ลำดับที่ :',
  `tax_type` int(5) DEFAULT NULL COMMENT 'ประเภทภาษี',
  `section_40_1_date` varchar(255) DEFAULT NULL COMMENT '1. เงินเดือน ค่าจ้าง เบี้ยเลี้ยง โบนัส ฯลฯ ตามมาตรา 40 (1)	วัน เดือน ปี ภาษีที่จ่าย',
  `section_40_1_moneyPay` varchar(255) DEFAULT NULL COMMENT '1. เงินเดือน ค่าจ้าง เบี้ยเลี้ยง โบนัส ฯลฯ ตามมาตรา 40 (1)	จำนวนเงินที่จ่าย',
  `section_40_1_priceTax` varchar(255) DEFAULT NULL COMMENT '1. เงินเดือน ค่าจ้าง เบี้ยเลี้ยง โบนัส ฯลฯ ตามมาตรา 40 (1)	ภาษีที่หักและนำส่งไว้',
  `section_40_40_date` varchar(255) DEFAULT NULL COMMENT '2. ค่าธรรมเนียม ค่านายหน้า ฯลฯ ตามมาตรา 40 (40)	วัน เดือน ปี ภาษีที่จ่าย',
  `section_40_40_moneyPay` varchar(255) DEFAULT NULL COMMENT '2. ค่าธรรมเนียม ค่านายหน้า ฯลฯ ตามมาตรา 40 (40)	จำนวนเงินที่จ่าย',
  `section_40_40_priceTax` varchar(255) DEFAULT NULL COMMENT '2. ค่าธรรมเนียม ค่านายหน้า ฯลฯ ตามมาตรา 40 (40)	ภาษีที่หักและนำส่งไว้',
  `section_40_3_date` varchar(255) DEFAULT NULL COMMENT '3. ค่าแห่งลิขสิทธิ์ ฯลฯ ตามมาตรา 40 (3)	วัน เดือน ปี ภาษีที่จ่าย',
  `section_40_3_moneyPay` varchar(255) DEFAULT NULL COMMENT '3. ค่าแห่งลิขสิทธิ์ ฯลฯ ตามมาตรา 40 (3)	จำนวนเงินที่จ่าย',
  `section_40_3_priceTax` varchar(255) DEFAULT NULL COMMENT '3. ค่าแห่งลิขสิทธิ์ ฯลฯ ตามมาตรา 40 (3)	ภาษีที่หักและนำส่งไว้',
  `section_40_4_date` varchar(255) DEFAULT NULL COMMENT '4. (ก) ดอกเบี้ย ฯลฯ ตามมาตรา 40 (4) (ก)	วัน เดือน ปี ภาษีที่จ่าย',
  `section_40_4_moneyPay` varchar(255) DEFAULT NULL COMMENT '4. (ก) ดอกเบี้ย ฯลฯ ตามมาตรา 40 (4) (ก)	จำนวนเงินที่จ่าย',
  `section_40_4_priceTax` varchar(255) DEFAULT NULL COMMENT '4. (ก) ดอกเบี้ย ฯลฯ ตามมาตรา 40 (4) (ก)	ภาษีที่หักและนำส่งไว้',
  `per_30_profit_date` varchar(255) DEFAULT NULL COMMENT '(1.1) อัตราร้อยละ 30 ของกำไรสุทธิ	วัน เดือน ปี ภาษีที่จ่าย',
  `per_30_profit_moneyPay` varchar(255) DEFAULT NULL COMMENT '(1.1) อัตราร้อยละ 30 ของกำไรสุทธิ	จำนวนเงินที่จ่าย',
  `per_30_profit_priceTax` varchar(255) DEFAULT NULL COMMENT '(1.1) อัตราร้อยละ 30 ของกำไรสุทธิ	ภาษีที่หักและนำส่งไว้',
  `per_25_profit_date` varchar(255) DEFAULT NULL COMMENT '(1.2) อัตราร้อยละ 25 ของกำไรสุทธิ	วัน เดือน ปี ภาษีที่จ่าย',
  `per_25_profit_moneyPay` varchar(255) DEFAULT NULL COMMENT '(1.2) อัตราร้อยละ 25 ของกำไรสุทธิ	จำนวนเงินที่จ่าย',
  `per_25_profit_priceTax` varchar(255) DEFAULT NULL COMMENT '(1.2) อัตราร้อยละ 25 ของกำไรสุทธิ   ภาษีที่หักและนำส่งไว้',
  `per_20_profit_date` varchar(255) DEFAULT NULL COMMENT '(1.3) อัตราร้อยละ 20 ของกำไรสุทธิ	วัน เดือน ปี ภาษีที่จ่าย',
  `per_20_profit_moneyPay` varchar(255) DEFAULT NULL COMMENT '(1.3) อัตราร้อยละ 20 ของกำไรสุทธิ	จำนวนเงินที่จ่าย',
  `per_20_profit_priceTax` varchar(255) DEFAULT NULL COMMENT '(1.3) อัตราร้อยละ 20 ของกำไรสุทธิ	ภาษีที่หักและนำส่งไว้',
  `per_other_profit_remark` varchar(255) DEFAULT NULL COMMENT '1.4) อัตราอื่น ๆ (ระบุ).............. ของกำไรสุทธิ	ระบุ...',
  `per_other_profit_date` varchar(255) DEFAULT NULL COMMENT '1.4) อัตราอื่น ๆ (ระบุ).............. ของกำไรสุทธิ	วัน เดือน ปี ภาษีที่จ่าย',
  `per_other_profit_moneyPay` varchar(255) DEFAULT NULL COMMENT '1.4) อัตราอื่น ๆ (ระบุ).............. ของกำไรสุทธิ	จำนวนเงินที่จ่าย',
  `per_other_profit_priceTax` varchar(255) DEFAULT NULL COMMENT '1.4) อัตราอื่น ๆ (ระบุ).............. ของกำไรสุทธิ	ภาษีที่หักและนำส่งไว้',
  `profit_cancel_tax_date` varchar(255) DEFAULT NULL COMMENT '(2.1) กำไรสุทธิของกิจการที่ได้รับยกเว้นภาษีเงินได้นิติบุคคล	วัน เดือน ปี ภาษีที่จ่าย',
  `profit_cancel_tax_moneyPay` varchar(255) DEFAULT NULL COMMENT '(2.1) กำไรสุทธิของกิจการที่ได้รับยกเว้นภาษีเงินได้นิติบุคคล	จำนวนเงินที่จ่าย',
  `profit_cancel_tax_priceTax` varchar(255) DEFAULT NULL COMMENT '(2.1) กำไรสุทธิของกิจการที่ได้รับยกเว้นภาษีเงินได้นิติบุคคล	ภาษีที่หักและนำส่งไว้',
  `profit_share_cancel_tax_date` varchar(255) DEFAULT NULL COMMENT '(2.2) เงินปันผลหรือเงินส่วนแบ่งของกำไรที่ได้รับยกเว้นไม่ต้องนำมารวมคำนวณเป็นรายได้	วัน เดือน ปี ภาษีที่จ่าย',
  `profit_share_cancel_tax_moneyPay` varchar(255) DEFAULT NULL COMMENT '(2.2) เงินปันผลหรือเงินส่วนแบ่งของกำไรที่ได้รับยกเว้นไม่ต้องนำมารวมคำนวณเป็นรายได้	จำนวนเงินที่จ่าย',
  `profit_share_cancel_tax_priceTax` varchar(255) DEFAULT NULL COMMENT '(2.2) เงินปันผลหรือเงินส่วนแบ่งของกำไรที่ได้รับยกเว้นไม่ต้องนำมารวมคำนวณเป็นรายได้',
  `profit_loss_not_limit_date` varchar(255) DEFAULT NULL COMMENT '(2.3) กำไรสุทธิส่วนที่ได้หักผลขาดทุนสุุทธิยกมาไม่เกิน 5 ปี	วัน เดือน ปี ภาษีที่จ่าย',
  `profit_loss_not_limit_moneyPay` varchar(255) DEFAULT NULL COMMENT '(2.3) กำไรสุทธิส่วนที่ได้หักผลขาดทุนสุุทธิยกมาไม่เกิน 5 ปี	จำนวนเงินที่จ่าย',
  `profit_loss_not_limit_priceTax` varchar(255) DEFAULT NULL COMMENT '(2.3) กำไรสุทธิส่วนที่ได้หักผลขาดทุนสุุทธิยกมาไม่เกิน 5 ปี	ภาษีที่หักและนำส่งไว้',
  `equity_method_date` varchar(255) DEFAULT NULL COMMENT '(2.4) กำไรที่รับรู้ทางบัญชีโดยวิธีส่วนได้เสีย (equity method	วัน เดือน ปี ภาษีที่จ่าย',
  `equity_method_moneyPay` varchar(255) DEFAULT NULL COMMENT '(2.4) กำไรที่รับรู้ทางบัญชีโดยวิธีส่วนได้เสีย (equity method	จำนวนเงินที่จ่าย',
  `equity_method_priceTax` varchar(255) DEFAULT NULL COMMENT '(2.4) กำไรที่รับรู้ทางบัญชีโดยวิธีส่วนได้เสีย (equity method	ภาษีที่หักและนำส่งไว้',
  `receive_dividends_others_remark` varchar(255) DEFAULT NULL COMMENT '(2.5) อื่น ฯ (ระบุ)	ระบุ...',
  `receive_dividends_others_date` varchar(255) DEFAULT NULL COMMENT '(2.5) อื่น ฯ (ระบุ)	วัน เดือน ปี ภาษีที่จ่าย',
  `receive_dividends_others_moneyPay` varchar(255) DEFAULT NULL COMMENT '(2.5) อื่น ฯ (ระบุ)	จำนวนเงินที่จ่าย',
  `receive_dividends_others_priceTax` varchar(255) DEFAULT NULL COMMENT '(2.5) อื่น ฯ (ระบุ)	ภาษีที่หักและนำส่งไว้',
  `section_3_date` varchar(255) DEFAULT NULL COMMENT '5. การจ่ายเงินได้ที่ต้องหักภาษี ณ ที่จ่าย ตามคำสั่งกรมสรรพากรที่ออกตามมาตรา 3 	วัน เดือน ปี ภาษีที่จ่าย',
  `section_3_moneyPay` varchar(255) DEFAULT NULL COMMENT '5. การจ่ายเงินได้ที่ต้องหักภาษี ณ ที่จ่าย ตามคำสั่งกรมสรรพากรที่ออกตามมาตรา 3	จำนวนเงินที่จ่าย',
  `section_3_priceTax` varchar(255) DEFAULT NULL COMMENT '5. การจ่ายเงินได้ที่ต้องหักภาษี ณ ที่จ่าย ตามคำสั่งกรมสรรพากรที่ออกตามมาตรา 3	ภาษีที่หักและนำส่งไว้',
  `others_remark` varchar(255) DEFAULT NULL COMMENT '6. อื่น ฯ (ระบุ)	ระบุ...',
  `others_date` varchar(255) DEFAULT NULL COMMENT '6. อื่น ฯ (ระบุ)	วัน เดือน ปี ภาษีที่จ่าย',
  `others_moneyPay` varchar(255) DEFAULT NULL COMMENT '6. อื่น ฯ (ระบุ)	จำนวนเงินที่จ่าย',
  `others_priceTax` varchar(255) DEFAULT NULL COMMENT '6. อื่น ฯ (ระบุ)	ภาษีที่หักและนำส่งไว้',
  `net_tax_date` varchar(255) DEFAULT NULL COMMENT 'รวมเงินที่จ่ายและภาษีที่หักนำส่ง	วัน เดือน ปี ภาษีที่จ่าย',
  `net_tax_moneyPay` varchar(255) DEFAULT NULL COMMENT 'รวมเงินที่จ่ายและภาษีที่หักนำส่ง	จำนวนเงินที่จ่าย',
  `net_tax_priceTax` varchar(255) DEFAULT NULL COMMENT 'รวมเงินที่จ่ายและภาษีที่หักนำส่ง	ภาษีที่หักและนำส่งไว้',
  `tax_total_text` varchar(255) DEFAULT NULL COMMENT 'รวมเงินภาษีที่หักนำส่ง (ตัวอักษร)',
  `money_paid` varchar(255) DEFAULT NULL COMMENT 'เงินที่จ่ายเข้า กบข./กสจ./กองทุนสงเคราะห์ครูโรงเรียนเอกชน',
  `two_social_security_grants` varchar(255) DEFAULT NULL COMMENT 'สองทุนประกันสังคม',
  `provident_fund` varchar(255) DEFAULT NULL COMMENT 'กองทุนสำรองเลี้ยงชีพ',
  `payer` varchar(255) DEFAULT NULL COMMENT 'ผู้จ่ายเงิน',
  `payer_orthers` varchar(255) DEFAULT NULL COMMENT '(4) อื่น ๆ (ระบุ)',
  `user_id` int(11) DEFAULT NULL COMMENT 'ผู้บันทึก',
  `created_date` datetime DEFAULT NULL COMMENT 'วันที่บันทึก',
  PRIMARY KEY (`tax_at_pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_5free1`
--

CREATE TABLE IF NOT EXISTS `tb_5free1` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `product_id` int(3) NOT NULL COMMENT 'รหัสสินค้า',
  `qty` int(3) NOT NULL COMMENT 'จำนวนขาย',
  `qty_free` int(2) NOT NULL COMMENT 'จำนวนที่แถมฟรี',
  `remark` text COMMENT 'หมายเหตุ',
  `product_id_free` int(11) NOT NULL COMMENT 'สินค้าที่จะแถมฟรี',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_alert`
--

CREATE TABLE IF NOT EXISTS `tb_alert` (
  `alert_id` int(11) NOT NULL,
  `alert_topic` varchar(255) DEFAULT NULL,
  `alert_day` date DEFAULT NULL,
  `alert_detail` text,
  `alert_created_date` datetime DEFAULT NULL,
  `alert_status` enum('wait','do','complete') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`alert_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ar`
--

CREATE TABLE IF NOT EXISTS `tb_ar` (
  `ar_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `bill_sale_id` int(11) DEFAULT NULL,
  `ar_will_pay_date` date DEFAULT NULL,
  `ar_pay_date` datetime DEFAULT NULL,
  `ar_status` enum('wait','pay','cancel') NOT NULL,
  PRIMARY KEY (`ar_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_bill_config`
--

CREATE TABLE IF NOT EXISTS `tb_bill_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slip_width` int(4) NOT NULL,
  `slip_height` int(4) NOT NULL,
  `bill_send_product_width` int(4) NOT NULL,
  `bill_send_product_height` int(4) NOT NULL,
  `bill_add_tax_width` int(4) NOT NULL,
  `bill_add_tax_height` int(4) NOT NULL,
  `bill_drop_width` int(5) NOT NULL,
  `bill_drop_height` int(5) NOT NULL,
  `slip_paper` varchar(10) CHARACTER SET utf8 NOT NULL,
  `slip_position` varchar(10) CHARACTER SET utf8 NOT NULL,
  `bill_send_product_paper` varchar(10) CHARACTER SET utf8 NOT NULL,
  `bill_send_product_position` varchar(10) CHARACTER SET utf8 NOT NULL,
  `bill_drop_paper` varchar(10) CHARACTER SET utf8 NOT NULL,
  `bill_drop_position` varchar(10) CHARACTER SET utf8 NOT NULL,
  `bill_add_tax_paper` varchar(10) CHARACTER SET utf8 NOT NULL,
  `bill_add_tax_position` varchar(10) CHARACTER SET utf8 NOT NULL,
  `slip_font_size` int(2) NOT NULL DEFAULT '11' COMMENT 'à¸‚à¸™à¸²à¸”à¸•à¸±à¸§à¸­à¸±à¸à¸©à¸£',
  `sale_font_size` int(2) NOT NULL DEFAULT '11' COMMENT 'à¸‚à¸™à¸²à¸”à¸•à¸±à¸§à¸­à¸±à¸à¸©à¸£ à¹ƒà¸šà¹€à¸ªà¸£à¹‡à¸ˆ',
  `sale_width` int(2) DEFAULT NULL COMMENT 'à¸„à¸§à¸²à¸¡à¸à¸§à¹‰à¸²à¸‡à¹ƒà¸šà¹€à¸ªà¸£à¹‡à¸ˆ',
  `sale_height` int(2) DEFAULT NULL COMMENT 'à¸„à¸§à¸²à¸¡à¸ªà¸¹à¸‡à¹ƒà¸šà¹€à¸ªà¸£à¹‡à¸ˆ',
  `sale_paper` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT 'A4' COMMENT 'รูปแบบกระดาษ ใบเสร็จ',
  `sale_position` varchar(15) CHARACTER SET utf8 NOT NULL DEFAULT 'vertical' COMMENT 'แนวนอน แนวตั้ง ของใบเสร็จ',
  `bill_send_show_line` enum('no','yes') CHARACTER SET utf8 DEFAULT 'no' COMMENT 'แสดงเส้นใบส่งสินค้า',
  `bill_drop_show_line` enum('no','yes') CHARACTER SET utf8 DEFAULT 'no' COMMENT 'แสดงเส้นใบวางบิล',
  `bill_add_show_line` enum('no','yes') CHARACTER SET utf8 DEFAULT 'no' COMMENT 'แสดงเส้นใบกำกับภาษี',
  `sale_condition_show_line` enum('no','yes') CHARACTER SET utf8 DEFAULT 'no' COMMENT 'แสดงเส้นใบเสร็จรับเงิน',
  `slip_show_date` enum('yes','no') CHARACTER SET utf8 DEFAULT 'yes' COMMENT 'แสดงวันที่บนใบสลิป',
  `bill_send_show_date` enum('yes','no') CHARACTER SET utf8 DEFAULT 'yes' COMMENT 'แสดงวันที่บนใบส่งสินค้า',
  `bill_drop_show_date` enum('yes','no') CHARACTER SET utf8 DEFAULT 'yes' COMMENT 'แสดงวันที่บนใบวางบิล',
  `bill_tax_show_date` enum('yes','no') CHARACTER SET utf8 DEFAULT 'yes' COMMENT 'แสดงวันที่บนใบกำกับภาษี',
  `bill_show_date` enum('yes','no') CHARACTER SET utf8 DEFAULT 'yes' COMMENT 'แสดงวันที่บนใบเสร็จ',
  `slip_default_height` int(3) NOT NULL DEFAULT '115' COMMENT 'ความสูงใบสลิป',
  `slip_height_per_row` int(2) NOT NULL DEFAULT '4' COMMENT 'ความสูง รายการใน ใบสลิป',
  `tax_font_size` int(2) NOT NULL DEFAULT '12' COMMENT 'ขนาดอักษร ในใบกำกับภาษี',
  `bill_send_product_font_size` int(2) NOT NULL DEFAULT '12' COMMENT 'ขนาดอักษร ในใบส่งสินค้า',
  `drop_bill_font_size` int(2) NOT NULL DEFAULT '12' COMMENT 'ขนาดอักษร ในใบวางบิล',
  `slip_show_vat_on_bill` enum('yes','no') CHARACTER SET utf8 NOT NULL DEFAULT 'yes' COMMENT 'แสดงจำนวน vat บนใบสลิป',
  `slip_show_vat_type_on_bill` enum('yes','no') CHARACTER SET utf8 NOT NULL DEFAULT 'yes' COMMENT 'แสดงชนิด vat บนใบสลิป',
  `bill_send_sum_footer` enum('yes','no') CHARACTER SET utf8 NOT NULL DEFAULT 'no',
  `bill_show_picture` enum('no','yes') CHARACTER SET utf8 NOT NULL DEFAULT 'no',
  `bill_send_show_picture` enum('no','yes') CHARACTER SET utf8 NOT NULL DEFAULT 'no',
  `bill_show_barcode` enum('no','yes') CHARACTER SET utf8 NOT NULL DEFAULT 'no',
  `bill_send_show_barcode` enum('no','yes') CHARACTER SET utf8 NOT NULL DEFAULT 'no',
  `bill_tax_show_barcode` enum('no','yes') CHARACTER SET utf8 NOT NULL DEFAULT 'no',
  `bill_send_show_text_document_set` enum('yes','no') DEFAULT 'yes' COMMENT 'แสดงเอกสารออกเป็นชุดบนใบส่งสินค้า',
  `bill_tax_show_text_document_set` enum('yes','no') DEFAULT 'yes' COMMENT 'แสดงเอกสารออกเป็นชุดบนใบกำกับภาษี',
  `bill_drop_show_text_document_set` enum('yes','no') DEFAULT 'yes' COMMENT 'แสดงเอกสารออกเป็นชุดบนใบวางบิล',
  `bill_success_show_text_document_set` enum('yes','no') DEFAULT 'yes' COMMENT 'แสดงเอกสารออกเป็นชุดบนใบเสร็จ',
  `logo_width` int(3) NOT NULL DEFAULT '50',
  `logo_height` int(3) NOT NULL DEFAULT '50',
  `import_bill_show_price` enum('no','yes') CHARACTER SET utf8 NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tb_bill_config`
--

INSERT INTO `tb_bill_config` (`id`, `slip_width`, `slip_height`, `bill_send_product_width`, `bill_send_product_height`, `bill_add_tax_width`, `bill_add_tax_height`, `bill_drop_width`, `bill_drop_height`, `slip_paper`, `slip_position`, `bill_send_product_paper`, `bill_send_product_position`, `bill_drop_paper`, `bill_drop_position`, `bill_add_tax_paper`, `bill_add_tax_position`, `slip_font_size`, `sale_font_size`, `sale_width`, `sale_height`, `sale_paper`, `sale_position`, `bill_send_show_line`, `bill_drop_show_line`, `bill_add_show_line`, `sale_condition_show_line`, `slip_show_date`, `bill_send_show_date`, `bill_drop_show_date`, `bill_tax_show_date`, `bill_show_date`, `slip_default_height`, `slip_height_per_row`, `tax_font_size`, `bill_send_product_font_size`, `drop_bill_font_size`, `slip_show_vat_on_bill`, `slip_show_vat_type_on_bill`, `bill_send_sum_footer`, `bill_show_picture`, `bill_send_show_picture`, `bill_show_barcode`, `bill_send_show_barcode`, `bill_tax_show_barcode`, `bill_send_show_text_document_set`, `bill_tax_show_text_document_set`, `bill_drop_show_text_document_set`, `bill_success_show_text_document_set`, `logo_width`, `logo_height`, `import_bill_show_price`) VALUES
(2, 58, 200, 0, 0, 0, 0, 0, 0, 'A4', 'horizontal', 'A4', 'horizontal', 'A4', 'horizontal', 'A4', 'horizontal', 15, 15, 0, 0, 'A4', 'horizontal', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 170, 5, 15, 15, 15, 'yes', 'yes', 'yes', 'no', 'no', 'no', 'no', 'no', 'yes', 'yes', 'yes', 'yes', 50, 50, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `tb_bill_import`
--

CREATE TABLE IF NOT EXISTS `tb_bill_import` (
  `bill_import_code` varchar(255) NOT NULL,
  `bill_import_created_date` datetime NOT NULL,
  `farmer_id` int(11) NOT NULL,
  `bill_import_pay` enum('cash','credit') NOT NULL,
  `bill_import_remark` varchar(1000) NOT NULL,
  `bill_import_pay_status` enum('pay','wait') NOT NULL,
  `bill_import_pay_date` datetime DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `from_branch_id` int(11) NOT NULL DEFAULT '1',
  `vat_total` double(15,4) DEFAULT NULL COMMENT 'จำนวนยอดภาษี',
  `vat_type` enum('include','exclude','no') NOT NULL DEFAULT 'include' COMMENT 'ประเภทของภาษี',
  `bill_import_code_in` varchar(255) DEFAULT NULL COMMENT 'รหัสบิล ภายในร้านเอง',
  `will_pay_date` date DEFAULT NULL COMMENT 'วันกำหนดชำระหนี้',
  `import_type` enum('from_sale','from_company') NOT NULL DEFAULT 'from_sale' COMMENT 'รูปแบบการรับเข้า',
  `user_id` int(11) DEFAULT NULL COMMENT 'รหัสผู้รับเข้าสินค้า',
  `value_of_product` double(15,4) DEFAULT NULL COMMENT 'มูลค่าสินค้าทั้งหมด ในการรับเข้า',
  `discount` double(15,4) NOT NULL,
  `status` enum('normal','delete') NOT NULL,
  `remark` text COMMENT 'หมายเหตุ',
  `status_bill` int(1) NOT NULL DEFAULT '1' COMMENT 'สถานะบิล 0 = เปิดบิล, 1 = ปิดบิลแล้ว',
  `po_id` int(5) DEFAULT NULL COMMENT 'อ้างอิงใบสั่งซื้อ',
  PRIMARY KEY (`bill_import_code`),
  KEY `bill_import_code` (`bill_import_code`),
  KEY `branch_id` (`branch_id`),
  KEY `status` (`status`),
  KEY `bill_import_created_date` (`bill_import_created_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_bill_import_detail`
--

CREATE TABLE IF NOT EXISTS `tb_bill_import_detail` (
  `bill_import_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('noserial','serial') NOT NULL,
  `bill_import_code` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `box_id` int(11) NOT NULL,
  `import_bill_detail_product_qty` double(15,4) DEFAULT NULL,
  `import_bill_detail_price` double(15,4) NOT NULL,
  `import_bill_detail_qty` double(15,4) DEFAULT NULL,
  `import_bill_detail_code` varchar(50) DEFAULT NULL COMMENT 'รหัสสินค้า ที่รับเข้า',
  `import_bill_detail_qty_per_pack` double(15,4) DEFAULT NULL,
  `serial_code` varchar(255) DEFAULT NULL COMMENT 'รหัส serial สินค้า',
  `ime1` varchar(255) DEFAULT NULL COMMENT 'รหัส IME 1',
  `ime2` varchar(255) DEFAULT NULL COMMENT 'รหัส IME 2',
  `garantee_date` int(3) DEFAULT NULL COMMENT 'วันรับประกัน',
  `status` enum('normal','delete') NOT NULL,
  `for_compute` varchar(255) DEFAULT NULL COMMENT 'ใช้คำนวนต้นทุนเฉลี่ย',
  PRIMARY KEY (`bill_import_detail_id`),
  KEY `product_id` (`product_id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_bill_matjam`
--

CREATE TABLE IF NOT EXISTS `tb_bill_matjam` (
  `matjam_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสบิลมัดจำ',
  `created_date` datetime DEFAULT NULL COMMENT 'วันที่มัดจำ',
  `bill_sale_id` int(11) DEFAULT NULL COMMENT 'รหัสบิลขาย',
  `inv_matjam` varchar(255) DEFAULT NULL COMMENT 'เลขที่มัดจำ',
  `matjam_pay_date` datetime DEFAULT NULL COMMENT 'วันที่จ่ายมัดจำ',
  `user_id` int(11) DEFAULT NULL COMMENT 'ผู้บันทึก',
  `price` double(22,14) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL COMMENT 'ธนาคาร',
  `bank_branch` varchar(255) DEFAULT NULL COMMENT 'ธนาคารสาขา',
  `no_check` varchar(255) DEFAULT NULL COMMENT 'เลขที่เช็ค',
  PRIMARY KEY (`matjam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_bill_sale`
--

CREATE TABLE IF NOT EXISTS `tb_bill_sale` (
  `bill_sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_detail_id` varchar(50) DEFAULT NULL COMMENT 'คูปองส่วนลด',
  `bill_sale_created_date` datetime NOT NULL,
  `bill_sale_status` enum('wait','pay','cancel','credit','point') NOT NULL,
  `member_id` int(11) NOT NULL,
  `bill_sale_vat` enum('no','vat') NOT NULL,
  `user_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `bill_sale_pay_date` datetime DEFAULT NULL,
  `bill_sale_drop_bill_date` date DEFAULT NULL,
  `bill_sale_want_drop` enum('no','yes') NOT NULL,
  `vat_type` enum('in','out','no') DEFAULT NULL COMMENT 'รูปแบบ vat (in, out, no)',
  `bonus_type` varchar(30) NOT NULL DEFAULT 'money',
  `bonus_percent` int(6) NOT NULL DEFAULT '0',
  `bonus_price` double(15,4) DEFAULT NULL COMMENT 'ส่วนลด',
  `out_vat` double(15,4) DEFAULT NULL COMMENT 'vat บวกเพิ่มกี่บาท',
  `input_money` double(15,4) DEFAULT NULL COMMENT 'รับเงิน',
  `return_money` double(15,4) DEFAULT NULL COMMENT 'เงินทอน',
  `total_money` double(15,4) DEFAULT NULL COMMENT 'ยอดเงินทั้งหมด',
  `sale_type` enum('sale','mobile') NOT NULL DEFAULT 'sale' COMMENT 'รูปแบบการขาย',
  `quotation_id` int(11) DEFAULT NULL COMMENT 'à¸£à¸«à¸±à¸ªà¹ƒà¸šà¹€à¸ªà¸™à¸­à¸£à¸²à¸„à¸²',
  `vat_percen` int(2) DEFAULT NULL COMMENT 'à¸ à¸²à¸©à¸µ',
  `vat_bath` double(15,4) DEFAULT NULL COMMENT 'จำนวนค่าภาษี',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'à¸Šà¸·à¹ˆà¸­à¸¥à¸¹à¸à¸„à¹‰à¸²',
  `customer_tel` varchar(255) DEFAULT NULL COMMENT 'à¹€à¸šà¸­à¸£à¹Œà¹‚à¸—à¸£',
  `customer_tax` varchar(255) DEFAULT NULL COMMENT 'à¹€à¸¥à¸‚à¸œà¸¹à¹‰à¹€à¸ªà¸µà¸¢à¸ à¸²à¸©à¸µ',
  `customer_address` varchar(255) DEFAULT NULL COMMENT 'à¸—à¸µà¹ˆà¸­à¸¢à¸¹à¹ˆà¸¥à¸¹à¸à¸„à¹‰à¸²',
  `update_bill_id` int(1) NOT NULL DEFAULT '0' COMMENT '0 = ยังไม่รีเซต, 1 = รีเซตแล้ว',
  `pay_type_money` varchar(255) NOT NULL DEFAULT 'baht' COMMENT 'สกุลเงินที่จ่าย',
  `payment_id` int(6) NOT NULL DEFAULT '1',
  `sale_id` int(11) DEFAULT NULL COMMENT 'รหัสพนักงานขาย',
  `channel_id` int(11) DEFAULT NULL COMMENT 'รหัส ช่องทางการจำหน่าย',
  `will_pay_date` date DEFAULT NULL COMMENT 'วันที่นัดชำระเงิน กรณีจ่ายเงินเชื่อ',
  `bill_sale_code` varchar(50) DEFAULT NULL COMMENT 'เลขเอกสาร',
  `inv_code` varchar(255) DEFAULT NULL COMMENT 'เลขบิลรวม',
  `check_code` varchar(255) DEFAULT NULL COMMENT 'หมายเลขเช็ค',
  `check_date` datetime DEFAULT NULL COMMENT 'วันที่เช็ค',
  `bill_no` int(6) DEFAULT NULL COMMENT 'ลำดับบิล ในปีนั้น',
  `bill_year` int(4) DEFAULT NULL COMMENT 'ปีที่ออกบิล',
  `is_credit` enum('no','yes') NOT NULL DEFAULT 'no' COMMENT ' รายการนี้ คือการซื้อเงินเชื่อ หรือไม่',
  `is_drop_bill` enum('no','yes') NOT NULL DEFAULT 'no' COMMENT ' no = ยังไม่วางบิล, yes = วางบิลแล้ว',
  `status` enum('normal','delete') NOT NULL,
  `drop_bill_date` datetime DEFAULT NULL COMMENT 'วันที่วางบิลล่าสุด',
  `remark` varchar(500) DEFAULT NULL,
  `status_delivery` varchar(255) DEFAULT NULL COMMENT 'สถานะการจัดส่งสินค้า',
  `ems` varchar(255) DEFAULT NULL COMMENT 'หมายเลขพัสดุ EMS',
  `hide_bill` int(1) NOT NULL DEFAULT '0' COMMENT 'ซ่อนบิลขาย 0 = ไม่ซ่อน, 1 = ซ่อน',
  `bill_code` varchar(20) DEFAULT NULL COMMENT 'รหัสบิล ที่รันใหม่เพื่อซ่อนรายการ',
  `money_added` int(6) NOT NULL DEFAULT '0' COMMENT 'ค่าปรับหากจ่ายหนี้ล่าช้า',
  `credit_remark` varchar(500) DEFAULT NULL COMMENT 'หมายเหตุ เมื่อรับชำระหนี้',
  `ems_code` varchar(255) DEFAULT NULL COMMENT 'รหัสติดตามสินค้า สำหรับกรณีมีการจัดส่ง',
  `bill_remark` varchar(255) DEFAULT NULL COMMENT 'หมายเหตุท้ายบิล',
  `created_Bill_sale` datetime NOT NULL COMMENT 'วันที่ทำรายการ',
  `matjam` double(22,14) DEFAULT NULL COMMENT 'จำนวนเงินมัดจำ',
  `bill_sale_pay_date_after_matjam` datetime DEFAULT NULL COMMENT 'ชำระเงิน หลังจากที่มีการมัดจำไปแล้ว',
  `receipt` varchar(255) DEFAULT NULL COMMENT 'เลขที่ใบเสร็จรับเงิน',
  `receipt_short` varchar(255) DEFAULT NULL COMMENT 'เลขที่ใบเสร็จรับเงิน (ย่อ)',
  `tax` varchar(255) DEFAULT NULL COMMENT 'เลขที่ใบกำกับภาษี',
  `tax_short` varchar(255) DEFAULT NULL COMMENT 'เลขที่ใบกำกับภาษี (ย่อ)',
  `all_bill` varchar(255) DEFAULT NULL COMMENT 'เลขเอกสาร',
  `score` int(11) DEFAULT NULL,
  `reduce_data_at` varchar(255) DEFAULT NULL COMMENT 'วันที่ใบลดหนี้ ',
  `reduce_no` varchar(255) DEFAULT NULL COMMENT 'เลขที่ใบลดหนี้ ',
  `reduce_note` varchar(255) DEFAULT NULL COMMENT 'หมายเหตุลดหนี้ ',
  `icommerce_bill_sale_id` int(11) DEFAULT NULL COMMENT 'id บิลขายจากระบบออนไลน์',
  `customer_branch` varchar(255) DEFAULT NULL COMMENT 'สาขาลูกค้า',
  PRIMARY KEY (`bill_sale_id`),
  KEY `channel_id` (`channel_id`),
  KEY `branch_id` (`branch_id`),
  KEY `member_id` (`member_id`),
  KEY `user_id` (`user_id`),
  KEY `bill_sale_pay_date` (`bill_sale_pay_date`),
  KEY `bill_sale_created_date` (`bill_sale_created_date`),
  KEY `bill_sale_status` (`bill_sale_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_bill_sale_detail`
--

CREATE TABLE IF NOT EXISTS `tb_bill_sale_detail` (
  `bill_sale_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NOT NULL,
  `bill_sale_detail_promotion` int(1) DEFAULT '0' COMMENT '0=ไม่มีโปร,1=มีโปร',
  `bill_sale_detail_promotion_group` int(6) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `bill_sale_detail_barcode` varchar(50) NOT NULL,
  `bill_sale_detail_price` double(22,14) DEFAULT NULL COMMENT 'ราคาสินค้า',
  `discount_type` varchar(30) DEFAULT 'money',
  `discount_percent` int(3) NOT NULL DEFAULT '0',
  `discount` double(15,4) NOT NULL DEFAULT '0.0000',
  `bill_sale_detail_total` double(15,4) DEFAULT NULL,
  `vat_type` varchar(10) DEFAULT NULL,
  `bill_sale_detail_price_vat` double(15,4) NOT NULL,
  `bill_sale_detail_price_vat2` double(15,4) NOT NULL DEFAULT '0.0000',
  `bill_sale_detail_qty` double(15,4) DEFAULT NULL,
  `bill_sale_detail_has_bonus` enum('no','yes') NOT NULL DEFAULT 'no',
  `bill_sale_detail_type` enum('one','many') NOT NULL DEFAULT 'one' COMMENT 'ขายปลีก ขายส่ง',
  `old_price` double(15,4) DEFAULT NULL COMMENT 'ราคาทุน',
  `sub` double(15,4) DEFAULT NULL COMMENT 'ส่วนลด',
  `quotation_detail_id` int(11) DEFAULT NULL COMMENT 'à¸£à¸«à¸±à¸ªà¸£à¸²à¸¢à¸à¸²à¸£ à¹ƒà¸™à¹ƒà¸šà¹€à¸ªà¸™à¸­à¸£à¸²à¸„à¸²',
  `transfer_status` int(1) NOT NULL DEFAULT '0' COMMENT '0 = ยังไม่ส่งไปสรุป, 1 = ส่งไปสรุปแล้ว',
  `transfer_by_user_id` int(11) DEFAULT NULL COMMENT 'รหัสของผู้ส่งข้อมูล',
  `member_id` int(11) DEFAULT NULL COMMENT 'รหัสลูกค้าที่ซื้อสินค้าไป',
  `serial` varchar(255) DEFAULT NULL,
  `point` double(15,4) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL COMMENT 'หมายเหตุการขาย',
  `status` enum('use','delete') NOT NULL,
  `will_send_date` datetime DEFAULT NULL COMMENT 'วันที่ต้องนำสินค้านี้คืน',
  `return_product` float DEFAULT NULL COMMENT 'จำนวนที่ส่งคืนลูกค้า',
  `return_product_id` int(11) DEFAULT NULL COMMENT 'อ้างอิงเลขใบรับคืนสินค้า',
  `send_date_sucees` datetime DEFAULT NULL COMMENT 'วันที่คืนสินค้า(สินค้าเช่า)',
  `product_free` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'สินค้า แถมฟรี',
  `money_added_item` int(6) NOT NULL DEFAULT '0' COMMENT 'ค่าปรับหากจ่ายหนี้ล่าช้า',
  `credit_remark_item` varchar(500) DEFAULT NULL COMMENT 'หมายเหตุ เมื่อรับชำระหนี้',
  `status_pay` int(1) NOT NULL DEFAULT '0' COMMENT '0 = ชำระแล้ว, 1 = ยังไม่ชำระเงิน',
  PRIMARY KEY (`bill_sale_detail_id`),
  KEY `bill_id` (`bill_id`),
  KEY `bill_sale_detail_barcode` (`bill_sale_detail_barcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_bill_sale_detail_online`
--

CREATE TABLE IF NOT EXISTS `tb_bill_sale_detail_online` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_sale_online_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `price` double(15,4) NOT NULL COMMENT 'ราคาขาย',
  `price_cost` double(15,4) NOT NULL COMMENT 'ราคาทุน',
  `qty` double(15,4) NOT NULL COMMENT 'จำนวน',
  `price_total` double(15,4) NOT NULL COMMENT 'ราคารวม',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_bill_sale_online`
--

CREATE TABLE IF NOT EXISTS `tb_bill_sale_online` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `line` varchar(30) DEFAULT NULL,
  `facebook` varchar(50) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `total_money` double(15,4) NOT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `send_date` datetime NOT NULL,
  `send_channel` varchar(50) NOT NULL,
  `send_no` varchar(30) NOT NULL,
  `status` enum('wait','pay','send','accept') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_bill_sale_temp`
--

CREATE TABLE IF NOT EXISTS `tb_bill_sale_temp` (
  `product_total` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_price` int(5) DEFAULT NULL,
  `bill_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_box`
--

CREATE TABLE IF NOT EXISTS `tb_box` (
  `box_id` int(11) NOT NULL AUTO_INCREMENT,
  `box_name` varchar(255) NOT NULL,
  `box_total_per_unit` int(5) NOT NULL,
  `box_detail` text NOT NULL,
  `box_created_date` datetime NOT NULL,
  PRIMARY KEY (`box_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_branch`
--

CREATE TABLE IF NOT EXISTS `tb_branch` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(255) DEFAULT NULL,
  `branch_tel` varchar(255) DEFAULT NULL,
  `branch_email` varchar(255) DEFAULT NULL,
  `branch_address` text,
  `branch_created_date` datetime DEFAULT NULL,
  `branch_vat` int(2) NOT NULL DEFAULT '7' COMMENT 'การคิด vat ของสาขานี้',
  `primary_money` enum('us','kip','baht') NOT NULL DEFAULT 'baht' COMMENT 'สกุลเงินของสาขา',
  `primary_language` varchar(255) NOT NULL DEFAULT 'th' COMMENT 'ภาษาหลักของสาขา',
  `vat_type` enum('no','in','out') NOT NULL DEFAULT 'no' COMMENT 'ประเภทของ vat',
  `use_multi_language` enum('no','yes') NOT NULL DEFAULT 'no' COMMENT 'เปิดใช้ระบบ หลายสกุลเงิน',
  `branch_code` varchar(5) DEFAULT NULL COMMENT 'ข้อความ ไว้ออกบิล',
  `use_delimiter` enum('no','yes') NOT NULL,
  `delimiter` int(1) NOT NULL,
  `use_delimiter2` enum('no','yes') NOT NULL COMMENT 'เปิดใช้งานทศนิยมจำนวน',
  `delimiter2` int(1) NOT NULL DEFAULT '0',
  `reseller` enum('off','on') NOT NULL DEFAULT 'off',
  `use_score_member` enum('yes','no') NOT NULL DEFAULT 'yes',
  `status` enum('use','delete') NOT NULL DEFAULT 'use',
  PRIMARY KEY (`branch_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tb_branch`
--

INSERT INTO `tb_branch` (`branch_id`, `branch_name`, `branch_tel`, `branch_email`, `branch_address`, `branch_created_date`, `branch_vat`, `primary_money`, `primary_language`, `vat_type`, `use_multi_language`, `branch_code`, `use_delimiter`, `delimiter`, `use_delimiter2`, `delimiter2`, `reseller`, `use_score_member`, `status`) VALUES
(5, 'สำนักงานใหญ่', '-', '-', '-', '2017-07-05 11:02:41', 7, 'baht', 'th', 'no', 'no', NULL, 'no', 0, 'no', 0, 'off', 'yes', 'use');

-- --------------------------------------------------------

--
-- Table structure for table `tb_car`
--

CREATE TABLE IF NOT EXISTS `tb_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_license` varchar(255) DEFAULT NULL,
  `car_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `qty_seat` int(11) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT '0' COMMENT '0 = use , 1 = not use',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_car_customer`
--

CREATE TABLE IF NOT EXISTS `tb_car_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL COMMENT 'รหัสเส้นทางเดินรถ',
  `seat` varchar(255) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT '0' COMMENT '0 = use , 1 = not use',
  `price` float DEFAULT '0' COMMENT 'ราคาตั๋ว',
  `user_id` int(11) NOT NULL COMMENT 'ผู้ขาย',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_car_road`
--

CREATE TABLE IF NOT EXISTS `tb_car_road` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_id` int(11) DEFAULT NULL,
  `road_from_to` varchar(255) DEFAULT NULL,
  `time_out_car` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `ticket_price` float NOT NULL,
  `out_time` time DEFAULT NULL COMMENT 'เวลาเดินรถ',
  `status` varchar(10) NOT NULL DEFAULT '0' COMMENT '0 = use , 1 = not use',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_cinema`
--

CREATE TABLE IF NOT EXISTS `tb_cinema` (
  `cinema_id` int(11) NOT NULL AUTO_INCREMENT,
  `cinema_name` varchar(255) DEFAULT NULL COMMENT 'ชื่อโรงหนัง เช่น A, B, C, 1, 2, 3',
  `created_at` datetime DEFAULT NULL COMMENT 'วันที่บันทึก',
  `status` enum('use','delete') NOT NULL DEFAULT 'use' COMMENT 'สถานะโรงหนัง',
  `user_id` int(11) NOT NULL COMMENT 'ผู้บันทึก',
  PRIMARY KEY (`cinema_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_cinema_row`
--

CREATE TABLE IF NOT EXISTS `tb_cinema_row` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `row_name` varchar(2) NOT NULL COMMENT 'ชื่อแถว',
  `cinema_id` int(11) NOT NULL COMMENT 'รหัสโรงหนัง',
  `created_at` datetime DEFAULT NULL COMMENT 'วันที่บันทึก',
  `status` enum('use','delete') NOT NULL DEFAULT 'use' COMMENT 'สถานะการใช้งาน',
  `user_id` int(11) NOT NULL COMMENT 'ผู้บันทึก',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_client`
--

CREATE TABLE IF NOT EXISTS `tb_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(255) DEFAULT NULL,
  `client_score` int(11) DEFAULT NULL,
  `client_regis_date` date DEFAULT NULL,
  `client_serial` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_coupon`
--

CREATE TABLE IF NOT EXISTS `tb_coupon` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT 'ชื่อคูปอง',
  `type` enum('money','percent') NOT NULL COMMENT 'รูปแบบการลด',
  `value` double(15,4) NOT NULL COMMENT 'มูลค่า',
  `branch_id` int(5) NOT NULL,
  `status` enum('use','delete') NOT NULL DEFAULT 'use',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_coupon_detail`
--

CREATE TABLE IF NOT EXISTS `tb_coupon_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(5) NOT NULL COMMENT 'อิงกับ tb_coupon.id',
  `serial` varchar(50) NOT NULL,
  `created` datetime DEFAULT NULL COMMENT 'วันที่สร้าง',
  `expire` datetime DEFAULT NULL COMMENT 'วันหมดอายุ',
  `use` datetime DEFAULT NULL COMMENT 'วันที่ใช้',
  `status` enum('unuse','use','delete') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_customer`
--

CREATE TABLE IF NOT EXISTS `tb_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `customer_tel` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_code` varchar(13) NOT NULL,
  `customer_sex` enum('f','m') NOT NULL,
  `customer_created_date` datetime NOT NULL,
  `customer_birth_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_farmer`
--

CREATE TABLE IF NOT EXISTS `tb_farmer` (
  `farmer_id` int(11) NOT NULL AUTO_INCREMENT,
  `farmer_name` varchar(500) NOT NULL,
  `farmer_tel` varchar(50) DEFAULT NULL,
  `farmer_address` text,
  `farmer_created_date` datetime NOT NULL,
  `status` enum('use','delete') NOT NULL DEFAULT 'use',
  PRIMARY KEY (`farmer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tb_farmer`
--

INSERT INTO `tb_farmer` (`farmer_id`, `farmer_name`, `farmer_tel`, `farmer_address`, `farmer_created_date`, `status`) VALUES
(2, 'ทั่วไป', '', '', '2017-07-05 11:11:43', 'use');

-- --------------------------------------------------------

--
-- Table structure for table `tb_finance`
--

CREATE TABLE IF NOT EXISTS `tb_finance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finance_type` varchar(50) NOT NULL,
  `finance_date` datetime NOT NULL,
  `finance_down` double(15,4) NOT NULL,
  `finance_net` double(15,4) DEFAULT NULL,
  `finance_interest` double(15,4) NOT NULL,
  `finance_interest_type` enum('percent','money') NOT NULL DEFAULT 'percent',
  `round` int(11) NOT NULL,
  `money_per_round` double(15,4) NOT NULL,
  `bill_sale_id` int(11) NOT NULL,
  `status` enum('owe','paid','cancel') NOT NULL DEFAULT 'owe',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_finance_detail`
--

CREATE TABLE IF NOT EXISTS `tb_finance_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finance_id` int(11) NOT NULL,
  `no` int(6) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `money` double(15,4) DEFAULT NULL,
  `late_day` int(6) DEFAULT NULL,
  `fines_price` double(15,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_group_product`
--

CREATE TABLE IF NOT EXISTS `tb_group_product` (
  `group_product_id` int(5) NOT NULL AUTO_INCREMENT,
  `group_product_code` varchar(50) NOT NULL,
  `group_product_name` varchar(255) NOT NULL,
  `group_product_detail` text,
  `group_product_created_date` datetime NOT NULL,
  `group_product_last_update` datetime NOT NULL,
  `group_product_name_lao` varchar(255) DEFAULT NULL COMMENT 'ชื่อภาษา ลาว',
  `group_product_name_eng` varchar(255) DEFAULT NULL COMMENT 'ชื่อภาษา อังกฤษ',
  `status` enum('use','delete') NOT NULL DEFAULT 'use',
  PRIMARY KEY (`group_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `tb_group_product`
--

INSERT INTO `tb_group_product` (`group_product_id`, `group_product_code`, `group_product_name`, `group_product_detail`, `group_product_created_date`, `group_product_last_update`, `group_product_name_lao`, `group_product_name_eng`, `status`) VALUES
(13, 'ETC', 'ทั่วไป', '', '2017-07-05 11:11:27', '2017-07-05 11:11:27', '', '', 'use');

-- --------------------------------------------------------

--
-- Table structure for table `tb_group_product_box`
--

CREATE TABLE IF NOT EXISTS `tb_group_product_box` (
  `group_product_id` int(11) NOT NULL,
  `box_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_import_product`
--

CREATE TABLE IF NOT EXISTS `tb_import_product` (
  `import_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `import_product_total` int(5) NOT NULL,
  `import_product_price` int(4) NOT NULL,
  `import_product_created_date` datetime NOT NULL,
  `farmer_id` int(11) NOT NULL,
  `box_id` int(11) NOT NULL,
  PRIMARY KEY (`import_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_language`
--

CREATE TABLE IF NOT EXISTS `tb_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` varchar(255) NOT NULL COMMENT 'หน้าจอ',
  `label` varchar(255) NOT NULL COMMENT 'คำเดิม',
  `label_output` varchar(255) DEFAULT NULL COMMENT 'คำใหม่',
  `name` varchar(255) NOT NULL COMMENT 'ชื่อของป้าย Label',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_main_menu`
--

CREATE TABLE IF NOT EXISTS `tb_main_menu` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `menu_id` int(6) DEFAULT NULL COMMENT 'รหัสเมนูตัวแม่',
  `url` varchar(255) DEFAULT NULL COMMENT 'url ของเมนูนี้',
  `icon` varchar(255) NOT NULL COMMENT 'icon ประจำเมนู',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=712 ;

--
-- Dumping data for table `tb_main_menu`
--

INSERT INTO `tb_main_menu` (`id`, `name`, `menu_id`, `url`, `icon`) VALUES
(1, 'บันทึกประจำวัน', NULL, NULL, 'fa fa-book'),
(2, 'รายงาน', NULL, NULL, 'fa fa-file-alt'),
(3, 'Stock สินค้า', NULL, NULL, 'fa fa-th'),
(4, 'ส่งเสริมการขาย', NULL, NULL, 'fa fa-medkit'),
(5, 'บัญชี', NULL, NULL, 'fa fa-laptop'),
(6, 'ตั้งค่าพื้นฐาน', NULL, NULL, 'fa fa-cog'),
(7, 'ตั้งค่าระบบ', NULL, NULL, 'fa fa-cogs'),
(101, 'ขายสินค้า', 1, 'sale', ''),
(102, 'รับคืนสินค้า', 1, 'getProduct', ''),
(201, 'ภาพรวมของร้าน', 2, 'dashboard', ''),
(202, 'ยอดขายรายวันแยกตามสินค้า', 2, 'salePerDayByProduct', ''),
(203, 'กำไร ขาดทุน', 2, 'income', ''),
(204, 'รายละเอียดการขาย', 2, 'saleDetail', ''),
(205, 'ยอดขายรายวัน', 2, 'salePerDay', ''),
(206, 'สรุปยอดขายรายวัน', 2, 'sumSalePerDay', ''),
(207, 'สรุปยอดขายรายเดือน', 2, 'sumSalePerMonth', ''),
(209, 'สรุปยอดขายตามสมาชิก', 2, 'sumSalePerMember', ''),
(210, 'สรุปยอดขายตามพนักงาน', 2, 'sumSaleEmployee', ''),
(211, 'Stock สินค้า', 2, 'reportStock', ''),
(212, 'ลูกหนี้', 2, 'reportAr', ''),
(213, 'เจ้าหนี้', 2, 'reportIr', ''),
(214, 'ความเคลื่อนไหวของ สต้อก', 2, 'stockHistory', ''),
(215, 'สรุปยอดขายตามช่องทาง', 2, 'sumSaleChannel', ''),
(301, 'รับสินค้าเข้าสต้อก', 3, 'stock', ''),
(302, 'ใบสั่งซื้อ : PO', 3, 'po', ''),
(303, 'เบิกสินค้า', 3, 'forGetProduct', ''),
(304, 'รับสินค้า', 3, 'getProductFromRequest', ''),
(305, 'โอนสินค้า', 3, 'transferProduct', ''),
(306, 'ปรับยอดสต้อก', 3, 'adjust', ''),
(401, 'กำหนดคะแนนสะสม', 4, 'point', ''),
(402, 'ราคาแบบเหมา เช่น 3 ชิ้น 100', 4, 'price3per100', ''),
(403, 'คูปองส่วนลด', 4, 'coupon', ''),
(404, 'ซื้อ 5 แถม 1 ชิ้น', 4, 'buy5free1', ''),
(501, 'จัดการบิลขาย', 5, 'billSale', ''),
(502, 'ใบเสนอราคา', 5, 'quotationBill', ''),
(503, 'ประเภทรายจ่าย', 5, 'payType', ''),
(504, 'บันทึกรายจ่าย', 5, 'pay', ''),
(505, 'คะแนนสะสมของสมาชิก', 5, 'scoreOfMember', ''),
(601, 'ข้อมูลร้านค้า', 6, 'org', ''),
(602, 'อัตราแลกเปลี่ยนเงินตรา', 6, 'exchange', ''),
(603, 'คลังสินค้า/สาขา', 6, 'branch', ''),
(604, 'ช่องทางการจำหน่าย', 6, 'channel', ''),
(605, 'ช่องทางชำระเงิน', 6, 'payment', ''),
(606, 'ประเภทสินค้า', 6, 'groupProduct', ''),
(607, 'สินค้า', 6, 'product', ''),
(608, 'ราคาจำหน่าย', 6, 'pricePerMemberGroup', ''),
(609, 'ผู้จำหน่ายสินค้า', 6, 'farmer', ''),
(610, 'ประเภทสมาชิก-ลูกค้า', 6, 'memberType', ''),
(611, 'สมาชิกร้าน-ลูกค้า', 6, 'member', ''),
(612, 'ผู้ใช้งานระบบ', 6, 'users', ''),
(613, 'เงินในลิ้นชัก', 6, 'moneyInDrawcash', ''),
(711, 'ใบสั่งซื้อจาก iCommerce', 2, 'orderFromICommerce', ''),
(701, 'สิทธิการเข้าใช้เมนูต่างๆ', 7, 'role', ''),
(702, 'รูปแบบการรันเลขเอกสาร', 7, 'docRunning', ''),
(703, 'ตั้งค่าการพิมพ์บิล', 7, 'billSetting', ''),
(704, 'ตั้งค่าบิลและสินค้าขั้นต่ำ', 7, 'printSetting', ''),
(705, 'เงื่อนไขการขาย', 7, 'saleSetting', ''),
(706, 'สินค้าส่งคืน', 2, 'reportIsRent', ''),
(707, 'ยอดขายตามช่องทางการชำระ', 2, 'sumSalePerPayment', ''),
(708, 'ลงทะเบียนสมาชิก', 1, 'catalogrg', ''),
(709, 'รูปภาพแคตตาล็อก', 1, 'catalogimg', ''),
(710, 'รายงานเบิกสินค้า', 2, 'reportForGetProduct', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_member`
--

CREATE TABLE IF NOT EXISTS `tb_member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_code` varchar(50) NOT NULL,
  `member_name` varchar(255) NOT NULL,
  `member_tel` varchar(255) DEFAULT NULL,
  `member_address` varchar(255) DEFAULT NULL,
  `member_created_date` datetime NOT NULL,
  `branch_id` int(11) NOT NULL,
  `remark` varchar(1000) DEFAULT NULL COMMENT 'à¸£à¸²à¸¢à¸¥à¸°à¹€à¸­à¸µà¸¢à¸”à¹€à¸žà¸´à¹ˆà¸¡à¹€à¸•à¸´à¸¡',
  `tax_code` varchar(20) DEFAULT NULL COMMENT 'เลขผู้เสียภาษี',
  `member_group_id` int(11) DEFAULT NULL COMMENT 'รหัส ประเภทสมาชิก',
  `channel_id` int(11) DEFAULT NULL COMMENT 'ช่องทางการจำหน่าย',
  `user_id` int(11) DEFAULT NULL COMMENT 'รหัส พนักงานขาย ที่ดูแลลูกค้า',
  `pay_type` enum('cash','credit') NOT NULL DEFAULT 'cash' COMMENT 'รูปแบบการชำระเงิน',
  `credit_term` int(3) NOT NULL DEFAULT '60' COMMENT 'จำนวนวันที่ให้ เครดิต',
  `type_sale` enum('no','one','many','many2','many3','many4','many5') NOT NULL DEFAULT 'no' COMMENT 'ราคาจำหน่าย',
  `status` enum('use','delete') NOT NULL DEFAULT 'use',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=153 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_modules`
--

CREATE TABLE IF NOT EXISTS `tb_modules` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `mod_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_module_jamnam_customer`
--

CREATE TABLE IF NOT EXISTS `tb_module_jamnam_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL COMMENT 'รหัสลูกค้า',
  `name` varchar(255) NOT NULL COMMENT 'ชื่อ',
  `tel` varchar(255) DEFAULT NULL COMMENT 'เบอร์โทร',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'หมายเหตุ',
  `created_at` datetime DEFAULT NULL COMMENT 'วันที่บันทึก',
  `status` enum('use','delete') NOT NULL DEFAULT 'use' COMMENT 'สถานะการใช้งาน',
  `user_id` int(11) NOT NULL COMMENT 'ผู้บันทึก',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_module_jamnam_product`
--

CREATE TABLE IF NOT EXISTS `tb_module_jamnam_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'ชื่อ',
  `brand` varchar(255) DEFAULT NULL COMMENT 'ยี่ห้อ',
  `release_name` varchar(255) DEFAULT NULL COMMENT 'รุ่น',
  `serial` varchar(255) DEFAULT NULL COMMENT 'เลขเครื่อง',
  `from_date` datetime DEFAULT NULL COMMENT 'จากวันที่',
  `to_date` datetime DEFAULT NULL COMMENT 'ถึงวันที่',
  `add_money` varchar(255) DEFAULT NULL COMMENT 'ดอกเบี้ย (บาท)',
  `tel` varchar(255) DEFAULT NULL COMMENT 'เบอร์โทรติดต่อ',
  `created_at` datetime DEFAULT NULL COMMENT 'วันที่บันทึก',
  `status` enum('use','delete') NOT NULL DEFAULT 'use' COMMENT 'สถานะการใช้งาน',
  `user_id` int(11) NOT NULL COMMENT 'ผู้บันทึก',
  `module_jamnam_customer_id` int(1) NOT NULL DEFAULT '0' COMMENT 'รหัสลูกค้า',
  `price` int(7) NOT NULL DEFAULT '0' COMMENT 'รหัสลูกค้า',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_module_jamnam_table_pay`
--

CREATE TABLE IF NOT EXISTS `tb_module_jamnam_table_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_jamnam_customer_id` int(11) NOT NULL COMMENT 'รหัสลูกค้า',
  `due_date` datetime NOT NULL COMMENT 'วันกำหนดชำระ',
  `money` int(6) NOT NULL COMMENT 'ยอดเงิน',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'หมายเหตุ',
  `created_at` datetime DEFAULT NULL COMMENT 'วันที่บันทึก',
  `status` enum('use','delete') NOT NULL DEFAULT 'use' COMMENT 'สถานะการใช้งาน',
  `user_id` int(11) NOT NULL COMMENT 'ผู้บันทึก',
  `pay_status` int(1) NOT NULL DEFAULT '0' COMMENT '0 = ยังไม่จ่าย, 1 = จ่ายแล้ว',
  `module_jamnam_product_id` int(11) NOT NULL COMMENT 'รหัสสินค้าที่นำมาจำนำ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_food_menu`
--

CREATE TABLE IF NOT EXISTS `tb_mod_food_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `menu_name` varchar(255) NOT NULL COMMENT 'ชื่อเมนู',
  `menu_group_id` int(3) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` int(7) NOT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `status` varchar(6) NOT NULL DEFAULT 'use',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_food_menu_group`
--

CREATE TABLE IF NOT EXISTS `tb_mod_food_menu_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `group_name` varchar(255) NOT NULL COMMENT 'ชื่อหมวดอาหาร',
  `status` varchar(6) NOT NULL DEFAULT 'use',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_food_order`
--

CREATE TABLE IF NOT EXISTS `tb_mod_food_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `table_id` int(5) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` enum('open','close','wait','cancel','completed') DEFAULT 'open',
  `created_at` datetime NOT NULL,
  `db_status` varchar(6) NOT NULL DEFAULT 'use',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_food_order_detail`
--

CREATE TABLE IF NOT EXISTS `tb_mod_food_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `order_id` int(5) NOT NULL,
  `menu_id` int(5) NOT NULL,
  `detail_price` int(7) NOT NULL,
  `qty` int(5) NOT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `status` enum('use','delete') DEFAULT 'use',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_food_table`
--

CREATE TABLE IF NOT EXISTS `tb_mod_food_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `tb_name` varchar(255) NOT NULL COMMENT 'ชื่อโต้ะ',
  `status` varchar(6) DEFAULT 'use',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_payroll_add_money`
--

CREATE TABLE IF NOT EXISTS `tb_mod_payroll_add_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `employee_id` int(11) NOT NULL,
  `name` varchar(1000) DEFAULT NULL,
  `money` int(5) DEFAULT NULL,
  `remark` varchar(2500) DEFAULT NULL,
  `created_date` date NOT NULL,
  `add_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_payroll_depart`
--

CREATE TABLE IF NOT EXISTS `tb_mod_payroll_depart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `name` varchar(255) NOT NULL COMMENT 'ชื่อ',
  `code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_payroll_employee`
--

CREATE TABLE IF NOT EXISTS `tb_mod_payroll_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `depart_id` int(11) NOT NULL,
  `sub_depart_id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position_name` varchar(500) DEFAULT NULL,
  `demo_job_start` date DEFAULT NULL,
  `demo_job_end` date DEFAULT NULL,
  `emp_start` date DEFAULT NULL,
  `emp_end` date DEFAULT NULL COMMENT 'วันสิ้นสุดการเป็นพนักงาน',
  `current_salary` int(6) DEFAULT NULL,
  `remark` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_payroll_employee_ta`
--

CREATE TABLE IF NOT EXISTS `tb_mod_payroll_employee_ta` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `table_job_id` int(11) NOT NULL,
  `ta_year` int(4) NOT NULL,
  `ta_month` int(2) NOT NULL,
  `ta_day` int(2) NOT NULL,
  `ta_shift_start` varchar(10) NOT NULL,
  `ta_shift_end` varchar(10) NOT NULL,
  `ta_shift_break_start` varchar(10) NOT NULL,
  `ta_shift_break_end` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_payroll_employee_table_job`
--

CREATE TABLE IF NOT EXISTS `tb_mod_payroll_employee_table_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `employee_id` int(11) NOT NULL,
  `table_job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_payroll_employee_ta_detail`
--

CREATE TABLE IF NOT EXISTS `tb_mod_payroll_employee_ta_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `ta_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `ta_time_start` varchar(10) NOT NULL,
  `ta_time_end` varchar(10) NOT NULL,
  `ta_break_start` varchar(10) NOT NULL,
  `ta_break_end` varchar(10) NOT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `shift_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_payroll_leave`
--

CREATE TABLE IF NOT EXISTS `tb_mod_payroll_leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `employee_id` int(11) NOT NULL,
  `leave_name` varchar(1000) DEFAULT NULL,
  `leave_full` varchar(100) DEFAULT NULL COMMENT 'full = เต็มวัน, mid1 = ครึ่งวันเช้า, mid2 = ครึ่งวันบ่าย',
  `remark` varchar(1500) DEFAULT NULL,
  `created_date` date DEFAULT NULL COMMENT 'วันที่บันทึกลา',
  `alert_date` date DEFAULT NULL COMMENT 'วันที่แจ้ง',
  `leave_date` date DEFAULT NULL COMMENT 'วันที่ลา',
  `sub_money` varchar(10) DEFAULT NULL COMMENT 'yes = หักเงิน, no = ไม่หักเงิน',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_payroll_shift`
--

CREATE TABLE IF NOT EXISTS `tb_mod_payroll_shift` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `name` varchar(255) NOT NULL COMMENT 'ชื่อ',
  `code` varchar(15) DEFAULT NULL,
  `start_time` varchar(10) DEFAULT NULL,
  `end_time` varchar(10) DEFAULT NULL,
  `start_break` varchar(10) DEFAULT NULL,
  `end_break` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_payroll_shift_employee`
--

CREATE TABLE IF NOT EXISTS `tb_mod_payroll_shift_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `shift_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_payroll_social_security`
--

CREATE TABLE IF NOT EXISTS `tb_mod_payroll_social_security` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `employee_id` int(11) NOT NULL,
  `ss_date` date DEFAULT NULL COMMENT 'วันที่เริ่มประกันสังคม',
  `remark` varchar(1500) DEFAULT NULL COMMENT 'หมายเหตุ',
  `ss_percen` int(2) NOT NULL COMMENT 'จำนวนเปอร์เซนต์ ที่หักพนักงาน',
  `ss_over` int(4) NOT NULL COMMENT 'หักได้ไม่เกิน x บาท',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_payroll_sub_depart`
--

CREATE TABLE IF NOT EXISTS `tb_mod_payroll_sub_depart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `name` varchar(255) NOT NULL COMMENT 'ชื่อ',
  `code` varchar(15) DEFAULT NULL,
  `depart_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_payroll_sub_money`
--

CREATE TABLE IF NOT EXISTS `tb_mod_payroll_sub_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `employee_id` int(11) NOT NULL,
  `name` varchar(1000) DEFAULT NULL,
  `money` int(5) DEFAULT NULL,
  `remark` varchar(2500) DEFAULT NULL,
  `created_date` date NOT NULL,
  `sub_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_payroll_table_job`
--

CREATE TABLE IF NOT EXISTS `tb_mod_payroll_table_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `name` varchar(255) NOT NULL COMMENT 'ชื่อ',
  `code` varchar(15) DEFAULT NULL,
  `remark` varchar(2000) DEFAULT NULL,
  `day1_shift_id` int(11) DEFAULT NULL,
  `day2_shift_id` int(11) DEFAULT NULL,
  `day3_shift_id` int(11) DEFAULT NULL,
  `day4_shift_id` int(11) DEFAULT NULL,
  `day5_shift_id` int(11) DEFAULT NULL,
  `day6_shift_id` int(11) DEFAULT NULL,
  `day7_shift_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_payroll_work_time`
--

CREATE TABLE IF NOT EXISTS `tb_mod_payroll_work_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `start_minute` int(3) NOT NULL DEFAULT '0' COMMENT 'นาทีที่เริ่มการหักเงิน',
  `first_sub_money` int(3) DEFAULT NULL COMMENT 'เริ่มต้นการหักที่ x บาท',
  `remark` varchar(1500) DEFAULT NULL COMMENT 'หมายเหตุ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_room`
--

CREATE TABLE IF NOT EXISTS `tb_mod_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `name` varchar(255) NOT NULL COMMENT 'ชื่อ',
  `price_per_day` int(4) DEFAULT NULL,
  `price_per_month` int(5) DEFAULT NULL,
  `price_per_round` int(4) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `room_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_room_add_money`
--

CREATE TABLE IF NOT EXISTS `tb_mod_room_add_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `name` varchar(255) NOT NULL COMMENT 'ชื่อ',
  `remark` varchar(15) DEFAULT NULL,
  `add_money` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_room_miter`
--

CREATE TABLE IF NOT EXISTS `tb_mod_room_miter` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `room_id` int(11) NOT NULL,
  `water_start` float DEFAULT NULL,
  `water_current` float DEFAULT NULL,
  `elec_start` float DEFAULT NULL,
  `elec_current` float DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `created_at` date NOT NULL,
  `data_of_month` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_room_stay`
--

CREATE TABLE IF NOT EXISTS `tb_mod_room_stay` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `stay_type` varchar(255) NOT NULL,
  `room_id` int(4) DEFAULT NULL,
  `stay_from` date DEFAULT NULL,
  `stay_to` date DEFAULT NULL,
  `id_card` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `matjam` int(4) DEFAULT NULL,
  `stay_day` int(3) DEFAULT NULL,
  `total_pay` int(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `price` int(5) NOT NULL,
  `total_guest` int(1) NOT NULL,
  `out_date` date DEFAULT NULL,
  `room_time_out_at` varchar(55) DEFAULT NULL COMMENT 'เวลาออก ',
  `room_time_in_at` varchar(55) DEFAULT NULL COMMENT 'เวลาเข้า ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_room_type`
--

CREATE TABLE IF NOT EXISTS `tb_mod_room_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `name` varchar(255) NOT NULL COMMENT 'ชื่อ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mod_room_water`
--

CREATE TABLE IF NOT EXISTS `tb_mod_room_water` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `water_per_unit` float DEFAULT NULL,
  `electricity_per_unit` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_movies`
--

CREATE TABLE IF NOT EXISTS `tb_movies` (
  `movies_id` int(11) NOT NULL AUTO_INCREMENT,
  `movies_name` varchar(255) DEFAULT NULL COMMENT 'ชื่อหนัง',
  `movies_language` varchar(255) DEFAULT NULL COMMENT 'ภาษาในการพูด',
  `created_at` datetime DEFAULT NULL COMMENT 'วันที่บันทึก',
  `status` enum('use','delete') NOT NULL DEFAULT 'use' COMMENT 'สถานะหนัง',
  `user_id` int(11) NOT NULL COMMENT 'ผู้บันทึก',
  PRIMARY KEY (`movies_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_organization`
--

CREATE TABLE IF NOT EXISTS `tb_organization` (
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  `version_jpos` varchar(50) NOT NULL,
  `org_name` varchar(255) NOT NULL,
  `org_address_1` varchar(255) NOT NULL,
  `org_address_2` varchar(255) NOT NULL,
  `org_address_3` varchar(255) NOT NULL,
  `org_address_4` varchar(255) NOT NULL,
  `org_tel` varchar(255) NOT NULL,
  `org_fax` varchar(255) NOT NULL,
  `org_tax_code` varchar(100) NOT NULL,
  `org_current_version` varchar(10) DEFAULT NULL,
  `org_name_eng` varchar(255) DEFAULT NULL,
  `org_logo_show_on_bill` enum('no','yes') NOT NULL,
  `org_logo` varchar(255) NOT NULL,
  `logo_show_on_header` enum('no','yes') NOT NULL DEFAULT 'no',
  `logo_show_on_header_bg` enum('no','yes') NOT NULL DEFAULT 'no',
  `use_relax_system` enum('yes','no') NOT NULL DEFAULT 'yes' COMMENT 'ใช้งานระบบผ่อน หรือไม่',
  `business_type` varchar(255) DEFAULT NULL COMMENT 'ชนิดธุรกิจเฉพาะ',
  `email` varchar(255) DEFAULT NULL COMMENT 'อีเมล์ร้าน',
  `line_id` varchar(255) DEFAULT NULL COMMENT 'line id',
  `website` varchar(255) DEFAULT NULL COMMENT 'website',
  `expire_date` date DEFAULT NULL,
  `use_auto_complete` int(1) NOT NULL DEFAULT '0' COMMENT 'เปิดใช้ระบบขายแบบ autocomplete 0 = ไม่ใช้, 1 = ใช้',
  `org_enddate_license` varchar(255) DEFAULT NULL COMMENT 'วันสิ้นอายุ ใบอนุญาติ',
  `org_license` varchar(255) DEFAULT NULL COMMENT 'เลขที่ใบอนุญาติ',
  `show_master` varchar(10) NOT NULL DEFAULT 'yes' COMMENT 'แสดงคำว่า ต้นฉบับ บนบิลรวม',
  `single_page` varchar(10) NOT NULL DEFAULT 'yes' COMMENT 'พิมพ์บิลรวมแบบ หน้าสองแผ่น',
  `use_local_storage` int(1) NOT NULL DEFAULT '0' COMMENT 'หน่วยความจำภายในเครื่องลูกข่าย autocomplete 0 = ไม่ใช้, 1 = ใช้',
  `use_auto_print` varchar(10) NOT NULL DEFAULT 'no' COMMENT 'เปิดใช้ระบบพิมพ์ออโต้',
  PRIMARY KEY (`org_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tb_organization`
--

INSERT INTO `tb_organization` (`org_id`, `version_jpos`, `org_name`, `org_address_1`, `org_address_2`, `org_address_3`, `org_address_4`, `org_tel`, `org_fax`, `org_tax_code`, `org_current_version`, `org_name_eng`, `org_logo_show_on_bill`, `org_logo`, `logo_show_on_header`, `logo_show_on_header_bg`, `use_relax_system`, `business_type`, `email`, `line_id`, `website`, `expire_date`, `use_auto_complete`, `org_enddate_license`, `org_license`, `show_master`, `single_page`, `use_local_storage`, `use_auto_print`) VALUES
(1, '2019.05.13.1430', 'jPOS Minimart', '-', '-', '-', '-', '-', '-', '-', NULL, '', 'yes', '0009237001429866100.png', 'yes', 'no', 'yes', NULL, NULL, NULL, NULL, '2020-05-14', 0, NULL, NULL, 'yes', 'yes', 0, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `tb_payment`
--

CREATE TABLE IF NOT EXISTS `tb_payment` (
  `payment_id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `status` enum('use','delete') NOT NULL DEFAULT 'use',
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tb_payment`
--

INSERT INTO `tb_payment` (`payment_id`, `name`, `status`) VALUES
(1, 'เงินสด', 'use'),
(2, 'การโอน', 'use'),
(3, 'บัตรเครดิต', 'use'),
(4, 'การสแกน', 'use');

-- --------------------------------------------------------

--
-- Table structure for table `tb_percen_sale`
--

CREATE TABLE IF NOT EXISTS `tb_percen_sale` (
  `percen_sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `percen_sale_total` int(3) NOT NULL,
  `percen_sale_created_date` datetime NOT NULL,
  PRIMARY KEY (`percen_sale_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_product`
--

CREATE TABLE IF NOT EXISTS `tb_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK à¸ªà¸´à¸™à¸„à¹‰à¸²',
  `group_product_id` int(5) NOT NULL DEFAULT '0' COMMENT 'รหัส หมวดสินค้า',
  `product_code` varchar(50) NOT NULL DEFAULT '' COMMENT 'บาโค้ด',
  `product_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'ชื่อสินค้า',
  `product_detail` text COMMENT 'รายละเอียด',
  `product_location` varchar(100) DEFAULT NULL,
  `product_created_date` datetime DEFAULT NULL COMMENT 'à¸§à¸±à¸™à¸—à¸µà¹ˆà¸šà¸±à¸™à¸—à¸¶à¸',
  `product_last_update` datetime DEFAULT NULL COMMENT 'à¸§à¸±à¸™à¸—à¸µà¹ˆà¸­à¸±à¸žà¹€à¸”à¸•à¸¥à¹ˆà¸²à¸ªà¸¸à¸”',
  `product_quantity` double(15,4) DEFAULT NULL,
  `product_pack_barcode` varchar(255) NOT NULL DEFAULT '' COMMENT 'รหัสแพค',
  `product_total_per_pack` int(5) NOT NULL COMMENT 'à¸ˆà¸³à¸™à¸§à¸™à¸•à¹ˆà¸­à¹à¸žà¸„',
  `product_expire` enum('expire','fresh') NOT NULL DEFAULT 'expire' COMMENT 'สินค้าสด/ไม่สด',
  `product_return` enum('in','out') NOT NULL DEFAULT 'in' COMMENT 'สินค้าของร้าน',
  `product_expire_date` date DEFAULT NULL COMMENT 'à¸§à¸±à¸™à¸«à¸¡à¸”à¸­à¸²à¸¢à¸¸',
  `product_sale_condition` enum('sale','prompt') DEFAULT NULL COMMENT 'เงื่อนไขการขาย',
  `product_price` double(15,4) NOT NULL COMMENT 'ราคาจำหน่าย',
  `product_price_send` double(15,4) NOT NULL COMMENT 'ราคาขายส่ง',
  `product_price_per_pack` int(6) NOT NULL COMMENT 'à¸£à¸²à¸„à¸²à¸•à¹ˆà¸­à¹à¸žà¸„',
  `product_quantity_of_pack` int(5) NOT NULL COMMENT 'à¸ˆà¸³à¸™à¸§à¸™à¸„à¸‡à¹€à¸«à¸¥à¸·à¸­ à¹à¸žà¸„',
  `product_price_buy` double(15,4) NOT NULL COMMENT 'ต้นทุนเฉลีย',
  `product_tag` int(1) NOT NULL DEFAULT '0',
  `product_pic` varchar(255) DEFAULT NULL,
  `weight` double(15,4) DEFAULT NULL COMMENT 'น้ำหนักสินค้า',
  `product_name_lao` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ชื่อสินค้า ภาษาลาว',
  `product_name_eng` varchar(255) DEFAULT NULL COMMENT 'ชื่อสินค้า ภาษาอังกฤษ',
  `is_vat` enum('yes','no') NOT NULL DEFAULT 'yes' COMMENT 'ให้คำนวณ vat หรือไม่',
  `is_reduce_group` enum('yes','no') NOT NULL DEFAULT 'yes' COMMENT 'ให้คิดส่วนลดกลุ่มได้หรือไม่',
  `company_id` int(11) DEFAULT NULL COMMENT 'รหัสบริษัทที่จัดจำหน่าย สินค้านี้',
  `product_relate_id1` int(11) DEFAULT NULL COMMENT 'สินค้า เชื่อมโยง ตัวที่ 1',
  `product_relate_qty1` double(15,4) DEFAULT NULL COMMENT 'จำนวนที่จะตัดสินค้าเชื่อมโยง ต้วที่ 1',
  `product_relate_id2` int(11) DEFAULT NULL COMMENT 'สินค้า เชื่อมโยง ตัวที่ 2',
  `product_relate_qty2` double(15,4) DEFAULT NULL COMMENT 'จำนวนที่จะตัดสินค้าเชื่อมโยง ต้วที่ 2',
  `product_relate_id3` int(11) DEFAULT NULL COMMENT 'สินค้า เชื่อมโยง ตัวที่ 3',
  `product_relate_qty3` double(15,4) DEFAULT NULL COMMENT 'จำนวนที่จะตัดสินค้าเชื่อมโยง ต้วที่ 3',
  `product_relate_id4` int(11) DEFAULT NULL COMMENT 'สินค้า เชื่อมโยง ตัวที่ 4',
  `product_relate_qty4` double(15,4) DEFAULT NULL COMMENT 'จำนวนที่จะตัดสินค้าเชื่อมโยง ต้วที่ 4',
  `product_relate_id5` int(11) DEFAULT NULL COMMENT 'สินค้า เชื่อมโยง ตัวที่ 5',
  `product_relate_qty5` double(15,4) DEFAULT NULL COMMENT 'จำนวนที่จะตัดสินค้าเชื่อมโยง ต้วที่ 5',
  `farmer_id` int(11) DEFAULT NULL COMMENT 'รหัส ผู้จำหน่ายสินค้านี้',
  `product_code_2` varchar(50) DEFAULT NULL COMMENT 'รหัสสินค้า (รหัสรอง)',
  `unit_name` varchar(255) DEFAULT NULL COMMENT 'หน่วยสินค้า',
  `sale_by` enum('barcode','serial') NOT NULL,
  `status` enum('use','delete') NOT NULL DEFAULT 'use',
  `price_send_2` float DEFAULT NULL COMMENT 'ราคาส่ง 2',
  `price_send_3` float DEFAULT NULL COMMENT 'ราคาส่ง 3',
  `price_send_4` float DEFAULT NULL COMMENT 'ราคาส่ง 4',
  `price_send_5` float DEFAULT NULL COMMENT 'ราคาส่ง 5',
  `is_rent` varchar(30) DEFAULT 'no',
  `is_show_on_bill` varchar(30) DEFAULT 'yes',
  `min_stock` float DEFAULT NULL COMMENT 'สินค้าขั้นต่ำ',
  `child_barcode` varchar(50) DEFAULT NULL COMMENT 'barcode สินค้าลูก',
  `child_price` float DEFAULT NULL COMMENT 'ราคา สินค้าลูก',
  `qty_of_parent` int(4) DEFAULT NULL COMMENT 'จำนวนในสินค้าแม่',
  `warranty_old` int(4) DEFAULT NULL COMMENT 'อายุการรับประกัน ',
  `child_barcode_3` varchar(20) DEFAULT NULL COMMENT 'บาโค้ด ชั้นที่ 3',
  `child_price_3` int(7) DEFAULT NULL COMMENT 'ราคาขาย ชั้นที่ 3',
  `qty_of_child_barcode` int(7) DEFAULT NULL COMMENT 'จำนวนต่อสินค้าแม่ ชั้นที่ 3',
  `fk_child_barcode` varchar(20) DEFAULT NULL COMMENT 'รหัสสินค้าแม่ ชั้นที่ 2',
  `child_barcode_4` varchar(20) DEFAULT NULL COMMENT 'บาโค้ด ชั้นที่ 4',
  `child_price_4` int(7) DEFAULT NULL COMMENT 'ราคาขาย ชั้นที่ 4',
  `qty_of_child_barcode_3` int(7) DEFAULT NULL COMMENT 'จำนวนต่อสินค้าแม่ ชั้นที่ 4',
  `fk_child_barcode_3` varchar(20) DEFAULT NULL COMMENT 'รหัสสินค้าแม่ ชั้นที่ 3',
  `child_barcode_5` varchar(20) DEFAULT NULL COMMENT 'บาโค้ด ชั้นที่ 5',
  `child_price_5` int(7) DEFAULT NULL COMMENT 'ราคาขาย ชั้นที่ 5',
  `qty_of_child_barcode_4` int(7) DEFAULT NULL COMMENT 'จำนวนต่อสินค้าแม่ ชั้นที่ 5',
  `fk_child_barcode_4` varchar(20) DEFAULT NULL COMMENT 'รหัสสินค้าแม่ ชั้นที่ 4',
  `point` int(4) DEFAULT NULL COMMENT 'คะแนนของสินค้านั้นๆ เมื่อขายได้',
  `not_vat` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'สินค้าไม่คิดแวท',
  `product_details_remark` text COMMENT 'รายละเอียดสินค้า',
  PRIMARY KEY (`product_id`),
  KEY `product_code` (`product_code`),
  KEY `product_name` (`product_name`),
  KEY `product_name_lao` (`product_name_lao`),
  KEY `product_name_eng` (`product_name_eng`),
  KEY `group_product_id` (`group_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4059 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_product_box`
--

CREATE TABLE IF NOT EXISTS `tb_product_box` (
  `product_id` int(11) NOT NULL,
  `box_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_product_price`
--

CREATE TABLE IF NOT EXISTS `tb_product_price` (
  `product_price_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `box_id` int(11) NOT NULL,
  `product_price_price` int(8) NOT NULL,
  `product_price_barcode` varchar(50) NOT NULL,
  PRIMARY KEY (`product_price_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_product_price_per_unit`
--

CREATE TABLE IF NOT EXISTS `tb_product_price_per_unit` (
  `product_id` int(11) NOT NULL,
  `product_price_per_unit_barcode` varchar(255) DEFAULT NULL,
  `product_price_per_unit_price` int(11) DEFAULT NULL,
  `product_price_per_unit_old_price` double(15,4) NOT NULL,
  `product_price_per_unit_sent` int(11) DEFAULT NULL,
  `product_price_per_unit_idint` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_product_serial`
--

CREATE TABLE IF NOT EXISTS `tb_product_serial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_code` int(11) NOT NULL,
  `serial_no` varchar(255) NOT NULL,
  `product_start_date` date NOT NULL,
  `product_expire_date` date NOT NULL,
  `bill_sale_id` int(11) NOT NULL,
  `clame_date` datetime NOT NULL,
  `clame_status` enum('no','wait','complete') NOT NULL,
  `repair_date` datetime NOT NULL,
  `repair_status` enum('no','wait','complete') NOT NULL,
  `user_id` int(11) NOT NULL,
  `current_status` enum('no','repair','clame') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6618 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_repair`
--

CREATE TABLE IF NOT EXISTS `tb_repair` (
  `repair_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `product_code` varchar(255) DEFAULT NULL,
  `repair_date` date DEFAULT NULL,
  `repair_problem` varchar(1000) DEFAULT NULL,
  `repair_price` int(11) DEFAULT NULL,
  `repair_type` enum('internal','center','external') DEFAULT NULL,
  `repair_original` varchar(1000) DEFAULT NULL,
  `repair_detail` varchar(1000) DEFAULT NULL,
  `repair_created_date` datetime DEFAULT NULL,
  `repair_status` enum('wait','do','complete') DEFAULT NULL,
  `serial_no` varchar(50) NOT NULL,
  `repair_group` enum('internal','external') NOT NULL DEFAULT 'internal' COMMENT 'à¸ªà¸´à¸™à¸„à¹‰à¸²à¸‹à¹ˆà¸­à¸¡à¸¡à¸²à¸ˆà¸²à¸à¸£à¹‰à¸²à¸™à¸«à¸£à¸·à¸­à¹„à¸¡à¹ˆ internal à¸„à¸·à¸­à¸ªà¸´à¸™à¸„à¹‰à¸²à¹ƒà¸™à¸£à¹‰à¸²à¸™ external à¸„à¸·à¸­à¸ªà¸´à¸™à¸„à¹‰à¸²à¸™à¸­à¸à¸£à¹‰à¸²à¸™',
  `repair_tel` varchar(50) NOT NULL COMMENT 'à¹€à¸šà¸­à¸£à¹Œà¹‚à¸—à¸£à¸•à¸´à¸”à¸•à¹ˆà¸­',
  `repair_name` varchar(255) NOT NULL COMMENT 'à¸¥à¸¹à¸à¸„à¹‰à¸²',
  `repair_product_name` varchar(255) NOT NULL COMMENT 'à¸ªà¸´à¸™à¸„à¹‰à¸²',
  `repair_end_date` datetime DEFAULT NULL COMMENT 'à¸§à¸±à¸™à¸—à¸µà¹ˆà¸‹à¹ˆà¸­à¸¡à¹€à¸ªà¸£à¹‡à¸ˆ',
  `id_card` varchar(13) DEFAULT NULL COMMENT 'เลขบัตรประชาชน',
  `status` enum('complete','wait','repair') NOT NULL DEFAULT 'wait' COMMENT 'สถานะงานซ่อม',
  `product_id` int(11) NOT NULL COMMENT 'รหัสสินค้า',
  `start_repair_date` datetime DEFAULT NULL COMMENT 'วันที่เริ่มทำการซ่อม',
  PRIMARY KEY (`repair_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_return_product`
--

CREATE TABLE IF NOT EXISTS `tb_return_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(6) NOT NULL,
  `user_id` int(6) NOT NULL,
  `bill_sale_id` int(11) NOT NULL,
  `bill_sale_detail_id` int(11) NOT NULL,
  `barcode` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` double(11,4) NOT NULL,
  `fee_type` enum('bath','percent') DEFAULT NULL,
  `fee_value` double(15,4) DEFAULT NULL,
  `serial` varchar(50) NOT NULL,
  `created` datetime NOT NULL,
  `status` enum('normal','delete') NOT NULL,
  `remark` varchar(1000) DEFAULT NULL COMMENT 'หมายเหตุ',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `branch_id` (`branch_id`),
  KEY `created` (`created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_reward`
--

CREATE TABLE IF NOT EXISTS `tb_reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `point` int(11) NOT NULL DEFAULT '0',
  `status` enum('use','delete') NOT NULL DEFAULT 'use',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_sale_oil`
--

CREATE TABLE IF NOT EXISTS `tb_sale_oil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `customer_code` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_tel` varchar(255) DEFAULT NULL,
  `customer_tax` varchar(255) DEFAULT NULL,
  `customer_address` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_sale_oil_detail`
--

CREATE TABLE IF NOT EXISTS `tb_sale_oil_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_oil_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `lite` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_sale_oil_temp`
--

CREATE TABLE IF NOT EXISTS `tb_sale_oil_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `qty` float NOT NULL,
  `price` float NOT NULL,
  `lite` float NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_sale_per_day`
--

CREATE TABLE IF NOT EXISTS `tb_sale_per_day` (
  `sale_year` int(4) DEFAULT NULL,
  `sale_month` int(2) DEFAULT NULL,
  `sale_day` int(2) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `sale_total_price` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_seat`
--

CREATE TABLE IF NOT EXISTS `tb_seat` (
  `seat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cinema_id` int(11) NOT NULL COMMENT 'โรงหนัง',
  `seat_row` varchar(255) DEFAULT NULL COMMENT 'แถว เช่น A - Z',
  `seat_number` varchar(255) DEFAULT NULL COMMENT 'ลำดับ',
  `created_at` datetime DEFAULT NULL COMMENT 'วันที่บันทึก',
  `status` enum('use','delete') NOT NULL DEFAULT 'use' COMMENT 'สถานะที่นั่ง',
  `user_id` int(11) NOT NULL COMMENT 'ผู้บันทึก',
  `cinema_row_id` int(1) NOT NULL DEFAULT '0' COMMENT 'รหัสที่นั่ง',
  `seat_type_id` int(1) NOT NULL DEFAULT '0' COMMENT 'รหัสประเภทที่นั่ง',
  PRIMARY KEY (`seat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_seat_type`
--

CREATE TABLE IF NOT EXISTS `tb_seat_type` (
  `seat_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `seat_type_price` float NOT NULL DEFAULT '0' COMMENT 'ราคา',
  `seat_type_normal` varchar(255) DEFAULT NULL COMMENT 'ที่นั่งธรรมดา',
  `seat_type_hunneemoon` varchar(255) DEFAULT NULL COMMENT 'ที่นั่งฮันนีมูน',
  `created_at` datetime DEFAULT NULL COMMENT 'วันที่บันทึก',
  `status` enum('use','delete') NOT NULL DEFAULT 'use' COMMENT 'สถานะประเภทที่นั่ง',
  `user_id` int(11) NOT NULL COMMENT 'ผู้บันทึก',
  `seat_type_name` varchar(255) DEFAULT NULL COMMENT 'ชื่อประเภทที่นั่ง',
  PRIMARY KEY (`seat_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_send_oil`
--

CREATE TABLE IF NOT EXISTS `tb_send_oil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_name` varchar(255) DEFAULT NULL COMMENT 'ชื่อสถานที่ส่งสินค้าปลายทาง',
  `target_address` varchar(1000) DEFAULT NULL COMMENT 'ที่อยู่ ในการส่งสินค้าปลายทาง',
  `target_will_send_date` date DEFAULT NULL COMMENT 'กำหนดส่งวันที่',
  `target_will_get_date` date DEFAULT NULL COMMENT 'ถึงลูกค้าประมาณวันที่',
  `target_will_get_time` varchar(10) DEFAULT NULL COMMENT 'เวลาถึงลูกค้าประมาณ',
  `seal_start` varchar(255) DEFAULT NULL COMMENT 'seal เริ่มต้น',
  `seal_end` varchar(255) DEFAULT NULL COMMENT 'seal ถึง',
  `seal_total` int(3) DEFAULT NULL COMMENT 'seal ทั้งสิ้น',
  `bill_code` varchar(100) NOT NULL COMMENT 'เลขบิล',
  `bill_created_date` datetime NOT NULL COMMENT 'วันที่บันทึกรายการ',
  `bill_date` date NOT NULL COMMENT 'วันที่บนบิล',
  `car_code` varchar(20) DEFAULT NULL COMMENT 'เลขทะเบียนรถที่ใช้ขนส่ง',
  `sofer_name` varchar(255) DEFAULT NULL COMMENT 'ผู้ขับรถ',
  `sofer_id_card` varchar(255) DEFAULT NULL COMMENT 'เลขประจำตัวประชาชนผู้ขับ',
  `sofer_car_code` varchar(255) DEFAULT NULL COMMENT 'ใบอนุญาติเลขที่',
  `sofer_car_type` varchar(10) DEFAULT NULL COMMENT 'ชนิด ท.',
  `sofer_car_end_date` date DEFAULT NULL COMMENT 'วันสิ้นอายุ',
  `start_name` varchar(255) DEFAULT NULL COMMENT 'ต้นทาง',
  `start_thambol` varchar(255) DEFAULT NULL COMMENT 'ตำบล',
  `start_amphur` varchar(255) DEFAULT NULL COMMENT 'อำเภอ',
  `start_province` varchar(255) DEFAULT NULL COMMENT 'จังหวัด',
  `bill_status` int(1) NOT NULL COMMENT 'สถานะเอกสาร 0 = ปกติ, 1 = ไม่ใช้แล้ว',
  `remark` varchar(255) DEFAULT NULL COMMENT 'หมายเหตุท้ายบิล',
  `user_id` int(11) NOT NULL COMMENT 'id ผู้บันทึกรายการ',
  `bill_open_status` int(1) NOT NULL COMMENT 'สถานะการเปิดบิล 0 = เปิดบิลไว้, 1 = ปิดบิลเรียบร้อย',
  `date_goto_target` varchar(255) DEFAULT NULL COMMENT 'วันที่ออกรถ',
  `time_goto_target` varchar(255) DEFAULT NULL COMMENT 'เวลาออกรถ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_send_oil_detail`
--

CREATE TABLE IF NOT EXISTS `tb_send_oil_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_oil_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL COMMENT 'ชื่อลูกค้า',
  `customer_address` varchar(1000) NOT NULL COMMENT 'ที่อยู่',
  `qty` int(5) NOT NULL COMMENT 'จำนวน',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_send_oil_detail_items`
--

CREATE TABLE IF NOT EXISTS `tb_send_oil_detail_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qty` int(6) NOT NULL COMMENT 'จำนวน',
  `send_oil_detail_id` int(11) NOT NULL COMMENT 'รหัส รายละเอียดของใบขนส่งเชื้อเพลิง',
  `product_id` int(11) NOT NULL COMMENT 'รหัสสินค้า',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_send_oil_detail_items_incar`
--

CREATE TABLE IF NOT EXISTS `tb_send_oil_detail_items_incar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qty` int(6) NOT NULL COMMENT 'จำนวน',
  `send_oil_id` int(11) NOT NULL COMMENT 'รหัส รายละเอียดของใบขนส่งเชื้อเพลิง',
  `product_id` int(11) NOT NULL COMMENT 'รหัสสินค้า',
  `density` varchar(255) NOT NULL COMMENT 'ค่าความหนาเเน่น',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_serial`
--

CREATE TABLE IF NOT EXISTS `tb_serial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_id` int(11) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `ime1` varchar(255) DEFAULT NULL,
  `ime2` varchar(255) DEFAULT NULL,
  `warranty_start` datetime DEFAULT NULL,
  `warranty_expire` datetime DEFAULT NULL,
  `status` enum('instock','outstock','delete') NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_showdown`
--

CREATE TABLE IF NOT EXISTS `tb_showdown` (
  `showdown_id` int(11) NOT NULL AUTO_INCREMENT,
  `cinema_id` int(11) NOT NULL COMMENT 'โรงหนัง',
  `showdown_time_start` datetime DEFAULT NULL COMMENT 'เวลาเริ่ม',
  `showdown_time_end` datetime DEFAULT NULL COMMENT 'เวลาสิ้นสุด',
  `movie_id` int(11) NOT NULL COMMENT 'หนัง',
  `showdown_date` datetime DEFAULT NULL COMMENT 'วันที่บันฉาย',
  `created_at` datetime DEFAULT NULL COMMENT 'วันที่บันทึก',
  `status` enum('use','delete') NOT NULL DEFAULT 'use' COMMENT 'สถานะรอบฉาย',
  `user_id` int(11) NOT NULL COMMENT 'ผู้บันทึก',
  PRIMARY KEY (`showdown_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_stock`
--

CREATE TABLE IF NOT EXISTS `tb_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_code` varchar(255) NOT NULL,
  `stock_qty` int(11) NOT NULL,
  `stock_created_date` datetime NOT NULL,
  `stock_pack_qty` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `stock_qty_from_manual` int(11) DEFAULT NULL,
  `stock_qty_real` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_stock_summary`
--

CREATE TABLE IF NOT EXISTS `tb_stock_summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT 'รหัสสินค้า',
  `stock_d` int(2) NOT NULL COMMENT 'วันที่',
  `stock_m` int(2) NOT NULL COMMENT 'เดือน',
  `stock_y` int(4) NOT NULL COMMENT 'ปี',
  `qty_before_adjust_import` int(6) NOT NULL DEFAULT '0' COMMENT 'ยอดการรับเข้า ก่อนปรับยอด',
  `qty_before_adjust_transfer_out` int(6) NOT NULL DEFAULT '0' COMMENT 'ยอดการโอนออก ก่อนปรับยอด',
  `qty_before_adjust_transfer_in` int(6) NOT NULL DEFAULT '0' COMMENT 'ยอดการโอนเข้า ก่อนปรับยอด',
  `qty_before_adjust_sale` int(6) NOT NULL DEFAULT '0' COMMENT 'ยอดการขาย ก่อนปรับยอด',
  `qty_before_adjust_get` int(6) NOT NULL DEFAULT '0' COMMENT 'ยอดการรับคืน ก่อนปรับยอด',
  `qty_adjust` int(7) NOT NULL DEFAULT '0' COMMENT 'ปรับยอดสินค้า',
  `qty_after_adjust_import` int(6) NOT NULL DEFAULT '0' COMMENT 'ยอดการรับเข้า หลังปรับยอด',
  `qty_after_adjust_transfer_in` int(6) NOT NULL DEFAULT '0' COMMENT 'ยอดการโอนเข้า หลังปรับยอด',
  `qty_after_adjust_transfer_out` int(6) NOT NULL DEFAULT '0' COMMENT 'ยอดการโอนออก หลังปรับยอด',
  `qty_after_adjust_sale` int(6) NOT NULL DEFAULT '0' COMMENT 'ยอดการขายออก หลังปรับยอด',
  `qty_after_adjust_get` int(6) NOT NULL DEFAULT '0' COMMENT 'ยอดการรับคืน หลังปรับยอด',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT 'สถานะ 0 = ใช้อยู่, 1 = ไม่ใช้',
  `branch_id` int(5) NOT NULL DEFAULT '0' COMMENT 'รหัส สาขา',
  `qty_before_adjust_entries` int(5) NOT NULL DEFAULT '0' COMMENT 'จำนวนที่ขอเบิก ก่อนปรับยอด',
  `qty_after_adjust_entries` int(5) NOT NULL DEFAULT '0' COMMENT 'จำนวนที่ขอเบิก หลังปรับยอด',
  `qty_before_adjust_entries_out` int(5) NOT NULL DEFAULT '0' COMMENT 'จำนวนที่ถูกเบิกออก ก่อนปรับยอด',
  `qty_after_adjust_entries_out` int(5) NOT NULL DEFAULT '0' COMMENT 'จำนวนที่ถูกเบิกออก หลังปรับยอด',
  `qty_remove_item_on_bill_sale` int(5) NOT NULL DEFAULT '0' COMMENT 'จำนวนที่ลบออกจากบิลขาย',
  `reset_to_zero` int(1) NOT NULL DEFAULT '0' COMMENT 'ล้างสต้อก 0 = ไม่ล้าง, 1 = ล้าง',
  `current_total` int(6) NOT NULL DEFAULT '0' COMMENT 'จำนวนคงเหลือ ณ ปัจจุบัน',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `branch_id` (`branch_id`),
  KEY `stock_d` (`stock_d`),
  KEY `stock_m` (`stock_m`),
  KEY `stock_y` (`stock_y`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_temp`
--

CREATE TABLE IF NOT EXISTS `tb_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_sale` longtext,
  `bill_sale_detail` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ticket_movies`
--

CREATE TABLE IF NOT EXISTS `tb_ticket_movies` (
  `ticket_movies_id` int(11) NOT NULL AUTO_INCREMENT,
  `showdown_id` int(11) NOT NULL COMMENT 'รอบฉาย',
  `seat_id` int(11) NOT NULL COMMENT 'ที่นั่ง',
  `ticket_movies_price` float NOT NULL DEFAULT '0' COMMENT 'ราคาตั๋ว',
  `created_at` datetime DEFAULT NULL COMMENT 'วันที่บันทึก',
  `status` varchar(10) DEFAULT 'use' COMMENT 'สถานะ',
  `user_id` int(11) NOT NULL COMMENT 'ผู้บันทึก',
  PRIMARY KEY (`ticket_movies_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE IF NOT EXISTS `tb_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_tel` varchar(50) NOT NULL,
  `user_level` varchar(50) NOT NULL DEFAULT 'cacheer' COMMENT 'ระดับผู้ใช้งาน',
  `user_username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `branch_id` int(11) NOT NULL,
  `user_code` varchar(25) DEFAULT NULL COMMENT 'code ผู้ใช้ระบบ',
  `status` enum('use','remove') NOT NULL DEFAULT 'use' COMMENT 'สถานะการใช้งาน',
  `role_group_id` int(11) DEFAULT NULL COMMENT 'รหัส ระดับกลุ่มผู้ใช้งาน',
  `chanel_id` int(4) DEFAULT NULL COMMENT 'ช่องทางจำหน่าย',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`user_id`, `user_name`, `user_tel`, `user_level`, `user_username`, `user_password`, `user_created_date`, `branch_id`, `user_code`, `status`, `role_group_id`, `chanel_id`) VALUES
(5, 'tonor', '', 'admin', 'tonor', '2227', '2011-12-22 15:30:32', 5, '', 'use', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `temp_sale_per_day`
--

CREATE TABLE IF NOT EXISTS `temp_sale_per_day` (
  `no` int(4) DEFAULT NULL,
  `sale_date` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `bill_id` varchar(8) DEFAULT NULL,
  `barcode` varchar(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `bill_status` varchar(20) DEFAULT NULL,
  `price` double(15,4) DEFAULT NULL,
  `sale_price` double(15,4) DEFAULT NULL,
  `price_old` double(15,4) DEFAULT NULL,
  `bonus_per_unit` double(15,4) DEFAULT NULL,
  `qty` double(15,4) DEFAULT NULL,
  `total_bonus` double(15,4) DEFAULT NULL,
  `total_income` double(15,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE IF NOT EXISTS `token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL COMMENT 'รหัสเลข token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_money`
--

CREATE TABLE IF NOT EXISTS `transfer_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'ผู้เอาเงินออก',
  `transfer_date` datetime NOT NULL COMMENT 'วันที่ตัดเงินออก',
  `total` varchar(5) DEFAULT NULL COMMENT 'เลขประจำตัว',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'หมายเหตุ',
  `status` varchar(30) DEFAULT 'use',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_product`
--

CREATE TABLE IF NOT EXISTS `transfer_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(50) NOT NULL,
  `from_branch_id` int(11) NOT NULL,
  `to_branch_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('success','cancel') DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL COMMENT 'วันที่ยกเลิกบิล',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_product_detail`
--

CREATE TABLE IF NOT EXISTS `transfer_product_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_product_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` enum('success','cancel') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_temp`
--

CREATE TABLE IF NOT EXISTS `transfer_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `from_branch_id` int(11) NOT NULL,
  `to_branch_id` int(11) NOT NULL,
  `qty` double(15,4) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'รหัสผู้ใช้งานระบบ',
  `role_group_id` int(11) NOT NULL COMMENT 'รหัสกลุ่มผู้ใช้งานระบบ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

ALTER TABLE  `config_software` CHANGE  `score`  `score` INT( 3 ) NULL DEFAULT  '0';

ALTER TABLE  `tb_product` ADD  `product_tag_icom` VARCHAR( 255 ) NULL;

ALTER TABLE  `tb_product` CHANGE  `product_tag_icom`  `product_tag_icom` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL;

ALTER TABLE  `tb_bill_sale` ADD  `sale_online_id` INT( 10 ) NULL;


ALTER TABLE  `tb_bill_sale` ADD  `sale_on_ecom` ENUM(  'yes',  'no' ) NOT NULL DEFAULT  'no' AFTER  `score`;


ALTER TABLE  `tb_coupon_detail` CHANGE  `status`  `status` ENUM(  'unuse',  'use',  'delete',  'expried' ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;

ALTER TABLE  `tb_mod_room_stay` ADD  `inv_code` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT  'เลขบิลรวม';
ALTER TABLE  `tb_mod_food_menu` CHANGE  `image`  `image` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT  'default_jfood.jpg';
ALTER TABLE  `tb_mod_food_order` ADD  `bill_sale_inv_code` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT  'เลขบิลรวม';

ALTER TABLE  `tb_mod_food_order` ADD  `res_money` INT( 11 ) NOT NULL COMMENT  'รับเงิน' AFTER  `total` ,
ADD  `discount` INT( 11 ) NOT NULL COMMENT  'ส่วนลด' AFTER  `res_money` ,
ADD  `check_bill_at` DATETIME NOT NULL COMMENT  'วัน/เวลาเชคบิล' AFTER  `discount`;

ALTER TABLE  `sale_temp` ADD  `stock` INT( 11 ) NULL;

ALTER TABLE  `tb_product` ADD  `create_by` VARCHAR( 10 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;
ALTER TABLE  `tb_product` ADD  `create_from` VARCHAR( 10 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;


ALTER TABLE  `barcode_config` ADD  `product_price_special` VARCHAR( 20 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;
ALTER TABLE  `barcode_config` ADD  `show_product_price_special` VARCHAR( 20 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;

ALTER TABLE tb_mod_payroll_employee_ta_detail ADD ta_lat VARCHAR(30) NULL COMMENT 'พิกัด ละติจูท';
ALTER TABLE tb_mod_payroll_employee_ta_detail ADD ta_long VARCHAR(30) NULL COMMENT 'พิกัด ลองติจูท';

ALTER TABLE  `tb_mod_food_order` ADD  `total` VARCHAR( 10 ) NOT NULL AFTER  `created_at`;


ALTER TABLE  `tb_bill_sale` ADD  `score` INT( 11 ) NULL;

ALTER TABLE  `tb_mod_food_order` CHANGE  `status`  `status` ENUM(  'open',  'close',  'wait',  'cancel',  'completed' ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT  'open';


ALTER TABLE  `tb_mod_food_order_detail` CHANGE  `status`  `status` ENUM(  'use',  'delete' ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT  'use';

ALTER TABLE  `tb_mod_food_order_detail` CHANGE  `price`  `detail_price` INT( 7 ) NOT NULL ;

ALTER TABLE  `tb_mod_food_menu` CHANGE  `name`  `menu_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT  'ชื่อเมนู';


ALTER TABLE  `tb_mod_food_menu_group` CHANGE  `name`  `group_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT  'ชื่อหมวดอาหาร';

ALTER TABLE  `tb_mod_food_table` CHANGE  `name`  `tb_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT  'ชื่อโต้ะ';

ALTER TABLE  `tb_mod_food_order` ADD  `db_status` VARCHAR( 6 ) NOT NULL DEFAULT  'use';
ALTER TABLE  `tb_mod_food_menu` ADD  `status` VARCHAR( 6 ) NOT NULL DEFAULT  'use';
ALTER TABLE  `tb_mod_food_menu_group` ADD  `status` VARCHAR( 6 ) NOT NULL DEFAULT  'use';
ALTER TABLE  `tb_mod_food_table` ADD  `status` VARCHAR( 6 ) NULL DEFAULT  'use';

ALTER TABLE  `product_prices` CHANGE  `qty`  `qty` FLOAT( 15, 4 ) NOT NULL DEFAULT  '0.0000',CHANGE  `price`  `price` FLOAT( 15, 4 ) NOT NULL DEFAULT  '0.0000',CHANGE  `price_send`  `price_send` FLOAT( 15, 4 ) NOT NULL DEFAULT  '0.0000',CHANGE  `qty_end`  `qty_end` FLOAT( 15, 4 ) NOT NULL DEFAULT  '0.0000';

ALTER TABLE  `tb_organization` ADD  `version_jpos` VARCHAR( 50 ) NOT NULL AFTER  `org_id`;

ALTER TABLE sale_temp ADD sale_condition VARCHAR(5) NULL;
ALTER TABLE  `product_in_stock` ADD  `status` VARCHAR( 6 ) NULL AFTER  `stock_created_date`;
ALTER TABLE  `sale_temp` ADD  `sale_condition` VARCHAR( 5 ) NOT NULL AFTER  `product_not_vat`;
ALTER TABLE  `tb_serial` ADD  `branch_id` INT( 11 ) NOT NULL AFTER  `status`;
ALTER TABLE product_in_stock ADD user_id  INT(11) NULL COMMENT 'ผู้บันทึก';
ALTER TABLE product_in_stock ADD stock_created_date  DATETIME NOT NULL COMMENT 'เวลาบันทึก';
ALTER TABLE tb_mod_room_stay ADD room_time_out_at  VARCHAR(55) NULL COMMENT 'เวลาออก ';
ALTER TABLE tb_mod_room_stay ADD room_time_in_at  VARCHAR(55) NULL COMMENT 'เวลาเข้า ';

ALTER TABLE tb_bill_sale_detail CHANGE bill_sale_detail_price bill_sale_detail_price DOUBLE;
ALTER TABLE tb_bill_sale ADD reduce_data_at  VARCHAR(255) NULL COMMENT 'วันที่ใบลดหนี้ ';
ALTER TABLE tb_bill_sale ADD reduce_no  VARCHAR(255) NULL COMMENT 'เลขที่ใบลดหนี้ ';
ALTER TABLE tb_bill_sale ADD reduce_note  VARCHAR(255) NULL COMMENT 'หมายเหตุลดหนี้ ';

ALTER TABLE tb_product ADD warranty_old  int(4) NULL COMMENT 'อายุการรับประกัน ';

ALTER TABLE pays ADD pay_number VARCHAR(255) NULL COMMENT 'เลขที่ ';
ALTER TABLE pays ADD pay_date_at VARCHAR(255) NULL COMMENT 'วันที่';
ALTER TABLE pays ADD pay_receive_name VARCHAR(255) NULL COMMENT 'ชื่อผู้รับเงิน';
ALTER TABLE pays ADD pay_tex VARCHAR(255) NULL COMMENT 'รหัสเลขเสียภาษี';
ALTER TABLE pays ADD pay_add VARCHAR(255) NULL COMMENT 'ที่อยู่';
ALTER TABLE pays ADD pay_tel VARCHAR(255) NULL COMMENT 'เบอร์โทร';
ALTER TABLE pays ADD pay_list VARCHAR(255) NULL COMMENT 'รายการ';
ALTER TABLE pays ADD pay_detail VARCHAR(255) NULL COMMENT 'รายละเอียด';
ALTER TABLE pays ADD pay_qua VARCHAR(255) NULL COMMENT 'จำนวนที่ได้รับ';
ALTER TABLE pays ADD pay_price VARCHAR(255) NULL COMMENT 'ราคา';
ALTER TABLE pays ADD pay_get_price VARCHAR(255) NULL COMMENT 'ลงชื่อ ผู้จ่ายเงิน';
ALTER TABLE pays ADD pay_approve VARCHAR(255) NULL COMMENT 'ผู้อนุมัติ';


ALTER TABLE tb_product ADD product_tag INT(1) DEFAULT 0 NOT NULL;
        ALTER TABLE tb_product ADD product_pic VARCHAR(255) NULL;
        ALTER TABLE tb_product ADD weight INT(11) DEFAULT 0 NOT NULL;

        
        
        
        ALTER TABLE quotations DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
        
       
        ALTER TABLE tb_organization ADD logo_show_on_header ENUM('no', 'yes') DEFAULT 'no' NOT NULL;
        ALTER TABLE tb_organization ADD logo_show_on_header_bg ENUM('no', 'yes') DEFAULT 'no' NOT NULL;
       
        ALTER TABLE tb_repair ADD repair_group ENUM('internal', 'external') DEFAULT 'internal' COMMENT 'สินค้าซ่อมมาจากร้านหรือไม่ internal คือสินค้าในร้าน external คือสินค้านอกร้าน' NOT NULL;
        ALTER TABLE tb_repair ADD repair_tel VARCHAR(50) COMMENT 'เบอร์โทรติดต่อ' NOT NULL;
        ALTER TABLE tb_repair ADD repair_name VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'ลูกค้า' NOT NULL;
        ALTER TABLE tb_repair ADD repair_product_name VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'สินค้า' NOT NULL;
        ALTER TABLE tb_repair ADD repair_end_date DATETIME COMMENT 'วันที่ซ่อมเสร็จ' NULL;
        ALTER TABLE tb_bill_config ADD slip_font_size INT(2) COMMENT 'ขนาดตัวอักษร' NOT NULL DEFAULT 11;
        ALTER TABLE tb_bill_import_detail ADD import_bill_detail_code VARCHAR(50) COMMENT 'รหัสสินค้า ที่รับเข้า' NULL;
        ALTER TABLE tb_bill_import_detail ADD import_bill_detail_qty_per_pack INT(2) COMMENT 'จำนวนต่อแพค' NULL;
        ALTER TABLE tb_bill_config ADD sale_font_size INT(2) COMMENT 'ขนาดตัวอักษร ใบเสร็จ' NOT NULL DEFAULT 11;
        ALTER TABLE tb_bill_config ADD sale_width INT(2) COMMENT 'ความกว้างใบเสร็จ' NULL;
        ALTER TABLE tb_bill_config ADD sale_height INT(2) COMMENT 'ความสูงใบเสร็จ' NULL;
        ALTER TABLE tb_bill_config ADD sale_paper VARCHAR(10) COMMENT 'รูปแบบกระดาษ ใบเสร็จ' NOT NULL DEFAULT 'A4';
        ALTER TABLE tb_bill_config ADD sale_position VARCHAR(15) COMMENT 'แนวนอน แนวตั้ง ของใบเสร็จ' NOT NULL DEFAULT 'vertical';
        ALTER TABLE tb_bill_sale ADD vat_type ENUM('in', 'out') COMMENT 'รูปแบบ vat (in, out)';
        
        ALTER TABLE sale_temp ADD is_rent VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'no';
        ALTER TABLE sale_temp ADD will_send_date DATETIME;
        ALTER TABLE sale_temp ADD pk_temp VARCHAR(50);
        ALTER TABLE sale_temp ADD created_at DATETIME;
        ALTER TABLE config_software ADD bill_slip_footer TEXT CHARACTER SET utf8 COLLATE utf8_general_ci;
        ALTER TABLE config_software ADD bill_send_footer TEXT CHARACTER SET utf8 COLLATE utf8_general_ci;
        ALTER TABLE config_software ADD bill_vat_footer TEXT CHARACTER SET utf8 COLLATE utf8_general_ci;
        ALTER TABLE config_software ADD bill_sale_footer TEXT CHARACTER SET utf8 COLLATE utf8_general_ci;
        ALTER TABLE config_software ADD bill_drop_footer TEXT CHARACTER SET utf8 COLLATE utf8_general_ci;
        ALTER TABLE config_software ADD score INT(3) COMMENT 'กี่บาทเป็น 1 แต้ม';
        ALTER TABLE barcode_prices ADD price_before INT(6) COMMENT 'ราคาทุน';
        ALTER TABLE tb_bill_sale_detail ADD old_price DOUBLE COMMENT 'ราคาทุน';
        ALTER TABLE sale_temp ADD old_price DOUBLE COMMENT 'ราคาทุน';
        ALTER TABLE tb_bill_sale ADD bonus_price DOUBLE COMMENT 'ส่วนลด';
        ALTER TABLE tb_bill_sale ADD out_vat DOUBLE COMMENT 'vat บวกเพิ่มกี่บาท';
        ALTER TABLE tb_bill_sale ADD input_money DOUBLE COMMENT 'รับเงิน';
        ALTER TABLE tb_bill_sale ADD return_money DOUBLE COMMENT 'เงินทอน';
        ALTER TABLE tb_bill_sale ADD total_money DOUBLE COMMENT 'ยอดเงินทั้งหมด';
        ALTER TABLE config_software ADD count_hour INTEGER COMMENT 'ค่าชั่วโมง';
        ALTER TABLE tb_bill_config ADD bill_send_show_line ENUM('no', 'yes') DEFAULT 'no' COMMENT 'แสดงเส้นใบส่งสินค้า';
        ALTER TABLE tb_bill_config ADD bill_drop_show_line ENUM('no', 'yes') DEFAULT 'no' COMMENT 'แสดงเส้นใบวางบิล';
        ALTER TABLE tb_bill_config ADD bill_add_show_line ENUM('no', 'yes') DEFAULT 'no' COMMENT 'แสดงเส้นใบกำกับภาษี';
        ALTER TABLE tb_bill_config ADD sale_condition_show_line ENUM('no', 'yes') DEFAULT 'no' COMMENT 'แสดงเส้นใบเสร็จรับเงิน';
        
        ALTER TABLE tb_member ADD remark VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'รายละเอียดเพิ่มเติม';
        
       
        ALTER TABLE config_software ADD sale_can_edit_price ENUM('no', 'yes') DEFAULT 'no' COMMENT 'ให้แคชเชียร์ แก้ไขราคาขายได้';
        ALTER TABLE config_software ADD sale_can_add_sub_price ENUM('no', 'yes') DEFAULT 'no' COMMENT 'ให้แคชเชียร์ คิดส่วนลดได้';
        ALTER TABLE config_software ADD sale_out_of_stock ENUM('no', 'yes') DEFAULT 'no' COMMENT 'ขายสินค้าหมดสต็อคได้';
        ALTER TABLE tb_member ADD tax_code VARCHAR(20) NULL COMMENT 'เลขผู้เสียภาษี';
        ALTER TABLE sale_temp ADD sale_type ENUM('sale', 'mobile') DEFAULT 'sale' NOT NULL COMMENT 'รูปแบบการขาย';
        ALTER TABLE tb_bill_sale ADD sale_type ENUM('sale', 'mobile') DEFAULT 'sale' NOT NULL COMMENT 'รูปแบบการขาย';
        ALTER TABLE config_software ADD serial_port VARCHAR(10) DEFAULT 'COM1' NOT NULL COMMENT 'Serial PORT';
        ALTER TABLE tb_bill_sale ADD quotation_id INT(11) NULL COMMENT 'รหัสใบเสนอราคา';
        ALTER TABLE tb_bill_sale ADD vat_percen INT(2) NULL COMMENT 'ภาษี';
        ALTER TABLE tb_bill_sale ADD vat_bath FLOAT NULL COMMENT 'จำนวนค่าภาษี';
        ALTER TABLE tb_bill_sale_detail ADD sub FLOAT NULL COMMENT 'ส่วนลด';
        ALTER TABLE tb_bill_sale_detail ADD quotation_detail_id INT(11) NULL COMMENT 'รหัสรายการ ในใบเสนอราคา';
        ALTER TABLE tb_bill_sale ADD customer_name VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ชื่อลูกค้า';
        ALTER TABLE tb_bill_sale ADD customer_tel VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'เบอร์โทร';
        ALTER TABLE tb_bill_sale ADD customer_tax VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'เลขผู้เสียภาษี';
        ALTER TABLE tb_bill_sale ADD customer_address VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ที่อยู่ลูกค้า';
        ALTER TABLE tb_bill_sale ADD status_delivery VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'สถานะการจัดส่งสินค้า';
        ALTER TABLE tb_bill_sale ADD ems VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'หมายเลขพัสดุ EMS';
        
        ALTER TABLE barcode_config ADD paper_landscape VARCHAR(2) DEFAULT '' COMMENT 'กระดาษ แนวนอน แนวตั้ง';
        ALTER TABLE barcode_config ADD barcode_rotate ENUM('horizontal', 'vertical') DEFAULT 'horizontal' COMMENT 'รูปแบบการพิมพ์บาร์โค้ด';
        ALTER TABLE barcode_config ADD barcode_type VARCHAR(255) DEFAULT 'EAN13' COMMENT 'ลายเส้น barcode';
        ALTER TABLE tb_bill_config ADD slip_show_date ENUM('yes', 'no') DEFAULT 'yes' COMMENT 'แสดงวันที่บนใบสลิป';
        ALTER TABLE tb_bill_config ADD bill_send_show_date ENUM('yes', 'no') DEFAULT 'yes' COMMENT 'แสดงวันที่บนใบส่งสินค้า';
        ALTER TABLE tb_bill_config ADD bill_drop_show_date ENUM('yes', 'no') DEFAULT 'yes' COMMENT 'แสดงวันที่บนใบวางบิล';
        ALTER TABLE tb_bill_config ADD bill_tax_show_date ENUM('yes', 'no') DEFAULT 'yes' COMMENT 'แสดงวันที่บนใบกำกับภาษี';
        ALTER TABLE tb_bill_config ADD bill_show_date ENUM('yes', 'no') DEFAULT 'yes' COMMENT 'แสดงวันที่บนใบเสร็จ';
        ALTER TABLE tb_bill_config ADD bill_send_show_text_document_set ENUM('yes', 'no') DEFAULT 'yes' COMMENT 'แสดงเอกสารออกเป็นชุดบนใบส่งสินค้า';
        ALTER TABLE tb_bill_config ADD bill_tax_show_text_document_set ENUM('yes', 'no') DEFAULT 'yes' COMMENT 'แสดงเอกสารออกเป็นชุดบนใบกำกับภาษี';
        ALTER TABLE tb_bill_config ADD bill_drop_show_text_document_set ENUM('yes', 'no') DEFAULT 'yes' COMMENT 'แสดงเอกสารออกเป็นชุดบนใบวางบิล';
        ALTER TABLE tb_bill_config ADD bill_success_show_text_document_set ENUM('yes', 'no') DEFAULT 'yes' COMMENT 'แสดงเอกสารออกเป็นชุดบนใบเสร็จ';
       
      
       ALTER TABLE tb_product CHANGE product_quantity product_quantity FLOAT;
        
        ALTER TABLE tb_bill_sale_detail CHANGE bill_sale_detail_qty bill_sale_detail_qty FLOAT;
        ALTER TABLE sale_temp CHANGE qty qty FLOAT;
        ALTER TABLE sale_temp CHANGE qty_per_pack qty FLOAT;
        ALTER TABLE tb_bill_import_detail CHANGE import_bill_detail_product_qty import_bill_detail_product_qty FLOAT;
        ALTER TABLE tb_bill_import_detail CHANGE import_bill_detail_qty import_bill_detail_qty FLOAT;
        ALTER TABLE tb_bill_import_detail CHANGE import_bill_detail_qty_per_pack import_bill_detail_qty_per_pack FLOAT;
        ALTER TABLE tb_bill_sale ADD update_bill_id INT(1) DEFAULT 0 NOT NULL COMMENT '0 = ยังไม่รีเซต, 1 = รีเซตแล้ว';
        ALTER TABLE tb_bill_sale_detail ADD transfer_status INT(1) DEFAULT 0 NOT NULL COMMENT '0 = ยังไม่ส่งไปสรุป, 1 = ส่งไปสรุปแล้ว';
        ALTER TABLE tb_bill_sale_detail ADD transfer_by_user_id INT(11) NULL COMMENT 'รหัสของผู้ส่งข้อมูล';
        ALTER TABLE tb_bill_sale_detail MODIFY COLUMN will_send_date datetime NULL COMMENT 'วันที่ต้องนำสินค้านี้คืน';
        ALTER TABLE tb_bill_sale_detail ADD will_send_date DATETIME NULL COMMENT 'วันที่ต้องนำสินค้านี้คืน';

        
        
        ALTER TABLE config_software ADD print_slip_after_end_sale ENUM('no', 'yes') DEFAULT 'no' NOT NULL COMMENT 'พิมพ์สลิป หลังจบการขาย';
        ALTER TABLE config_software ADD print_bill_after_end_sale ENUM('no', 'yes') DEFAULT 'no' NOT NULL COMMENT 'พิมพ์ bill หลังจบการขาย';
        ALTER TABLE tb_bill_config ADD slip_default_height INT(3) DEFAULT 115 NOT NULL COMMENT 'ความสูงใบสลิป';
        ALTER TABLE tb_bill_config ADD slip_height_per_row INT(2) DEFAULT 4 NOT NULL COMMENT 'ความสูง รายการใน ใบสลิป';
        ALTER TABLE tb_bill_config ADD tax_font_size INT(2) DEFAULT 12 NOT NULL COMMENT 'ขนาดอักษร ในใบกำกับภาษี';
        ALTER TABLE tb_bill_config ADD bill_send_product_font_size INT(2) DEFAULT 12 NOT NULL COMMENT 'ขนาดอักษร ในใบส่งสินค้า';
        ALTER TABLE tb_bill_config ADD drop_bill_font_size INT(2) DEFAULT 12 NOT NULL COMMENT 'ขนาดอักษร ในใบวางบิล';
       
        ALTER TABLE relax_type ADD over_day INT(2) NULL COMMENT 'ถ้าเกิน x วัน หลังทำสัญญาให้คิดดอกเบี้ย';
        ALTER TABLE relax_type ADD no_interest INT(1) NULL COMMENT 'ปิดยอดไม่เกิน x เดือน ไม่คิดดอกเบี้ย';
        ALTER TABLE relax_type ADD close_no_interest ENUM('no', 'yes') NOT NULL DEFAULT 'no' COMMENT 'ส่วนลดจะลดให้ตอนปิดยอดเท่านั้น no = ไม่ให้ส่วนลด, yes = ให้ส่วนลด';
        ALTER TABLE relax_type ADD relax_step ENUM('day', 'month') NOT NULL DEFAULT 'day' COMMENT 'รูปแบบการผ่อน รายวัน รายเดือน';
        ALTER TABLE tb_branch ADD branch_vat INT(2) DEFAULT 7 NOT NULL COMMENT 'การคิด vat ของสาขานี้';
        ALTER TABLE config_software ADD bill_slip_title_lao VARCHAR(255) NULL COMMENT 'หัวบิล สลิป ภาษาลาว';
        ALTER TABLE config_software ADD bill_slip_footer_lao VARCHAR(255) NULL COMMENT 'ด้านล่างของใบสลิป ภาษาลาว';
        ALTER TABLE config_software ADD bill_send_title_lao VARCHAR(255) NULL COMMENT 'ใบส่งสินค้า ภาษาลาว';
        ALTER TABLE config_software ADD bill_send_footer_lao VARCHAR(255) NULL COMMENT 'ท้ายใบส่งสินค้า ภาษาลาว';
        ALTER TABLE config_software ADD bill_vat_title_lao VARCHAR(255) NULL COMMENT 'ใบกำกับภาษี ภาษาลาว';
        ALTER TABLE config_software ADD bill_vat_footer_lao VARCHAR(255) NULL COMMENT 'ท้ายใบกำกับภาษี ภาษาลาว';
        ALTER TABLE config_software ADD bill_sale_title_lao VARCHAR(255) NULL COMMENT 'ใบเสร็จ ภาษาลาว';
        ALTER TABLE config_software ADD bill_sale_footer_lao VARCHAR(255) NULL COMMENT 'ท้ายใบเสร็จ ภาษาลาว';
        ALTER TABLE config_software ADD bill_drop_title_lao VARCHAR(255) NULL COMMENT 'ใบวางบิล ภาษาลาว';
        ALTER TABLE config_software ADD bill_drop_footer_lao VARCHAR(255) NULL COMMENT 'ท้ายใบวางบิล ภาษาลาว';
        ALTER TABLE config_software ADD bill_slip_title_eng VARCHAR(255) NULL COMMENT 'ใบสลิป ภาษาอังกฤษ';
        ALTER TABLE config_software ADD bill_slip_footer_eng VARCHAR(255) NULL COMMENT 'ท้ายใบสลิป ภาษาอังกฤษ';
        ALTER TABLE config_software ADD bill_send_title_eng VARCHAR(255) NULL COMMENT 'ใบส่งสินค้า ภาษาอังกฤษ';
        ALTER TABLE config_software ADD bill_send_footer_eng VARCHAR(255) NULL COMMENT 'ท้ายใบส่งสินค้า ภาษาอังกฤษ';
        ALTER TABLE config_software ADD bill_vat_title_eng VARCHAR(255) NULL COMMENT 'ใบกำกับภาษี ภาษาอังกฤษ';
        ALTER TABLE config_software ADD bill_vat_footer_eng VARCHAR(255) NULL COMMENT 'ท้ายใบกำกับภาษี ภาษาอังกฤษ';
        ALTER TABLE config_software ADD bill_sale_title_eng VARCHAR(255) NULL COMMENT 'ใบเสร็จ ภาษาอังกฤษ';
        ALTER TABLE config_software ADD bill_sale_footer_eng VARCHAR(255) NULL COMMENT 'ท้ายใบเสร็จ ภาษาอังกฤษ';
        ALTER TABLE config_software ADD bill_drop_title_eng VARCHAR(255) NULL COMMENT 'ใบวางบิล ภาษาอังกฤษ';
        ALTER TABLE config_software ADD bill_drop_footer_eng VARCHAR(255) NULL COMMENT 'ท้ายใบวางบิล ภาษาอังกฤษ';
        ALTER TABLE tb_branch ADD primary_money ENUM('us', 'kip', 'baht') NOT NULL DEFAULT 'baht' COMMENT 'สกุลเงินของสาขา';
       
        ALTER TABLE tb_product ADD product_name_lao VARCHAR(255) NULL COMMENT 'ชื่อสินค้า ภาษาลาว';
        ALTER TABLE tb_product ADD product_name_eng VARCHAR(255) NULL COMMENT 'ชื่อสินค้า ภาษาอังกฤษ';
        ALTER TABLE tb_product ADD is_vat ENUM('yes', 'no') NOT NULL DEFAULT 'yes' COMMENT 'ให้คำนวณ vat หรือไม่';
        ALTER TABLE tb_product ADD is_reduce_group ENUM('yes', 'no') NOT NULL DEFAULT 'yes' COMMENT 'ให้คิดส่วนลดกลุ่มได้หรือไม่';
        ALTER TABLE tb_product ADD company_id INT(11) NULL COMMENT 'รหัสบริษัทที่จัดจำหน่าย สินค้านี้';
        
        ALTER TABLE tb_group_product ADD group_product_name_lao VARCHAR(255) NULL COMMENT 'ชื่อภาษา ลาว';
        ALTER TABLE tb_group_product ADD group_product_name_eng VARCHAR(255) NULL COMMENT 'ชื่อภาษา อังกฤษ';
       
        ALTER TABLE tb_member ADD member_group_id INT(11) NULL COMMENT 'รหัส ประเภทสมาชิก';
     
        ALTER TABLE member_group ADD reduce_percen INT(2) NOT NULL DEFAULT 0 COMMENT 'ส่วนลด x %';
        ALTER TABLE sale_temp ADD member_id INT(11) NOT NULL DEFAULT 0 COMMENT 'รหัส สมาชิก ที่ซื้อ';
        ALTER TABLE sale_temp ADD quotation_id INT(11) NULL COMMENT 'รหัส ใบสั่งซื้อ';
        ALTER TABLE sale_temp ADD name_lao VARCHAR(255) NULL COMMENT 'ชื่อสินค้า ภาษาลาว';
        ALTER TABLE sale_temp ADD name_eng VARCHAR(255) NULL COMMENT 'ชื่อสินค้า ภาษาอังกฤษ';
        ALTER TABLE tb_bill_sale_detail ADD member_id INT(11) NULL COMMENT 'รหัสลูกค้าที่ซื้อสินค้าไป';
        ALTER TABLE tb_branch ADD primary_language VARCHAR(255) NOT NULL DEFAULT 'th' COMMENT 'ภาษาหลักของสาขา';
        ALTER TABLE tb_member ADD channel_id INT(11) NULL COMMENT 'ช่องทางการจำหน่าย';
        ALTER TABLE tb_member ADD user_id INT(11) NULL COMMENT 'รหัส พนักงานขาย ที่ดูแลลูกค้า';
   
        ALTER TABLE tb_user ADD user_code VARCHAR(25) NULL COMMENT 'code ผู้ใช้ระบบ';
        ALTER TABLE sale_temp ADD vat_price FLOAT NOT NULL DEFAULT 0 COMMENT 'ภาษี';
        ALTER TABLE sale_temp ADD is_vat ENUM('yes', 'no') NULL COMMENT 'มี vat หรือไม่';
       
        ALTER TABLE tb_bill_sale ADD pay_type_money VARCHAR(255) NOT NULL DEFAULT 'baht' COMMENT 'สกุลเงินที่จ่าย';
        ALTER TABLE tb_bill_sale ADD sale_id INT(11) NULL COMMENT 'รหัสพนักงานขาย';
        ALTER TABLE sale_temp ADD old_price_product FLOAT NOT NULL DEFAULT 0 COMMENT 'ราคาเดิมของสินค้า';
        ALTER TABLE tb_branch ADD vat_type ENUM('no', 'in', 'out') NOT NULL DEFAULT 'no' COMMENT 'ประเภทของ vat';
        ALTER TABLE tb_bill_sale ADD channel_id INT(11) NULL COMMENT 'รหัส ช่องทางการจำหน่าย';
        ALTER TABLE price_per_member_group ADD channel_id INT(11) NOT NULL COMMENT 'รหัสช่องทางจำหน่าย';
        ALTER TABLE tb_bill_sale ADD will_pay_date DATE NULL COMMENT 'วันที่นัดชำระเงิน กรณีจ่ายเงินเชื่อ';
        ALTER TABLE tb_member ADD pay_type ENUM('cash', 'credit') NOT NULL DEFAULT 'cash' COMMENT 'รูปแบบการชำระเงิน';
        ALTER TABLE channel ADD print_bill ENUM('no', 'slip', 'bill_send_product', 'tax', 'slip_tax', 'bill_sale') NOT NULL DEFAULT 'no' COMMENT 'บิลที่ต้องการพิมพ์ เมื่อจบการขาย';
        ALTER TABLE tb_organization ADD use_relax_system ENUM('yes', 'no') NOT NULL DEFAULT 'yes' COMMENT 'ใช้งานระบบผ่อน หรือไม่';
        
        ALTER TABLE tb_product ADD product_relate_id1 INT(11) NULL COMMENT 'สินค้า เชื่อมโยง ตัวที่ 1';
        ALTER TABLE tb_product ADD product_relate_qty1 DOUBLE(15,4) NULL COMMENT 'จำนวนที่จะตัดสินค้าเชื่อมโยง ต้วที่ 1';
        ALTER TABLE tb_product ADD product_relate_id2 INT(11) NULL COMMENT 'สินค้า เชื่อมโยง ตัวที่ 2';
        ALTER TABLE tb_product ADD product_relate_qty2 DOUBLE(15,4) NULL COMMENT 'จำนวนที่จะตัดสินค้าเชื่อมโยง ต้วที่ 2';
        ALTER TABLE tb_product ADD product_relate_id3 INT(11) NULL COMMENT 'สินค้า เชื่อมโยง ตัวที่ 3';
        ALTER TABLE tb_product ADD product_relate_qty3 DOUBLE(15,4) NULL COMMENT 'จำนวนที่จะตัดสินค้าเชื่อมโยง ต้วที่ 3';
        ALTER TABLE tb_product ADD product_relate_id4 INT(11) NULL COMMENT 'สินค้า เชื่อมโยง ตัวที่ 4';
        ALTER TABLE tb_product ADD product_relate_qty4 DOUBLE(15,4) NULL COMMENT 'จำนวนที่จะตัดสินค้าเชื่อมโยง ต้วที่ 4';
        ALTER TABLE tb_product ADD product_relate_id5 INT(11) NULL COMMENT 'สินค้า เชื่อมโยง ตัวที่ 5';
        ALTER TABLE tb_product ADD product_relate_qty5 DOUBLE(15,4) NULL COMMENT 'จำนวนที่จะตัดสินค้าเชื่อมโยง ต้วที่ 5';
        ALTER TABLE tb_product ADD farmer_id INT(11) NULL COMMENT 'รหัส ผู้จำหน่ายสินค้านี้';
        
        ALTER TABLE channel ADD sale_condition ENUM('one', 'many') NOT NULL DEFAULT 'one' COMMENT 'รูปแบบการขาย';
        
        ALTER TABLE tb_product ADD product_code_2 VARCHAR(50) NULL COMMENT 'รหัสสินค้า (รหัสรอง)';
        
        ALTER TABLE tb_branch ADD use_multi_language ENUM('no', 'yes') NOT NULL DEFAULT 'no' COMMENT 'เปิดใช้ระบบ หลายสกุลเงิน';
        ALTER TABLE tb_bill_sale ADD bill_sale_code VARCHAR(50) NULL COMMENT 'เลขเอกสาร';
        ALTER TABLE `channel` CHANGE `print_bill` `print_bill` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'บิลที่ต้องการพิมพ์ เมื่อจบการขาย';

        ALTER TABLE channel ADD use_delimiter ENUM('no', 'yes') NOT NULL DEFAULT 'yes' COMMENT 'ใช้ทศนิยมหรือไม่';
        
        ALTER TABLE tb_product ADD unit_name VARCHAR(255) NULL COMMENT 'หน่วยสินค้า';
        
        ALTER TABLE bill_format ADD bill_code VARCHAR(50) NOT NULL DEFAULT 'all_bill';
        ALTER TABLE tb_bill_sale ADD inv_code VARCHAR(255) NULL COMMENT 'เลขบิลรวม';
        ALTER TABLE bill_running ADD channel_id INT(11) NOT NULL COMMENT 'รหัสช่องทางจำหน่าย';
        ALTER TABLE req_detail ADD req_status ENUM('wait', 'send', 'get') NOT NULL DEFAULT 'wait' COMMENT 'สถานะการเบิกสินค้า';
        ALTER TABLE req ADD get_date DATETIME NULL COMMENT 'วันที่รับสินค้า';
        ALTER TABLE bill_running ADD branch_id INT(11) NULL COMMENT 'รหัสสาขา';
        ALTER TABLE req ADD remark VARCHAR(1000) NULL COMMENT 'หมายเหตุ';
        ALTER TABLE tb_bill_config ADD slip_show_vat_on_bill ENUM("yes", "no") NOT NULL DEFAULT "yes" COMMENT "แสดงจำนวน vat บนใบสลิป";
        ALTER TABLE tb_bill_config ADD slip_show_vat_type_on_bill ENUM('yes', 'no') NOT NULL DEFAULT 'yes' COMMENT 'แสดงชนิด vat บนใบสลิป';
        
        ALTER TABLE req ADD from_branch_id INT(11) NOT NULL COMMENT 'จากสาขา';
        ALTER TABLE req_detail CHANGE req_status req_status ENUM("wait", "send", "get", "cancel") NOT NULL DEFAULT "wait" COMMENT "สถานะรายการ";
        ALTER TABLE req CHANGE req_status req_status ENUM('wait', 'get', 'cancel') NOT NULL DEFAULT 'wait' COMMENT 'สถานะใบเบิกสินค้า';
        
        ALTER TABLE transfer_product ADD cancel_date DATETIME NULL COMMENT 'วันที่ยกเลิกบิล';
        ALTER TABLE channel ADD pay_type ENUM('cash', 'credit') DEFAULT 'cash' NOT NULL COMMENT 'รูปแบบการชำระ';
        ALTER TABLE tb_member ADD credit_term INT(3) NOT NULL DEFAULT 60 COMMENT 'จำนวนวันที่ให้ เครดิต';
        ALTER TABLE tb_bill_sale ADD check_code VARCHAR(255) NULL COMMENT 'หมายเลขเช็ค';
        ALTER TABLE tb_bill_sale ADD check_date DATETIME NULL COMMENT 'วันที่เช็ค';
        ALTER TABLE tb_bill_import ADD vat_total FLOAT NULL COMMENT 'จำนวนยอดภาษี';
        ALTER TABLE tb_bill_import ADD vat_type ENUM('include', 'exclude') NOT NULL DEFAULT 'include' COMMENT 'ประเภทของภาษี';
        ALTER TABLE tb_bill_import ADD bill_import_code_in VARCHAR(255) NULL COMMENT 'รหัสบิล ภายในร้านเอง';
        ALTER TABLE tb_bill_import ADD will_pay_date DATE NULL COMMENT 'วันกำหนดชำระหนี้';
        ALTER TABLE tb_bill_import ADD import_type ENUM('from_sale', 'from_company') NOT NULL DEFAULT 'from_sale' COMMENT 'รูปแบบการรับเข้า';
        ALTER TABLE tb_bill_import_detail ADD serial_code VARCHAR(255) NULL COMMENT 'รหัส serial สินค้า';
        ALTER TABLE tb_bill_import_detail ADD ime1 VARCHAR(255) NULL COMMENT 'รหัส IME 1';
        ALTER TABLE tb_bill_import_detail ADD ime2 VARCHAR(255) NULL COMMENT 'รหัส IME 2';
        ALTER TABLE tb_bill_import_detail ADD garantee_date INT(3) NULL COMMENT 'วันรับประกัน';
  
        ALTER TABLE sale_temp ADD bill_pending_id INT(11) NULL COMMENT 'รหัสบิล ที่โดนพักบิล';
        ALTER TABLE bill_pending ADD branch_id INT(11) NOT NULL COMMENT 'รหัสสาขา';
        ALTER TABLE bill_pending ADD channel_id INT(11) NOT NULL COMMENT 'รหัสช่องทางจำหน่าย';
        ALTER TABLE bill_pending ADD member_id INT(11) NULL COMMENT 'รหัสลูกค้า';
        ALTER TABLE bill_pending ADD sale_condition VARCHAR(50) NOT NULL COMMENT 'รูปแบบการขาย';
        ALTER TABLE bill_pending ADD user_id INT(11) NOT NULL COMMENT 'รหัสผู้ขาย';
        ALTER TABLE tb_bill_import ADD user_id INT(11) NULL COMMENT 'รหัสผู้รับเข้าสินค้า';
        
        ALTER TABLE tb_product CHANGE weight weight FLOAT NULL COMMENT 'น้ำหนักสินค้า';
        
        ALTER TABLE tb_bill_import ADD value_of_product FLOAT NULL COMMENT 'มูลค่าสินค้าทั้งหมด ในการรับเข้า';
        ALTER TABLE tb_bill_sale ADD bill_no INT(6) NULL COMMENT 'ลำดับบิล ในปีนั้น';
        ALTER TABLE tb_bill_sale ADD bill_year INT(4) NULL COMMENT 'ปีที่ออกบิล';
        
        ALTER TABLE `tb_product` CHANGE `product_price_buy` `product_price_buy` DOUBLE NOT NULL COMMENT 'ต้นทุนเฉลีย';
        
        ALTER TABLE tb_branch ADD branch_code VARCHAR(5) NULL COMMENT 'ข้อความ ไว้ออกบิล';
        ALTER TABLE channel ADD channel_code VARCHAR(5) NULL COMMENT 'โค้ด ช่องทาง';
        ALTER TABLE config_software ADD use_sale_step ENUM('no', 'yes') NOT NULL DEFAULT 'no' COMMENT 'เปิดใช้การขายแบบลำดับ';
       
        ALTER TABLE quotations ADD note VARCHAR(50) NULL;
        ALTER TABLE price_per_group ADD status ENUM('use', 'delete') NOT NULL DEFAULT 'use' COMMENT 'สถานะรายการ';
        ALTER TABLE tb_bill_sale_detail ADD remark VARCHAR(1000) NULL COMMENT 'หมายเหตุการขาย';
        ALTER TABLE sale_temp ADD remark VARCHAR(1000) NULL COMMENT 'หมายเหตุการขาย';
        ALTER TABLE tb_user ADD status ENUM('use', 'remove') NOT NULL DEFAULT 'use' COMMENT 'สถานะการใช้งาน';
        ALTER TABLE quotations ADD status ENUM('use', 'remove') NOT NULL DEFAULT 'use' COMMENT 'สถานะรายการ';
        
        ALTER TABLE `tb_product` DEFAULT CHARSET=utf8 COLLATE utf8_general_ci; // PoyKungz
        ALTER TABLE `tb_product` CHANGE `product_code` `product_code` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'บาโค้ด'; //poykungz
        
        ALTER TABLE `tb_bill_sale` DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
        ALTER TABLE `tb_ar` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
        ALTER TABLE `tb_ar` CHANGE `ar_status` `ar_status` ENUM('wait','pay','cancel') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
        ALTER TABLE `tb_bill_config` CHANGE `slip_paper` `slip_paper` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
        ALTER TABLE `tb_bill_config` CHANGE `slip_position` `slip_position` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
        ALTER TABLE `tb_bill_config` CHANGE `bill_send_product_paper` `bill_send_product_paper` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
        ALTER TABLE `tb_bill_config` CHANGE `bill_send_product_position` `bill_send_product_position` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
        ALTER TABLE `tb_bill_config` CHANGE `bill_drop_paper` `bill_drop_paper` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
        ALTER TABLE `tb_bill_config` CHANGE `bill_drop_position` `bill_drop_position` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
        ALTER TABLE `tb_bill_config` CHANGE `bill_add_tax_paper` `bill_add_tax_paper` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
        ALTER TABLE `tb_bill_config` CHANGE `bill_add_tax_position` `bill_add_tax_position` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
        ALTER TABLE `tb_bill_config` CHANGE `sale_paper` `sale_paper` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A4' COMMENT 'รูปแบบกระดาษ ใบเสร็จ';
        ALTER TABLE `tb_bill_config` CHANGE `sale_position` `sale_position` VARCHAR(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'vertical' COMMENT 'แนวนอน แนวตั้ง ของใบเสร็จ';
        ALTER TABLE `tb_bill_config` CHANGE `bill_send_show_line` `bill_send_show_line` ENUM('no','yes') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'no' COMMENT 'แสดงเส้นใบส่งสินค้า';
        ALTER TABLE `tb_bill_config` CHANGE `bill_drop_show_line` `bill_drop_show_line` ENUM('no','yes') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'no' COMMENT 'แสดงเส้นใบวางบิล';
        ALTER TABLE `tb_bill_config` CHANGE `bill_add_show_line` `bill_add_show_line` ENUM('no','yes') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'no' COMMENT 'แสดงเส้นใบกำกับภาษี';
        ALTER TABLE `tb_bill_config` CHANGE `sale_condition_show_line` `sale_condition_show_line` ENUM('no','yes') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'no' COMMENT 'แสดงเส้นใบเสร็จรับเงิน';
        ALTER TABLE `tb_bill_config` CHANGE `slip_show_date` `slip_show_date` ENUM('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'yes' COMMENT 'แสดงวันที่บนใบสลิป';
        ALTER TABLE `tb_bill_config` CHANGE `bill_send_show_date` `bill_send_show_date` ENUM('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'yes' COMMENT 'แสดงวันที่บนใบส่งสินค้า';
        ALTER TABLE `tb_bill_config` CHANGE `bill_drop_show_date` `bill_drop_show_date` ENUM('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'yes' COMMENT 'แสดงวันที่บนใบวางบิล';
        ALTER TABLE `tb_bill_config` CHANGE `bill_tax_show_date` `bill_tax_show_date` ENUM('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'yes' COMMENT 'แสดงวันที่บนใบกำกับภาษี';
        ALTER TABLE `tb_bill_config` CHANGE `bill_show_date` `bill_show_date` ENUM('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'yes' COMMENT 'แสดงวันที่บนใบเสร็จ';
        ALTER TABLE `tb_bill_config` CHANGE `slip_show_vat_on_bill` `slip_show_vat_on_bill` ENUM('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'yes' COMMENT 'แสดงจำนวน vat บนใบสลิป';
        ALTER TABLE `tb_bill_config` CHANGE `slip_show_vat_type_on_bill` `slip_show_vat_type_on_bill` ENUM('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'yes' COMMENT 'แสดงชนิด vat บนใบสลิป';
        ALTER TABLE `tb_bill_import` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
        ALTER TABLE `tb_bill_import` CHANGE `bill_import_code` `bill_import_code` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
        ALTER TABLE `tb_bill_import` CHANGE `bill_import_pay` `bill_import_pay` ENUM('cash','credit') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
        ALTER TABLE `tb_bill_import` CHANGE `bill_import_remark` `bill_import_remark` VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
        ALTER TABLE `tb_bill_import` CHANGE `bill_import_pay_status` `bill_import_pay_status` ENUM('pay','wait') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
        ALTER TABLE `tb_bill_import` CHANGE `vat_type` `vat_type` ENUM('include','exclude') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'include' COMMENT 'ประเภทของภาษี';
        ALTER TABLE `tb_bill_import` CHANGE `bill_import_code_in` `bill_import_code_in` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'รหัสบิล ภายในร้านเอง';
        ALTER TABLE `tb_bill_import` CHANGE `import_type` `import_type` ENUM('from_sale','from_company') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'from_sale' COMMENT 'รูปแบบการรับเข้า';
        ALTER TABLE `tb_bill_import_detail` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
        ALTER TABLE `tb_bill_import_detail` CHANGE `bill_import_code` `bill_import_code` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `import_bill_detail_code` `import_bill_detail_code` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'รหัสสินค้า ที่รับเข้า', CHANGE `ime1` `ime1` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'รหัส IME 1', CHANGE `ime2` `ime2` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'รหัส IME 2', CHANGE `serial_code` `serial_code` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'รหัส serial สินค้า';
        ALTER TABLE `tb_bill_sale` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
        ALTER TABLE `tb_bill_sale` CHANGE `bill_sale_vat` `bill_sale_vat` ENUM('no','vat') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `bill_sale_want_drop` `bill_sale_want_drop` ENUM('no','yes') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `vat_type` `vat_type` ENUM('in','out') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'รูปแบบ vat (in, out)', CHANGE `sale_type` `sale_type` ENUM('sale','mobile') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'sale' COMMENT 'รูปแบบการขาย', CHANGE `pay_type_money` `pay_type_money` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'baht' COMMENT 'สกุลเงินที่จ่าย', CHANGE `bill_sale_code` `bill_sale_code` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'เลขเอกสาร', CHANGE `inv_code` `inv_code` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'เลขบิลรวม', CHANGE `check_code` `check_code` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'หมายเลขเช็ค';
        ALTER TABLE `tb_bill_sale_detail` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
        ALTER TABLE `tb_bill_sale_detail` CHANGE `bill_sale_detail_barcode` `bill_sale_detail_barcode` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `bill_sale_detail_has_bonus` `bill_sale_detail_has_bonus` ENUM('no','yes') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no', CHANGE `bill_sale_detail_type` `bill_sale_detail_type` ENUM('one','many') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'one' COMMENT 'ขายปลีก ขายส่ง', CHANGE `remark` `remark` VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'หมายเหตุการขาย';
        ALTER TABLE `tb_box` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
        ALTER TABLE `tb_box` CHANGE `box_name` `box_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `box_detail` `box_detail` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
        ALTER TABLE `tb_farmer` CHANGE `farmer_name` `farmer_name` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `farmer_tel` `farmer_tel` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, CHANGE `farmer_address` `farmer_address` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL;
        ALTER TABLE `tb_group_product` DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
        ALTER TABLE `tb_group_product` CHANGE `group_product_code` `group_product_code` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `group_product_name` `group_product_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `group_product_detail` `group_product_detail` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL, CHANGE `group_product_name_lao` `group_product_name_lao` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ชื่อภาษา ลาว', CHANGE `group_product_name_eng` `group_product_name_eng` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ชื่อภาษา อังกฤษ';
        ALTER TABLE `tb_group_product_box` DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
        ALTER TABLE `tb_import_product` DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
        ALTER TABLE `tb_member` CHANGE `member_code` `member_code` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `member_name` `member_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `member_tel` `member_tel` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `member_address` `member_address` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `tax_code` `tax_code` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'เลขผู้เสียภาษี', CHANGE `pay_type` `pay_type` ENUM('cash','credit') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'cash' COMMENT 'รูปแบบการชำระเงิน';
        ALTER TABLE `tb_organization` DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
        ALTER TABLE `tb_organization` CHANGE `org_name` `org_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `org_address_1` `org_address_1` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `org_address_2` `org_address_2` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `org_address_3` `org_address_3` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `org_address_4` `org_address_4` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `org_tel` `org_tel` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `org_fax` `org_fax` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `org_tax_code` `org_tax_code` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `org_current_version` `org_current_version` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, CHANGE `org_name_eng` `org_name_eng` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, CHANGE `org_logo_show_on_bill` `org_logo_show_on_bill` ENUM('no','yes') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `org_logo` `org_logo` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `logo_show_on_header` `logo_show_on_header` ENUM('no','yes') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no', CHANGE `logo_show_on_header_bg` `logo_show_on_header_bg` ENUM('no','yes') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no', CHANGE `use_relax_system` `use_relax_system` ENUM('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'yes' COMMENT 'ใช้งานระบบผ่อน หรือไม่';
        ALTER TABLE `tb_percen_sale` DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
        
        ALTER TABLE `tb_product` CHANGE `product_name` `product_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ชื่อสินค้า', CHANGE `product_detail` `product_detail` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'รายละเอียด', CHANGE `product_pack_barcode` `product_pack_barcode` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'รหัสแพค', CHANGE `product_expire` `product_expire` ENUM('expire','fresh') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'expire' COMMENT 'สินค้าสด/ไม่สด', CHANGE `product_return` `product_return` ENUM('in','out') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'in' COMMENT 'สินค้าของร้าน', CHANGE `product_sale_condition` `product_sale_condition` ENUM('sale','prompt') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'เงื่อนไขการขาย', CHANGE `product_pic` `product_pic` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, CHANGE `product_name_lao` `product_name_lao` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ชื่อสินค้า ภาษาลาว', CHANGE `product_name_eng` `product_name_eng` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ชื่อสินค้า ภาษาอังกฤษ', CHANGE `is_vat` `is_vat` ENUM('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'yes' COMMENT 'ให้คำนวณ vat หรือไม่', CHANGE `is_reduce_group` `is_reduce_group` ENUM('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'yes' COMMENT 'ให้คิดส่วนลดกลุ่มได้หรือไม่', CHANGE `product_code_2` `product_code_2` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'รหัสสินค้า (รหัสรอง)', CHANGE `unit_name` `unit_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'หน่วยสินค้า';
        ALTER TABLE `tb_product_price` DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
        ALTER TABLE `tb_product_price` CHANGE `product_price_barcode` `product_price_barcode` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
        ALTER TABLE `tb_product_price_per_unit` DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
        ALTER TABLE `tb_product_price_per_unit` CHANGE `product_price_per_unit_barcode` `product_price_per_unit_barcode` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;
        
        ALTER TABLE `tb_stock` DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
        ALTER TABLE `tb_stock` CHANGE `product_code` `product_code` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
        ALTER TABLE `tb_user` DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
        ALTER TABLE `tb_user` CHANGE `user_name` `user_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `user_tel` `user_tel` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `user_username` `user_username` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `user_password` `user_password` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `user_code` `user_code` VARCHAR(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'code ผู้ใช้ระบบ', CHANGE `status` `status` ENUM('use','remove') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'use' COMMENT 'สถานะการใช้งาน';
        ALTER TABLE `token` DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
        ALTER TABLE `token` CHANGE `code` `code` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'รหัสเลข token';
        ALTER TABLE `tb_bill_sale` CHANGE `vat_type` `vat_type` ENUM('in','out','no') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'รูปแบบ vat (in, out, no)';
        ALTER TABLE `tb_bill_sale_detail` ADD `bill_sale_detail_total` DOUBLE NULL AFTER `bill_sale_detail_price`;
        ALTER TABLE `tb_bill_sale_detail` ADD `bill_sale_detail_promotion` INT(1) NULL DEFAULT '0' COMMENT '0=ไม่มีโปร,1=มีโปร' AFTER `bill_id`;
       
        ALTER TABLE `sale_temp` ADD `total` DOUBLE NULL AFTER `qty`;
        ALTER TABLE `sale_temp` ADD `promotion` INT(1) NULL DEFAULT '0' COMMENT '0=ไม่มีโปร,1=มีโปร' AFTER `serial`;
        ALTER TABLE bill_pending ADD status ENUM('pending', 'success') DEFAULT 'pending' NOT NULL;
        ALTER TABLE bill_pending ADD bill_sale_id INT(11) NULL;
        ALTER TABLE `tb_member` CHANGE `member_tel` `member_tel` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, CHANGE `member_address` `member_address` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL;
        
        ALTER TABLE `bill_pending` CHANGE `status` `status` ENUM('pending','success','remove') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'pending';
        ALTER TABLE adjust_stock_log ADD status ENUM('use', 'remove') DEFAULT 'use' NOT NULL;

        

        

        
        ALTER TABLE `tb_product` CHANGE `product_quantity` `product_quantity` DOUBLE(15,4) NULL DEFAULT NULL, CHANGE `product_price` `product_price` DOUBLE(15,4) NOT NULL COMMENT 'ราคาจำหน่าย', CHANGE `product_price_send` `product_price_send` FLOAT(15,2) NOT NULL COMMENT 'ราคาขายส่ง', CHANGE `weight` `weight` FLOAT(15,2) NULL DEFAULT NULL COMMENT 'น้ำหนักสินค้า', CHANGE `product_relate_qty1` `product_relate_qty1` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'จำนวนที่จะตัดสินค้าเชื่อมโยง ต้วที่ 1', CHANGE `product_relate_qty2` `product_relate_qty2` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'จำนวนที่จะตัดสินค้าเชื่อมโยง ต้วที่ 2', CHANGE `product_relate_qty3` `product_relate_qty3` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'จำนวนที่จะตัดสินค้าเชื่อมโยง ต้วที่ 3', CHANGE `product_relate_qty4` `product_relate_qty4` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'จำนวนที่จะตัดสินค้าเชื่อมโยง ต้วที่ 4', CHANGE `product_relate_qty5` `product_relate_qty5` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'จำนวนที่จะตัดสินค้าเชื่อมโยง ต้วที่ 5';
        
        ALTER TABLE `adjust_stock_log_detail` ADD `qty_approve` DOUBLE NOT NULL AFTER `adjust_stock_log_id`;
        ALTER TABLE `adjust_stock_log` ADD `approve_date` DATETIME NULL AFTER `status`;
        ALTER TABLE `tb_bill_sale` ADD `coupon_detail_id` VARCHAR(50) NULL COMMENT 'คูปองส่วนลด' AFTER `bill_sale_id`;
        ALTER TABLE tb_member ADD type_sale ENUM('no', 'one', 'many') NOT NULL DEFAULT 'one' COMMENT 'ชนิดส่วนลด one = ราคาปลีก, many = ราคาส่ง';
        ALTER TABLE adjust_stock_log ADD doc_code VARCHAR(100) NULL COMMENT 'เลขเอกสาร';
        
        ALTER TABLE `tb_bill_sale_detail_online` ADD `bill_sale_online_id` INT(11) NULL AFTER `id`;
        ALTER TABLE `tb_bill_sale_online` ADD `payment_date` DATETIME NULL AFTER `payment`;
        ALTER TABLE summary_score_of_member ADD score_current INT(7) NOT NULL DEFAULT 0 COMMENT 'แต้ม ปัจจุบัน';
        
        ALTER TABLE `summary_score_of_member` CHANGE `member_id` `member_id` INT(11) NULL COMMENT 'รหัสสมาชิก', CHANGE `score` `score` FLOAT NULL COMMENT 'จำนวนแต้ม', CHANGE `price` `price` FLOAT NULL COMMENT 'ยอดซื้อ', CHANGE `score_current` `score_current` INT(7) NULL DEFAULT '0' COMMENT 'แต้ม ปัจจุบัน';
        ALTER TABLE `summary_score_of_member` CHANGE `score` `score` DOUBLE NULL DEFAULT NULL COMMENT 'จำนวนแต้ม', CHANGE `price` `price` DOUBLE NULL DEFAULT NULL COMMENT 'ยอดซื้อ';
        ALTER TABLE `summary_score_of_member` ADD `score_total` DOUBLE NULL COMMENT 'แต้มทั้งหมด' AFTER `score_current`, ADD `last_update` DATETIME NULL AFTER `score_total`;
        ALTER TABLE `price_per_group` ADD `group_id` INT(6) NULL AFTER `id`;
       
        ALTER TABLE tb_bill_sale ADD is_credit ENUM('no', 'yes') NOT NULL DEFAULT 'no' COMMENT ' รายการนี้ คือการซื้อเงินเชื่อ หรือไม่';
        ALTER TABLE tb_bill_sale ADD is_drop_bill ENUM('no', 'yes') NOT NULL DEFAULT 'no' COMMENT ' no = ยังไม่วางบิล, yes = วางบิลแล้ว';
        ALTER TABLE tb_bill_sale ADD drop_bill_date NULL COMMENT 'วันที่วางบิลล่าสุด';
        
        ALTER TABLE `sale_temp` ADD `promotion_group` INT(6) NULL COMMENT 'null = ไม่มีโปรโมชั่นกลุ่ม' AFTER `promotion`;
        ALTER TABLE `tb_bill_sale_detail` ADD `bill_sale_detail_promotion_group` INT(6) NULL AFTER `bill_sale_detail_promotion`;
        ALTER TABLE role_detail ADD is_add ENUM('no', 'yes') DEFAULT 'no' COMMENT 'สามารถ เพิ่มได้';
        ALTER TABLE role_detail ADD is_edit ENUM('no', 'yes') DEFAULT 'no' COMMENT 'สามารถ แก้ไขได้';
        ALTER TABLE role_detail ADD is_delete ENUM('no', 'yes') DEFAULT 'no' COMMENT 'สามารถ ลบได้';
       
        ALTER TABLE `tb_serial` CHANGE `imei1` `ime1` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, CHANGE `imei2` `ime2` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;
        ALTER TABLE tb_user ADD role_group_id INT(11) NULL COMMENT 'รหัส ระดับกลุ่มผู้ใช้งาน';
        ALTER TABLE `tb_bill_sale_detail` ADD `serial` VARCHAR(255) NULL AFTER `member_id`;
        ALTER TABLE tb_user CHANGE user_level user_level VARCHAR(50) DEFAULT 'cacheer' NOT NULL COMMENT 'ระดับผู้ใช้งาน';
        ALTER TABLE `tb_serial` ADD `warranty_start` DATETIME NULL AFTER `ime2`, ADD `warranty_expire` DATETIME NULL AFTER `warranty_start`;
        ALTER TABLE `sale_temp` ADD `warranty` INT NULL AFTER `serial`;
        ALTER TABLE tb_repair ADD id_card VARCHAR(13) COMMENT 'เลขบัตรประชาชน';
        ALTER TABLE `barcode_config` CHANGE `barcode_width` `barcode_width` DOUBLE(15,4) NOT NULL COMMENT 'ขนาด', CHANGE `barcode_height` `barcode_height` DOUBLE(15,4) NOT NULL COMMENT 'ความสูง';
        ALTER TABLE `exchange` CHANGE `thai_baht` `thai_baht` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'เงินไทย', CHANGE `lao_kip` `lao_kip` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'เงินลาว', CHANGE `dollar_us` `dollar_us` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'เงินดอลล่า';
        ALTER TABLE `log_score_of_member` CHANGE `score` `score` DOUBLE(15,4) NOT NULL COMMENT 'จำนวนแต้ม';
        ALTER TABLE `pays` CHANGE `price` `price` DOUBLE(15,4) NOT NULL COMMENT 'จำนวนเงิน';
        ALTER TABLE `price_per_member_group` CHANGE `price` `price` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'ราคาจำหน่าย';
        ALTER TABLE `product_in_stock` CHANGE `qty` `qty` DOUBLE(15,4) NOT NULL COMMENT 'จำนวนคงเหลือ';
        ALTER TABLE `quotation_details` CHANGE `old_price` `old_price` DOUBLE(15,4) NOT NULL, CHANGE `sale_price` `sale_price` DOUBLE(15,4) NOT NULL;
        ALTER TABLE `relax_type` CHANGE `price_baht` `price_baht` DOUBLE(15,4) NOT NULL COMMENT 'ดอกเบี้ยเป็นบาท', CHANGE `price_percen` `price_percen` DOUBLE(15,4) NOT NULL COMMENT 'ดอกเบี้ยเป็นเปอร์เซนต์';
        ALTER TABLE `sale_temp` CHANGE `qty` `qty` DOUBLE(15,4) NULL DEFAULT NULL, CHANGE `vat_price` `vat_price` DOUBLE(15,4) NOT NULL DEFAULT '0' COMMENT 'ภาษี', CHANGE `old_price_product` `old_price_product` DOUBLE(15,4) NOT NULL DEFAULT '0' COMMENT 'ราคาเดิมของสินค้า';
        ALTER TABLE `tb_bill_import` CHANGE `vat_total` `vat_total` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'จำนวนยอดภาษี', CHANGE `value_of_product` `value_of_product` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'มูลค่าสินค้าทั้งหมด ในการรับเข้า';
        ALTER TABLE `tb_bill_import_detail` CHANGE `import_bill_detail_product_qty` `import_bill_detail_product_qty` DOUBLE(15,4) NULL DEFAULT NULL, CHANGE `import_bill_detail_price` `import_bill_detail_price` DOUBLE(15,4) NOT NULL, CHANGE `import_bill_detail_qty` `import_bill_detail_qty` DOUBLE(15,4) NULL DEFAULT NULL, CHANGE `import_bill_detail_qty_per_pack` `import_bill_detail_qty_per_pack` DOUBLE(15,4) NULL DEFAULT NULL;
        ALTER TABLE `tb_bill_sale` CHANGE `vat_bath` `vat_bath` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'จำนวนค่าภาษี';
        ALTER TABLE `tb_bill_sale_detail` CHANGE `bill_sale_detail_qty` `bill_sale_detail_qty` DOUBLE(15,4) NULL DEFAULT NULL, CHANGE `sub` `sub` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'ส่วนลด';
        ALTER TABLE `tb_bill_sale_detail_online` CHANGE `qty` `qty` DOUBLE(15,4) NOT NULL COMMENT 'จำนวน';
        ALTER TABLE `tb_coupon` CHANGE `value` `value` DOUBLE(15,4) NOT NULL COMMENT 'มูลค่า';
        
        ALTER TABLE `tb_product` CHANGE `product_price_send` `product_price_send` DOUBLE(15,4) NOT NULL COMMENT 'ราคาขายส่ง', CHANGE `weight` `weight` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'น้ำหนักสินค้า', CHANGE `product_relate_qty1` `product_relate_qty1` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'จำนวนที่จะตัดสินค้าเชื่อมโยง ต้วที่ 1', CHANGE `product_relate_qty2` `product_relate_qty2` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'จำนวนที่จะตัดสินค้าเชื่อมโยง ต้วที่ 2', CHANGE `product_relate_qty3` `product_relate_qty3` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'จำนวนที่จะตัดสินค้าเชื่อมโยง ต้วที่ 3', CHANGE `product_relate_qty4` `product_relate_qty4` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'จำนวนที่จะตัดสินค้าเชื่อมโยง ต้วที่ 4', CHANGE `product_relate_qty5` `product_relate_qty5` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'จำนวนที่จะตัดสินค้าเชื่อมโยง ต้วที่ 5';
        ALTER TABLE `tb_product_price_per_unit` CHANGE `product_price_per_unit_old_price` `product_price_per_unit_old_price` DOUBLE(15,4) NOT NULL;
        
        ALTER TABLE `temp_sale_per_day` CHANGE `price` `price` DOUBLE(15,4) NULL DEFAULT NULL, CHANGE `sale_price` `sale_price` DOUBLE(15,4) NULL DEFAULT NULL, CHANGE `price_old` `price_old` DOUBLE(15,4) NULL DEFAULT NULL, CHANGE `bonus_per_unit` `bonus_per_unit` DOUBLE(15,4) NULL DEFAULT NULL, CHANGE `total_bonus` `total_bonus` DOUBLE(15,4) NULL DEFAULT NULL, CHANGE `total_income` `total_income` DOUBLE(15,4) NULL DEFAULT NULL;
        ALTER TABLE `transfer_temp` CHANGE `qty` `qty` DOUBLE(15,4) NOT NULL;
        ALTER TABLE `tb_bill_sale_detail_online` CHANGE `price` `price` DOUBLE(15,4) NOT NULL COMMENT 'ราคาขาย', CHANGE `price_cost` `price_cost` DOUBLE(15,4) NOT NULL COMMENT 'ราคาทุน', CHANGE `price_total` `price_total` DOUBLE(15,4) NOT NULL COMMENT 'ราคารวม';
        ALTER TABLE `tb_bill_sale_online` CHANGE `total_money` `total_money` DOUBLE(15,4) NOT NULL;
        
        ALTER TABLE `tb_product` CHANGE `product_price_buy` `product_price_buy` DOUBLE(15,4) NOT NULL COMMENT 'ต้นทุนเฉลีย';
        
        ALTER TABLE `adjust_stock_log_detail` CHANGE `qty_before` `qty_before` DOUBLE(15,4) NOT NULL, CHANGE `qty_after` `qty_after` DOUBLE(15,4) NOT NULL, CHANGE `qty_approve` `qty_approve` DOUBLE(15,4) NOT NULL;
        ALTER TABLE `adjust_stock_log_temp` CHANGE `qty_before` `qty_before` DOUBLE(15,4) NOT NULL, CHANGE `qty_after` `qty_after` DOUBLE(15,4) NOT NULL;
        ALTER TABLE `barcode_prices` CHANGE `price` `price` DOUBLE(15,4) NOT NULL DEFAULT '0';
        ALTER TABLE `drawcash_logs` CHANGE `draw_price` `draw_price` DOUBLE(15,4) NOT NULL DEFAULT '0';
        ALTER TABLE `pocket_money` CHANGE `money` `money` DOUBLE(15,4) NOT NULL;
        ALTER TABLE `price_per_group` CHANGE `price` `price` DOUBLE(15,4) NOT NULL COMMENT 'ราคาจำหน่าย';
        ALTER TABLE `price_per_group_group` CHANGE `price` `price` DOUBLE(15,4) NOT NULL;
        ALTER TABLE `product_prices` CHANGE `price` `price` DOUBLE(15,4) NOT NULL DEFAULT '0', CHANGE `price_send` `price_send` DOUBLE(15,4) NOT NULL DEFAULT '0';
        ALTER TABLE `sale_temp` CHANGE `price` `price` DOUBLE NULL DEFAULT NULL, CHANGE `total` `total` DOUBLE NULL DEFAULT NULL, CHANGE `old_price` `old_price` DOUBLE NULL DEFAULT NULL COMMENT 'ราคาทุน';
        ALTER TABLE `summary_score_of_member` CHANGE `score` `score` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'จำนวนแต้ม', CHANGE `price` `price` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'ยอดซื้อ', CHANGE `score_total` `score_total` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'แต้มทั้งหมด';
        ALTER TABLE `tb_bill_sale` CHANGE `bonus_price` `bonus_price` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'ส่วนลด', CHANGE `out_vat` `out_vat` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'vat บวกเพิ่มกี่บาท', CHANGE `input_money` `input_money` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'รับเงิน', CHANGE `return_money` `return_money` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'เงินทอน', CHANGE `total_money` `total_money` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'ยอดเงินทั้งหมด';
        ALTER TABLE `tb_bill_sale_detail` CHANGE `bill_sale_detail_price` `bill_sale_detail_price` DOUBLE(15,4) NULL DEFAULT NULL, CHANGE `bill_sale_detail_total` `bill_sale_detail_total` DOUBLE(15,4) NULL DEFAULT NULL, CHANGE `bill_sale_detail_price_vat` `bill_sale_detail_price_vat` DOUBLE(15,4) NOT NULL, CHANGE `old_price` `old_price` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'ราคาทุน';
        ALTER TABLE `product_in_stock` CHANGE `qty` `qty` DOUBLE(15,4) NOT NULL DEFAULT '0' COMMENT 'จำนวนคงเหลือ';
        ALTER TABLE `sale_temp` CHANGE `price` `price` DOUBLE(15,4) NULL DEFAULT NULL, CHANGE `total` `total` DOUBLE(15,4) NULL DEFAULT NULL, CHANGE `old_price` `old_price` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'ราคาทุน';
        ALTER TABLE `temp_sale_per_day` CHANGE `qty` `qty` DOUBLE(15,4) NULL DEFAULT NULL;
        ALTER TABLE `exchange` ADD `money_name` VARCHAR(255) NOT NULL DEFAULT 'kip' COMMENT 'ชื่อหน่วยเงิน ประเทศที่ 3' AFTER `dollar_us`;
        ALTER TABLE `tb_bill_import_detail` ADD `type` ENUM('noserial','serial') NOT NULL AFTER `bill_import_detail_id`;
        ALTER TABLE `tb_bill_sale` ADD `status` ENUM('normal','delete') NOT NULL AFTER `is_drop_bill`;
        ALTER TABLE tb_repair ADD status ENUM('complete', 'wait', 'repair') NOT NULL DEFAULT 'wait' COMMENT 'สถานะงานซ่อม';
        ALTER TABLE `tb_serial` CHANGE `status` `status` ENUM('instock','outstock','delete') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
        ALTER TABLE `tb_bill_import` ADD `status` ENUM('normal','delete') NOT NULL AFTER `value_of_product`;
        ALTER TABLE `tb_bill_import_detail` ADD `status` ENUM('normal','delete') NOT NULL AFTER `garantee_date`;
        ALTER TABLE tb_bill_sale ADD drop_bill_date DATETIME NULL COMMENT 'วันที่วางบิลล่าสุด';
        
        ALTER TABLE `tb_product` ADD `sale_by` ENUM('barcode','serial') NOT NULL AFTER `unit_name`;
        
        ALTER TABLE tb_repair ADD product_id INT(11) NOT NULL COMMENT 'รหัสสินค้า';
        ALTER TABLE tb_repair ADD start_repair_date DATETIME NULL COMMENT 'วันที่เริ่มทำการซ่อม';
        ALTER TABLE `tb_branch` ADD `use_delimiter` ENUM('no','yes') NOT NULL AFTER `branch_code`, ADD `delimiter` INT(1) NOT NULL AFTER `use_delimiter`;
        ALTER TABLE `tb_branch` ADD `use_delimiter2` ENUM('no','yes') NOT NULL COMMENT 'เปิดใช้งานทศนิยมจำนวน' AFTER `delimiter`, ADD `delimiter2` INT(1) NOT NULL DEFAULT '0' AFTER `use_delimiter2`;
        ALTER TABLE tb_organization ADD business_type VARCHAR(255) NULL COMMENT 'ชนิดธุรกิจเฉพาะ';
        ALTER TABLE spa_room_type ADD remark VARCHAR(1000) NULL COMMENT 'หมายเหตุ';
        ALTER TABLE spa_room ADD remark VARCHAR(1000) NULL COMMENT 'หมายเหตุ';
        ALTER TABLE spa_room_type ADD price INT(4) NULL COMMENT 'ค่าห้อง';
        ALTER TABLE `quotation_details` CHANGE `qty` `qty` DOUBLE(15,4) NOT NULL, CHANGE `sub` `sub` DOUBLE(15,4) NOT NULL;
        ALTER TABLE `tb_bill_sale_detail` ADD `status` ENUM('use','delete') NOT NULL AFTER `remark`;
        ALTER TABLE tb_organization ADD email VARCHAR(255) NULL COMMENT 'อีเมล์ร้าน';
        ALTER TABLE tb_organization ADD line_id VARCHAR(255) NULL COMMENT 'line id';
        ALTER TABLE tb_organization ADD website VARCHAR(255) NULL COMMENT 'website';
        ALTER TABLE spa_emp ADD price DOUBLE(15,4) NULL COMMENT 'ค่าบริการของพนักงานนวด';
        ALTER TABLE spa_emp ADD price_per_course DOUBLE(15, 4) NULL COMMENT 'ค่าคอมมิชชั่นของพนักงานนวด';
        ALTER TABLE `tb_bill_import` CHANGE `vat_type` `vat_type` ENUM('include','exclude', 'no') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'include' COMMENT 'ประเภทของภาษี';
        ALTER TABLE `tb_return_product` ADD `product_id` INT(11) NOT NULL AFTER `barcode`, ADD `qty` INT(11) NOT NULL AFTER `product_id`;
        ALTER TABLE `tb_return_product` CHANGE `qty` `qty` DOUBLE(11,4) NOT NULL;
        ALTER TABLE `sale_temp` ADD `promotion_discount_price` DOUBLE(15,4) NULL DEFAULT '0' AFTER `promotion_group`;
        ALTER TABLE `req` ENGINE = MYISAM DEFAULT CHARSET=utf16 COLLATE utf16_general_ci;
        ALTER TABLE `tb_bill_config` ADD `bill_send_sum_footer` ENUM('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'yes' AFTER `slip_show_vat_type_on_bill`;
        ALTER TABLE tb_bill_import_detail ADD for_compute VARCHAR(255) NULL COMMENT 'ใช้คำนวนต้นทุนเฉลี่ย';
        ALTER TABLE  `tb_branch` ADD  `reseller` ENUM(  'off',  'on' ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT  'off' AFTER  `delimiter2`;
        ALTER TABLE  `sale_temp` ADD  `reseller` ENUM(  'no',  'yes' ) NOT NULL DEFAULT  'no' AFTER  `old_price_product`;
        
        ALTER TABLE  `tb_product` ADD  `status` ENUM(  'use',  'delete' ) NOT NULL DEFAULT  'use' AFTER  `sale_by`;
        
        ALTER TABLE `tb_branch` ADD `use_score_member` ENUM('yes','no') NOT NULL DEFAULT 'yes' AFTER `reseller`;
        ALTER TABLE `stock_import_change_log` ADD `discount` DOUBLE(15,4) NOT NULL AFTER `bill_import_detail_id`;
        ALTER TABLE `tb_bill_import` ADD `discount` DOUBLE(15,4) NOT NULL AFTER `value_of_product`;
        ALTER TABLE `tb_bill_sale` ADD `remark` VARCHAR(500) NULL AFTER `drop_bill_date`;
        ALTER TABLE `temp_sale_per_day` ADD `created` DATETIME NULL AFTER `sale_date`;
        ALTER TABLE `tb_return_product` ADD `fee_type` ENUM('bath','percent') NULL AFTER `qty`, ADD `fee_value` DOUBLE(15,4) NULL AFTER `fee_type`;
        
        ALTER TABLE `tb_product` ADD `product_location` VARCHAR(100) NULL AFTER `product_detail`;
        
        ALTER TABLE `sale_temp` ADD `location` VARCHAR(100) NULL AFTER `bill_pending_id`;
        ALTER TABLE `sale_temp` ADD `img` VARCHAR(100) NULL;
        ALTER TABLE tb_bill_config ADD logo_width INT(3) NOT NULL DEFAULT 50;
        ALTER TABLE tb_bill_config ADD logo_height INT(3) NOT NULL DEFAULT 50;
        ALTER TABLE `tb_farmer` ADD `status` ENUM('use','delete') NOT NULL DEFAULT 'use';
        ALTER TABLE `tb_branch` ADD `status` ENUM('use','delete') NOT NULL DEFAULT 'use';
        ALTER TABLE `tb_group_product` ADD `status` ENUM('use','delete') NOT NULL DEFAULT 'use';
        ALTER TABLE `channel` ADD `status` ENUM('use','delete') NOT NULL DEFAULT 'use';
        ALTER TABLE `member_group` ADD `status` ENUM('use','delete') NOT NULL DEFAULT 'use';
        ALTER TABLE `tb_member` ADD `status` ENUM('use','delete') NOT NULL DEFAULT 'use';
        ALTER TABLE `tb_finance_detail` CHANGE `payment_date` `payment_date` DATETIME NULL, CHANGE `money` `money` DOUBLE(15,4) NULL, CHANGE `late_day` `late_day` INT(6) NULL, CHANGE `fines_price` `fines_price` DOUBLE(15,4) NULL;
        ALTER TABLE `tb_finance` ADD `finance_net` DOUBLE(15,4) NULL AFTER `finance_down`;
        ALTER TABLE `tb_finance` ADD `status` ENUM('owe','paid','cancel') NOT NULL DEFAULT 'owe' ;
        ALTER TABLE `tb_finance` ADD `finance_interest_type` ENUM('percent','money') NOT NULL DEFAULT 'percent' AFTER `finance_interest`;
        ALTER TABLE `bill_pending` CHANGE `status` `status` ENUM('pending','success','remove','delete') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'pending';
        ALTER TABLE po_detail ADD price DOUBLE(15, 4) NOT NULL;
        ALTER TABLE po ADD customer_name VARCHAR(255) NULL;
        ALTER TABLE po ADD customer_tel VARCHAR(255) NULL;
        ALTER TABLE po ADD customer_email VARCHAR(255) NULL;
        ALTER TABLE po ADD customer_address VARCHAR(500) NULL;
        ALTER TABLE po ADD quotation_code VARCHAR(255) NULL;
        ALTER TABLE po ADD credit_day INT(3) NULL;
        ALTER TABLE po ADD send_date DATE NULL;
        ALTER TABLE po ADD send_day INT(3) NULL;
        ALTER TABLE po ADD end_date DATE NULL;
        ALTER TABLE po ADD reduce_price DOUBLE(15, 4) NULL;
        ALTER TABLE po ADD vat_percen INT(2) NULL;
        ALTER TABLE `tb_bill_sale` CHANGE `bill_sale_status` `bill_sale_status` ENUM('wait','pay','cancel','credit','point') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
        ALTER TABLE `summary_score_of_member` ADD `id` INT(11) NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (`id`) ;
        ALTER TABLE `tb_bill_sale_detail` ADD `point` DOUBLE(15,4) NULL DEFAULT NULL AFTER `serial`;
        ALTER TABLE `tb_bill_config` ADD `import_bill_show_price` ENUM('no','yes') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no' AFTER `logo_height`;
        ALTER TABLE quotations ADD vat_type ENUM('no', 'in', 'out');
        ALTER TABLE `quotations` ADD `discount` DOUBLE(16,2) NOT NULL DEFAULT '0' AFTER `vat_type`;
        ALTER TABLE `tb_bill_config` ADD `bill_send_show_picture` ENUM('no','yes') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no' AFTER `bill_send_sum_footer`;
        ALTER TABLE `tb_bill_config` ADD `bill_show_barcode` ENUM('no','yes') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no' AFTER `bill_send_show_picture`;
        ALTER TABLE `tb_bill_config` ADD `bill_send_show_barcode` ENUM('no','yes') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no' AFTER `bill_show_barcode`;
        ALTER TABLE `tb_bill_config` ADD `bill_tax_show_barcode` ENUM('no','yes') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no' AFTER `bill_send_show_barcode`;
        ALTER TABLE `tb_bill_config` ADD `bill_show_picture` ENUM('no','yes') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no' AFTER `bill_send_sum_footer`;
        ALTER TABLE `quotation_details` CHANGE `barcode` `barcode` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;
        ALTER TABLE `quotation_details` ADD `remark` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `barcode`;
        ALTER TABLE `tb_bill_sale` ADD `payment_id` INT(6) NOT NULL DEFAULT '1' AFTER `pay_type_money`;
        ALTER TABLE `config_software` ADD `discount_per_record` ENUM('no','yes') NOT NULL DEFAULT 'no' AFTER `sale_out_of_stock`;
        
        ALTER TABLE tb_product ADD price_send_2 FLOAT NULL COMMENT 'ราคาส่ง 2';
        ALTER TABLE tb_product ADD price_send_3 FLOAT NULL COMMENT 'ราคาส่ง 3';
        ALTER TABLE tb_product ADD price_send_4 FLOAT NULL COMMENT 'ราคาส่ง 4';
        ALTER TABLE tb_product ADD price_send_5 FLOAT NULL COMMENT 'ราคาส่ง 5';
        
        ALTER TABLE tb_member CHANGE type_sale type_sale ENUM('no', 'one', 'many', 'many2', 'many3', 'many4', 'many5') NOT NULL DEFAULT 'no' COMMENT 'ราคาจำหน่าย';
        ALTER TABLE tb_return_product ADD remark VARCHAR(1000) NULL COMMENT 'หมายเหตุ';
        ALTER TABLE tb_bill_sale_detail ADD return_product FLOAT NULL COMMENT 'จำนวนที่ส่งคืนลูกค้า';
        ALTER TABLE tb_bill_sale_detail ADD return_product_id INT(11) NULL COMMENT 'อ้างอิงเลขใบรับคืนสินค้า';
        ALTER TABLE `tb_bill_sale` ADD `bonus_type` VARCHAR(30) NOT NULL DEFAULT 'money' AFTER `vat_type`, ADD `bonus_percent` INT(6) NOT NULL DEFAULT '0' AFTER `bonus_type`;
        ALTER TABLE `sale_temp` ADD `discount_type` VARCHAR(30) NULL DEFAULT 'money' AFTER `promotion_discount_price`, ADD `discount_percent` INT(3) NULL DEFAULT '0' AFTER `discount_type`, ADD `discount` DOUBLE(15,4) NULL DEFAULT '0' AFTER `discount_percent`;
        ALTER TABLE `tb_bill_sale_detail` ADD `discount_type` VARCHAR(30) NULL DEFAULT 'money' AFTER `bill_sale_detail_price`, ADD `discount_percent` INT(3) NOT NULL DEFAULT '0' AFTER `discount_type`, ADD `discount` DOUBLE(15,4) NOT NULL DEFAULT '0' AFTER `discount_percent`;
        ALTER TABLE `sale_temp` ADD `vat_price2` DOUBLE(15,4) NOT NULL DEFAULT '0' AFTER `vat_price`;
        ALTER TABLE `tb_bill_sale_detail` ADD `bill_sale_detail_price_vat2` DOUBLE(15,4) NOT NULL DEFAULT '0' AFTER `bill_sale_detail_price_vat`;
        ALTER TABLE `tb_bill_sale_detail` ADD `vat_type` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `bill_sale_detail_total`;
        ALTER TABLE `tb_bill_sale_detail` ADD `product_id` INT(11) NULL DEFAULT NULL AFTER `bill_sale_detail_promotion_group`;
        
        ALTER TABLE `tb_product` ADD `is_rent` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'no' , ADD `is_show_on_bill` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'yes' ;
        
        ALTER TABLE `quotation_details` ADD `is_vat` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `sub`, ADD `price_vat` DOUBLE(15,4) NULL DEFAULT NULL AFTER `is_vat`;
        ALTER TABLE `drawcash_logs` ADD `status` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'use' ;
        ALTER TABLE `transfer_money` ADD `status` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'use' ;
        ALTER TABLE `role_group` ADD `status` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'use' ;
        ALTER TABLE `role_detail` ADD `is_main` ENUM('no','yes') NOT NULL DEFAULT 'no' AFTER `menu_id`;
        ALTER TABLE `pay_types` ADD `status` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'use' AFTER `remark`;
        ALTER TABLE `pays` ADD `status` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'use' AFTER `price`;
        ALTER TABLE tb_bill_import ADD remark TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'หมายเหตุ';
        ALTER TABLE tb_bill_import ADD status_bill INTEGER(1) NOT NULL DEFAULT 1 COMMENT 'สถานะบิล 0 = เปิดบิล, 1 = ปิดบิลแล้ว';
        ALTER TABLE po ADD bill_status INT(1) NOT NULL DEFAULT 1 COMMENT 'สถานะบิล 0 = รอชำระ, 1 = ชำระแล้ว';
        ALTER TABLE po ADD reduce_type ENUM('baht','percen') NOT NULL DEFAULT 'baht' COMMENT 'ประเภทส่วนลด baht = ส่วนลดเป็นบาท, percen = ส่วนลดเป็นเปอร์เซ็น';
        ALTER TABLE po ADD pay_date DATETIME NULL COMMENT 'วันที่ชำระเงิน';
        ALTER TABLE tb_bill_import ADD po_id INT(5) NULL COMMENT 'อ้างอิงใบสั่งซื้อ';
        
        ALTER TABLE `tb_product` CHANGE `group_product_id` `group_product_id` INT(5) NOT NULL DEFAULT '0' COMMENT 'รหัส หมวดสินค้า';
        
        ALTER TABLE tb_stock_summary ADD qty_before_adjust_entries INT(5) NOT NULL DEFAULT 0 COMMENT 'จำนวนที่ขอเบิก ก่อนปรับยอด';
        ALTER TABLE tb_stock_summary ADD qty_after_adjust_entries INT(5) NOT NULL DEFAULT 0 COMMENT 'จำนวนที่ขอเบิก หลังปรับยอด';
        ALTER TABLE tb_stock_summary ADD qty_before_adjust_entries_out INT(5) NOT NULL DEFAULT 0 COMMENT 'จำนวนที่ถูกเบิกออก ก่อนปรับยอด';
        ALTER TABLE tb_stock_summary ADD qty_after_adjust_entries_out INT(5) NOT NULL DEFAULT 0 COMMENT 'จำนวนที่ถูกเบิกออก หลังปรับยอด';
        ALTER TABLE tb_stock_summary ADD qty_remove_item_on_bill_sale INT(5) NOT NULL DEFAULT 0 COMMENT 'จำนวนที่ลบออกจากบิลขาย';
        ALTER TABLE tb_stock_summary ADD reset_to_zero INT(1) NOT NULL DEFAULT 0 COMMENT 'ล้างสต้อก 0 = ไม่ล้าง, 1 = ล้าง';
        ALTER TABLE tb_organization ADD use_auto_complete INT(1) NOT NULL DEFAULT 0 COMMENT 'เปิดใช้ระบบขายแบบ autocomplete 0 = ไม่ใช้, 1 = ใช้';
        ALTER TABLE tb_bill_sale ADD hide_bill INT(1) NOT NULL DEFAULT 0 COMMENT 'ซ่อนบิลขาย 0 = ไม่ซ่อน, 1 = ซ่อน';
        ALTER TABLE tb_bill_sale ADD bill_code VARCHAR(20) NULL COMMENT 'รหัสบิล ที่รันใหม่เพื่อซ่อนรายการ';
        ALTER TABLE `tb_bill_sale_detail` ADD `send_date_sucees` DATETIME NULL COMMENT 'วันที่คืนสินค้า(สินค้าเช่า)';
        ALTER TABLE `tb_bill_sale` ADD `money_added` INT(6) NOT NULL DEFAULT 0 COMMENT 'ค่าปรับหากจ่ายหนี้ล่าช้า';
        ALTER TABLE `tb_bill_sale` ADD credit_remark VARCHAR(500) NULL COMMENT 'หมายเหตุ เมื่อรับชำระหนี้';
        ALTER TABLE tb_bill_sale_detail ADD money_added_item INT(6) NOT NULL DEFAULT 0 COMMENT 'ค่าปรับหากจ่ายหนี้ล่าช้า' ;
        ALTER TABLE tb_bill_sale_detail ADD credit_remark_item VARCHAR(500) NULL COMMENT 'หมายเหตุ เมื่อรับชำระหนี้';
        ALTER TABLE tb_bill_sale_detail ADD status_pay INT(1) NOT NULL DEFAULT 0 COMMENT '0 = ชำระแล้ว, 1 = ยังไม่ชำระเงิน';
        ALTER TABLE tb_organization ADD expire_date DATE NULL COMMENT 'วันหมดอายุการใช้ระบบ แบบรายปี ออนไลน์';
        ALTER TABLE tb_stock_summary ADD current_total INT(6) NOT NULL DEFAULT 0 COMMENT 'จำนวนคงเหลือ ณ ปัจจุบัน';
        ALTER TABLE `tb_bill_sale` ADD ems_code VARCHAR(255) NULL COMMENT 'รหัสติดตามสินค้า สำหรับกรณีมีการจัดส่ง';
        ALTER TABLE `tb_bill_sale` ADD bill_remark VARCHAR(255) NULL COMMENT 'หมายเหตุท้ายบิล';
        ALTER TABLE tb_send_oil ADD user_id INT(11) NOT NULL COMMENT 'id ผู้บันทึกรายการ';
        ALTER TABLE tb_send_oil_detail_items_incar ADD density VARCHAR(255) NOT NULL COMMENT 'ค่าความหนาเเน่น';
        ALTER TABLE tb_send_oil_detail_items ADD product_id INT(11) NOT NULL COMMENT 'รหัสสินค้า';
        ALTER TABLE tb_send_oil ADD bill_open_status INT(1) NOT NULL COMMENT 'สถานะการเปิดบิล 0 = เปิดบิลไว้, 1 = ปิดบิลเรียบร้อย';
        
        ALTER TABLE tb_product ADD min_stock float NULL COMMENT 'สินค้าขั้นต่ำ';
        
        ALTER TABLE `tb_bill_sale` ADD created_Bill_sale DATETIME NOT NULL COMMENT 'วันที่ทำรายการ';
        ALTER TABLE tb_bill_sale CHANGE created_Bill_sale created_Bill_sale DATETIME NULL COMMENT 'วันที่ทำรายการ';
        UPDATE tb_bill_sale SET created_Bill_sale = bill_sale_created_date WHERE created_Bill_sale = '0000-00-00 00:00:00';
        ALTER TABLE tb_language ADD name VARCHAR(255) NOT NULL COMMENT 'ชื่อของป้าย Label';
        ALTER TABLE tb_organization ADD org_enddate_license VARCHAR(255) NULL COMMENT 'วันสิ้นอายุ ใบอนุญาติ';
        ALTER TABLE tb_organization ADD org_license VARCHAR(255) NULL COMMENT 'เลขที่ใบอนุญาติ';
        ALTER TABLE tb_send_oil ADD date_goto_target VARCHAR(255) NULL COMMENT 'วันที่ออกรถ';
        ALTER TABLE tb_send_oil ADD time_goto_target VARCHAR(255) NULL COMMENT 'เวลาออกรถ';
        ALTER TABLE `tb_bill_sale` ADD matjam INT(6) NULL COMMENT 'จำนวนเงินมัดจำ';
        ALTER TABLE `tb_bill_sale` ADD bill_sale_pay_date_after_matjam DATETIME NULL COMMENT 'ชำระเงิน หลังจากที่มีการมัดจำไปแล้ว';
        ALTER TABLE tb_organization ADD show_master VARCHAR(10) NOT NULL DEFAULT 'yes' COMMENT 'แสดงคำว่า ต้นฉบับ บนบิลรวม';
        ALTER TABLE tb_organization ADD single_page VARCHAR(10) NOT NULL DEFAULT 'yes' COMMENT 'พิมพ์บิลรวมแบบ หน้าสองแผ่น'; 
        ALTER TABLE catalog_register ADD rg_day TEXT COMMENT '';
        ALTER TABLE catalog_register ADD rg_month TEXT COMMENT '';
        ALTER TABLE catalog_register ADD rg_year TEXT COMMENT '';
        ALTER TABLE catalog_register ADD rg_status TEXT COMMENT '';
        ALTER TABLE tb_car ADD status VARCHAR(10) NOT NULL DEFAULT '0' COMMENT '0 = use , 1 = not use';
        ALTER TABLE tb_car_road ADD out_time time NULL COMMENT 'เวลาเดินรถ';
        ALTER TABLE tb_car_road CHANGE COLUMN car_number car_id INT(11);
        ALTER TABLE tb_car_road ADD status VARCHAR(10) NOT NULL DEFAULT '0' COMMENT '0 = use , 1 = not use';
        ALTER TABLE tb_car_customer CHANGE COLUMN car_number car_id INT(11);  
        ALTER TABLE tb_car_customer ADD status VARCHAR(10) NOT NULL DEFAULT '0' COMMENT '0 = use , 1 = not use';
        ALTER TABLE tb_car_customer ADD price float NULL DEFAULT 0 COMMENT 'ราคาตั๋ว';
        ALTER TABLE tb_car_customer ADD user_id int NOT NULL  COMMENT 'ผู้ขาย';
        ALTER TABLE tb_organization ADD use_local_storage INT(1) NOT NULL DEFAULT 0 COMMENT 'หน่วยความจำภายในเครื่องลูกข่าย autocomplete 0 = ไม่ใช้, 1 = ใช้';
        ALTER TABLE tb_seat_type ADD seat_type_name VARCHAR(255) NULL COMMENT 'ชื่อประเภทที่นั่ง';
        ALTER TABLE tb_seat ADD cinema_row_id INT(1) NOT NULL DEFAULT 0 COMMENT 'รหัสที่นั่ง';
        ALTER TABLE tb_seat ADD seat_type_id INT(1) NOT NULL DEFAULT 0 COMMENT 'รหัสประเภทที่นั่ง';
        ALTER TABLE tb_ticket_movies MODIFY status VARCHAR(10) DEFAULT 'use' COMMENT 'สถานะ';
        ALTER TABLE tb_module_jamnam_product ADD module_jamnam_customer_id INT(1) NOT NULL DEFAULT 0 COMMENT 'รหัสลูกค้า';
        ALTER TABLE tb_module_jamnam_product ADD price INT(7) NOT NULL DEFAULT 0 COMMENT 'รหัสลูกค้า';
        ALTER TABLE tb_module_jamnam_table_pay ADD pay_status INT(1) NOT NULL DEFAULT 0 COMMENT '0 = ยังไม่จ่าย, 1 = จ่ายแล้ว';
        ALTER TABLE tb_module_jamnam_table_pay ADD module_jamnam_product_id INT(11) NOT NULL COMMENT 'รหัสสินค้าที่นำมาจำนำ';
        
        ALTER TABLE tb_product ADD child_barcode VARCHAR(50) NULL COMMENT 'barcode สินค้าลูก';
        ALTER TABLE tb_product ADD child_price FLOAT NULL COMMENT 'ราคา สินค้าลูก';
        ALTER TABLE tb_product ADD qty_of_parent INT(4) NULL COMMENT 'จำนวนในสินค้าแม่';
        
        ALTER TABLE `tb_user` ADD `chanel_id` INT(4) NULL COMMENT 'ช่องทางจำหน่าย';
        ALTER TABLE `tb_bill_sale` ADD receipt VARCHAR(255) NULL COMMENT 'เลขที่ใบเสร็จรับเงิน';
        ALTER TABLE `tb_bill_sale` ADD receipt_short VARCHAR(255) NULL COMMENT 'เลขที่ใบเสร็จรับเงิน (ย่อ)';
        ALTER TABLE `tb_bill_sale` ADD tax VARCHAR(255) NULL COMMENT 'เลขที่ใบกำกับภาษี';
        ALTER TABLE `tb_bill_sale` ADD tax_short VARCHAR(255) NULL COMMENT 'เลขที่ใบกำกับภาษี (ย่อ)';
        ALTER TABLE `tb_bill_sale` ADD all_bill VARCHAR(255) NULL COMMENT 'เลขเอกสาร';
        ALTER TABLE `tb_bill_sale_detail` CHANGE `bill_sale_detail_price` `bill_sale_detail_price` DOUBLE(22,14) NULL DEFAULT NULL COMMENT 'ราคาสินค้า';
        ALTER TABLE `sale_temp` ADD `price_promotion` DOUBLE(22,14) NULL COMMENT 'ราคาต่อชิ้นคิดจากโปรโมชั่น';
        ALTER TABLE `config_software` ADD `sale_limit_of_stock` ENUM('no','yes') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no' COMMENT 'ขายสินค้าหมดสต๊อค';
        ALTER TABLE `icommerce_bill_sale` ADD `microtime` VARCHAR(255) NOT NULL COMMENT 'เสี้ยววินาทีในการสั่งซื้อ เพื่อไม่ให้ซ้ำกัน';
        ALTER TABLE `icommerce_bill_sale` ADD `rancomcode` VARCHAR(255) NOT NULL COMMENT 'รหัสตอนสั่งซื้อ เพื่อไม่ให้ซ้ำกัน';
        ALTER TABLE `icommerce_bill_sale` ADD `confirm_date` DATE NULL COMMENT 'รหัสตอนสั่งซื้อ เพื่อไม่ให้ซ้ำกัน';
        ALTER TABLE `icommerce_bill_sale` ADD `send_price` INT(5) NULL COMMENT 'ค่าจัดส่ง';
        
        ALTER TABLE tb_product ADD child_barcode_3 VARCHAR(20) NULL COMMENT 'บาโค้ด ชั้นที่ 3';
        ALTER TABLE tb_product ADD child_price_3 INT(7) NULL COMMENT 'ราคาขาย ชั้นที่ 3';
        ALTER TABLE tb_product ADD qty_of_child_barcode INT(7) NULL COMMENT 'จำนวนต่อสินค้าแม่ ชั้นที่ 3';
        ALTER TABLE tb_product ADD fk_child_barcode VARCHAR(20) NULL COMMENT 'รหัสสินค้าแม่ ชั้นที่ 2';
        ALTER TABLE tb_product ADD child_barcode_4 VARCHAR(20) NULL COMMENT 'บาโค้ด ชั้นที่ 4';
        ALTER TABLE tb_product ADD child_price_4 INT(7) NULL COMMENT 'ราคาขาย ชั้นที่ 4';
        ALTER TABLE tb_product ADD qty_of_child_barcode_3 INT(7) NULL COMMENT 'จำนวนต่อสินค้าแม่ ชั้นที่ 4';
        ALTER TABLE tb_product ADD fk_child_barcode_3 VARCHAR(20) NULL COMMENT 'รหัสสินค้าแม่ ชั้นที่ 3';
        ALTER TABLE tb_product ADD child_barcode_5 VARCHAR(20) NULL COMMENT 'บาโค้ด ชั้นที่ 5';
        ALTER TABLE tb_product ADD child_price_5 INT(7) NULL COMMENT 'ราคาขาย ชั้นที่ 5';
        ALTER TABLE tb_product ADD qty_of_child_barcode_4 INT(7) NULL COMMENT 'จำนวนต่อสินค้าแม่ ชั้นที่ 5';
        ALTER TABLE tb_product ADD fk_child_barcode_4 VARCHAR(20) NULL COMMENT 'รหัสสินค้าแม่ ชั้นที่ 4';
        
        ALTER TABLE `icommerce_bill_sale` ADD `inv_code` VARCHAR(30) NULL COMMENT 'invoice code';
        ALTER TABLE `tb_bill_sale` ADD `icommerce_bill_sale_id` INT(11) NULL COMMENT 'id บิลขายจากระบบออนไลน์';
        ALTER TABLE `tb_bill_sale` ADD `customer_branch` VARCHAR(255) NULL COMMENT 'สาขาลูกค้า';
        ALTER TABLE `tb_bill_matjam` ADD `bank` VARCHAR(255) NULL COMMENT 'ธนาคาร';
        ALTER TABLE `tb_bill_matjam` ADD `bank_branch` VARCHAR(255) NULL COMMENT 'ธนาคารสาขา';
        ALTER TABLE `tb_bill_matjam` ADD `no_check` VARCHAR(255) NULL COMMENT 'เลขที่เช็ค';
        ALTER TABLE `tb_bill_matjam` CHANGE `matjam_pay_date` `matjam_pay_date` DATETIME NULL DEFAULT NULL COMMENT 'วันที่จ่ายมัดจำ';
        ALTER TABLE `pays` ADD `pay_every_at` INT(2) NULL DEFAULT NULL COMMENT 'ต้องจ่ายทุกวันที่ xxx';
        
        ALTER TABLE `tb_product` ADD `point` INT(4) NULL DEFAULT NULL COMMENT 'คะแนนของสินค้านั้นๆ เมื่อขายได้';
        
        ALTER TABLE `tb_bill_sale` CHANGE `matjam` `matjam` DOUBLE(22,14) NULL DEFAULT NULL COMMENT 'จำนวนเงินมัดจำ';
        ALTER TABLE `sale_temp` ADD `point` DOUBLE(15,4) NULL DEFAULT NULL COMMENT 'คะแนน ต่อการซื้อสินค้านี้ 1 ชิ้น' AFTER `price_promotion`;
        ALTER TABLE `exchange` ADD `status` ENUM('on','off') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'on' COMMENT 'สถานะใช้อัตราการแปลกเปลี่ยน' AFTER `money_name`;
        
        ALTER TABLE `tb_product` ADD `not_vat` ENUM('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no' COMMENT 'สินค้าไม่คิดแวท' AFTER `point`;
        
        ALTER TABLE `sale_temp` ADD `product_free` ENUM('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no' COMMENT 'สินค้า แถมฟรี' AFTER `point`;
        ALTER TABLE `sale_temp` ADD PRIMARY KEY(`pk_temp`);
        ALTER TABLE `sale_temp` ADD `product_not_vat` ENUM('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no' COMMENT 'สินค้าไม่คิดแวท' AFTER `product_free`;        
        ALTER TABLE `tb_bill_sale_detail` ADD `product_free` ENUM('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no' COMMENT 'สินค้า แถมฟรี' AFTER `send_date_sucees`;
        ALTER TABLE `sale_temp` CHANGE `old_price_product` `old_price_product` DOUBLE(22,14) NOT NULL DEFAULT '0.0000' COMMENT 'ราคาเดิมของสินค้า';
        ALTER TABLE `sale_temp` CHANGE `old_price` `old_price` DOUBLE(22,14) NULL DEFAULT NULL COMMENT 'ราคาทุน';
        ALTER TABLE `tb_car_customer` CHANGE `car_id` `car_id` INT(11) NULL DEFAULT NULL COMMENT 'รหัสเส้นทางเดินรถ';
        ALTER TABLE `tb_bill_config` CHANGE `bill_send_sum_footer` `bill_send_sum_footer` ENUM('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no';
        ALTER TABLE `role_group` CHANGE `remark` `remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'หมายเหตุ';
        ALTER TABLE `pay_types` CHANGE `remark` `remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'หมายเหตุ';
        ALTER TABLE `pay_types` CHANGE `name` `name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ชื่อประเภทรายจ่าย';
        ALTER TABLE `quotation_details` CHANGE `is_vat` `is_vat` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'no';
        ALTER TABLE `bill_running` CHANGE `channel_id` `channel_id` INT(11) NULL DEFAULT NULL COMMENT 'รหัสช่องทางจำหน่าย';
        
        ALTER TABLE `tb_product` CHANGE `product_detail` `product_detail` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'รายละเอียด';
        ALTER TABLE `tb_product` ADD `product_details_remark` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'รายละเอียดสินค้า' AFTER not_vat;
        
        UPDATE tb_bill_sale_detail SET bill_sale_detail_total=(bill_sale_detail_qty * bill_sale_detail_price) WHERE bill_sale_detail_promotion=0; 
        ALTER TABLE tb_mod_payroll_shift ADD start_time VARCHAR(10) NULL;
        ALTER TABLE tb_mod_payroll_shift ADD end_time VARCHAR(10) NULL;
        ALTER TABLE tb_mod_payroll_shift ADD start_break VARCHAR(10) NULL;
        ALTER TABLE tb_mod_payroll_shift ADD end_break VARCHAR(10) NULL;
        ALTER TABLE tb_mod_payroll_table_job ADD day1_shift_id INT(11) NULL;
        ALTER TABLE tb_mod_payroll_table_job ADD day2_shift_id INT(11) NULL;
        ALTER TABLE tb_mod_payroll_table_job ADD day3_shift_id INT(11) NULL;
        ALTER TABLE tb_mod_payroll_table_job ADD day4_shift_id INT(11) NULL;
        ALTER TABLE tb_mod_payroll_table_job ADD day5_shift_id INT(11) NULL;
        ALTER TABLE tb_mod_payroll_table_job ADD day6_shift_id INT(11) NULL;
        ALTER TABLE tb_mod_payroll_table_job ADD day7_shift_id INT(11) NULL;
        
        ALTER TABLE tb_product ADD warranty_old  int(4) NULL COMMENT 'เลขที่ ';
        
        ALTER TABLE tb_mod_payroll_employee_ta_detail ADD shift_id int(11) NULL;
        ALTER TABLE tb_5free1 ADD product_id_free INT(11) NOT NULL COMMENT 'สินค้าที่จะแถมฟรี';
        ALTER TABLE tb_organization ADD use_auto_print VARCHAR(10) NOT NULL DEFAULT "no" COMMENT "เปิดใช้ระบบพิมพ์ออโต้"
        ALTER TABLE tb_mod_payroll_employee CHANGE emd_end emp_end DATE NULL COMMENT 'วันสิ้นสุดการเป็นพนักงาน';
        ALTER TABLE  `tb_mod_room_stay` CHANGE  `total_guest`  `total_guest` INT( 1 ) NULL DEFAULT NULL ;
        ALTER TABLE  `tb_mod_room_add_money` ADD  `room_id` INT( 4 ) NULL DEFAULT NULL ,ADD  `created_at` DATETIME NOT NULL ,ADD  `status` VARCHAR( 10 ) NOT NULL DEFAULT  'credit';
        ALTER TABLE  `tb_mod_room_add_money` ADD  `stay_id` INT( 11 ) NULL DEFAULT NULL;
        ALTER TABLE  `tb_mod_room_miter` ADD  `stay_id` INT( 11 ) NULL;
        ALTER TABLE  `tb_mod_room_stay` ADD  `status` VARCHAR( 20 ) NOT NULL DEFAULT  'use';
        ALTER TABLE  `tb_mod_food_import_item` ADD  `user_id` INT( 11 ) NULL DEFAULT NULL COMMENT  'ผู้บันทึก';
        ALTER TABLE  `tb_mod_food_take_out` ADD  `price` DOUBLE( 15, 4 ) NULL DEFAULT NULL;
        ALTER TABLE  `tb_mod_food_stock` ADD  `unit` VARCHAR( 100 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL;
        ALTER TABLE  `tb_mod_food_stock` CHANGE  `date`  `date` DATE NULL DEFAULT NULL;
        ALTER TABLE  `tb_mod_food_item` ADD  `create_date` DATE NULL;
        ALTER TABLE  `tb_mod_food_menu_group` ADD  `kitchen_id` INT( 11 ) NULL DEFAULT NULL;
        UPDATE tb_organization SET version_jpos=:version_jpos,`use_local_storage`='0' WHERE org_id='1';
        
        ALTER TABLE tb_product ADD sale_on_ecommerce VARCHAR(10) DEFAULT 'no' COMMENT 'ให้สินค้านี้ไปแสดงบนร้านค้าออนไลน์ หรือไม่ no คือไม่ yes คือใช่';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
