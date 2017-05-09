-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2015 at 12:25 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Jangkoo`
--

-- --------------------------------------------------------

--
-- Table structure for table `lb_account_basic_permission`
--

CREATE TABLE IF NOT EXISTS `lb_account_basic_permission` (
  `account_basic_permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `basic_permission_id` int(11) NOT NULL,
  `basic_permission_status` int(1) NOT NULL,
  PRIMARY KEY (`account_basic_permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `lb_account_basic_permission`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_account_define_permission`
--

CREATE TABLE IF NOT EXISTS `lb_account_define_permission` (
  `account_define_permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `define_permission_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`account_define_permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lb_account_roles`
--

CREATE TABLE IF NOT EXISTS `lb_account_roles` (
  `account_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `accout_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`account_role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `lb_account_roles`
--

INSERT INTO `lb_account_roles` (`account_role_id`, `accout_id`, `role_id`) VALUES
(1, 213, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lb_bank_account`
--

CREATE TABLE IF NOT EXISTS `lb_bank_account` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_account_id` int(11) NOT NULL,
  `lb_bank_account` varchar(255) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `lb_bank_account`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_basic_permission`
--

CREATE TABLE IF NOT EXISTS `lb_basic_permission` (
  `basic_permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `basic_permission_name` varchar(100) NOT NULL,
  `basic_permission_description` varchar(255) NOT NULL,
  `basic_permission_hidden` int(1) NOT NULL,
  PRIMARY KEY (`basic_permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `lb_basic_permission`
--


-- --------------------------------------------------------

--
-- Table structure for table `lb_comment`
--

CREATE TABLE IF NOT EXISTS `lb_comment` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_module_name` varchar(100) NOT NULL,
  `lb_comment_description` longtext NOT NULL,
  `lb_item_module_id` int(11) NOT NULL,
  `lb_account_id` int(11) NOT NULL,
  `lb_comment_date` date NOT NULL,
  `lb_parent_comment_id` int(11) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lb_contracts`
--

CREATE TABLE IF NOT EXISTS `lb_contracts` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_customer_id` int(11) NOT NULL,
  `lb_address_id` int(11) NOT NULL,
  `lb_contact_id` int(11) NOT NULL,
  `lb_contract_no` varchar(50) NOT NULL,
  `lb_contract_notes` varchar(255) NOT NULL,
  `lb_contract_date_start` date NOT NULL,
  `lb_contract_date_end` date NOT NULL,
  `lb_contract_type` varchar(100) NOT NULL,
  `lb_contract_amount` decimal(10,2) NOT NULL,
  `lb_contract_parent` int(11) NOT NULL,
  `lb_contract_status` varchar(50) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=174 ;

--
-- Dumping data for table `lb_contracts`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_contract_document`
--

CREATE TABLE IF NOT EXISTS `lb_contract_document` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_contract_id` int(11) NOT NULL,
  `lb_document_url` varchar(255) NOT NULL,
  `lb_document_name` varchar(255) NOT NULL,
  `lb_document_url_icon` varchar(255) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `lb_contract_document`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_contract_invoice`
--

CREATE TABLE IF NOT EXISTS `lb_contract_invoice` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_contract_id` int(11) NOT NULL,
  `lb_invoice_id` int(11) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

--
-- Dumping data for table `lb_contract_invoice`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_core_entities`
--

CREATE TABLE IF NOT EXISTS `lb_core_entities` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_entity_type` char(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'INVOICE, QUOTATION, CUSTOMER,...',
  `lb_entity_primary_key` int(11) NOT NULL,
  `lb_created_by` int(11) NOT NULL,
  `lb_created_date` datetime NOT NULL,
  `lb_last_updated_by` int(11) NOT NULL,
  `lb_last_update` datetime NOT NULL,
  `lb_subscription_id` int(11) NOT NULL,
  `lb_locked_from_deletion` tinyint(1) NOT NULL COMMENT 'e.g. already paid or written-off invoices',
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='attributes that almost all important models should have' AUTO_INCREMENT=3882 ;

--
-- Dumping data for table `lb_core_entities`
--


-- --------------------------------------------------------

--
-- Table structure for table `lb_customer_addresses`
--

CREATE TABLE IF NOT EXISTS `lb_customer_addresses` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_customer_id` int(11) NOT NULL,
  `lb_customer_address_line_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lb_customer_address_line_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_customer_address_city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_customer_address_state` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_customer_address_country` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_customer_address_postal_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_customer_address_website_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_customer_address_phone_1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_customer_address_phone_2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_customer_address_fax` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_customer_address_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_customer_address_note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_customer_address_is_active` tinyint(1) NOT NULL,
  `lb_customer_address_is_billing` tinyint(1) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=59 ;

--
-- Dumping data for table `lb_customer_addresses`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_customer_address_contacts`
--

CREATE TABLE IF NOT EXISTS `lb_customer_address_contacts` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_customer_address_id` int(11) NOT NULL,
  `lb_customer_contact_id` int(11) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `lb_customer_address_contacts`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_customer_contacts`
--

CREATE TABLE IF NOT EXISTS `lb_customer_contacts` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_customer_id` int(11) DEFAULT NULL,
  `lb_customer_contact_first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lb_customer_contact_last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lb_customer_contact_office_phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_customer_contact_office_fax` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_customer_contact_mobile` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_customer_contact_email_1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_customer_contact_email_2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_customer_contact_note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_customer_contact_is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=43 ;

--
-- Dumping data for table `lb_customer_contacts`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_default_note`
--

CREATE TABLE IF NOT EXISTS `lb_default_note` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_default_note_quotation` longtext NOT NULL,
  `lb_default_note_invoice` longtext NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `lb_default_note`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_define_permission`
--

CREATE TABLE IF NOT EXISTS `lb_define_permission` (
  `define_permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `define_permission_name` varchar(100) NOT NULL,
  `define_description` varchar(255) NOT NULL,
  `define_permission_hidden` int(1) NOT NULL,
  PRIMARY KEY (`define_permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `lb_define_permission`
--


-- --------------------------------------------------------

--
-- Table structure for table `lb_documents`
--

CREATE TABLE IF NOT EXISTS `lb_documents` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_document_parent_type` varchar(255) NOT NULL,
  `lb_document_parent_id` int(11) NOT NULL,
  `lb_account_id` int(11) NOT NULL,
  `lb_document_url` varchar(255) NOT NULL,
  `lb_document_name` varchar(255) NOT NULL,
  `lb_document_uploaded_datetime` datetime NOT NULL,
  `lb_document_encoded_name` varchar(255) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `lb_documents`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_expenses`
--

CREATE TABLE IF NOT EXISTS `lb_expenses` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_category_id` int(11) NOT NULL,
  `lb_expenses_no` varchar(50) NOT NULL,
  `lb_expenses_amount` decimal(10,2) NOT NULL,
  `lb_expenses_date` date NOT NULL,
  `lb_expenses_recurring_id` int(11) DEFAULT NULL,
  `lb_expenses_bank_account_id` int(11) DEFAULT NULL,
  `lb_expenses_note` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `lb_expenses`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_expenses_customer`
--

CREATE TABLE IF NOT EXISTS `lb_expenses_customer` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_expenses_id` int(11) NOT NULL,
  `lb_customer_id` int(11) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `lb_expenses_customer`
--

-- --------------------------------------------------------

--
-- Table structure for table `lb_expenses_invoice`
--

CREATE TABLE IF NOT EXISTS `lb_expenses_invoice` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_expenses_id` int(11) NOT NULL,
  `lb_invoice_id` int(11) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `lb_expenses_invoice`
--


-- --------------------------------------------------------

--
-- Table structure for table `lb_expenses_tax`
--

CREATE TABLE IF NOT EXISTS `lb_expenses_tax` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_expenses_id` int(11) NOT NULL,
  `lb_tax_id` int(11) NOT NULL,
  `lb_expenses_tax_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lb_genera`
--

CREATE TABLE IF NOT EXISTS `lb_genera` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_genera_currency_symbol` varchar(100) NOT NULL,
  `lb_thousand_separator` varchar(50) NOT NULL,
  `lb_decimal_symbol` varchar(50) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `lb_genera`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_invoices`
--

CREATE TABLE IF NOT EXISTS `lb_invoices` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_invoice_group` char(60) COLLATE utf8_unicode_ci NOT NULL COMMENT 'INVOICE, QUOTATION',
  `lb_generated_from_quotation_id` int(11) DEFAULT NULL,
  `lb_invoice_no` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lb_invoice_date` date NOT NULL,
  `lb_invoice_due_date` date DEFAULT NULL,
  `lb_invoice_company_id` int(11) DEFAULT NULL COMMENT 'owner company',
  `lb_invoice_company_address_id` int(11) DEFAULT NULL,
  `lb_invoice_customer_id` int(11) DEFAULT NULL,
  `lb_invoice_customer_address_id` int(11) DEFAULT NULL,
  `lb_invoice_attention_contact_id` int(11) DEFAULT NULL,
  `lb_invoice_subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_invoice_note` longtext COLLATE utf8_unicode_ci,
  `lb_invoice_status_code` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_invoice_encode` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `lb_quotation_id` int(11) NOT NULL,
  `lb_invoice_internal_note` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=407 ;

--
-- Dumping data for table `lb_invoices`
--


-- --------------------------------------------------------

--
-- Table structure for table `lb_invoice_items`
--

CREATE TABLE IF NOT EXISTS `lb_invoice_items` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_invoice_id` int(11) NOT NULL,
  `lb_invoice_item_type` char(60) COLLATE utf8_unicode_ci NOT NULL COMMENT 'LINE_ITEM, DISCOUNT, TAX',
  `lb_invoice_item_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_invoice_item_quantity` decimal(10,2) NOT NULL DEFAULT '0.00',
  `lb_invoice_item_value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `lb_invoice_item_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1066 ;

--
-- Dumping data for table `lb_invoice_items`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_invoice_item_templates`
--

CREATE TABLE IF NOT EXISTS `lb_invoice_item_templates` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_item_title` varchar(255) DEFAULT NULL,
  `lb_item_description` longtext NOT NULL,
  `lb_item_unit_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `lb_invoice_item_templates`
--


-- --------------------------------------------------------

--
-- Table structure for table `lb_invoice_totals`
--

CREATE TABLE IF NOT EXISTS `lb_invoice_totals` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_invoice_id` int(11) NOT NULL,
  `lb_invoice_revision_id` int(11) NOT NULL COMMENT '0 for latest',
  `lb_invoice_subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `lb_invoice_total_after_discounts` decimal(10,2) NOT NULL DEFAULT '0.00',
  `lb_invoice_total_after_taxes` decimal(10,2) NOT NULL DEFAULT '0.00',
  `lb_invoice_total_paid` decimal(10,2) NOT NULL DEFAULT '0.00',
  `lb_invoice_total_outstanding` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=393 ;

--
-- Dumping data for table `lb_invoice_totals`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_modules`
--

CREATE TABLE IF NOT EXISTS `lb_modules` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `module_directory` varchar(100) NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `module_text` varchar(100) NOT NULL,
  `modules_description` varchar(255) NOT NULL,
  `module_hidden` int(1) NOT NULL,
  `module_order` int(11) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `lb_modules`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_next_ids`
--

CREATE TABLE IF NOT EXISTS `lb_next_ids` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_next_invoice_number` int(11) NOT NULL,
  `lb_next_quotation_number` int(11) NOT NULL,
  `lb_next_payment_number` int(11) NOT NULL,
  `lb_next_contract_number` int(11) NOT NULL,
  `lb_next_expenses_number` int(11) NOT NULL,
  `lb_next_po_number` int(11) NOT NULL,
  `lb_next_supplier_invoice_number` int(11) NOT NULL,
  `	lb_next_supplier_payment_number` int(11) NOT NULL,
  `lb_next_supplier_payment_number` int(11) NOT NULL,
  `lb_next_pv_number` int(11) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `lb_next_ids`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_payment`
--

CREATE TABLE IF NOT EXISTS `lb_payment` (
  `lb_record_primary_key` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lb_payment_customer_id` int(10) unsigned NOT NULL,
  `lb_payment_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_payment_method` int(11) NOT NULL,
  `lb_payment_date` date NOT NULL,
  `lb_payment_notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_payment_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=162 ;

--
-- Dumping data for table `lb_payment`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_payments`
--

CREATE TABLE IF NOT EXISTS `lb_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `paypal_id` varchar(250) NOT NULL,
  `created_at` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lb_payment_item`
--

CREATE TABLE IF NOT EXISTS `lb_payment_item` (
  `lb_record_primary_key` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lb_payment_id` int(11) unsigned NOT NULL,
  `lb_invoice_id` int(11) unsigned NOT NULL,
  `lb_payment_item_note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lb_payment_item_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=153 ;

--
-- Dumping data for table `lb_payment_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `lb_payment_vendor_invoice`
--

CREATE TABLE IF NOT EXISTS `lb_payment_vendor_invoice` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_payment_id` int(11) NOT NULL,
  `lb_vendor_invoice_id` int(11) NOT NULL,
  `lb_payment_item_note` varchar(100) NOT NULL,
  `lb_payment_item_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `lb_payment_vendor_invoice`
--

INSERT INTO `lb_payment_vendor_invoice` (`lb_record_primary_key`, `lb_payment_id`, `lb_vendor_invoice_id`, `lb_payment_item_note`, `lb_payment_item_amount`) VALUES
(49, 161, 94, '', '10.00');

-- --------------------------------------------------------

--
-- Table structure for table `lb_payment_voucher`
--

CREATE TABLE IF NOT EXISTS `lb_payment_voucher` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_pv_company_id` int(11) NOT NULL,
  `lb_pv_company_address_id` int(11) NOT NULL,
  `lb_payment_voucher_no` varchar(100) NOT NULL,
  `lb_pv_title` varchar(255) NOT NULL,
  `lb_pv_description` varchar(255) NOT NULL,
  `lb_pv_create_by` int(11) NOT NULL,
  `lb_pv_date` date NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `lb_payment_voucher`
--


-- --------------------------------------------------------

--
-- Table structure for table `lb_pv_expenses`
--

CREATE TABLE IF NOT EXISTS `lb_pv_expenses` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_payment_voucher_id` int(11) NOT NULL,
  `lb_expenses_id` int(11) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `lb_pv_expenses`
--


-- --------------------------------------------------------

--
-- Table structure for table `lb_quotation`
--

CREATE TABLE IF NOT EXISTS `lb_quotation` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_company_id` int(11) DEFAULT NULL,
  `lb_company_address_id` int(11) DEFAULT NULL,
  `lb_quotation_customer_id` int(11) DEFAULT NULL,
  `lb_quotation_customer_address_id` int(11) DEFAULT NULL,
  `lb_quotation_attention_id` int(11) DEFAULT NULL,
  `lb_quotation_no` varchar(50) DEFAULT NULL,
  `lb_quotation_date` date DEFAULT NULL,
  `lb_quotation_due_date` date DEFAULT NULL,
  `lb_quotation_subject` varchar(255) DEFAULT NULL,
  `lb_quotation_note` longtext,
  `lb_quotation_status` char(20) DEFAULT NULL,
  `lb_quotation_encode` varchar(255) DEFAULT NULL,
  `lb_quotation_internal_note` longtext NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=139 ;

--
-- Dumping data for table `lb_quotation`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_quotation_discount`
--

CREATE TABLE IF NOT EXISTS `lb_quotation_discount` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_quotation_id` int(11) NOT NULL,
  `lb_quotation_discount_description` varchar(255) NOT NULL,
  `lb_quotation_discount_value` decimal(10,2) NOT NULL,
  `lb_quotation_discount_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `lb_quotation_discount`
--


-- --------------------------------------------------------

--
-- Table structure for table `lb_quotation_item`
--

CREATE TABLE IF NOT EXISTS `lb_quotation_item` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_quotation_id` int(11) NOT NULL,
  `lb_quotation_item_description` text NOT NULL,
  `lb_quotation_item_quantity` decimal(10,2) NOT NULL,
  `lb_quotation_item_price` decimal(10,2) NOT NULL,
  `lb_quotation_item_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=327 ;

--
-- Dumping data for table `lb_quotation_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `lb_quotation_tax`
--

CREATE TABLE IF NOT EXISTS `lb_quotation_tax` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_quotation_id` int(11) NOT NULL,
  `lb_quotation_tax_id` int(11) NOT NULL,
  `lb_quotation_tax_value` decimal(10,2) NOT NULL,
  `lb_quotation_tax_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=203 ;

--
-- Dumping data for table `lb_quotation_tax`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_quotation_total`
--

CREATE TABLE IF NOT EXISTS `lb_quotation_total` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_quotation_id` int(11) NOT NULL,
  `lb_quotation_subtotal` decimal(10,2) NOT NULL,
  `lb_quotation_total_after_discount` decimal(10,2) NOT NULL,
  `lb_quotation_total_after_tax` decimal(10,2) NOT NULL,
  `lb_quotation_total_after_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=135 ;

--
-- Dumping data for table `lb_quotation_total`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_roles`
--

CREATE TABLE IF NOT EXISTS `lb_roles` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL,
  `role_description` varchar(255) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `lb_roles`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_roles_basic_permission`
--

CREATE TABLE IF NOT EXISTS `lb_roles_basic_permission` (
  `role_basic_permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `basic_permission_id` int(11) NOT NULL,
  `basic_permission_status` int(1) NOT NULL,
  PRIMARY KEY (`role_basic_permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=82 ;

--
-- Dumping data for table `lb_roles_basic_permission`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_roles_define_permission`
--

CREATE TABLE IF NOT EXISTS `lb_roles_define_permission` (
  `role_define_permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `define_permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `define_permission_status` int(1) NOT NULL,
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`role_define_permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `lb_roles_define_permission`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_subscription`
--

CREATE TABLE IF NOT EXISTS `lb_subscription` (
  `subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_name` varchar(255) NOT NULL,
  `subscription_cycle` int(11) NOT NULL,
  `subscription_value` varchar(255) NOT NULL,
  PRIMARY KEY (`subscription_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `lb_subscription`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_sys_accounts`
--

CREATE TABLE IF NOT EXISTS `lb_sys_accounts` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_email` char(255) NOT NULL,
  `account_password` char(255) NOT NULL,
  `account_created_date` datetime NOT NULL,
  `account_timezone` varchar(255) DEFAULT NULL,
  `account_language` varchar(255) DEFAULT NULL,
  `account_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=222 ;

--
-- Dumping data for table `lb_sys_accounts`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_sys_account_invitations`
--

CREATE TABLE IF NOT EXISTS `lb_sys_account_invitations` (
  `account_invitation_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_invitation_master_id` int(11) NOT NULL,
  `account_invitation_to_email` char(255) NOT NULL,
  `account_invitation_date` datetime NOT NULL,
  `account_invitation_status` tinyint(4) NOT NULL,
  `account_invitation_rand_key` char(100) NOT NULL,
  `account_invitation_project` int(11) DEFAULT NULL,
  `account_invitation_type` tinyint(1) NOT NULL COMMENT '0: team member, 1: customer',
  PRIMARY KEY (`account_invitation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `lb_sys_account_invitations`
--


-- --------------------------------------------------------

--
-- Table structure for table `lb_sys_account_password_reset`
--

CREATE TABLE IF NOT EXISTS `lb_sys_account_password_reset` (
  `account_password_reset_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `account_password_reset_rand_key` char(100) CHARACTER SET utf8 NOT NULL,
  `account_password_reset_rand_key_expiry` datetime NOT NULL,
  PRIMARY KEY (`account_password_reset_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `lb_sys_account_password_reset`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_sys_account_profiles`
--

CREATE TABLE IF NOT EXISTS `lb_sys_account_profiles` (
  `account_profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `account_profile_surname` varchar(255) NOT NULL,
  `account_profile_given_name` varchar(255) NOT NULL,
  `account_profile_preferred_display_name` varchar(255) NOT NULL,
  `account_profile_company_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_profile_id`),
  UNIQUE KEY `account_id` (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `lb_sys_account_profiles`
--


-- --------------------------------------------------------

--
-- Table structure for table `lb_sys_account_subscriptions`
--

CREATE TABLE IF NOT EXISTS `lb_sys_account_subscriptions` (
  `account_subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `account_subscription_package_id` tinyint(3) NOT NULL,
  `account_subscription_start_date` datetime NOT NULL,
  `account_subscription_end_date` datetime DEFAULT NULL,
  `account_subscription_status_id` tinyint(1) NOT NULL,
  `subscription_name` varchar(255) NOT NULL,
  PRIMARY KEY (`account_subscription_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `lb_sys_account_subscriptions`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_sys_account_team_members`
--

CREATE TABLE IF NOT EXISTS `lb_sys_account_team_members` (
  `account_team_member_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_account_id` int(11) NOT NULL,
  `master_account_id` int(11) NOT NULL,
  `is_customer` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL COMMENT '-1 deactivated; 1 active',
  PRIMARY KEY (`account_team_member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `lb_sys_account_team_members`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_sys_lists`
--

CREATE TABLE IF NOT EXISTS `lb_sys_lists` (
  `system_list_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `system_list_name` varchar(255) NOT NULL,
  `system_list_code` char(100) NOT NULL,
  `system_list_item_code` char(50) NOT NULL,
  `system_list_item_name` varchar(255) NOT NULL,
  `system_list_parent_item_id` int(11) DEFAULT NULL,
  `system_list_item_order` int(4) DEFAULT NULL,
  `system_list_item_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`system_list_item_id`),
  UNIQUE KEY `system_list_item_code` (`system_list_item_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `lb_sys_lists`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_sys_subscription_packages`
--

CREATE TABLE IF NOT EXISTS `lb_sys_subscription_packages` (
  `subscription_package_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_package_name` varchar(255) NOT NULL,
  `subscription_package_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`subscription_package_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `lb_sys_subscription_packages`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_sys_translate`
--

CREATE TABLE IF NOT EXISTS `lb_sys_translate` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_tranlate_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lb_translate_vn` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=134 ;

--
-- Dumping data for table `lb_sys_translate`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_taxes`
--

CREATE TABLE IF NOT EXISTS `lb_taxes` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_tax_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `lb_tax_value` decimal(5,2) NOT NULL COMMENT 'percentage:7 for 7%',
  `lb_tax_is_default` tinyint(1) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=26 ;

--
-- Dumping data for table `lb_taxes`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_user_credit_card`
--

CREATE TABLE IF NOT EXISTS `lb_user_credit_card` (
  `user_credit_card_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `credit_card_id` varchar(255) NOT NULL,
  PRIMARY KEY (`user_credit_card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lb_user_list`
--

CREATE TABLE IF NOT EXISTS `lb_user_list` (
  `system_list_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `system_list_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `system_list_code` varchar(100) CHARACTER SET utf8 NOT NULL,
  `system_list_item_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `system_list_item_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `system_list_parent_item_id` int(11) NOT NULL,
  `system_list_item_order` int(4) NOT NULL,
  `system_list_item_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`system_list_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `lb_user_list`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_user_payment`
--

CREATE TABLE IF NOT EXISTS `lb_user_payment` (
  `user_payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_subscription_id` int(11) NOT NULL,
  `date_payment` int(11) NOT NULL,
  PRIMARY KEY (`user_payment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lb_user_subscription`
--

CREATE TABLE IF NOT EXISTS `lb_user_subscription` (
  `user_subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `date_from` date NOT NULL,
  PRIMARY KEY (`user_subscription_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lb_vendor`
--

CREATE TABLE IF NOT EXISTS `lb_vendor` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_vendor_company_id` int(11) NOT NULL,
  `lb_vendor_company_address_id` int(11) NOT NULL,
  `lb_vendor_supplier_id` int(11) NOT NULL,
  `lb_vendor_supplier_address` int(11) NOT NULL,
  `lb_vendor_supplier_attention_id` int(11) NOT NULL,
  `lb_vendor_no` varchar(100) NOT NULL,
  `lb_vendor_category` varchar(255) NOT NULL,
  `lb_vendor_date` date NOT NULL,
  `lb_vendor_due_date` date NOT NULL,
  `lb_vendor_notes` longtext NOT NULL,
  `lb_vendor_subject` longtext,
  `lb_vendor_status` varchar(50) NOT NULL,
  `lb_vendor_encode` varchar(255) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=79 ;

--
-- Dumping data for table `lb_vendor`
--


-- --------------------------------------------------------

--
-- Table structure for table `lb_vendor_discount`
--

CREATE TABLE IF NOT EXISTS `lb_vendor_discount` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_vendor_type` varchar(100) NOT NULL,
  `lb_vendor_id` int(11) NOT NULL,
  `lb_vendor_description` varchar(255) NOT NULL,
  `lb_vendor_value` decimal(10,2) NOT NULL,
  `lb_vendor_invoice_id` int(11) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=123 ;

--
-- Dumping data for table `lb_vendor_discount`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_vendor_invoice`
--

CREATE TABLE IF NOT EXISTS `lb_vendor_invoice` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_vd_invoice_company_id` int(11) NOT NULL,
  `lb_vd_invoice_company_address_id` int(11) NOT NULL,
  `lb_vd_invoice_supplier_id` int(11) NOT NULL,
  `lb_vd_invoice_supplier_address_id` int(11) NOT NULL,
  `lb_vd_invoice_supplier_attention_id` int(11) NOT NULL,
  `lb_vd_invoice_no` varchar(100) DEFAULT NULL,
  `lb_vd_invoice_category` int(11) NOT NULL,
  `lb_vd_invoice_date` date DEFAULT NULL,
  `lb_vd_invoice_due_date` date NOT NULL,
  `lb_vd_invoice_notes` longtext,
  `lb_vd_invoice_subject` longtext,
  `lb_vd_invoice_status` varchar(50) NOT NULL,
  `lb_vd_invoice_encode` varchar(255) NOT NULL,
  `lb_vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=96 ;

--
-- Dumping data for table `lb_vendor_invoice`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_vendor_item`
--

CREATE TABLE IF NOT EXISTS `lb_vendor_item` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_vendor_type` varchar(100) NOT NULL,
  `lb_vendor_id` int(11) NOT NULL,
  `lb_vendor_item_description` longtext NOT NULL,
  `lb_vendor_item_price` decimal(10,2) NOT NULL,
  `lb_vendor_item_quantity` decimal(10,2) NOT NULL,
  `lb_vendor_item_amount` decimal(10,2) NOT NULL,
  `lb_vendor_invoice_id` int(11) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=243 ;

--
-- Dumping data for table `lb_vendor_item`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_vendor_tax`
--

CREATE TABLE IF NOT EXISTS `lb_vendor_tax` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_vendor_id` int(11) NOT NULL,
  `lb_vendor_tax_id` int(11) NOT NULL,
  `lb_vendor_tax_value` decimal(10,2) NOT NULL,
  `lb_vendor_tax_total` decimal(10,2) NOT NULL,
  `lb_vendor_type` varchar(100) NOT NULL,
  `lb_tax_name` varchar(100) NOT NULL,
  `lb_vendor_invoice_id` int(11) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=97 ;

--
-- Dumping data for table `lb_vendor_tax`
--



-- --------------------------------------------------------

--
-- Table structure for table `lb_vendor_total`
--

CREATE TABLE IF NOT EXISTS `lb_vendor_total` (
  `lb_record_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `lb_vendor_id` int(11) NOT NULL,
  `lb_vendor_type` varchar(100) NOT NULL,
  `lb_vendor_subtotal` decimal(10,2) NOT NULL,
  `lb_vendor_total_last_discount` decimal(10,2) NOT NULL,
  `lb_vendor_last_tax` decimal(10,2) NOT NULL,
  `lb_vendor_last_paid` decimal(10,2) NOT NULL,
  `lb_vendor_last_outstanding` decimal(10,2) NOT NULL,
  `lb_vendor_invoice_id` int(11) NOT NULL,
  PRIMARY KEY (`lb_record_primary_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=152 ;

--
-- Dumping data for table `lb_vendor_total`
--



-- --------------------------------------------------------

--
-- Table structure for table `process_checklist`
--

CREATE TABLE IF NOT EXISTS `process_checklist` (
  `pc_id` int(11) NOT NULL AUTO_INCREMENT,
  `subcription_id` int(11) NOT NULL,
  `pc_name` varchar(100) NOT NULL,
  `pc_created_by` int(11) NOT NULL,
  `pc_created_date` date NOT NULL,
  `pc_last_update_by` int(11) NOT NULL,
  `pc_last_update` date NOT NULL,
  PRIMARY KEY (`pc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `process_checklist_default`
--

CREATE TABLE IF NOT EXISTS `process_checklist_default` (
  `pcdi_id` int(11) NOT NULL AUTO_INCREMENT,
  `pc_id` int(11) NOT NULL,
  `pcdi_name` varchar(255) NOT NULL,
  `pcdi_order` int(2) NOT NULL,
  PRIMARY KEY (`pcdi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `process_checklist_item_rel`
--

CREATE TABLE IF NOT EXISTS `process_checklist_item_rel` (
  `pcir_id` int(11) NOT NULL AUTO_INCREMENT,
  `pc_id` int(11) NOT NULL,
  `pcir_name` varchar(255) NOT NULL,
  `pcir_order` int(11) NOT NULL,
  `pcir_entity_type` varchar(100) NOT NULL,
  `pcir_entity_id` int(11) NOT NULL,
  `pcir_status` int(1) NOT NULL,
  `pcir_status_update_by` int(11) NOT NULL,
  `pcir_status_date` date NOT NULL,
  PRIMARY KEY (`pcir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `yiisession`
--

CREATE TABLE IF NOT EXISTS `yiisession` (
  `id` char(32) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `yiisession`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
