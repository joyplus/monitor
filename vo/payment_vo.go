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
	LovPaymentStatusStr string
	MerchantUserName string
	DelayPaymentFine float32
	LovDelayStatus int
	LovDelayStatusStr string
}
