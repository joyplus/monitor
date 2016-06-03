package models

import (
	"fenqiwanh5/models"
	"github.com/astaxie/beego/orm"
)

//Gets all orders status
func GetOrdersByStatus(orderStatus int, orderTime string) (orders []models.FinOrder, err error) {
	o := orm.NewOrm()
	_, err = o.Raw("SELECT * FROM fin_order WHERE lov_order_status=? and order_time>=?", orderStatus, orderTime).QueryRows(&orders)

	return
}
