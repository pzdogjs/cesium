<%@ page  contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ page  isELIgnored="false" %>
<!DOCTYPE HTML >
<html>
  <head>
    <title>客户管理</title>
	  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	  <!-- 导入easyui的资源文件 -->
	  <script type="text/javascript" src="../easyui/jquery.min.js"></script>
	  <script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
	  <script type="text/javascript" src="../easyui/locale/easyui-lang-zh_CN.js"></script>
	  <link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
	  <link id="themeLink" rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
	  <link rel="stylesheet" type="text/css" href="../css/mystyle.css">
  </head>
  
  <body>
  	<table id="list"  ></table>
  	
  	<!-- 工具条 -->
  	<div id="tb">
		<a id="addBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
		<a id="editBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
		<a id="deleteBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
	</div>
	
	<!-- 编辑窗口 -->
	<div id="win" class="easyui-window" title="客户数据编辑" style="width:500px;height:300px"   
        data-options="iconCls:'icon-save',modal:true,closed:true">   
	    <form id="editForm" method="post" accept-charset="utf-8" onsubmit="document.charset="" >
	    	<%--提供id隐藏域 --%>
	    	id:<input type="text" name="id"><br/>
		  	x：<input type="text" name="x" class="easyui-validatebox" data-options="required:true"/><br/>
			y：<input type="text" name="y" class="easyui-validatebox" data-options="required:true"/><br/>
				height：<input type="text" name="height" class="easyui-validatebox" data-options="required:true"/><br/>
				r：<input type="text" name="r" class="easyui-validatebox" data-options="required:true"/><br/>
				name：<input type="text" name="name" class="easyui-validatebox" data-options="required:true"/><br/>


				频率：<input type="text" name="hz" class="easyui-validatebox" data-options="required:true"/><br/>
				型号：<input type="text" name="type" class="easyui-validatebox" data-options="required:true"/><br/>
				状态：<input type="text" name="state" class="easyui-validatebox" data-options="required:true"/><br/>
				任务类型：<input type="text" name="task" class="easyui-validatebox" data-options="required:true"/><br/>
				其他信息：<input type="text" name="info" class="easyui-validatebox" data-options="required:true"/><br/>

	  	<a id="saveBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
 	 </form> 
	</div>  
  
  	<script type="text/javascript">
  		$(function(){
  			$("#list").datagrid({
  				//url:后台数据查询的地址

  				url:"../ele_fieldController/show.action",
  				//columns：填充的列数据
  					//field:后台对象的属性
  					//tille:列标题
  				columns:[[
  					{
  						field:"id",
  						title:"编号",
  						width:100,
  						checkbox:true
  					},
  					{
  						field:"x",
  						title:"纬度",
  						width:200
  					},
					{
						field:"y",
						title:"经度",
						width:200
					},
					{
						field:"height",
						title:"海拔",
						width:200
					},
					{
						field:"r",
						title:"半径",
						width:200
					},
					{
						field:"name",
						title:"名字",
						width:200
					},

					{
						field:"hz",
						title:"频率",
						width:200
					},
					{
						field:"type",
						title:"设备型号",
						width:200
					},
					{
						field:"state",
						title:"状态",
						width:200
					},
					{
						field:"task",
						title:"任务类型",
						width:200
					},
					{
						field:"info",
						title:"其他信息",
						width:200
					}
  				]],
  				//显示分页
  				pagination:true,
  				//工具条
  				toolbar:"#tb"//选上上面的id
  			});
  			
  			//打开编辑窗口
  			$("#addBtn").click(function(){
  				//清空表单数据
  				$("#editForm").form("clear");
  				$("#win").window("open");
  			});
  			
  			//保存数据
  			$("#saveBtn").click(function(){
  				$("#editForm").form("submit",{
  					//url: 提交到后台的地址

  					url:"../ele_fieldController/add.action",
  					//onSubmit: 表单提交前的回调函数，true：提交表单   false：不提交表单
  					onSubmit:function(){
  						//判断表单的验证是否都通过了
  						return true;
  					},
  					//success:服务器执行完毕回调函数
  					success:function(data){ //data: 服务器返回的数据，类型字符串类
  						//要求Controller返回的数据格式：  
  						//成功：{success:true} 失败:{success:false,msg:错误信息}
  						
  						//把data字符串类型转换对象类型
  						data = eval("("+data+")");
  						
  						if(data.success){
  							//关闭窗口
  							$("#win").window("close");
  							//刷新datagrid
  							$("#list").datagrid("reload");
  							
  							$.messager.alert("提示","保存成功","info");
  						}else{
  							$.messager.alert("提示","保存失败："+data.msg,"error");
  						}
   					}
  				});
  				
  			});
  			
  			//修改数据
  			$("#editBtn").click(function(){
  				//判断只能选择一行
  				var rows = $("#list").datagrid("getSelections");
  				if(rows.length!=1){
  					$.messager.alert("提示","修改操作只能选择一行","warning");
  					return;
  				}
  				
  				//表单回显
  				$("#editForm").form("load","../ele_fieldController/findById.action?id="+rows[0].id);
  				
  				$("#win").window("open");
  			});
  			
  			//删除
  			$("#deleteBtn").click(function(){
  				var rows =$("#list").datagrid("getSelections");
  				if(rows.length==0){
  					$.messager.alert("提示","删除操作至少选择一行","warning");
  					return;
  				}
  				
  				//格式： id=1&id=2&id=3
  				$.messager.confirm("提示","确认删除数据吗?",function(value){
  					if(value){
  						var idStr = "";
  						//遍历数据
  						$(rows).each(function(i){
  							idStr+=("id="+rows[i].id+"&");
  						});
  						idStr = idStr.substring(0,idStr.length-1);
						
  						//传递到后台
  						$.post("../ele_fieldController/del.action",idStr,function(data){
  							if(data.success){
  	  							//刷新datagrid
  	  							$("#list").datagrid("reload");
  	  							
  	  							$.messager.alert("提示","删除成功","info");
  	  						}else{
  	  							$.messager.alert("提示","删除失败："+data.msg,"error");
  	  						}
  						},"json");
  					}
  				});
  			});
  		});
  	
  	</script>
  </body>
</html>
