package models

import (
	//"fenqiwanh5/lib"
	"fenqiwanh5/models"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"monitor/vo"
	"time"
)

//Gets all payments by payment date
func GetPaymentsByDate(strDate string, delayStatus int) (payments []vo.PaymentVo, err error) {
	o := orm.NewOrm()

	_, err = o.Raw("SELECT payment.id, order.product_name,`person`.`name`,`person`.`mobile_number`, `payment`.lov_payment_status,payment.payment_date,payment.payment_amount,payment.payment_stage FROM `fin_payment` as `payment` inner join `fin_person` as`person` on `payment`.person_id=`person`.id inner join fin_order as `order` on `payment`.order_id=order.id  where ?>=`payment`.payment_date and `payment`.`lov_payment_status`=0 and `payment`.`lov_delay_status`=? order by`payment`.payment_date asc", strDate, delayStatus).QueryRows(&payments)

	return
}

//Gets all overdue payments
func GetOverduePayments() (payments []vo.PaymentVo, err error) {
	o := orm.NewOrm()

	_, err = o.Raw("SELECT payment.id, order.product_name,`person`.`name`,`person`.`mobile_number`, `payment`.lov_payment_status,payment.payment_date,payment.payment_amount,payment.payment_stage FROM `fin_payment` as `payment` inner join `fin_person` as`person` on `payment`.person_id=`person`.id inner join fin_order as `order` on `payment`.order_id=order.id  where `payment`.`lov_payment_status`=0 and `payment`.`lov_delay_status`=1 order by`payment`.payment_date asc").QueryRows(&payments)

	return
}

func UpdateOverduePayments(strDate string) error {
	o := orm.NewOrm()

	res, err := o.Raw("UPDATE fin_payment SET lov_delay_status = 1 where payment_date < ? and `lov_payment_status`=0 and `lov_delay_status`=0", strDate).Exec()

	if err == nil {
		num, _ := res.RowsAffected()
		beego.Debug("overdue payments has been updated: ", num)
	}
	return err
}

//超过指定天数的账单设置为潜在坏账
func UpdatePBDPayments(strDate string) error {
	o := orm.NewOrm()

	res, err := o.Raw("UPDATE fin_payment SET lov_delay_status = 2 where payment_date < ? and `lov_payment_status`=0 and `lov_delay_status`=1", strDate).Exec()

	if err == nil {
		num, _ := res.RowsAffected()
		beego.Debug("pdb payments has been updated: ", num)
	}
	return err
}

//计算逾期罚金
func UpdatePaymentOverdueFine(strDate string) (err error) {
	o := orm.NewOrm()
	var payments []models.FinPayment

	_, err = o.Raw("select * from fin_payment where lov_payment_status=0 and lov_delay_status>0").QueryRows(&payments)

	if err != nil {
		return
	}

	err = o.Begin()
	for _, payment := range payments {
		var duration int
		duration, err = CalcDuration(payment.PaymentDate, strDate)
		if err != nil {
			break
		}
		//计算罚金
		payment.DelayPaymentFine = payment.PaymentAmount * _OverdueFineDailyRate * float64(duration)
		_, err = o.Update(&payment, "DelayPaymentFine")

		if err != nil {
			break
		}
	}

	if err == nil {
		o.Commit()
	} else {
		o.Rollback()
	}
	return
}

func CalcDuration(strPaymentDate string, strCurrentDate string) (duration int, err error) {
	var paymentDate, currentDate time.Time
	paymentDate, err = time.Parse("2006-01-02", strPaymentDate)
	if err == nil {
		currentDate, err = time.Parse("2006-01-02", strCurrentDate)
	}

	duration = int(currentDate.Sub(paymentDate).Hours()/24) - 1

	return

}

//Gets payments by payment and delay status
func GetPaymentsByStatus(merchantId int, paymentStatus int, delayStatus int) (payments []vo.PaymentVo, err error) {
	o := orm.NewOrm()

	_, err = o.Raw("SELECT payment.id, order.product_name,`person`.`name`,`person`.`mobile_number`, `payment`.lov_payment_status,payment.payment_date,payment.payment_amount,payment.payment_stage FROM `fin_payment` as `payment` inner join `fin_person` as`person` on `payment`.person_id=`person`.id inner join fin_order as `order` on `payment`.order_id=order.id inner join fin_merchant_user_matrix as matrix on person.id=matrix.person_id and matrix.merchant_id=?  where `payment`.`lov_payment_status`=? and `payment`.`lov_delay_status`=? order by`payment`.payment_date asc", merchantId, paymentStatus, delayStatus).QueryRows(&payments)

	return
}
