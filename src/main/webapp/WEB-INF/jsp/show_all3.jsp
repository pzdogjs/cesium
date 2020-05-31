<%--
  Created by IntelliJ IDEA.
  User: pz
  Date: 2020/5/18
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <script src="https://cesium.com/downloads/cesiumjs/releases/1.69/Build/Cesium/Cesium.js"></script>
    <script src="../CesiumHeatmap-master/CesiumHeatmap.js"></script>

    <link href="https://cesium.com/downloads/cesiumjs/releases/1.69/Build/Cesium/Widgets/widgets.css" rel="stylesheet">
    <title>Title</title>
    <%--
    这里路径前加../  可能是maven的原因，相对路径会失败，必须使用绝对路径
--%>
    <script src = "../js/jquery-3.4.1.js"></script>
    <script>
        $(function () {
            $("#ajaxBtn").click(function () {
                //alert("hello");
                //ajax
                $.ajax({
                    url:"/cesium_war/ele_fieldController/ajax.action",
                    contenType:"application/json,charset=UTF-8",
                    data :{"id":"1"},
                    dataType:"json",
                    type:"post",
                    success:function(result){
                        //result 响应的json数据
                        alert("haha"); alert(result);
                        var obj = JSON.parse(result);
                        var arr = obj.autoAppApplyItemVos;
                        for(var i in arr){
                            alert(arr[i].envId+"haha");
                            alert(arr[i].hostAppType+"haha");
                            alert(arr[i].count+"haha");
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
<div id="cesiumContainer" style="width: 100%; height:100%"></div>

<script>
    Cesium.Ion.defaultAccessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJmZDVmZWJjNy02YmQ1LTQwOGItYjU5NC05YmQ3NGMxZWIzOWMiLCJpZCI6MjMyMzAsInNjb3BlcyI6WyJhc3IiLCJnYyJdLCJpYXQiOjE1ODI5NjEyNTN9.m-Wl89a0m0LPZM6ozHBQ0yPMm5MGq8AaeZjxP6f2cFU';
    var viewer = new Cesium.Viewer('cesiumContainer');

</script>

${list}<br>

<c:forEach items="${list}" var="u">
    ${u.id}<br/>
    <script>
        function getData(str) {
            var points = [];
            var array = str.split(",");

            for (i = 0; i < array.length; i+=3) {

                var point = {

                    x: array[i],
                    y: array[i+1],
                    value: array[i+2]
                };
                points.push(point);
            }


            return  points
        }
        var bounds = {
            west: ${u.west}, south: ${u.south}, east: ${u.east}, north: ${u.north}
        };
        var heatMap = CesiumHeatmap.create(
            viewer, // 视图层
            bounds, // 矩形坐标
            { // heatmap相应参数
                backgroundColor: "rgba(0,0,0,0)",
                radius: 50,
                maxOpacity: .5,
                minOpacity: 0,
                blur: .75
            }
        );

        heatMap.setWGS84Data(0, 100,getData(${u.data})
        );
        viewer.zoomTo(viewer.entities);

    </script>
</c:forEach>
<br>============================<br>



<button id = "ajaxBtn">ajax</button>
<textarea id="t1"></textarea>
</body>
</html>
