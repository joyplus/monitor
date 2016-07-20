package controllers

import (
	////"encoding/json"
	//"errors"
	//"fenqiwanh5/lib"
	////"fenqiwanh5/models"
	"github.com/astaxie/beego"
	dao "monitor/models"
	"monitor/tasks"

	//"time"
)

// oprations for FinPayment
type FinPaymentController struct {
	BaseController
}

const LOV_KEY_PAYMENT_STATUS string = "LOV_PAYMENT_STATUS"
const LOV_KEY_DELAY_STATUS string = "LOV_DELAY_STATUS"

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
	beego.Debug("parameter paymentStatus:", paymentStatus)
	if errParam != nil {
		paymentStatus = -1
	}
	delayStatus, errParam = c.GetInt("delayStatus")
	beego.Debug("parameter delayStatus:", delayStatus)
	if errParam != nil {
		delayStatus = -1
	}
	// now use merchantId=1 as test case
	merchantId =  1
	page, _ := c.GetInt("page")
	page_size, _ := c.GetInt("rows")
	beego.Debug("page:", page)
	beego.Debug("page size:", page_size)
	total := dao.CountPaymentsByStatus(merchantId, paymentStatus, delayStatus)
	beego.Debug("total:", total)
	l, err := dao.GetPaymentsByStatus(merchantId, paymentStatus, delayStatus, page, page_size)
	if err != nil {
		c.Data["json"] = c.HandleError(err)
	} else {
		c.Data["json"] = &map[string]interface{}{"total": total, "rows": &l}
	}
	c.ServeJSON()
}

// @Title Get payment status lovs
// @Success 200
// @Failure 403
// @router /paymentstatus [post]
func (c *FinPaymentController) GetPaymentStatusLovs() {
	beego.Debug("try to get payment status lovs")
	finlovs, _ := dao.GetFinLovByLovKey(LOV_KEY_PAYMENT_STATUS)
	c.Data["json"] = &finlovs
	c.ServeJSON()
}

// @Title Get delay status lovs
// @Success 200
// @Failure 403
// @router /delaystatus [post]
func (c *FinPaymentController) GetDelayStatusLovs() {
	beego.Debug("try to get delay status lovs")
	finlovs, _ := dao.GetFinLovByLovKey(LOV_KEY_DELAY_STATUS)
	c.Data["json"] = &finlovs
	c.ServeJSON()
}

// @Title Get delay status lovs
// @Success 200
// @Failure 403
// @router /sendsms [post]
func (c *FinPaymentController) SendSms() {
	id := c.GetString("paymentid")
	tpid := c.GetString("tpid")
	beego.Debug("********** payment id:", id)
	beego.Debug("********** template id:", tpid)
	paymentvo, err := dao.GetPaymentById(id)
	if err == nil {
		err = tasks.SendPaymentNotificationBySMS(paymentvo, tpid)
	}
	c.Data["json"] = c.HandleError(err)
	c.ServeJSON()

}

// @Title Cancel delay payment fine
// @Success 200
// @Failure 403
// @router /canceldelaypaymentfine [post]
func (c *FinPaymentController) CancelDelaypaymentFine() {
	id := c.GetString("paymentid")
	beego.Debug("********** payment id:", id)
	err := dao.UpdateDelayPaymentFineById(id, 0)
	c.Data["json"] = c.HandleError(err)
	c.ServeJSON()
}
