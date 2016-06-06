package routers

import (
	"github.com/astaxie/beego"
)

func init() {

	beego.GlobalControllerRouter["monitor/controllers:FinOrderController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinOrderController"],
		beego.ControllerComments{
			"Post",
			`/`,
			[]string{"post"},
			nil})

	beego.GlobalControllerRouter["monitor/controllers:FinOrderController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinOrderController"],
		beego.ControllerComments{
			"GetOne",
			`/:id`,
			[]string{"get"},
			nil})

	beego.GlobalControllerRouter["monitor/controllers:FinOrderController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinOrderController"],
		beego.ControllerComments{
			"GetAll",
			`/GetAll`,
			[]string{"get"},
			nil})

	beego.GlobalControllerRouter["monitor/controllers:FinOrderController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinOrderController"],
		beego.ControllerComments{
			"Put",
			`/:id`,
			[]string{"put"},
			nil})

	beego.GlobalControllerRouter["monitor/controllers:FinOrderController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinOrderController"],
		beego.ControllerComments{
			"Delete",
			`/:id`,
			[]string{"delete"},
			nil})

	beego.GlobalControllerRouter["monitor/controllers:FinOrderController"] = append(beego.GlobalControllerRouter["monitor/controllers:FinOrderController"],
		beego.ControllerComments{
			"ListConfirmedOrder",
			`/ConfirmedList`,
			[]string{"get"},
			nil})

}
