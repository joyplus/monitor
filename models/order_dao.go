package models

import (
	"fenqiwanh5/lib"
	"github.com/astaxie/beego/orm"
	"monitor/vo"
)

//Gets all orders by order status and merchant status
func GetOrdersByStatus(orderStatus int, merchantStatus int) (orders []vo.OrderVo, err error) {
	o := orm.NewOrm()
	_, err = o.Raw("SELECT order.id, order.order_number,`person`.name,matrix.merchant_user_name,`person`.mobile_number,`order`.principal_balance,merchant.merchant_name, order.lov_order_status,order.order_time,order.lov_merchant_status FROM `fin_order` as `order` inner join `fin_person` as`person` on `order`.person_id=`person`.id inner join fin_merchant as merchant on merchant.id=order.merchant_id inner join fin_merchant_user_matrix as matrix on matrix.person_id=order.person_id and matrix.merchant_id=order.merchant_id WHERE `order`.lov_order_status =? and order.lov_merchant_status=? order by`order`.order_time desc", orderStatus, merchantStatus).QueryRows(&orders)

	return
}

func GetConfirmedOrders(query map[string]string, fields []string, sortby []string, order []string,
	offset int64, limit int64) (orders []vo.OrderVo, err error) {

	orderStatus := lib.LOV_ORDER_PAY_CONFIRM
	merchantStatus := lib.LOV_MERCHANT_PENDING

	orders, err = GetOrdersByStatus(orderStatus, merchantStatus)

	return
}

// Update merchant status
func UpdateOrderMerchantStatus(orderId int, merchantStatus int) (err error) {
	o := orm.NewOrm()
	_, err = o.Raw("UPDATE fin_order SET lov_merchant_status = ? WHERE id = ?", merchantStatus, orderId).Exec()

	return
}
