package routers

import (
	"github.com/astaxie/beego"
)

func init() {

	beego.GlobalControllerRouter["monitor/controllers:FinOrderController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinOrderController"],
		beego.ControllerComments{
			"GetAll",
			`/getall`,
			[]string{"post"},
			nil})

	beego.GlobalControllerRouter["monitor/controllers:FinOrderController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinOrderController"],
		beego.ControllerComments{
			"ListConfirmedOrder",
			`/confirmedlist`,
			[]string{"get"},
			nil})

	beego.GlobalControllerRouter["monitor/controllers:FinOrderController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinOrderController"],
		beego.ControllerComments{
			"ConfirmMerchantPay",
			`/confirmmerchantpay`,
			[]string{"post"},
			nil})

	beego.GlobalControllerRouter["monitor/controllers:FinOrderController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinOrderController"],
		beego.ControllerComments{
			"ListFinishedOrder",
			`/finishedlist`,
			[]string{"get"},
			nil})

	beego.GlobalControllerRouter["monitor/controllers:FinOrderController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinOrderController"],
		beego.ControllerComments{
			"GetFinishedOrders",
			`/getfinishedorders`,
			[]string{"post"},
			nil})

	beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"],
		beego.ControllerComments{
			"ListPayment",
			`/listpayment`,
			[]string{"get"},
			nil})

	beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"],
		beego.ControllerComments{
			"GetList",
			`/getlist`,
			[]string{"post"},
			nil})

	beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"],
		beego.ControllerComments{
			"GetPaymentStatusLovs",
			`/paymentstatus`,
			[]string{"post"},
			nil})

	beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"],
		beego.ControllerComments{
			"GetDelayStatusLovs",
			`/delaystatus`,
			[]string{"post"},
			nil})

	beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"],
		beego.ControllerComments{
			"SendSms",
			`/sendsms`,
			[]string{"post"},
			nil})

	beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"],
		beego.ControllerComments{
			"CancelDelaypaymentFine",
			`/canceldelaypaymentfine`,
			[]string{"post"},
			nil})

}
