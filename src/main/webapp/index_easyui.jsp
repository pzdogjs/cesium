<%--
  Created by IntelliJ IDEA.
  User: pz
  Date: 2020/5/22
  Time: 12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <title>用户登录</title>
    <link href="easyui/themes/metro-blue/easyui.css" rel="stylesheet" />
    <link href="easyui/themes/icon.css" rel="stylesheet" />
    <script src="easyui/jquery.min.js"></script>
    <script src="easyui/jquery.easyui.min.js"></script>
    <script src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="css/mystyle.css">
    <style>
        html, body
        {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
        }

        h1
        {
            color: rgb(128, 128, 128);
            text-align: center;
        }

        a:link, a:hover, a:visited, a:active
        {
            color: rgb(128, 128, 128);
            text-decoration: none;
        }

        form
        {
            width: 400px;
            min-width: 400px;
            position: absolute;
            left: 40%;
            top: 15%;
            margin: 0;
            padding: 30px;
            background-color: white;
            border: 2px solid rgba(128, 128, 128, 0.2);
            border-radius: 10px;
        }

        form div
        {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<form action="/cesium_war/userController/dologin" method="post">
    <div>
        <h1>用户登录</h1>
    </div>
    <div>
        <input type="text" name="name"  value="1" class="easyui-textbox" data-options="iconCls:'icon-man',iconWidth:30,iconAlign:'left',prompt:'用户名'" style="width:100%;height:35px;" />
    </div>
    <div>
        <input type="text" name="password"  value="1" class="easyui-passwordbox" data-options="iconWidth:30,iconAlign:'left',prompt:'密码'" style="width:100%;height:35px;" />
    </div>

    <div>
        <input class="easyui-linkbutton" type="submit" value="登陆" style="width:100%;height:35px;" />
    </div>
    <div>
        <div style="display:inline;">
            <a href="/cesium_war/userController/register.action">root还未注册？</a>
        </div>

    </div>
</form>
</body>
</html>
