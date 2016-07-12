INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES
(30, '可结算订单', 'order/finishedlist', 2, 25, '', 2, 1),
(31, '获取可结算订单列表', 'getfinishedorders', 3, 30, '', 2, 1),
(32, '显示结算订单页面', 'finishedlist', 3, 26, '', 2, 1);


--账单
INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES (NULL, '30', '2'), (NULL, '31', '2');
INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES (NULL, '32', '2');

INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES
(33, '账单', 'payment/listpayment', 2, 25, '', 2, 1);

INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES (NULL, '33', '2');

INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES (NULL, '显示账单页面', 'listpayment', '3', '33', '', '2', '1');
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES (NULL, '获取账单列表', 'getlist', '3', '33', '', '2', '1');
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES (NULL, '获得账单状态列表', 'paymentstatus', '3', '33', '', '2', '1');
INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES (NULL, '获取逾期状态列表', 'delaystatus', '3', '33', '', '2', '1');


INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES (NULL, '34', '2');
INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES (NULL, '35', '2');
INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES (NULL, '36', '2');
INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES (NULL, '37', '2');