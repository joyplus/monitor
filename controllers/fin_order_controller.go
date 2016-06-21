package controllers

import (
	//"encoding/json"
	"errors"
	"fenqiwanh5/lib"
	//"fenqiwanh5/models"
	"github.com/astaxie/beego"
	dao "monitor/models"
	"monitor/vo"
	//"strconv"
	"strings"
)

// oprations for FinOrder
type FinOrderController struct {
	BaseController
}

func (c *FinOrderController) URLMapping() {
	//c.Mapping("Post", c.Post)
	//c.Mapping("GetOne", c.GetOne)
	c.Mapping("getall", c.GetAll)
	//c.Mapping("Put", c.Put)
	//c.Mapping("Delete", c.Delete)

	c.Mapping("confirmedlist", c.ListConfirmedOrder)
	c.Mapping("confirmmerchantpay", c.ConfirmMerchantPay)

	c.Mapping("getfinishedorders", c.GetFinishedOrders)
	c.Mapping("finishedlist", c.ListFinishedOrder)

}

// @Title Post
// @Description create FinOrder
// @Param	body		body 	models.FinOrder	true		"body for FinOrder content"
// @Success 201 {int} models.FinOrder
// @Failure 403 body is empty
// @router / [post]
//func (c *FinOrderController) Post() {
//	var v models.FinOrder
//	if err := json.Unmarshal(c.Ctx.Input.RequestBody, &v); err == nil {
//		if _, err := models.AddFinOrder(&v); err == nil {
//			c.Ctx.Output.SetStatus(201)
//			c.Data["json"] = v
//		} else {
//			c.Data["json"] = err.Error()
//		}
//	} else {
//		c.Data["json"] = err.Error()
//	}
//	c.ServeJSON()
//}

// @Title Get
// @Description get FinOrder by id
// @Param	id		path 	string	true		"The key for staticblock"
// @Success 200 {object} models.FinOrder
// @Failure 403 :id is empty
// @router /:id [get]
//func (c *FinOrderController) GetOne() {
//	idStr := c.Ctx.Input.Param(":id")
//	id, _ := strconv.Atoi(idStr)
//	v, err := models.GetFinOrderById(id)
//	if err != nil {
//		c.Data["json"] = err.Error()
//	} else {
//		c.Data["json"] = v
//	}
//	c.ServeJSON()
//}

// @Title Get All
// @Description get FinOrder
// @Param	query	query	string	false	"Filter. e.g. col1:v1,col2:v2 ..."
// @Param	fields	query	string	false	"Fields returned. e.g. col1,col2 ..."
// @Param	sortby	query	string	false	"Sorted-by fields. e.g. col1,col2 ..."
// @Param	order	query	string	false	"Order corresponding to each sortby field, if single value, apply to all sortby fields. e.g. desc,asc ..."
// @Param	limit	query	string	false	"Limit the size of result set. Must be an integer"
// @Param	offset	query	string	false	"Start position of result set. Must be an integer"
// @Success 200 {object} models.FinOrder
// @Failure 403
// @router /getall [post]
func (c *FinOrderController) GetAll() {
	var fields []string
	var sortby []string
	var order []string
	var query map[string]string = make(map[string]string)
	var limit int64 = 10
	var offset int64 = 0

	// fields: col1,col2,entity.col3
	if v := c.GetString("fields"); v != "" {
		fields = strings.Split(v, ",")
	}
	// limit: 10 (default is 10)
	if v, err := c.GetInt64("limit"); err == nil {
		limit = v
	}
	// offset: 0 (default is 0)
	if v, err := c.GetInt64("offset"); err == nil {
		offset = v
	}
	// sortby: col1,col2
	if v := c.GetString("sortby"); v != "" {
		sortby = strings.Split(v, ",")
	}
	// order: desc,asc
	if v := c.GetString("order"); v != "" {
		order = strings.Split(v, ",")
	}
	// query: k:v,k:v
	if v := c.GetString("query"); v != "" {
		for _, cond := range strings.Split(v, ",") {
			kv := strings.Split(cond, ":")
			if len(kv) != 2 {
				c.Data["json"] = errors.New("Error: invalid query key/value pair")
				c.ServeJSON()
				return
			}
			k, v := kv[0], kv[1]
			query[k] = v
		}
	}

	l, err := dao.GetConfirmedOrders(query, fields, sortby, order, offset, limit)
	if err != nil {
		c.Data["json"] = err.Error()
	} else {
		c.Data["json"] = l
	}
	c.ServeJSON()
}

// @Title Update
// @Description update the FinOrder
// @Param	id		path 	string	true		"The id you want to update"
// @Param	body		body 	models.FinOrder	true		"body for FinOrder content"
// @Success 200 {object} models.FinOrder
// @Failure 403 :id is not int
// @router /:id [put]
//func (c *FinOrderController) Put() {
//	idStr := c.Ctx.Input.Param(":id")
//	id, _ := strconv.Atoi(idStr)
//	v := models.FinOrder{Id: id}
//	if err := json.Unmarshal(c.Ctx.Input.RequestBody, &v); err == nil {
//		if err := models.UpdateFinOrderById(&v); err == nil {
//			c.Data["json"] = "OK"
//		} else {
//			c.Data["json"] = err.Error()
//		}
//	} else {
//		c.Data["json"] = err.Error()
//	}
//	c.ServeJSON()
//}

// @Title Delete
// @Description delete the FinOrder
// @Param	id		path 	string	true		"The id you want to delete"
// @Success 200 {string} delete success!
// @Failure 403 id is empty
// @router /:id [delete]
//func (c *FinOrderController) Delete() {
//	idStr := c.Ctx.Input.Param(":id")
//	id, _ := strconv.Atoi(idStr)
//	if err := models.DeleteFinOrder(id); err == nil {
//		c.Data["json"] = "OK"
//	} else {
//		c.Data["json"] = err.Error()
//	}
//	c.ServeJSON()
//}

// @Title Get confirmed order list
// @Description get FinOrder
// @Success 200 {object} models.FinOrder
// @Failure 403
// @router /confirmedlist
func (this *FinOrderController) ListConfirmedOrder() {
	if this.IsAjax() {
		return
	} else {
		this.TplName = this.GetTemplatetype() + "/admin/confirmed_order_list.tpl"

	}
}

// @Title Get
// @Description get FinOrder by id
// @Param	id		path 	string	true		"The key for staticblock"
// @Success 200 {object} models.FinOrder
// @Failure 403 :id is empty
// @router /confirmmerchantpay [post]
func (c *FinOrderController) ConfirmMerchantPay() {
	//idStr := c.Ctx.Input.getInt("id")
	//id, _ := strconv.Atoi(idStr)
	req := new(vo.ReqOrder)
	beego.Debug(string(c.Ctx.Input.RequestBody))
	//err := json.Unmarshal(c.Ctx.Input.RequestBody, req)
	err := c.ParseForm(req)
	if err != nil {
		err = &lib.SysError{
			ErrorCode: lib.ERROR_JSON_UNMARSHAL_FAILED,
		}

	}

	if err == nil {
		err = dao.UpdateOrderMerchantStatus(req.Id, lib.LOV_MERCHANT_CONFIRMED)
	}

	res := c.HandleError(err)

	c.Data["json"] = res
	c.ServeJSON()
}

// @Title Get confirmed order list
// @Description get FinOrder
// @Success 200 {object} models.FinOrder
// @Failure 403
// @router /finishedlist
func (this *FinOrderController) ListFinishedOrder() {
	if this.IsAjax() {
		return
	} else {
		this.TplName = this.GetTemplatetype() + "/admin/finished_order_list.tpl"

	}
}

//获得支付完成且商户充值完成的订单列表
// @Title Get GetFinishedOrders
// @Description get GetFinishedOrders
// @Success 200 {object} models.FinOrder
// @Failure 403
// @router /getfinishedorders [post]
func (c *FinOrderController) GetFinishedOrders() {

	orderStatus := lib.LOV_ORDER_PAY_CONFIRM
	merchantStatus := lib.LOV_MERCHANT_CONFIRMED

	l, err := dao.GetOrdersByStatus(orderStatus, merchantStatus)

	if err != nil {
		c.Data["json"] = c.HandleError(err)

	} else {
		c.Data["json"] = l
	}

	c.ServeJSON()
}
