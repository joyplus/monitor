{{template "../public/header.tpl"}}
<style>

</style>
<script type="text/javascript">

    var URL="/admin/payment";
    $(function(){
        //账单列表
        $("#datagrid").datagrid({
            title:'账单列表',
            url:URL+"/getlist",
            method:'POST',
            pagination:true,
            fitColumns:true,
            striped:true,
            rownumbers:true,
            singleSelect:true,
            idField:'Id',
            columns:[[
                {field:'Id',title:'ID',width:20,align:'left'},
                {field:'Name',title:'借款人姓名',width:50,align:'left'},
                {field:'MerchantUserName',title:'商户用户姓名',width:50,align:'left'},
                {field:'PaymentNumber',title:'账单编号',width:100,align:'center'},
                {field:'PaymentAmount',title:'账单金额(￥)',width:100,align:'center',editor:'text'},
                {field:'PaymentDate',title:'账单日期',width:100,align:'center',editor:'text',
					formatter:function(value,row,index){
                        var unixTimestamp = new Date(value);
                        return unixTimestamp.getFullYear()+"-"+(unixTimestamp.getMonth()+1)+"-"+unixTimestamp.getDate();
                    }
				},
                {field:'DelayPaymentFine',title:'罚金(￥)',width:100,align:'center',editor:'text',
                     formatter:function(value, row, index){
                         return value.toFixed(2);
                     }
                },
                {field:'MobileNumber',title:'手机号码',width:60,align:'center',editor:'text'},
                {field:'LovPaymentStatus',title:'支付状态',width:50,align:'center',editor:'text',
                    formatter:function(value, row, index){
                        var result = "";
                        switch (value) {
                            case -1:
                                result = "不限";
                                break;
                            case 0:
                                result = "待支付";
                                break;
                            case 2:
                                result = "支付完成";
                                break;
                        }
                        return result;
                    }
                },
				{field:'LovDelayStatus',title:'逾期状态',width:50,align:'center',editor:'text',
                      formatter:function(value, row, index){
                          var result = "";
                          switch (value) {
                              case -1:
                                  result = "不限";
                                  break;
                              case 0:
                                  result = "正常";
                                  break;
                              case 1:
                                  result = "逾期少于30天";
                                  break;
                              case 2:
                                  result = "逾期大于30天";
                                  break;
                          }
                          return result;
                      }
                },
                {field:'Operation', title:'操作',width:50,align:'center',
                    formatter: function(value,row, index){

                        var buttons = "";
                        if (row.LovDelayStatus > 0 && row.LovPaymentStatus == 0) {
                            // 用户姓名
                            // 商户用户名
                            // 手机号码
                            buttons += '<div><a href="#" icon="icon-edit" plain="true" onclick="opensendsmsdialog(' + "'" + row.Name + "'" + ',' + "'" + row.MerchantUserName + "'" + ',' + "'" + row.MobileNumber + "'" + ',' + "'" + row.Id + "'" + ')" class="easyui-linkbutton" >催收短信</a></div>';
                        }
                        if (row.DelayPaymentFine > 0) {
                            buttons += '<div><a href="#" icon="icon-edit" plain="true" onclick="cancelfine(' + "'" + row.Name + "'" + ',' + "'" + row.MerchantUserName + "'" + ',' + "'" + row.DelayPaymentFine + "'" + ',' + "'" + row.Id + "'"  + ')" class="easyui-linkbutton" >免除罚金</a></div>';
                        }
                        return buttons;
                    }
                }
            ]],

            onRowContextMenu:function(e, index, row){
                e.preventDefault();
                $(this).datagrid("selectRow",index);
                $('#mm').menu('show',{
                    left: e.clientX,
                    top: e.clientY
                });
            },

        });

		$('#paymentstatusid').combobox('setValue', -1);
		$('#delaystatusid').combobox('setValue', -1);
		$('#smstpl').combobox('setValue', '102249');

    });

    //刷新
    function reloadrow(){
		// clear the datagrid
		$('#datagrid').datagrid('loadData', {"total":0,"rows":[]});

		var paymentStatusVal = $("#paymentstatusid").combobox('getValue');
		var delayStatusVal = $("#delaystatusid").combobox('getValue');
        $("#datagrid").datagrid("reload", {paymentStatus:paymentStatusVal, delayStatus:delayStatusVal, page:1});
    }

    //发送催收短信
    function opensendsmsdialog(name, merchantusername, mobilenumber, paymentid) {
            $("#smsdialog").dialog('open');
            $("#username").val(name);
            $("#merchantusername").val(merchantusername);
            $("#mobilenumber").val(mobilenumber);
            $("#paymentid").val(paymentid);
    }

    function cancelsendsms() {
        $("#smsdialog").dialog('close');
    }

    function sendsms() {
       showprogressbar();
       var paymentid = $("#paymentid").val();
       var tpid = $('#smstpl').combobox('getValue');
       vac.ajax('/admin/payment/sendsms', {paymentid:paymentid, tpid:tpid}, 'POST', function(r) {
           if(r.status_code == 200){
               $('#p').progressbar('setValue', 100);
               $('#progressbardialog').dialog('close');
               //show message dialog
               $.messager.show(
                {
                	title:'短信发送成功',
                	msg:'催收短信发送成功!',
                	timeout:0,
                	showType:'show',
                	style:{
                        right:'',
                        //top:document.body.scrollTop+document.documentElement.scrollTop,
                        bottom:''
                    }


                    }
               );

           }else{
               $('#progressbardialog').dialog('close');
               vac.alert(r.message);
           }
       });

    }

    function showprogressbar() {
        $("#smsdialog").dialog('close');
        var value = $('#p').progressbar('getValue');
        if (value < 80){
            $('#progressbardialog').dialog('open');
            value += Math.floor(Math.random() * 10);
            $('#p').progressbar('setValue', value);
            setTimeout(arguments.callee, 200);
        }
    }

    function closeprogressbar() {
        $('#progressbardialog').dialog('close');
    }

    function cancelfine(name, merchantusername, delaypaymentfine, paymentid) {
           var msg = "是否免除"+ name + "(" + merchantusername + ")该笔账单的罚金" + delaypaymentfine;
           $.messager.confirm("免除罚金", msg, function(r) {
                if (r) {
                    vac.ajax('/admin/payment/canceldelaypaymentfine', {paymentid:paymentid}, 'POST', function(r) {
                        if(r.status_code == 200){
                                   reloadrow();
                                   //show message dialog
                                   $.messager.show(
                                    {
                                    	title:'免除罚金',
                                    	msg:'已经免除罚金!',
                                    	timeout:0,
                                    	showType:'show',
                                    	style:{
                                            right:'',
                                            //top:document.body.scrollTop+document.documentElement.scrollTop,
                                            bottom:''
                                        }


                                        }
                                   );

                               }else{
                                   vac.alert(r.message);
                               }
                           });
                }
           });
    }

</script>
<body>
<table id="datagrid" toolbar="#tb"></table>
<div id="tb" style="padding:5px;height:auto">
	<table>
	        <tr>
                    <td>
						<div style="float:right"><input id="paymentstatusid" class="easyui-combobox" data-options="valueField:'LovId',textField:'LovValue',url:'/admin/payment/paymentstatus', panelHeight:'auto'" editable=false></div>
                    </td>

                    <td>
                        <div style="float:right"><input id="delaystatusid" class="easyui-combobox" data-options="valueField:'LovId',textField:'LovValue',url:'/admin/payment/delaystatus', panelHeight:'auto'" editable=false></div>
                    </td>
					<td><a href="#" icon='icon-reload' plain="true" onclick="reloadrow()" class="easyui-linkbutton" >刷新</a></td>
            </tr>
	</table>
</div>
    <!--表格内的右键菜单-->
    <div id="mm" class="easyui-menu" style="width:120px;display: none" >
        <div iconCls='icon-reload' onclick="reloadrow()">刷新</div>
        <div class="menu-sep"></div>
        <div>Exit</div>
    </div>

        <div id="smsdialog" class="easyui-dialog" title="发送催收短信" style="width:500px;height:300px;padding-top:10px;"
                data-options="resizable:true,modal:true,closed:true,buttons:'#mb'">
                <div style="margin:10px 0;"></div>
                <table>
                    <tr><td>用户姓名:</td> <td><input id="username" type="text" class="easyui-textbox" style="width:200px" readonly></input></td></tr>
                    <tr><td>商户用户名:</td> <td><input id="merchantusername" type="text" class="easyui-textbox"  style="width:200px" readonly></input></td></tr>
                    <tr><td>手机号码:</td> <td><input id="mobilenumber" type="tel" class="easyui-textbox" style="width:200px" readonly></input></td></tr>
                    <tr>
                        <td>选择消息模版:</td>
                        <td>
                            <input id="smstpl" class="easyui-combobox" data-options="
                                    panelHeight:'auto',
                                    editable:false,
                                    width:200,
                            		valueField: 'value',
                            		textField: 'label',
                            		data: [{
                            			label: '逾期7天警告: 102249',
                            			value: '102249'
                            		}]" />

                        </td>
                    </tr>
                    <tr><input type="hidden" id="paymentid" /></tr>
                </table>

                <div style="margin:10px 0;"></div>
                <table id="demandDataGrid" style="height:270px"></table>
        </div>

        <div id="mb">
            <a href="#"  class="easyui-linkbutton" onclick="sendsms()">发送</a>
            <a href="#"  class="easyui-linkbutton" onclick="cancelsendsms()">取消</a>
        </div>
        <div id="progressbardialog" class="easyui-dialog" title="发送短信中" style="width:420px;padding-top:10px;" data-options="resizable:true,modal:true,closed:true,buttons:'#pb'">
            <div id="p" class="easyui-progressbar" style="width:400px;"></div>
         </div>
         <div id="pb">
             <a href="#"  class="easyui-linkbutton" onclick="closeprogressbar()">关闭</a>
         </div>
</body>
</html>