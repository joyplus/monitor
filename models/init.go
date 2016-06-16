package models

import (
	"github.com/astaxie/beego/orm"
	"time"
)

func init() {
	//orm.RegisterDataBase("default", db_type, dns)
	//loc, _ := time.LoadLocation("CST")
	//orm.DefaultTimeLoc = loc

	orm.SetMaxIdleConns("default", 30)
	orm.SetMaxOpenConns("default", 40)
}
