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
	PaymentStatus string
	MerchantUserName string
	DelayPaymentFine float64
	LovDelayStatus int
	DelayStatus string
}

