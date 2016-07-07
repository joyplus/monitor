package controllers

import (
	////"encoding/json"
	//"errors"
	//"fenqiwanh5/lib"
	////"fenqiwanh5/models"
	//"github.com/astaxie/beego"
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
	this.TplName = this.GetTemplatetype() + "/admin/payment_list.tpl"
}

// @Title Get All
// @Description get FinOrder
// @Success 200
// @Failure 403
// @router /getlist [post]
func (c *FinPaymentController) GetList() {

	l, err := dao.GetPaymentsByStatus(1, 0, 0)
	if err != nil {
		c.Data["json"] = c.HandleError(err)
	} else {
		c.Data["json"] = l
	}
	c.ServeJSON()
}
