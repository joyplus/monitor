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

//func init() {
//	CheckPayments4Notification()
//}

func CheckPayments4Notification() (err error) {

	beego.Debug("Check payment for notification")

	currentTime := time.Now()
	paymentTime := currentTime.Add(time.Hour * 48)
	strPaymentTime := paymentTime.Format("2006-01-02")

	aryPayments, _ := GetPendingPayments(strPaymentTime)
	for _, paymentVo := range aryPayments {
		go sendPaymentNotificationBySMS(paymentVo, TplIdHuankuanNotify)
	}
	return
}

func GetPendingPayments(strPaymentTime string) (aryPayments []vo.PaymentVo, err error) {

	aryPayments, err = monitorModels.GetPaymentsByDate(strPaymentTime)

	return
}

func sendPaymentNotificationBySMS(paymentVo vo.PaymentVo, tplId string) (err error) {
	strPaymentAmount := strconv.FormatFloat(paymentVo.PaymentAmount, 'f', 0, 64)
	datas := []string{paymentVo.Name, strPaymentAmount, paymentVo.PaymentDate.Format("2006年01月02日")}

	if _MockOTP {
		beego.Debug(datas)
	} else {
		var rst map[string]interface{}
		rst, err = lib.SMSAdapter.SendTemplateSMS(paymentVo.MobileNumber, datas, tplId)
		if err == nil {
			if !strings.EqualFold(rst["statusCode"].(string), "000000") {
				err = &lib.SysError{
					ErrorCode:    lib.ERROR_SMS_SENT_FAILED,
					ErrorMessage: rst["statusMsg"].(string),
				}
			} else {
				lib.TasksLog.Info("")
			}
		}

		if err != nil {
			beego.Error(err.Error())
			lib.TasksLog.Error(err.Error())
		}
	}

	return
}

func ProcessPayments() (err error) {
	go UpdateOverduePayments()
	go UpdatePBDPayments()
	return
}

func UpdateOverduePayments() (err error) {

	beego.Debug("Update overdue payments")

	today := time.Now()

	strToday := today.Format("2006-01-02")

	err = monitorModels.UpdateOverduePayments(strToday)

	if err != nil {
		beego.Error(err.Error())
		lib.TasksLog.Error(err.Error())
	}

	return
}

func UpdatePBDPayments() (err error) {

	beego.Debug("Update PBD payments")

	today := time.Now()
	//一天之前
	d, _ := time.ParseDuration("-24h")

	last30Day := today.Add(d * 30)
	strLast30Day := last30Day.Format("2006-01-02")

	err = monitorModels.UpdatePBDPayments(strLast30Day)

	if err != nil {
		beego.Error(err.Error())
		lib.TasksLog.Error(err.Error())
	}

	return
}
