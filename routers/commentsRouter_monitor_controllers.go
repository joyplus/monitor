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

}
