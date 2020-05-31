<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <script src = "../js/jquery-3.4.1.js"></script>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"/>
    <script type="text/JavaScript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/mystyle.css">
</head>
<body>


<div style = " background:url(pic/2.jpg); position:absolute;left:40%;top:65%;widght: 30%;height:10%" >
    <a  href="/cesium_war/userController/register.action" class="easyui-linkbutton">注册</a><br>
    <a href="/cesium_war/loginRoot.jsp" class="easyui-linkbutton" >rootlogin</a>

    <a href="/cesium_war/jspController/index2.action" class="easyui-linkbutton" >index2</a>


    <a href="/cesium_war/ele_fieldController/show_all.action" class="easyui-linkbutton" >test show_all</a>
    <a href="/cesium_war/airController/show_all2.action" class="easyui-linkbutton" >test show_all2</a>
    <a href="/cesium_war/heatMapController/show_all3.action" class="easyui-linkbutton" >test show_all3</a>
</div>



<div style = "background:url(pic/2.jpg); position:absolute;left:40%;top:25% ; widght: 30%;height:20%" >
<form id="ff" action="/cesium_war/userController/dologin" method="post">
    <div>
        <label  style = "color : aquamarine" for="name">Name:    </label><br>
        <input class="easyui-validatebox" type="text" name="name"  value="1" data-options="required:true" />
    </div><br>
    <div>
        <label  style = "color : aquamarine" for="password">password:</label><br>
        <input class="easyui-validatebox" type="text" name="password" value="1" data-options="required:true" /><br>
    </div>
    <div>
        <input class="easyui-validatebox" type="submit" value="登录"  />
    </div>
</form>
 </div>
</body>
</html>
