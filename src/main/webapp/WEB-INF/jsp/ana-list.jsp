<%@ page  contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-X-admin2.2</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="../layui/css/font.css">
        <link rel="stylesheet" href="../layui/css/xadmin.css">
        <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
        <script src="../layui/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../layui/js/xadmin.js"></script>
        <script src = "../js/jquery-3.4.1.js"></script>
        <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">

                        <div class="layui-card-header">
                            <button class="layui-btn" onclick="All()"><i class="layui-icon"></i>3d展示</button>

                        </div>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <button class="layui-btn" onclick=""><i class="layui-icon"></i>飞机信息</button>
                            <table class="layui-table layui-form"  >
                                <thead>
                                  <tr>
                                    <th>

                                    </th>
                                    <th>ID</th>
                                    <th>出现时间</th>
                                    <th>消失时间</th>
                                    <th>name</th>
                                    <th>备注信息</th>
                                    <th>类型</th>
                                    <th>默认经度</th>
                                    <th>默认纬度</th>
                                      <th>默认海拔</th>
                                      <th>选择路径</th>
                                  </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${air}" var="u">
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="id"  lay-filter="id" value="air${u.id}"  lay-skin="primary">
                                        </td>
                                        <td>${u.id}</td>
                                        <td>${u.start}</td>
                                        <td>${u.end}</td>
                                        <td>${u.name}</td>
                                        <td>${u.info}</td>
                                        <td>${u.type}</td>
                                        <td>${u.x}</td>
                                        <td>${u.y}</td>
                                        <td>${u.h}</td>
                                        <td>
                                        <select  name = "pzs" id="pair${u.id}">
                                            <c:forEach items="${path}" var="u">
                                                <option value=${u.id}>id:${u.id}</option>
                                                <!--
                                                <option value=${u.id}>
                                                id:${u.id}
                                                </option>
                                                下拉框会显示异常？
                                                -->
                                            </c:forEach>
                                        </select>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <div class="layui-card-body layui-table-body layui-table-main">
                            <button class="layui-btn" onclick=""><i class="layui-icon"></i>雷达信息</button>
                            <table class="layui-table layui-form">
                                <thead>
                                <tr>
                                    <th>

                                    </th>
                                    <th>ID</th>
                                    <th>经度</th>
                                    <th>纬度</th>
                                    <th>海拔</th>
                                    <th>影响范围</th>
                                    <th>name</th>
                                    <th>频率</th>
                                    <th>设备型号</th>
                                    <th>运行状态</th>
                                    <th>任务</th>
                                    <th>备注信息</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${ele}" var="u">
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="id" value="ele${u.id}"  lay-skin="primary">
                                        </td>
                                        <td>${u.id}</td>
                                        <td>${u.x}</td>
                                        <td>${u.y}</td>
                                        <td>${u.height}</td>
                                        <td>${u.r}</td>
                                        <td>${u.name}</td>
                                        <td>${u.hz}</td>
                                        <td>${u.type}</td>
                                        <td>${u.state}</td>
                                        <td>${u.task}</td>
                                        <td>${u.info}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <div class="layui-card-body layui-table-body layui-table-main">
                            <button class="layui-btn" onclick=""><i class="layui-icon"></i>路径信息</button>
                            <table class="layui-table layui-form">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>路径数据</th>
                                    <th>起点</th>
                                    <th>终点</th>
                                    <th>备注信息</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${path}" var="u">
                                    <tr>
                                        <td>${u.id}</td>
                                        <td>${u.data}</td>
                                        <td>${u.start}</td>
                                        <td>${u.end}</td>
                                        <td>${u.info}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <div class="layui-card-body ">
                            <div class="page">
                                <div>
                                  <a class="prev" href="">&lt;&lt;</a>
                                  <a class="num" href="">1</a>
                                  <span class="current">2</span>
                                  <a class="num" href="">3</a>
                                  <a class="num" href="">489</a>
                                  <a class="next" href="">&gt;&gt;</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </body>
    <script>
      layui.use(['laydate','form','table'], function(){

        var laydate = layui.laydate;
        var  form = layui.form;

      });
      function All (argument) {
          var ids = [];
          // 获取选中的id
          $('tbody input').each(function(index, el) {
              if($(this).prop('checked')){
                  ids.push($(this).val())
              }
          });
          layer.confirm('开始分析？'+ids.toString(),function(index){
              var idsAir = "";
              var idsEle = "";
              for(var i=0;i<ids.length;i++){
                  var id = ids[i];
                  if(id.indexOf('air') == -1){
                      idsEle=idsEle+id+",";
                  }
                  else{
                      idsAir = idsAir+id+",path"+$("#p"+id).val()+","
                  }
              }
              //alert("ids===="+idsAir+idsEle);

              $.ajax({
                  type:"post",
                  url: "../jspController/ana",
                  data:{
                      "eleIds":idsEle,
                      "airIds":idsAir
                  },
                  async:true,
                  dataType:"json",
                  success:function(data){
                      if(data.success){
                          //一旦data的元素取出一次后，就会变为空？再取无值？？
                          localStorage.setItem("eleList",JSON.stringify(data.eleList
                          ));
                          localStorage.setItem("heatList",JSON.stringify(data.heatList
                          ));
                          localStorage.setItem("airList",JSON.stringify(
                              data.airList
                          ));
                          localStorage.setItem("pathList",JSON.stringify(
                              data.pathList
                          ));
                          localStorage.setItem("eleFList",JSON.stringify(
                              data.eleFList
                          ));
                          localStorage.setItem("airFList",JSON.stringify(
                              data.airFList
                          ));
                          localStorage.setItem("timeList",JSON.stringify(
                              data.timeList
                          ));
                          var newWin = window.open('../ana-all.jsp');//先打开页面再跳转会异常
                      }else{
                          alert("error"+data.msg);
                      }
                  }//success
              });//ajax
          });
      }
    </script>
</html>