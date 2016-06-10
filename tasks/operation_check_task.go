package tasks

import (
	"fenqiwanh5/lib"
	//"fenqiwanh5/models"
	//"fmt"
	"github.com/astaxie/beego"
	monitorModels "monitor/models"
	"monitor/vo"
	"time"
)

func CheckOrder() (err error) {

	beego.Debug("Check order for notification")
	GetTargetOrders()

	return
}

//func ParseOrderTime(strOrderTime string) (updateTime time.Time, err error) {
//	updateTime, err = time.Parse("2006-01-02 15:04:05", "2016-04-17 02:11:12")
//	//if err == nil {
//	//	periodStart := updateTime.Add(time.Minute * 5)

//	//	if periodStart.Before(time.Now()) {

//	//	}
//	//}
//	return
//}

//订单完成时间超过5分钟，小于12分钟
func GetPeroid(orderTime time.Time) (start time.Time, end time.Time) {

	return orderTime.Add(time.Minute * 1), orderTime.Add(time.Minute * 10)
}

func GetTargetOrders() (aryOrders []vo.OrderVo, err error) {

	orderStatus := lib.LOV_ORDER_PAY_CONFIRM
	merchantStatus := lib.LOV_MERCHANT_PENDING

	var orders []vo.OrderVo
	orders, err = monitorModels.GetOrdersByStatus(orderStatus, merchantStatus)

	aryOrders = make([]vo.OrderVo, len(orders))
	currentTime := time.Now()

	index := 0
	notifyFlg := false
	for _, orderVo := range orders {
		start, end := GetPeroid(orderVo.OrderTime)

		if currentTime.After(start) && currentTime.Before(end) {
			notifyFlg = true
			aryOrders[index] = orderVo
			index++
		}
	}

	if notifyFlg {
		SendNotifyMail(aryOrders)
	}
	return
}
