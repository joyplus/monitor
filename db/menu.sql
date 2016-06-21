INSERT INTO `node` (`id`, `title`, `name`, `level`, `pid`, `remark`, `status`, `group_id`) VALUES
(30, '可结算订单', 'order/finishedlist', 2, 25, '', 2, 1),
(31, '获取可结算订单列表', 'getfinishedorders', 3, 30, '', 2, 1);

INSERT INTO `node_roles` (`id`, `node_id`, `role_id`) VALUES (NULL, '30', '2'), (NULL, '31', '2');