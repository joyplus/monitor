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
