package vo

import (
	"time"
)

type OrderVo struct {
	Id                int
	OrderNumber       string
	Name              string
	MerchantUserName  string
	MobileNumber      string
	ProductName       string
	PrincipalBalance  float64
	MerchantName      string
	OrderTime         time.Time
	LovMerchantStatus int
}

type ReqOrder struct {
	Id int `form:"id"`
}
