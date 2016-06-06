package vo

import (
	"time"
)

type OrderVo struct {
	Id               int
	OrderNumber      string
	Name             string
	MerchantUserName string
	MobileNumber     string
	PrincipalBalance float64
	MerchantName     string
	OrderTime        time.Time
}

type ReqOrder struct {
	Id int `form:"id"`
}
