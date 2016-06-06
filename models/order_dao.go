package models

import (
	"github.com/astaxie/beego/orm"
	"monitor/vo"
)

//Gets all orders by order status and merchant status
func GetOrdersByStatus(orderStatus int, merchantStatus string) (orders []vo.OrderVo, err error) {
	o := orm.NewOrm()
	_, err = o.Raw("SELECT order.id, order.order_number,`person`.name,matrix.merchant_user_name,`person`.mobile_number,`order`.principal_balance,merchant.merchant_name, order.lov_order_status,order.order_time FROM `fin_order` as `order` inner join `fin_person` as`person` on `order`.person_id=`person`.id inner join fin_merchant as merchant on merchant.id=order.merchant_id inner join fin_merchant_user_matrix as matrix on matrix.person_id=order.person_id and matrix.merchant_id=order.merchant_id WHERE `order`.lov_order_status =? and order.lov_merchant_status=? order by`order`.order_time desc", orderStatus, merchantStatus).QueryRows(&orders)

	return
}
