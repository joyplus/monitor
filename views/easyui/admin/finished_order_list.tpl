{{template "../public/header.tpl"}}
<script type="text/javascript">

    var URL="/admin/order";
    $(function(){
        //角色列表
        $("#datagrid").datagrid({
            title:'可结算订单列表',
            url:URL+"/getfinishedorders",
            method:'POST',
            pagination:false,
            fitColumns:true,
            striped:true,
            rownumbers:true,
            singleSelect:true,
            idField:'Id',
            columns:[[
                {field:'Id',title:'ID',width:20,align:'left'},
                {field:'OrderNumber',title:'订单号',width:200,align:'left',editor:'text'},
                {field:'Name',title:'姓名',width:50,align:'center',editor:'text'},
                {field:'MerchantName',title:'商户',width:100,align:'center',editor:'text'},
                {field:'ProductName',title:'商品名',width:150,align:'center',editor:'text'},
                {field:'MerchantUserName',title:'商户用户名',width:89,align:'center',editor:'text'},
                {field:'PrincipalBalance',title:'充值金额',width:60,align:'center',editor:'text'},
                {field:'OrderTime',title:'支付时间',width:200,align:'center',editor:'text',
                    formatter:function(value,row,index){
                        var unixTimestamp = new Date(value);
                        return unixTimestamp.toLocaleString();
                    }
                },

            ]],

            onRowContextMenu:function(e, index, row){
                e.preventDefault();
                $(this).datagrid("selectRow",index);
                $('#mm').menu('show',{
                    left: e.clientX,
                    top: e.clientY
                });
            },
            onHeaderContextMenu:function(e, field){
                e.preventDefault();
                $('#mm1').menu('show',{
                    left: e.clientX,
                    top: e.clientY
                });
            },
            
        });



    });



    //刷新
    function reloadrow(){
        $("#datagrid").datagrid("reload");
    }



</script>
<body>
<table id="datagrid" toolbar="#tb"></table>
<div id="tb" style="padding:5px;height:auto">
    <a href="#" icon='icon-reload' plain="true" onclick="reloadrow()" class="easyui-linkbutton" >刷新</a>
</div>
<!--表格内的右键菜单-->
<div id="mm" class="easyui-menu" style="width:120px;display: none" >
    <div iconCls='icon-reload' onclick="reloadrow()">刷新</div>
    <div class="menu-sep"></div>
    <div>Exit</div>
</div>


</body>
</html>