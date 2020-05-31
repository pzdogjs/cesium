<%--
  Created by IntelliJ IDEA.
  User: pz
  Date: 2020/5/18
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>

<%@ page  contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" charset="utf-8">
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
                    contentType:"application/json,charset=UTF-8",
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
<div id="cesiumContainer" style="width: 90%; height:90%"></div>

<script>
    Cesium.Ion.defaultAccessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJmZDVmZWJjNy02YmQ1LTQwOGItYjU5NC05YmQ3NGMxZWIzOWMiLCJpZCI6MjMyMzAsInNjb3BlcyI6WyJhc3IiLCJnYyJdLCJpYXQiOjE1ODI5NjEyNTN9.m-Wl89a0m0LPZM6ozHBQ0yPMm5MGq8AaeZjxP6f2cFU';
    var viewer = new Cesium.Viewer('cesiumContainer');

</script>

<c:forEach items="${list}" var="u">
    ${u.name}-${u.r}-${u.x}-${u.y}-${u.height}-${u.camp}-${u.cid_fk}<br/>
    <script>
        var value = ${u.name};
        document.write(value);
        var ent =viewer.entities.add({
            name:  ${u.name},
            position: Cesium.Cartesian3.fromDegrees( ${u.x}, ${u.y},  ${u.height}),
            ellipsoid: {
                radii: new Cesium.Cartesian3(${u.r}, ${u.r}, ${u.r}),
                material: Cesium.Color.RED.withAlpha(0.5),
                outline: true,
                outlineColor: Cesium.Color.BLACK,
            },
        });
        ent.description = '\
            频率:${u.hz}<br>\
            型号:${u.type}<br>\
            状态:${u.state}<br>\
            任务类型:${u.task}<br>\
            其他信息:${u.info}<br>\
            ';
    </script>
</c:forEach>

<c:forEach items="${listair}" var="u">

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
                name: "${u.name}",
                description:
                    "<p>飞行器以及路径:info:${u.info}</p>",
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

<c:forEach items="${listheat}" var="u">

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

<button id = "ajaxBtn">ajax</button>
<textarea id="t1"></textarea>
</body>
</html>
