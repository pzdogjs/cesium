<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html  class="x-admin-sm">
<head>
	<meta charset="UTF-8">
	<title>后台登录-X-admin2.2</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="layui/css/font.css">
    <link rel="stylesheet" href="layui/css/login.css">
	  <link rel="stylesheet" href="layui/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="layui/lib/layui/layui.js" charset="utf-8"></script>

    <script src="https://cesium.com/downloads/cesiumjs/releases/1.69/Build/Cesium/Cesium.js"></script>
    <script src="CesiumHeatmap-master/CesiumHeatmap.js"></script>
    <link href="https://cesium.com/downloads/cesiumjs/releases/1.69/Build/Cesium/Widgets/widgets.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-bg">

<div id="cesiumContainer" style="width: 100%; height:100%"></div>

<script>
    Cesium.Ion.defaultAccessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJmZDVmZWJjNy02YmQ1LTQwOGItYjU5NC05YmQ3NGMxZWIzOWMiLCJpZCI6MjMyMzAsInNjb3BlcyI6WyJhc3IiLCJnYyJdLCJpYXQiOjE1ODI5NjEyNTN9.m-Wl89a0m0LPZM6ozHBQ0yPMm5MGq8AaeZjxP6f2cFU';
    var viewer = new Cesium.Viewer('cesiumContainer');

</script>

    <script>
        var airList = JSON.parse(localStorage.getItem("airList"));//var airList = JSON.parse(localStorage.getItem("eleList"));都错了，怎么加载出来的？？？？
        var pathList = JSON.parse(localStorage.getItem("pathList"));
       // alert("data="+JSON.parse(localStorage.getItem("eleList"))[0].id);
        var eleList = JSON.parse(localStorage.getItem("eleList"));
        var heatList = JSON.parse(localStorage.getItem("heatList"));

       var eleFList = JSON.parse(localStorage.getItem("eleFList"));
        var airFList = JSON.parse(localStorage.getItem("airFList"));
        var timeList = JSON.parse(localStorage.getItem("timeList"));



        for(var i=0;i<eleList.length;i++){
            //eleFList[i]  [object,object..]  个数为偶数个，奇数飞机，偶数地址
            var findStr ="";
            if(eleFList[i] == "no"){
                findStr ="探测范围内没有飞行器<br>";
            }else{
                var list = eleFList[i];//取出发现的信息集合
                for(var id=0;id<list.length;id+=2){
                    var air = list[i];
                    var path = list[i+1];//取出匹配的飞机与路径
                    var str = "飞机name："+air.name+"<br>路径id"+path.id+"<br>";
                    findStr+=str;
                }
            }
            //alert("test"+eleFList[i]);
            var ent =viewer.entities.add({
                name:  eleList[i].name,
                position: Cesium.Cartesian3.fromDegrees( eleList[i].x, eleList[i].y, eleList[i].height),
                ellipsoid: {
                    radii: new Cesium.Cartesian3(eleList[i].r*1000,   eleList[i].r*1000,   eleList[i].r*1000),
                    maximumCone: Cesium.Math.PI_OVER_TWO,
                    material: Cesium.Color.RED.withAlpha(0.5),
                    outline: true,
                    outlineColor: Cesium.Color.BLACK,
                },
            });
            ent.description = '半径:'+ eleList[i].r + 'km<br>发现信息:<br>'+findStr;
        }
    </script>
<script>
    // alert("data="+JSON.parse(localStorage.getItem("eleList"))[0].id);

    for(var i=0;i<airList.length;i++){
        ////////////处理路径信息，转换为czml需要的格式
        var datastr = pathList[i].data;
        var datalist = datastr.split(",");
        var datalist2 = [];
        var datalist3 = [];
        var length = datalist.length;
        for(var j=0;j<length;j++){
            datalist2.push(parseFloat(datalist.pop()));
        }
        for(var j=0;j<length;j++){
            datalist3.push(datalist2.pop());
        }
        /////////////飞机被发现信息 的信息显示 形式优化，
        var findStr = "" ;
        if(airFList[i] == "no"){
            findStr ="没有被探测";
        }else{
            var list = airFList[i];//取出发现的信息集合
            for(var id=0;id<list.length;id++){//注意id  和 i 区别开
                var ele = list[id];

                var str = "雷达name："+ele.name+    //每种显示信息一行
                    "<br>雷达任务类型:"+ele.task+
                    "<br>";
                findStr+=str;
            }
        }
       // alert("path"+datalist3);
        var czml = [
            {
                id: "document",//not change
                name: "CZML Path",
                version: "1.0",
                clock: {
                    interval: timeList[0]+"/"+timeList[1],
                    //interval: "2012-08-04T10:00:00Z/2012-08-04T15:00:00Z",
                    //currentTime:"2012-08-04T10:00:00Z",
                    currentTime: timeList[0],
                    multiplier: 10,
                },
            },
            {
                id: "path",
                name: airList[i].name,
                description:
                    "<p>飞行器被探测情况:</p><br>"+findStr,
                // availability:  "2012-08-04T10:00:00Z/2012-08-04T15:00:00Z",
                availability: airList[i].start+"/"+airList[i].end,
                path: {
                    material: {
                        polylineOutline: {
                            color: {
                                rgba: [255, 0, 255, 255],
                            },
                            outlineColor: {
                                rgba: [0, 255, 255, 255],
                            },
                            outlineWidth: 1,
                        },
                    },
                    width: 2,
                    leadTime: 100000,
                    trailTime: 100000,
                    resolution: 5,
                },
                model: {
                    gltf: "cesium/Apps/SampleData/models/CesiumAir/Cesium_Air.glb",
                    scale: 2.0,
                    minimumPixelSize: 128,

                },
                position: {
                    //epoch: "2012-08-04T10:00:00Z",//路径start
                     epoch:airList[i].start,
                    cartographicDegrees:datalist3,
                },
            },
        ];
        viewer.dataSources
            .add(Cesium.CzmlDataSource.load(czml))
            .then(function (ds) {
                viewer.trackedEntity = ds.entities.getById("path");
            });
    }
</script>

<script>
    // alert("data="+JSON.parse(localStorage.getItem("eleList"))[0].id);

    function getData(str) {
        var points = [];
        var array = str.split(",");
        for (var i = 0; i < array.length; i+=3) {//for (i = 0; i < array.length; i+=3)   var i =0才是对的
            var point = {
                x: array[i],
                y: array[i+1],
                value: array[i+2]
            };
            points.push(point);
        }
        return  points;
    }
    //alert("heat lentgth:"+heatList.length);
    for(var i=0; i < heatList.length; i++){
        var bounds = {
            west: parseFloat(  heatList[i].west) ,//data小数点后位数少一些
            south:parseFloat(heatList[i].south),
            east: parseFloat(heatList[i].east),
            north: parseFloat(heatList[i].north)
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

        heatMap.setWGS84Data(0, 100,getData(heatList[i].data)
        );
    }
</script>
    <!-- 底部结束 -->

</body>
</html>