package models

import (
	"fmt"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
	_ "github.com/lib/pq"
	_ "github.com/mattn/go-sqlite3"
)

var o orm.Ormer

func init() {
	MockDBConnect()
}

//数据库连接
func MockDBConnect() {
	var dns string
	db_type := "mysql"
	db_host := "localhost"
	db_port := "8889"
	db_user := "root"
	db_pass := "root"
	db_name := "fenqiwan_ci"
	db_path := ""
	db_sslmode := ""
	switch db_type {
	case "mysql":
		orm.RegisterDriver("mysql", orm.DRMySQL)
		dns = fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8", db_user, db_pass, db_host, db_port, db_name)
		break
	case "postgres":
		orm.RegisterDriver("postgres", orm.DRPostgres)
		dns = fmt.Sprintf("dbname=%s host=%s  user=%s  password=%s  port=%s  sslmode=%s", db_name, db_host, db_user, db_pass, db_port, db_sslmode)
	case "sqlite3":
		orm.RegisterDriver("sqlite3", orm.DRSqlite)
		if db_path == "" {
			db_path = "./"
		}
		dns = fmt.Sprintf("%s%s.db", db_path, db_name)
		break
	default:
		beego.Critical("Database driver is not allowed:", db_type)
	}
	orm.RegisterDataBase("default", db_type, dns)

	orm.Debug = true
	//loc, _ := time.LoadLocation("CST")
	//orm.SetDataBaseTZ("default", loc)
}
