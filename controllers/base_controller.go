package controllers

import (
	"fenqiwanh5/lib"
	"fenqiwanh5/vo"
	"fmt"
	"github.com/astaxie/beego"
	"github.com/beego/admin/src/rbac"
)

var _RUN_MODE string

type BaseController struct {
	rbac.CommonController
}

func init() {
	_RUN_MODE = beego.AppConfig.String("runmode")
}

func (c *BaseController) HandleError(err error) (resVo vo.ResCommon) {
	resVo = vo.ResCommon{}
	if err == nil {
		resVo.StatusCode = lib.STATUS_SUCCESS
		return
	}

	var message string
	if sysErr, ok := err.(*lib.SysError); ok {
		resVo.StatusCode = sysErr.ErrorCode
		if len(sysErr.ErrorMessage) > 0 {
			message = sysErr.ErrorMessage
		} else {
			message = fmt.Sprintf("系统暂时不可用(%d)", sysErr.ErrorCode)
		}
	} else {

		message = fmt.Sprintf("系统暂时不可用(%d)", lib.ERROR_SYSTEM_UNKNOWN)
	}
	beego.Critical(err.Error())

	resVo.Message = message
	c.Data["message"] = message

	return
}
