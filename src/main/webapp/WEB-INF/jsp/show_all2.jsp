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

    var viewer = new Cesium.Viewer("cesiumContainer", {
        terrainProvider: Cesium.createWorldTerrain(),
        baseLayerPicker: false,
        shouldAnimate: true,
    });




</script>

${list}<br>

<c:forEach items="${list}" var="u">
    ${u.start}-${u.end}-${u.path}-}<br/>
    <script>

        var czml = [
            {
                id: "document",
                name: "CZML Path",
                version: "1.0",
                clock: {
                    interval: "2012-08-04T10:00:00Z/2012-08-04T15:00:00Z",
                    currentTime: "2012-08-04T10:00:00Z",
                    multiplier: 10,
                },
            },
            {
                id: "path",
                name: "path with GPS flight data",
                description:
                    "<p>Hang gliding flight log data from Daniel H. Friedman.<br>Icon created by Larisa Skosyrska from the Noun Project</p>",
                availability: "2012-08-04T10:00:00Z/2012-08-04T15:00:00Z",
                path: {
                    material: {
                        polylineOutline: {
                            color: {
                                rgba: [255, 0, 255, 255],
                            },
                            outlineColor: {
                                rgba: [0, 255, 255, 255],
                            },
                            outlineWidth: 5,
                        },
                    },
                    width: 8,
                    leadTime: 10,
                    trailTime: 1000,
                    resolution: 5,
                },
                model: {
                    gltf: "../cesium/Apps/SampleData/models/CesiumAir/Cesium_Air.glb",
                    scale: 2.0,
                    minimumPixelSize: 128,

                },
                position: {
                    epoch: "2012-08-04T10:00:00Z",
                    cartographicDegrees: [${u.path}],
                },
            },
        ];
        viewer.dataSources
            .add(Cesium.CzmlDataSource.load(czml))
            .then(function (ds) {
                viewer.trackedEntity = ds.entities.getById("path");
            });
    </script>
</c:forEach>

<br>============================<br>



<button id = "ajaxBtn">ajax</button>
<textarea id="t1"></textarea>
</body>
</html>
