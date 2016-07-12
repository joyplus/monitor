-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 07, 2016 at 05:23 AM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+08:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fenqiwan`
--

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

INSERT INTO `group` (`id`, `name`, `title`, `status`, `sort`) VALUES
(1, 'APP', 'System', 2, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `node`
--

INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES
(1, '权限管理', 'rbac', 1, 0, '', 2, 1),
(2, 'Node', 'node/index', 2, 1, '', 2, 1),
(3, 'node list', 'index', 3, 2, '', 2, 1),
(4, 'add or edit', 'AddAndEdit', 3, 2, '', 2, 1),
(5, 'del node', 'DelNode', 3, 2, '', 2, 1),
(6, 'User', 'user/index', 2, 1, '', 2, 1),
(7, 'user list', 'Index', 3, 6, '', 2, 1),
(8, 'add user', 'AddUser', 3, 6, '', 2, 1),
(9, 'update user', 'UpdateUser', 3, 6, '', 2, 1),
(10, 'del user', 'DelUser', 3, 6, '', 2, 1),
(11, 'Group', 'group/index', 2, 1, '', 2, 1),
(12, 'group list', 'index', 3, 11, '', 2, 1),
(13, 'add group', 'AddGroup', 3, 11, '', 2, 1),
(14, 'update group', 'UpdateGroup', 3, 11, '', 2, 1),
(15, 'del group', 'DelGroup', 3, 11, '', 2, 1),
(16, 'Role', 'role/index', 2, 1, '', 2, 1),
(17, 'role list', 'index', 3, 16, '', 2, 1),
(18, 'add or edit', 'AddAndEdit', 3, 16, '', 2, 1),
(19, 'del role', 'DelRole', 3, 16, '', 2, 1),
(20, 'get roles', 'Getlist', 3, 16, '', 2, 1),
(21, 'show access', 'AccessToNode', 3, 16, '', 2, 1),
(22, 'add accsee', 'AddAccess', 3, 16, '', 2, 1),
(23, 'show role to userlist', 'RoleToUserList', 3, 16, '', 2, 1),
(24, 'add role to user', 'AddRoleToUser', 3, 16, '', 2, 1),
(25, '订单管理', 'admin', 1, 0, '', 2, 1),
(26, '支付完成订单', 'order/confirmedlist', 2, 25, '', 2, 1),
(27, '获取待支付订单列表', 'getall', 3, 26, '', 2, 1),
(28, '充值确认', 'confirmmerchantpay', 3, 26, '', 2, 1),
(29, '显示订单页面', 'confirmedlist', 3, 26, '', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `node_roles`
--

DROP TABLE IF EXISTS `node_roles`;
CREATE TABLE `node_roles` (
  `id` bigint(20) NOT NULL,
  `node_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `node_roles`
--

INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES
(5, 25, 2),
(6, 26, 2),
(7, 27, 2),
(8, 28, 2),
(9, 29, 2);

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

INSERT INTO `role` (`id`, `title`, `name`, `remark`, `status`) VALUES
(1, 'Admin role', 'Admin', 'I''m a admin role', 2),
(2, '', 'operation', '', 2);

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

INSERT INTO `user` (`id`, `username`, `password`, `nickname`, `email`, `remark`, `status`, `lastlogintime`, `createtime`) VALUES
(1, 'admin', 'd351c57064000cec4ce5558e79fa9cdb', 'Admin', 'scott.li@lianzi360.com', 'I''m admin', 2, NULL, '2016-06-03 09:29:08'),
(2, 'mark', 'df2894fc405edfee0e0d506629cd9dfc', 'mark', '', '', 2, NULL, '2016-06-06 15:40:28');

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

INSERT INTO `user_roles` (`id`, `user_id`, `role_id`) VALUES
(3, 1, 1),
(5, 2, 2);

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `node`
--
ALTER TABLE `node`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `node_roles`
--
ALTER TABLE `node_roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
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
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--Date: 20160710
INSERT INTO fin_lov (`id`, `lov_id`, `lov_value`, `disp_order`, `lov_key`) VALUES (1, '0', '待支付', '1', 'LOV_PAYMENT_STATUS');
INSERT INTO fin_lov (`id`, `lov_id`, `lov_value`, `disp_order`, `lov_key`) VALUES (2, '2', '支付完成', '2', 'LOV_PAYMENT_STATUS');
INSERT INTO fin_lov (`id`, `lov_id`, `lov_value`, `disp_order`, `lov_key`) VALUES (3, '-1', '不限', '0', 'LOV_PAYMENT_STATUS');
INSERT INTO fin_lov (`id`, `lov_id`, `lov_value`, `disp_order`, `lov_key`) VALUES (4, '0', '正常', '1', 'LOV_DELAY_STATUS');
INSERT INTO fin_lov (`id`, `lov_id`, `lov_value`, `disp_order`, `lov_key`) VALUES (5, '1', '逾期少于30天', '2', 'LOV_DELAY_STATUS');
INSERT INTO fin_lov (`id`, `lov_id`, `lov_value`, `disp_order`, `lov_key`) VALUES (6, '2', '逾期大于30天', '3', 'LOV_DELAY_STATUS');
INSERT INTO fin_lov (`id`, `lov_id`, `lov_value`, `disp_order`, `lov_key`) VALUES (7, '-1', '不限', '0', 'LOV_DELAY_STATUS');


