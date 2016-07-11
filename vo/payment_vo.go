package vo

import (
	"time"
)

type PaymentVo struct {
	Id               int
	PaymentNumber    string
	Name             string
	MobileNumber     string
	ProductName      string
	PaymentDate      time.Time
	PaymentAmount    float64
	PaymentStage     int
	LovPaymentStatus int
	MerchantUserName string
	DelayPaymentFine float64
}
