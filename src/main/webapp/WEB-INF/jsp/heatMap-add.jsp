<%@ page  contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
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
        <script src="../layui/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../layui/js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
            <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
            <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form">
                    <div class="layui-form-item">
                        <label for="L_id" class="layui-form-label">
                            <span class="x-red">*</span>id</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_id" name="id" required="" lay-verify="required|id" autocomplete="off" class="layui-input"></div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>唯一的id</div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_x1" class="layui-form-label">
                            <span class="x-red">*</span>西边界</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_x1" name="west" required="" lay-verify="required|west" autocomplete="off" class="layui-input"></div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>180 ~-180</div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_x2" class="layui-form-label">
                            <span class="x-red">*</span>东边界</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_x2" name="east" required="" lay-verify="required|east" autocomplete="off" class="layui-input"></div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>180 ~-180</div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_y1" class="layui-form-label">
                            <span class="x-red">*</span>南边界</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_y1" name="south" required="" lay-verify="required|south" autocomplete="off" class="layui-input"></div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>90~ -90</div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_y2" class="layui-form-label">
                            <span class="x-red">*</span>北边界</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_y2" name="north" required="" lay-verify="required|north" autocomplete="off" class="layui-input"></div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>90~ -90</div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_9" class="layui-form-label">
                            <span class="x-red">*</span>命名</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_9" name="name" required="" lay-verify="required|name" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_7" class="layui-form-label">
                            <span class="x-red">*</span>data</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_7" name="data" required="" lay-verify="required|data" autocomplete="off" class="layui-input"></div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>格式：字符串，内容是以逗号分割的小数，小数数量是3的倍数</div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_8" class="layui-form-label">
                            <span class="x-red">*</span>备注</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_8" name="info" required="" lay-verify="info" autocomplete="off" class="layui-input"></div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_x1" class="layui-form-label"></label>
                        <button class="layui-btn" lay-filter="add" lay-submit="">增加</button></div>
                </form>
            </div>
        </div>
        <script>
            function isRealNum(val){
                // isNaN()函数 把空串 空格 以及NUll 按照0来处理 所以先去除，
                if(val === "" || val ==null){
                    return false;
                }
                if(!isNaN(val)){
                    //对于空数组和只有一个数值成员的数组或全是数字组成的字符串，isNaN返回false，例如：'123'、[]、[2]、['123'],isNaN返回false,
                    //所以如果不需要val包含这些特殊情况，则这个判断改写为if(!isNaN(val) && typeof val === 'number' )
                    return true;
                }
                else{
                    return false;
                }
            }
        </script>
        <script>layui.use(['form', 'layer','jquery'],
            function() {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                //自定义验证规则
                form.verify({
                    nikename: function(value) {
                        if (value.length < 2) {
                            return '昵称至少得2个字符啊';
                        }
                    },
                    pass: [/(.+){6,12}$/, '密码必须6到12位'],
                    repass: function(value) {
                        if ($('#L_pass').val() != $('#L_repass').val()) {
                            return '两次密码不一致';
                        }
                    },
                    west: function(value) {
                        if(!isRealNum(value)){
                            return '经度必须是数字';
                        }
                        if(value>180 || value<-180 ){
                            return 'west经度度必须在180 与 -180间';
                        }
                    },
                    east: function(value) {
                        if(!isRealNum(value)){
                            return '经度必须是数字';
                        }
                        if(value>180 || value<-180 ){
                            return 'east经度度必须在180 与 -180间';
                        }
                        if(value<$('#L_x1').val()){
                            return '东边界必须比西边界大';
                        }
                    },
                    south: function(value) {
                        if(!isRealNum(value)){
                            return '纬度必须是数字';
                        }
                        if(value>90 || value<-90 ){
                            return '纬度必须在90 与 -90间';
                        }
                    },
                    north: function(value) {
                        if(!isRealNum(value)){
                            return '纬度必须是数字';
                        }
                        if(value>90 || value<-90 ){
                            return '纬度必须在90 与 -90间';
                        }
                        if(value<$('#L_y1').val()){
                            return '北边界必须比南边界大';
                        }
                    },
                    data:function(value) {
                        var str = value.split(",");
                        for(var i=0;i<str.length;i++){
                            if(!isRealNum(str[i])){
                                return '必须是数字集合';
                            }
                        }
                        if(str.length%3  != 0){
                            return '数字数量必须是3的整数倍';
                        }
                    },//data
                });

                //监听提交
                form.on('submit(add)',
                function(data) {
                    console.log(data);
                    //发异步，把数据提交给php
                    $.ajax({
                        type:"post",
                        url: "../heatMapController/insert",
                        data:data.field,
                        async:true,
                        dataType:"json",
                        success:function(data){
                            ;
                        }
                    });

                    layer.alert("成功", {
                        icon: 6
                    },
                    function() {
                        //关闭当前frame
                        xadmin.close();

                        // 可以对父窗口进行刷新
                        xadmin.father_reload();
                    });
                    return false;
                });

            });</script>

    </body>

</html>