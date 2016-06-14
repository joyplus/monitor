package tasks

import (
	"fenqiwanh5/lib"
	"github.com/astaxie/beego"
	monitorModels "monitor/models"
	"monitor/vo"
	"strconv"
	"strings"
	"time"
)

func CheckPayments4Notification() (err error) {

	beego.Debug("Check payment for notification")
	aryPayments, _ := GetTargetPayments()
	for _, paymentVo := range aryPayments {
		go sendPaymentNotificationBySMS(paymentVo)
	}
	return
}

func GetTargetPayments() (aryPayments []vo.PaymentVo, err error) {

	currentTime := time.Now()
	paymentTime := currentTime.Add(time.Hour * 48)
	strPaymentTime := paymentTime.Format("2006-01-02")

	aryPayments, err = monitorModels.GetPaymentsByDate(strPaymentTime)

	return
}

func sendPaymentNotificationBySMS(paymentVo vo.PaymentVo) (err error) {
	strPaymentAmount := strconv.FormatFloat(paymentVo.PaymentAmount, 'f', 0, 64)
	datas := []string{paymentVo.Name, strPaymentAmount, paymentVo.PaymentDate.Format("2006年01月02日")}
	tempId := "92965"

	if _MockOTP {
		beego.Debug(datas)
	} else {
		var rst map[string]interface{}
		rst, err = lib.SMSAdapter.SendTemplateSMS(paymentVo.MobileNumber, datas, tempId)
		if err == nil {
			if !strings.EqualFold(rst["statusCode"].(string), "000000") {
				err = &lib.SysError{
					ErrorCode:    lib.ERROR_SMS_SENT_FAILED,
					ErrorMessage: rst["statusMsg"].(string),
				}
			}
		}

		if err != nil {
			beego.Error(err.Error())
		}
	}

	return
}
