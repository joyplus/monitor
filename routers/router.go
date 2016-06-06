package routers

import (
	"github.com/astaxie/beego" //beego 包
	"github.com/beego/admin"   //admin 包
	"monitor/controllers"      //自身业务包
)

func init() {

	admin.Run()
	beego.Router("/", &controllers.MainController{})

	ns := beego.NewNamespace("/admin",

		beego.NSNamespace("/order",
			beego.NSInclude(
				&controllers.FinOrderController{},
			),
		),
	)
	beego.AddNamespace(ns)

	beego.Info("monitor start")

}
