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
func GetPaymentsByDate(strDate string) (payments []vo.PaymentVo, err error) {
	o := orm.NewOrm()

	_, err = o.Raw("SELECT payment.id, order.product_name,`person`.`name`,`person`.`mobile_number`, `payment`.lov_payment_status,payment.payment_date,payment.payment_amount,payment.payment_stage FROM `fin_payment` as `payment` inner join `fin_person` as`person` on `payment`.person_id=`person`.id inner join fin_order as `order` on `payment`.order_id=order.id  where `payment`.payment_date < ? and `payment`.`lov_payment_status`=0 and `payment`.`lov_delay_status`=0 order by`payment`.payment_date asc", strDate).QueryRows(&payments)

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

//Handles all overdue payments
func HandleOverduePayments(strDate string) (err error) {
	o := orm.NewOrm()
	var payments []models.FinPayment

	_, err = o.Raw("select * from fin_payment where lov_payment_status=0 and lov_delay_status<>0").QueryRows(&payments)

	//for _, payment := range payments {

	//}
	return
}

func CalcDuration(strPaymentDate string, strCurrentDate string) (duration int, err error) {
	var paymentDate, currentDate time.Time
	paymentDate, err = time.Parse("2006-01-02", strPaymentDate)
	if err == nil {
		currentDate, err = time.Parse("2006-01-02", strCurrentDate)
	}

	duration = int(currentDate.Sub(paymentDate))

	return

}
