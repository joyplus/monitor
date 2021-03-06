package main

import (
	"encoding/gob"
	"fenqiwanh5/lib"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"github.com/beego/admin/src/models"
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

	lib.InitCacheManager()

	gob.Register(models.User{})
	gob.Register(make(map[string]bool))

	//mlib.SendNotifyMail2()

	beego.Run()
}
