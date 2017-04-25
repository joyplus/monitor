package routers

import (
	"github.com/astaxie/beego"
)

func init() {

	beego.GlobalControllerRouter["monitor/controllers:FinOrderController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinOrderController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/getall`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["monitor/controllers:FinOrderController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinOrderController"],
		beego.ControllerComments{
			Method: "ListConfirmedOrder",
			Router: `/confirmedlist`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["monitor/controllers:FinOrderController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinOrderController"],
		beego.ControllerComments{
			Method: "ConfirmMerchantPay",
			Router: `/confirmmerchantpay`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["monitor/controllers:FinOrderController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinOrderController"],
		beego.ControllerComments{
			Method: "ListFinishedOrder",
			Router: `/finishedlist`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["monitor/controllers:FinOrderController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinOrderController"],
		beego.ControllerComments{
			Method: "GetFinishedOrders",
			Router: `/getfinishedorders`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"],
		beego.ControllerComments{
			Method: "ListPayment",
			Router: `/listpayment`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"],
		beego.ControllerComments{
			Method: "GetList",
			Router: `/getlist`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"],
		beego.ControllerComments{
			Method: "GetPaymentStatusLovs",
			Router: `/paymentstatus`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"],
		beego.ControllerComments{
			Method: "GetDelayStatusLovs",
			Router: `/delaystatus`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"],
		beego.ControllerComments{
			Method: "SendSms",
			Router: `/sendsms`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinPaymentController"],
		beego.ControllerComments{
			Method: "CancelDelaypaymentFine",
			Router: `/canceldelaypaymentfine`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

}
