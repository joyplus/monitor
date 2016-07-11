package models

import (
	fenqimodel "fenqiwanh5/models"
	"github.com/astaxie/beego/orm"
)

// get all the lov key-value maps, filtered by lov key
func GetFinLovByLovKey(lovKey string)(lovs []*fenqimodel.FinLov, err error) {
	o := orm.NewOrm()
	_, err = o.QueryTable("FinLov").Filter("LovKey", lovKey).OrderBy("DispOrder").All(&lovs)
	if err != nil {
		return nil, err
	}
	return lovs, nil
}

// get all the lov key-value maps
func GetAllFinLov() (lovs []*fenqimodel.FinLov, err error) {
	o := orm.NewOrm()
	_, err = o.QueryTable("FinLov").OrderBy("DispOrder").All(&lovs)
	if err != nil {
		return nil, err	
	}
	return lovs, nil
}

// get the lov value by lov key and lov id
func GetLovValueByLovIdAndKey(lovid int8, lovkey string) string {
	var lov = fenqimodel.FinLov{}
	o := orm.NewOrm()
	finlov := new (fenqimodel.FinLov)
	qs := o.QueryTable(finlov)
	qs.Filter("lov_id", lovid).Filter("lov_key", lovkey).One(&lov)
	return lov.LovValue
}
