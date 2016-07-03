package tasks

import (
	"fenqiwanh5/lib"
	"fmt"
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
//查询账单并发送通知
func CheckPayments4Notification() (err error) {

	beego.Debug("Check payment for notification")
	err = SendPaymentNotification()

	if err != nil {
		beego.Error(err.Error())
		lib.TasksLog.Error(err.Error())
	}

	err = SendOverduePaymentNotification()

	if err != nil {
		beego.Error(err.Error())
		lib.TasksLog.Error(err.Error())
	}

	return
}

func SendPaymentNotification() (err error) {

	beego.Debug("Send notification for payments")
	var aryPayments []vo.PaymentVo
	aryPayments, err = GetPendingPayments()
	for _, paymentVo := range aryPayments {
		go sendPaymentNotificationBySMS(paymentVo, TplIdHuankuanNotify)
	}
	return
}

//查询一天后到期的账单
func GetPendingPayments() (aryPayments []vo.PaymentVo, err error) {

	currentTime := time.Now()
	paymentTime := currentTime.Add(time.Hour * 24)
	strPaymentDate := paymentTime.Format("2006-01-02")

	aryPayments, err = monitorModels.GetPaymentsByDate(strPaymentDate, lib.LOV_PAYMENT_PAY_NORMAL)

	return
}

func SendOverduePaymentNotification() (err error) {

	beego.Debug("Send notification for overdue payments")
	var aryPayments []vo.PaymentVo
	aryPayments, err = GetOverduePayments()
	for _, paymentVo := range aryPayments {
		go sendPaymentNotificationBySMS(paymentVo, TplIdYuqiNotify)
	}
	return
}

//查询已经逾期的账单
func GetOverduePayments() (aryPayments []vo.PaymentVo, err error) {

	aryPayments, err = monitorModels.GetOverduePayments()

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
			}
		}

		if err != nil {
			beego.Error(err.Error())
			lib.TasksLog.Error(err.Error())
		} else {
			lib.TasksLog.Info(fmt.Sprintf("Sent sms, tplId:%s, name:%s", tplId, paymentVo.Name))

		}
	}

	return
}

//更新账单通知
func ProcessPayments() (err error) {
	beego.Debug("Start to process payments")

	UpdateOverduePayments()
	UpdatePBDPayments()
	UpdatePaymentOverdueFine()
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

func UpdatePaymentOverdueFine() (err error) {

	beego.Debug("Update payment overdue fine")

	strToday := time.Now().Format("2006-01-02")

	err = monitorModels.UpdatePaymentOverdueFine(strToday)

	if err != nil {
		beego.Error(err.Error())
		lib.TasksLog.Error(err.Error())
	}

	return
}
