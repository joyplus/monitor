package models

import (
	//"fenqiwanh5/lib"
	"github.com/astaxie/beego/orm"
	"monitor/vo"
)

//Gets all payments by payment date
func GetPaymentsByDate(strDate string) (payments []vo.PaymentVo, err error) {
	o := orm.NewOrm()

	_, err = o.Raw("SELECT payment.id, order.product_name,`person`.`name`,`person`.`mobile_number`, `payment`.lov_payment_status,payment.payment_date,payment.payment_amount,payment.payment_stage FROM `fin_payment` as `payment` inner join `fin_person` as`person` on `payment`.person_id=`person`.id inner join fin_order as `order` on `payment`.order_id=order.id  where `payment`.payment_date < ? and `payment`.`lov_payment_status`=0 and `payment`.`lov_delay_status`<>1 order by`payment`.payment_date asc", strDate).QueryRows(&payments)

	return
}
