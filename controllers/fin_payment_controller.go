package controllers

import (
	////"encoding/json"
	//"errors"
	//"fenqiwanh5/lib"
	////"fenqiwanh5/models"
	"github.com/astaxie/beego"
	dao "monitor/models"
	//"monitor/vo"
	////"strconv"
	//"strings"
)

// oprations for FinPayment
type FinPaymentController struct {
	BaseController
}

const LOV_KEY_PAYMENT_STATUS string = "payment_status"
const LOV_KEY_DELAY_STATUS string = "delay_status"

func (c *FinPaymentController) URLMapping() {

	c.Mapping("listpayment", c.ListPayment)
	c.Mapping("getlist", c.GetList)

}

// @Title Display payment list
// @Success 200
// @Failure 403
// @router /listpayment
func (this *FinPaymentController) ListPayment() {
	beego.Info("index page of payment list")
	this.TplName = this.GetTemplatetype() + "/admin/payment_list.tpl"
}

// @Title Get All
// @Description get FinOrder
// @Success 200
// @Failure 403
// @router /getlist [post]
func (c *FinPaymentController) GetList() {
	var merchantId, paymentStatus, delayStatus int
	var errParam error
	merchantId, errParam = c.GetInt("merchantId")
	if errParam != nil {
		merchantId = -1
	}
	paymentStatus, errParam = c.GetInt("paymentStatus")
	beego.Info("parameter paymentStatus:", paymentStatus)
	if errParam != nil {
		paymentStatus = -1
	}
	delayStatus, errParam = c.GetInt("delayStatus")
	beego.Info("parameter delayStatus:", delayStatus)
	if errParam != nil {
		delayStatus = -1
	}
	// now use merchantId=1 as test case
	merchantId =  1
	l, err := dao.GetPaymentsByStatus(merchantId, paymentStatus, delayStatus)
	if err != nil {
		c.Data["json"] = c.HandleError(err)
	} else {
		for index,paymentvo := range l {
			paymentstatusvalue := dao.GetLovValueByLovIdAndKey(int8(paymentvo.LovPaymentStatus), "payment_status")
			delaystatusvalue := dao.GetLovValueByLovIdAndKey(int8(paymentvo.LovDelayStatus), "delay_status")
			
			l[index].PaymentStatus = paymentstatusvalue
			l[index].DelayStatus = delaystatusvalue
			
		}
//		beego.Info("******", &l)
		c.Data["json"] = l
	}
	c.ServeJSON()
}

// @Title Get payment status lovs
// @Success 200
// @Failure 403
// @router /paymentstatus [post]
func (c *FinPaymentController) GetPaymentStatusLovs() {
	beego.Info("try to get payment status lovs")
	finlovs, _ := dao.GetFinLovByLovKey(LOV_KEY_PAYMENT_STATUS)
	c.Data["json"] = &finlovs
	c.ServeJSON()
}

// @Title Get delay status lovs
// @Success 200
// @Failure 403
// @router /delaystatus [post]
func (c *FinPaymentController) GetDelayStatusLovs() {
	beego.Info("try to get delay status lovs")
	finlovs, _ := dao.GetFinLovByLovKey(LOV_KEY_DELAY_STATUS)
	
	for _, finlov := range finlovs {
		beego.Info("******", finlov.LovValue)
		
	}
	c.Data["json"] = &finlovs
	c.ServeJSON()
}