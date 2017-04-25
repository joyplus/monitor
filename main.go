package main

import (
	"encoding/gob"
	//"fenqiwanh5/lib"
	_ "monitor/routers"
	_ "monitor/tasks"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"github.com/beego/admin/src/models"
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

	//lib.InitCacheManager()

	gob.Register(models.User{})
	gob.Register(make(map[string]bool))

	//mlib.SendNotifyMail2()

	beego.Run()
}
