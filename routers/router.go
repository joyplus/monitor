package routers

import (
	"github.com/astaxie/beego" //beego 包
	"github.com/beego/admin"   //admin 包
	"monitor/controllers"      //自身业务包
)

func init() {

	admin.Run()
	beego.Router("/", &controllers.MainController{})

	beego.Info("monitor start")

}
