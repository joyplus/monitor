{{template "../public/header.tpl"}}
<script type="text/javascript">

    var URL="/admin/payment";
    $(function(){
        //账单列表
        $("#datagrid").datagrid({
            title:'账单列表',
            url:URL+"/getlist",
            method:'POST',
            pagination:false,
            fitColumns:true,
            striped:true,
            rownumbers:true,
            singleSelect:true,
            idField:'Id',
            columns:[[
                {field:'Id',title:'ID',width:20,align:'left'},
                {field:'Name',title:'借款人姓名',width:50,align:'left'},
                {field:'PaymentNumber',title:'账单编号',width:100,align:'center'},
                {field:'PaymentAmount',title:'账单金额(￥)',width:100,align:'center',editor:'text'},
                {field:'PaymentDate',title:'账单日期',width:100,align:'center',editor:'text',
					formatter:function(value,row,index){
                        var unixTimestamp = new Date(value);
                        return unixTimestamp.toLocaleString();
                    }
				},
                {field:'DelayPaymentFine',title:'罚金(￥)',width:100,align:'center',editor:'text'},
                {field:'MobileNumber',title:'手机号码',width:60,align:'center',editor:'text'},
                {field:'LovPaymentStatusStr',title:'支付状态',width:50,align:'center',editor:'text'},
				{field:'LovDelayStatusStr',title:'逾期状态',width:50,align:'center',editor:'text'}
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



    });

    //刷新
    function reloadrow(){
		var paymentStatusVal = $("#paymentstatusid").combobox('getValue');
		var delayStatusVal = $("#delaystatusid").combobox('getValue');
        $("#datagrid").datagrid("reload", {paymentStatus:paymentStatusVal, delayStatus:delayStatusVal});
    }



</script>
<body>
<table id="datagrid" toolbar="#tb"></table>
<div id="tb" style="padding:5px;height:auto">
	<table><tr>
                    <td>
                        <select id="paymentstatusid" class="easyui-combobox" style="width:150px;" editable=false panelHeight='auto'>
							<option value="-1">不限</option>
							<option value="0">待支付</option>
							<option value="1">支付完成</option>
						</select>
                    </td>
					
                    <td>
                        <select id="delaystatusid" class="easyui-combobox" style="width:150px;" editable=false panelHeight='auto'>
							<option value="-1">不限</option>
							<option value="0">正常</option>
							<option value="1">逾期少于30天</option>
							<option value="2">逾期大于30天</option>
						</select>
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
</body>
</html>