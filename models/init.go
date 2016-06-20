package models

import (
	"github.com/astaxie/beego"
	//"time"
)

var _OverdueFineDailyRate float64

func init() {
	_OverdueFineDailyRate, _ = beego.AppConfig.Float("overdue_fine_daily_rate")

	//orm.RegisterDataBase("default", db_type, dns)
	//loc, _ := time.LoadLocation("CST")
	//orm.DefaultTimeLoc = loc

	//orm.SetMaxIdleConns("default", 30)
	//orm.SetMaxOpenConns("default", 40)
}

func SetOverdueFineDailyRate(param float64) {
	_OverdueFineDailyRate = param
}
