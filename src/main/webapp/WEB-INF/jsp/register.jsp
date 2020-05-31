<%--
  Created by IntelliJ IDEA.
  User: pz
  Date: 2020/5/22
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Title</title>
</head>
<body>
<form action="/cesium_war/userController/save" method="post">
    name:<input type="text" name="name" value="1"/>
    password:<input type="text" name="password" value="1"/>
    is_first_user<input type="text" name="first" value="1"/>
    rootPassWord<input type="text" name="rootpassword" value="1"/>

    <input type="submit" value="submit"/>
</form>

</body>
</html>
