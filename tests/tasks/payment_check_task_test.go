package tasks

import (
	. "github.com/smartystreets/goconvey/convey"
	"monitor/tasks"
	_ "monitor/tests/models"
	"testing"
	//"time"
)

func Test_GetTargetPayments(t *testing.T) {

	Convey("获取一天后到期的payments", t, func() {

		payments, err := tasks.GetTargetPayments()

		So(err, ShouldBeNil)
		paymentVo := payments[0]
		So(paymentVo.PaymentAmount, ShouldEqual, 209)

	})

}
