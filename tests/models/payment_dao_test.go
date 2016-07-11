package models

import (
	"fenqiwanh5/lib"
	. "github.com/smartystreets/goconvey/convey"
	"monitor/models"
	"testing"
)

func Test_GetPaymentsByDate(t *testing.T) {

	Convey("获得即将过期的账单", t, func() {

		rst, err := models.GetPaymentsByDate("2016-06-15", 0)

		So(err, ShouldBeEmpty)
		So(len(rst), ShouldEqual, 1)

		paymentVo := rst[0]

		So(paymentVo.PaymentAmount, ShouldEqual, 209)
	})

}

func Test_CalcDuration(t *testing.T) {

	Convey("计算日期间隔2016-06-23到2016-06-28", t, func() {

		duration, err := models.CalcDuration("2016-06-23", "2016-06-28")

		So(err, ShouldBeEmpty)
		So(duration, ShouldEqual, 4)
	})

}

func Test_GetPaymentsByStatus(t *testing.T) {

	Convey("获得未支付，已逾期账单列表", t, func() {
		merchantId := 1
		paymentStatus := lib.LOV_PAYMENT_PAY_PENDING
		delayStatus := lib.LOV_PAYMENT_PAY_OVERDUE
		rst, err := models.GetPaymentsByStatus(merchantId, paymentStatus, delayStatus)

		So(err, ShouldBeNil)
		So(len(rst), ShouldEqual, 1)

	})

}
