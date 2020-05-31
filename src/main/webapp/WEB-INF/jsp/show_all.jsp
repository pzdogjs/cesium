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

    var blueEllipsoid = viewer.entities.add({

        name : 'Blue ellipsoid',

        position: Cesium.Cartesian3.fromDegrees(116.39, 39.9, 15000.0),

        ellipsoid : {

            radii : new Cesium.Cartesian3(200000.0, 200000.0, 300000.0),

            material : Cesium.Color.BLUE

        }

    });

    var redSphere = viewer.entities.add({
        name: "Red sphere with black outline",
        position: Cesium.Cartesian3.fromDegrees(-107.0, 40.0, 300000.0),
        ellipsoid: {
            radii: new Cesium.Cartesian3(300000.0, 300000.0, 300000.0),
            material: Cesium.Color.RED.withAlpha(0.5),
            outline: true,
            outlineColor: Cesium.Color.BLACK,
        },
    });
    redSphere.description = '\
\
<p>\
  Wyoming is a state in the mountain region of the Western \
  United States.\
</p>\
<p>\
  Wyoming is the 10th most extensive, but the least populous \
  and the second least densely populated of the 50 United \
  States. The western two thirds of the state is covered mostly \
  with the mountain ranges and rangelands in the foothills of \
  the eastern Rocky Mountains, while the eastern third of the \
  state is high elevation prairie known as the High Plains. \
  Cheyenne is the capital and the most populous city in Wyoming, \
  with a population estimate of 63,624 in 2017.\
</p>\
<p>\
  Source: \
  <a style="color: WHITE"\
    target="_blank"\
    href="http://en.wikipedia.org/wiki/Wyoming">Wikpedia</a>\
</p>';

    viewer.zoomTo(viewer.entities);
</script>

${list}<br>

<c:forEach items="${list}" var="u">
    ${u.name}-${u.r}-${u.x}-${u.y}-${u.height}-${u.camp}-${u.cid_fk}<br/>
    <script>
        var value = ${u.name};
        document.write(value);
        viewer.entities.add({
            name:  ${u.name},
            position: Cesium.Cartesian3.fromDegrees( ${u.x}, ${u.y},  ${u.height}),
            ellipsoid: {
                radii: new Cesium.Cartesian3(${u.r}, ${u.r}, ${u.r}),
                material: Cesium.Color.RED.withAlpha(0.5),
                outline: true,
                outlineColor: Cesium.Color.BLACK,
            },
        });
    </script>
</c:forEach>
<br>============================<br>



<button id = "ajaxBtn">ajax</button>
<textarea id="t1"></textarea>
</body>
</html>
