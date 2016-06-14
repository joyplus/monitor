package tasks

import (
	. "github.com/smartystreets/goconvey/convey"
	"monitor/tasks"
	_ "monitor/tests/models"
	"testing"
	"time"
)

//func Test_ParseUpdateTime(t *testing.T) {

//	Convey("解析更新时间返回time类型", t, func() {

//		rst, err := tasks.ParseUpdateTime("2016-04-17 02:11:12")

//		So(err, ShouldBeEmpty)

//		t.Logf("更新时间", rst)

//	})

//}

func Test_GetPeroid(t *testing.T) {

	Convey("返回当前时间区间", t, func() {

		rst1, rst2 := tasks.GetPeroid(time.Now())

		t.Logf("开始时间: %s", rst1)
		t.Logf("结束时间: %s", rst2)

	})

}

//func Test_GetTargetOrders(t *testing.T) {

//	Convey("返回需要发送通知的订单(id=43)", t, func() {

//		orders, err := tasks.GetTargetOrders()

//		So(err, ShouldBeNil)
//		t.Logf("order number:%s", orders[0].OrderNumber)

//	})

//}

//func Test_GetEmailBody(t *testing.T) {

//	Convey("生成通知email body", t, func() {

//		orders, err := tasks.GetTargetOrders()

//		So(err, ShouldBeNil)
//		t.Logf("order number:%s", orders[0].OrderNumber)

//		emailBody, _ := tasks.GetEmailBody(orders)
//		t.Logf(emailBody)

//	})

//}

//func Test_SendNotifyMail(t *testing.T) {

//	Convey("发送通知邮件", t, func() {

//		orders, err := tasks.GetTargetOrders()

//		So(err, ShouldBeNil)
//		t.Logf("order number:%s", orders[0].OrderNumber)

//		err = tasks.SendNotifyMail(orders)
//		So(err, ShouldBeNil)

//	})

//}
