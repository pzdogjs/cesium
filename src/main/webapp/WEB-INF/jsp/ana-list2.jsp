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

                            <table class="layui-table" lay-data="{url:'../airController/getall', id:'test'}" lay-filter="test">
                                <thead>
                                <tr>
                                    <th lay-data="{field:'id', width:80, sort: true}">ID</th>
                                    <th lay-data="{field:'start', width:80}">start</th>
                                    <th lay-data="{field:'end', width:80, sort: true}">end</th>
                                    <th lay-data="{field:'name'}">name</th>
                                    <th lay-data="{field:'info'}">info</th>
                                    <th lay-data="{field:'type'}">type</th>
                                    <th lay-data="{field:'x', sort: true}">x</th>
                                    <th lay-data="{field:'y', sort: true}">y</th>
                                    <th lay-data="{field:'h'}">h</th>
                                </tr>
                                </thead>
                            </table>


                        </div>

                        <div class="layui-card-body layui-table-body layui-table-main">
                            <button class="layui-btn" onclick=""><i class="layui-icon"></i>雷达信息</button>

                        </div>

                        <div class="layui-card-body layui-table-body layui-table-main">
                            <button class="layui-btn" onclick=""><i class="layui-icon"></i>路径信息</button>

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
          table.render({ //其它参数省略
              id: 'test'
          });


        var laydate = layui.laydate;
        var  form = layui.form;
        // 监听全选
        form.on('checkbox(checkall)', function(data){
          if(data.elem.checked){
            $('tbody input').prop('checked',true);
          }else{
            $('tbody input').prop('checked',false);
          }
          form.render('checkbox');
        });
      });
      function All (argument) {
          var checkStatus = table.checkStatus('idTest'); //idTest 即为基础参数 id 对应的值

          console.log(checkStatus.data) //获取选中行的数据
      }
    </script>
</html>