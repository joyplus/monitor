package tasks

import (
	"fmt"
	"github.com/astaxie/beego"
	"github.com/jordan-wright/email"
	"monitor/vo"
	"net/smtp"
	"strconv"
	"strings"
)

var _EmailFrom string
var _EmailPassword string
var _EmailHost string
var _EmailHostPort string
var _EmailTo string

func init() {
	_EmailFrom = beego.AppConfig.String("email_from")
	_EmailPassword = beego.AppConfig.String("email_password")
	_EmailHost = beego.AppConfig.String("email_host")
	_EmailHostPort = beego.AppConfig.String("email_host_port")
	_EmailTo = beego.AppConfig.String("email_to")
}

func SendNotifyMail(aryOrders []vo.OrderVo) (err error) {

	if len(_EmailFrom) > 0 {
		subject := "[系统通知]待处理订单"
		var emailBody string

		emailBody, err = GetEmailBody(aryOrders)

		if err != nil {
			return
		}

		e := email.NewEmail()
		e.From = _EmailFrom
		e.To = []string{_EmailTo}
		e.Subject = subject
		e.HTML = []byte(emailBody)
		err = e.Send(_EmailHost+":"+_EmailHostPort, smtp.PlainAuth("", _EmailFrom, _EmailPassword, _EmailHost))
	}

	return
}

func GetEmailBody(aryOrders []vo.OrderVo) (emailBody string, err error) {

	strLineTpl := `
				<tr>
					<td>ID</td>
					<td>平台名</td>
					<td>平台ID</td>
					<td>姓名</td>
					<td>商品名称</td>
					<td>充值金额</td>
					<td>充值时间</td>
				</tr>
					`
	var strLines string

	for _, orderVo := range aryOrders {
		if orderVo.Id > 0 {
			strLine := strLineTpl
			strLine = strings.Replace(strLine, "ID", fmt.Sprintf("%d", orderVo.Id), 1)
			strLine = strings.Replace(strLine, "平台名", orderVo.MerchantName, 1)
			strLine = strings.Replace(strLine, "平台ID", orderVo.MerchantUserName, 1)
			strLine = strings.Replace(strLine, "姓名", orderVo.Name, 1)
			strLine = strings.Replace(strLine, "商品名称", orderVo.ProductName, 1)
			strPrincipalBalance := strconv.FormatFloat(orderVo.PrincipalBalance, 'f', 0, 64)
			strLine = strings.Replace(strLine, "充值金额", strPrincipalBalance+"元", 1)
			strLine = strings.Replace(strLine, "充值时间", orderVo.OrderTime.Format("2006-01-02 15:04:05"), 1)
			strLines += strLine
		}
	}

	body := `
		<html>
		<body>
			<table border='1'cellspacing="0" cellpadding="0" >
				<tr>
					<th>ID</th>
					<th>平台</th>
					<th>平台ID</th>
					<th>姓名</th>
					<th>商品名称</th>
					<th>充值金额</th>
					<th>充值时间</th>
				</tr>
				{{strLines}}
			</table>
		</body>
		</html>
		`
	emailBody = strings.Replace(body, "{{strLines}}", strLines, 1)

	return
}
