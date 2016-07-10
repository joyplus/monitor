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
		c.Data["json"] = l
	}
	c.ServeJSON()
}
