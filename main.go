package main

import (
	"fenqiwanh5/lib"
	//"fenqiwanh5/models"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "monitor/routers"
	_ "monitor/tasks"
)

//var redisx *lib.RedisxCache

func main() {
	orm.Debug, _ = beego.AppConfig.Bool("orm_debug")
	beego.SetLogger("file", `{"filename":"logs/monitor.log"}`)
	beego.SetLogFuncCall(true)

	logLevel, _ := beego.AppConfig.Int("log_level")
	beego.SetLevel(logLevel)

	if logLevel < 7 {
		beego.BeeLogger.DelLogger("console")
	}

	//models.Connect()
	lib.InitCacheManager()

	beego.Run()
}
