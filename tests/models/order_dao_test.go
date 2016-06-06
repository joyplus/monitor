package models

import (
	. "github.com/smartystreets/goconvey/convey"
	"monitor/models"
	"testing"
)

func Test_GetOrdersByStatus(t *testing.T) {

	Convey("获得支付完成，但未完成商户充值的订单列表", t, func() {

		rst, err := models.GetOrdersByStatus(2, 0)

		So(err, ShouldBeEmpty)

		lastOrder := rst[len(rst)-1]

		So(lastOrder.OrderNumber, ShouldEqual, "TRX2016053114503990082")
	})

}
