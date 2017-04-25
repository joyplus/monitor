
--
-- Table structure for table `fin_order`
--

DROP TABLE IF EXISTS `fin_order`;
CREATE TABLE `fin_order` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `order_number` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `product_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_pic_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_time` timestamp NULL DEFAULT NULL,
  `down_payment` float DEFAULT NULL,
  `monthly_payment` float DEFAULT NULL,
  `first_payment_date` date DEFAULT NULL,
  `stages` int(11) DEFAULT NULL,
  `lov_order_status` tinyint(4) DEFAULT NULL,
  `lov_merchant_status` tinyint(4) NOT NULL DEFAULT '0',
  `merchant_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `principal_balance` float DEFAULT NULL,
  `interest_rate` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fin_order`
--

INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(1, 1, '123456', '部落冲突', 'http://i4.7399.com/android/141114/2283838i.png', '2016-04-10 17:10:11', 200, 300, '2016-04-11', 1, 0, 0, NULL, NULL, 0);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(2, 1, '123456789', '皇家战争', 'http://i4.7399.com/android/141114/2283838i.png', '2016-04-16 18:11:12', 200, 300, '2016-04-11', 1, 2, 0, NULL, NULL, 0);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(3, 2, '123456789test', '测试订单', 'http://i4.7399.com/android/141114/2283838i.png', '2016-04-16 18:11:12', 2000, 2080, '2016-04-11', 4, 0, 0, '1', 10000, 0.12);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(4, 3, 'TRX12345678', '测试订单4Payment', 'http://i4.7399.com/android/141114/2283838i.png', '2016-04-16 18:11:12', 2000, 2080, '2016-04-11', 3, 0, 0, '1', 10000, 0.12);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(14, 1, 'TRX2016053114203975125', '测试商户5126充值', 'http://test.url', '2016-05-31 06:20:39', 0, 0, '2016-05-31', 4, 0, 0, '1', 0, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(15, 1, 'TRX2016053114215736526', '测试商户5126充值', 'http://test.url', '2016-05-31 06:21:57', 0, 0, '2016-05-31', 4, 0, 0, '1', 0, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(16, 1, 'TRX2016053114311659649', '测试商户5126充值', 'http://test.url', '2016-05-31 06:31:16', 200, 209, '2016-05-31', 4, 0, 0, '1', 1000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(17, 1, 'TRX2016053114492914803', '测试商户5126充值', 'http://test.url', '2016-05-31 06:49:29', 200, 209, '2016-05-31', 4, 0, 0, '1', 1000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(18, 1, 'TRX2016053114503990082', '测试商户5126充值', 'http://test.url', '2016-05-31 06:50:39', 200, 209, '2016-05-31', 4, 2, 1, '1', 1000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(19, 1, 'TRX2016053114521441276', '测试商户5126充值', 'http://test.url', '2016-05-31 06:52:14', 200, 209, '2016-05-31', 4, 2, 1, '1', 1000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(20, 1, 'TRX2016053114534295056', '测试商户5126充值', 'http://test.url', '2016-05-31 06:53:42', 200, 209, '2016-05-31', 4, 2, 1, '1', 1000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(21, 1, 'TRX146475144832101551182', '测试商户5126充值', 'http://test.url', '2016-06-01 03:24:08', 1000, 1045, '2016-06-01', 4, 2, 1, '1', 5000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(22, 1, 'TRX14647886526792558591', '测试商户5126充值', 'http://test.url', '2016-06-01 13:44:12', 200, 209, '2016-06-01', 4, 2, 1, '1', 1000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(24, 2, 'TRX14650512093669591519', '测试商户5126充值', 'http://test.url', '2016-06-04 14:40:09', 400, 418, '2016-06-04', 4, 0, 0, '1', 2000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(26, 2, 'TRX14650512193496741394', '测试商户5126充值', 'http://test.url', '2016-06-04 14:40:19', 400, 418, '2016-06-04', 4, 0, 0, '1', 2000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(28, 2, 'TRX14650512631403225301', '测试商户5126充值', 'http://test.url', '2016-06-04 14:41:03', 400, 418, '2016-06-04', 4, 0, 0, '1', 2000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(29, 2, 'TRX14650515502242841287', '测试商户5126充值', 'http://test.url', '2016-06-04 14:45:50', 2, 2.09, '2016-06-04', 4, 0, 0, '1', 10, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(30, 2, 'TRX14650525371719114260', '测试商户5126充值', 'http://test.url', '2016-06-04 15:02:17', 2, 2.09, '2016-06-04', 4, 0, 0, '1', 10, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(34, 1, 'TRX14650542066724053069', '测试商户5126充值', 'http://test.url', '2016-06-04 15:30:06', 200, 209, '2016-06-04', 4, 0, 0, '1', 1000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(35, 1, 'TRX14650545016927657244', '测试商户5126充值', 'http://test.url', '2016-06-04 15:35:01', 200, 209, '2016-06-04', 4, 2, 1, '1', 1000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(36, 1, 'TRX14651420161929987886', '测试商户5126充值1000元 2016年06月05日', 'http://test.url', '2016-06-05 15:53:36', 200, 209, '2016-06-05', 4, 2, 1, '1', 1000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(37, 1, 'TRX14651420993994263338', '测试商户5126充值1000元', 'http://test.url', '2016-06-05 15:54:59', 200, 209, '2016-06-05', 4, 2, 1, '1', 1000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(38, 1, 'TRX14651436356655587368', '测试商户5126充值1000元', 'http://test.url', '2016-06-05 16:20:35', 200, 209, '2016-06-06', 4, 2, 1, '1', 1000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(39, 1, 'TRX14651964960446863540', '测试商户5126充值1000元', 'http://test.url', '2016-06-06 07:01:36', 200, 209, '2016-06-06', 4, 2, 1, '1', 1000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(40, 1, 'TRX14652012023870097241', '测试商户5126充值1000元', 'http://test.url', '2016-06-06 08:20:02', 200, 209, '2016-06-06', 4, 2, 1, '1', 1000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(41, 1, 'TRX14652020612465146086', '测试商户5126充值1000元', 'http://test.url', '2016-06-06 08:34:21', 200, 209, '2016-06-06', 4, 2, 1, '1', 1000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(42, 1, 'TRX14652021923447428555', '测试商户5126充值1000元06月06日', 'http://test.url', '2016-06-06 08:36:32', 200, 209, '2016-06-06', 4, 2, 1, '1', 1000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(43, 1, 'TRX14652808551888441566', '测试商户5126充值1000元', 'http://test.url', '2016-06-10 13:32:35', 200, 209, '2016-06-07', 4, 2, 1, '1', 1000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(44, 1, 'TRX14657193420583037285', '测试商户5126充值1000元', 'http://test.url', '2016-06-12 08:15:42', 200, 209, '2016-06-12', 4, 2, 0, '1', 1000, 0.009);
INSERT INTO `fin_order` (`id`, `person_id`, `order_number`, `product_name`, `product_pic_url`, `order_time`, `down_payment`, `monthly_payment`, `first_payment_date`, `stages`, `lov_order_status`, `lov_merchant_status`, `merchant_id`, `principal_balance`, `interest_rate`) VALUES(45, 1, 'TRX14657358974505754772', '测试商户5126充值1000元', 'http://test.url', '2016-06-12 12:51:37', 200, 209, '2016-06-12', 4, 2, 0, '1', 1000, 0.009);

-- --------------------------------------------------------

--
-- Table structure for table `fin_payment`
--

DROP TABLE IF EXISTS `fin_payment`;
CREATE TABLE `fin_payment` (
  `id` int(11) NOT NULL,
  `order_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `person_id` int(11) NOT NULL,
  `payment_number` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `payment_date` date NOT NULL,
  `payment_amount` float NOT NULL,
  `payment_fee` float NOT NULL DEFAULT '0',
  `lov_payment_status` tinyint(4) NOT NULL,
  `payment_stage` int(11) DEFAULT NULL,
  `actual_payment_date` datetime NOT NULL,
  `delay_payment_fine` float(10,2) NOT NULL,
  `lov_delay_status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fin_payment`
--

INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(1, '1', 1, 'PAY123456', '2016-04-14', 500, 0, 2, 2, '2016-06-01 11:30:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(25, '4', 3, 'PAY12345678', '2016-06-06', 300, 0, 2, 1, '2016-06-04 23:03:45', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(34, '4', 3, 'PAY12345679', '2016-07-06', 300, 0, 0, 2, '0000-00-00 00:00:00', 24.00, 1);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(35, '4', 3, 'PAY12345610', '2016-08-06', 300, 0, 0, 3, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(72, '18', 1, 'PAY2016053114504012750', '2016-06-13', 209, 0, 0, 1, '2016-05-31 15:37:38', 40.75, 2);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(73, '18', 1, 'PAY2016053114504013324', '2016-07-30', 209, 0, 2, 2, '2016-06-01 11:38:57', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(74, '18', 1, 'PAY2016053114504034073', '2016-08-29', 209, 0, 0, 3, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(75, '18', 1, 'PAY2016053114504022921', '2016-09-28', 209, 0, 0, 4, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(76, '19', 1, 'PAY2016053114521682268', '2016-06-30', 209, 0, 2, 1, '2016-06-01 11:35:40', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(77, '19', 1, 'PAY2016053114521692573', '2016-07-30', 209, 0, 2, 2, '2016-06-06 16:23:20', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(78, '19', 1, 'PAY2016053114521669341', '2016-08-29', 209, 0, 0, 3, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(79, '19', 1, 'PAY2016053114521665547', '2016-09-28', 209, 0, 0, 4, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(80, '20', 1, 'PAY2016053114534477622', '2016-06-30', 209, 0, 2, 1, '2016-05-31 15:41:18', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(81, '20', 1, 'PAY2016053114534497692', '2016-07-30', 209, 0, 2, 2, '2016-06-01 11:41:11', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(82, '20', 1, 'PAY2016053114534430813', '2016-08-29', 209, 0, 0, 3, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(83, '20', 1, 'PAY2016053114534491382', '2016-09-28', 209, 0, 0, 4, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(84, '21', 1, 'PAY146475145238887989270', '2016-07-01', 1045, 0, 2, 1, '2016-06-01 11:34:28', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(85, '21', 1, 'PAY146475145240904803098', '2016-07-31', 1045, 0, 2, 2, '2016-06-06 16:36:01', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(86, '21', 1, 'PAY146475145241392075787', '2016-08-30', 1045, 0, 0, 3, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(87, '21', 1, 'PAY146475145241695819759', '2016-09-29', 1045, 0, 0, 4, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(88, '22', 1, 'PAY14647886561960417491', '2016-07-01', 209, 0, 2, 1, '2016-06-04 23:50:25', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(89, '22', 1, 'PAY14647886561986137962', '2016-07-31', 209, 0, 2, 2, '2016-06-06 16:35:55', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(90, '22', 1, 'PAY14647886561992138255', '2016-08-30', 209, 0, 0, 3, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(91, '22', 1, 'PAY14647886562000839942', '2016-09-29', 209, 0, 0, 4, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(136, '35', 1, 'PAY14650545167793744828', '2016-07-04', 209, 9, 2, 1, '2016-06-04 23:50:42', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(137, '35', 1, 'PAY14650545167814825567', '2016-08-03', 209, 9, 2, 2, '2016-06-06 16:36:21', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(138, '35', 1, 'PAY14650545167822672354', '2016-09-02', 209, 9, 0, 3, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(139, '35', 1, 'PAY14664802284865469941', '2016-05-11', 209, 9, 2, 4, '2016-06-21 11:37:12', 40.76, 2);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(140, '36', 1, 'PAY14651420179649515152', '2016-07-05', 209, 9, 2, 1, '2016-06-06 16:35:41', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(141, '36', 1, 'PAY14652805279557125269', '2016-08-04', 209, 9, 2, 2, '2016-06-07 14:22:09', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(142, '36', 1, 'PAY14651420179695766277', '2016-09-03', 209, 9, 0, 3, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(143, '36', 1, 'PAY14651420179702119381', '2016-06-19', 209, 9, 0, 4, '0000-00-00 00:00:00', 34.48, 2);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(144, '37', 1, 'PAY14651447143664793874', '2016-07-05', 209, 9, 2, 1, '2016-06-06 00:38:35', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(145, '37', 1, 'PAY14652798690001308577', '2016-08-04', 209, 9, 2, 2, '2016-06-07 14:11:10', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(146, '37', 1, 'PAY14651421010352146341', '2016-09-03', 209, 9, 0, 3, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(147, '37', 1, 'PAY14651421010359014289', '2016-06-18', 209, 9, 0, 4, '0000-00-00 00:00:00', 35.53, 2);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(148, '38', 1, 'PAY14651447635532656727', '2016-07-06', 209, 9, 2, 1, '2016-06-06 00:39:25', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(149, '38', 1, 'PAY14652808307172012402', '2016-08-05', 209, 9, 2, 2, '2016-06-07 14:27:12', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(150, '38', 1, '', '2016-09-04', 209, 9, 0, 3, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(151, '38', 1, '', '2016-10-04', 209, 9, 0, 4, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(152, '39', 1, '', '2016-07-06', 209, 9, 2, 1, '2016-06-06 16:11:41', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(153, '39', 1, '', '2016-08-05', 209, 9, 2, 2, '2016-06-06 16:13:10', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(154, '39', 1, '', '2016-09-04', 209, 9, 0, 3, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(155, '39', 1, '', '2016-10-04', 209, 9, 0, 4, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(156, '40', 1, '', '2016-07-06', 209, 9, 2, 1, '2016-06-06 16:21:32', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(157, '40', 1, '', '2016-08-05', 209, 9, 0, 2, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(158, '40', 1, '', '2016-09-04', 209, 9, 0, 3, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(159, '40', 1, '', '2016-10-04', 209, 9, 0, 4, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(160, '41', 1, '', '2016-07-06', 209, 9, 2, 1, '2016-06-06 16:35:48', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(161, '41', 1, '', '2016-08-05', 209, 9, 0, 2, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(162, '41', 1, '', '2016-09-04', 209, 9, 0, 3, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(163, '41', 1, '', '2016-10-04', 209, 9, 0, 4, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(164, '42', 1, '', '2016-07-06', 209, 9, 2, 1, '2016-06-06 17:24:34', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(165, '42', 1, '', '2016-08-05', 209, 9, 0, 2, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(166, '42', 1, '', '2016-09-04', 209, 9, 0, 3, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(167, '42', 1, '', '2016-10-04', 209, 9, 0, 4, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(168, '43', 1, 'PAY14657359169849718215', '2016-07-07', 209, 9, 2, 1, '2016-06-12 20:51:58', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(169, '43', 1, '', '2016-08-06', 209, 9, 0, 2, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(170, '43', 1, '', '2016-09-05', 209, 9, 0, 3, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(171, '43', 1, '', '2016-10-05', 209, 9, 0, 4, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(172, '44', 1, '', '2016-07-12', 209, 9, 0, 1, '0000-00-00 00:00:00', 10.45, 1);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(173, '44', 1, '', '2016-08-11', 209, 9, 0, 2, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(174, '44', 1, '', '2016-09-10', 209, 9, 0, 3, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(175, '44', 1, '', '2016-10-10', 209, 9, 0, 4, '0000-00-00 00:00:00', 0.00, 0);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(176, '45', 1, '', '2016-06-20', 209, 9, 0, 1, '0000-00-00 00:00:00', 33.44, 2);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(177, '45', 1, 'PAY14664804396055158192', '2016-05-12', 209, 9, 2, 2, '2016-06-21 11:40:41', 39.71, 2);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(178, '45', 1, '', '2016-06-18', 209, 9, 0, 3, '0000-00-00 00:00:00', 35.53, 2);
INSERT INTO `fin_payment` (`id`, `order_id`, `person_id`, `payment_number`, `payment_date`, `payment_amount`, `payment_fee`, `lov_payment_status`, `payment_stage`, `actual_payment_date`, `delay_payment_fine`, `lov_delay_status`) VALUES(179, '45', 1, '', '2016-06-19', 209, 9, 0, 4, '0000-00-00 00:00:00', 34.48, 2);

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '2',
  `sort` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`id`, `name`, `title`, `status`, `sort`) VALUES(1, 'APP', 'System', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
CREATE TABLE `node` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT '1',
  `pid` bigint(20) NOT NULL DEFAULT '0',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `group_id` bigint(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `node`
--

INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(1, '权限管理', 'rbac', 1, 0, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(2, 'Node', 'node/index', 2, 1, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(3, 'node list', 'index', 3, 2, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(4, 'add or edit', 'AddAndEdit', 3, 2, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(5, 'del node', 'DelNode', 3, 2, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(6, 'User', 'user/index', 2, 1, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(7, 'user list', 'Index', 3, 6, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(8, 'add user', 'AddUser', 3, 6, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(9, 'update user', 'UpdateUser', 3, 6, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(10, 'del user', 'DelUser', 3, 6, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(11, 'Group', 'group/index', 2, 1, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(12, 'group list', 'index', 3, 11, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(13, 'add group', 'AddGroup', 3, 11, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(14, 'update group', 'UpdateGroup', 3, 11, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(15, 'del group', 'DelGroup', 3, 11, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(16, 'Role', 'role/index', 2, 1, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(17, 'role list', 'index', 3, 16, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(18, 'add or edit', 'AddAndEdit', 3, 16, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(19, 'del role', 'DelRole', 3, 16, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(20, 'get roles', 'Getlist', 3, 16, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(21, 'show access', 'AccessToNode', 3, 16, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(22, 'add accsee', 'AddAccess', 3, 16, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(23, 'show role to userlist', 'RoleToUserList', 3, 16, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(24, 'add role to user', 'AddRoleToUser', 3, 16, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(25, '订单管理', 'admin', 1, 0, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(26, '支付完成订单', 'order/confirmedlist', 2, 25, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(27, '获取待支付订单列表', 'getall', 3, 26, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(28, '充值确认', 'confirmmerchantpay', 3, 26, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(29, '显示订单页面', 'confirmedlist', 3, 26, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(30, '可结算订单', 'order/finishedlist', 2, 25, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(31, '获取可结算订单列表', 'getfinishedorders', 3, 30, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(32, '显示结算订单页面', 'finishedlist', 3, 26, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(33, '账单', 'payment/listpayment', 2, 25, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(34, '显示账单页面', 'listpayment', 3, 33, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(35, '获取账单列表', 'getlist', 3, 33, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(36, '获得账单状态列表', 'paymentstatus', 3, 33, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(37, '获取逾期状态列表', 'delaystatus', 3, 33, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(38, '发送催收短信', 'sendsms', 3, 33, '', 2, 1);
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES(39, '免除罚金', 'canceldelaypaymentfine', 3, 33, '', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `node_roles`
--

DROP TABLE IF EXISTS `node_roles`;
CREATE TABLE `node_roles` (
  `id` bigint(20) NOT NULL,
  `node_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `node_roles`
--

INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES(5, 25, 2);
INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES(6, 26, 2);
INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES(7, 27, 2);
INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES(8, 28, 2);
INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES(9, 29, 2);
INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES(10, 30, 2);
INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES(11, 31, 2);
INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES(12, 32, 2);
INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES(13, 33, 2);
INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES(14, 34, 2);
INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES(15, 35, 2);
INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES(16, 36, 2);
INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES(17, 37, 2);
INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES(18, 38, 2);
INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES(19, 39, 2);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `title`, `name`, `remark`, `status`) VALUES(1, 'Admin role', 'Admin', 'I''m a admin role', 2);
INSERT INTO `role` (`id`, `title`, `name`, `remark`, `status`) VALUES(2, '', 'operation', '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nickname` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `lastlogintime` datetime DEFAULT NULL,
  `createtime` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nickname`, `email`, `remark`, `status`, `lastlogintime`, `createtime`) VALUES(1, 'admin', 'd351c57064000cec4ce5558e79fa9cdb', 'Admin', 'scott.li@lianzi360.com', 'I''m admin', 2, NULL, '2016-06-03 09:29:08');
INSERT INTO `user` (`id`, `username`, `password`, `nickname`, `email`, `remark`, `status`, `lastlogintime`, `createtime`) VALUES(2, 'scott', 'd351c57064000cec4ce5558e79fa9cdb', 'mark', '', '', 2, NULL, '2016-06-06 15:40:28');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `user_id`, `role_id`) VALUES(3, 1, 1);
INSERT INTO `user_roles` (`id`, `user_id`, `role_id`) VALUES(5, 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fin_order`
--
ALTER TABLE `fin_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fin_payment`
--
ALTER TABLE `fin_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `node`
--
ALTER TABLE `node`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `node_roles`
--
ALTER TABLE `node_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `nickname` (`nickname`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fin_order`
--
ALTER TABLE `fin_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `fin_payment`
--
ALTER TABLE `fin_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=180;
--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `node`
--
ALTER TABLE `node`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `node_roles`
--
ALTER TABLE `node_roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;

CREATE TABLE `ssp_merchant` (
  `id` int(11) NOT NULL,
  `merchant_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_secret` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comission_rate` int(11) NOT NULL,
  `discount_rate` int(11) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ssp_merchant`
--

INSERT INTO `ssp_merchant` (`id`, `merchant_name`, `app_id`, `app_secret`, `comission_rate`, `discount_rate`, `update_time`) VALUES
(1, '来借钱', 'test_app_id', 'sfe023f_9fd&fwfl', 70, 80, '0000-00-00 00:00:00'),
(2, '测试渠道2', 'test_app_id2', 'sfe023f_9fd&fwfa', 70, 80, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ssp_merchant_bill_report`
--

CREATE TABLE `ssp_merchant_bill_report` (
  `id` int(11) NOT NULL,
  `work_date` date NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `count_pass` int(11) NOT NULL,
  `daily_amount` int(11) DEFAULT NULL,
  `bill_amount` int(11) DEFAULT NULL,
  `has_payed` tinyint(4) DEFAULT '0',
  `bill_count_pass` int(11) NOT NULL,
  `comission_rate` int(11) NOT NULL,
  `discount_rate` int(11) NOT NULL,
  `count_new_user` int(11) NOT NULL,
  `count_uv` int(11) NOT NULL,
  `count_apply` int(11) NOT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ssp_merchant_bill_report`
--

INSERT INTO `ssp_merchant_bill_report` (`id`, `work_date`, `merchant_id`, `count_pass`, `daily_amount`, `bill_amount`, `has_payed`, `bill_count_pass`, `comission_rate`, `discount_rate`, `count_new_user`, `count_uv`, `count_apply`, `update_time`) VALUES
(1, '2017-04-02', 1, 3, 2800, 2240, 0, 0, 0, 0, 0, 0, 0, '2017-04-03 13:40:42'),
(2, '2017-04-11', 1, 3, 2800, 2240, 0, 0, 0, 0, 0, 0, 0, '2017-04-12 05:58:29'),
(3, '2017-04-11', 2, 2, 2100, 1680, 0, 0, 0, 0, 0, 0, 0, '2017-04-12 05:58:29'),
(4, '2017-04-13', 1, 4, 2800, 2240, 0, 0, 0, 0, 0, 0, 0, '2017-04-14 08:08:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ssp_merchant`
--
ALTER TABLE `ssp_merchant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ssp_merchant_bill_report`
--
ALTER TABLE `ssp_merchant_bill_report`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `work_date` (`work_date`,`merchant_id`),
  ADD KEY `INDEX_WORKDATE` (`work_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ssp_merchant`
--
ALTER TABLE `ssp_merchant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ssp_merchant_bill_report`
--
ALTER TABLE `ssp_merchant_bill_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;


ALTER TABLE `user` ADD `merchantid` INT NOT NULL AFTER `status`;
