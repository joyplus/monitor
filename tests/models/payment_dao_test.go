package models

import (
	. "github.com/smartystreets/goconvey/convey"
	"monitor/models"
	"testing"
)

func Test_GetPaymentsByDate(t *testing.T) {

	Convey("获得即将过期的账单", t, func() {

		rst, err := models.GetPaymentsByDate("2016-06-15")

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
		So(duration, ShouldEqual, 5)
	})

}
