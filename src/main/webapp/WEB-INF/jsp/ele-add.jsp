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
                    <span class="x-red">*</span>将会成为您唯一的登入名</div></div>
            <div class="layui-form-item">
                <label for="L_x" class="layui-form-label">
                    <span class="x-red">*</span>经度</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_x" name="x" required="" lay-verify="required|x" autocomplete="off" class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>180 ~-180</div>
            </div>
            <div class="layui-form-item">
                <label for="L_y" class="layui-form-label">
                    <span class="x-red">*</span>纬度</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_y" name="y" required="" lay-verify="required|y" autocomplete="off" class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>90~ -90</div>
            </div>
            <div class="layui-form-item">
                <label for="L_4" class="layui-form-label">
                    <span class="x-red">*</span>海拔</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_4" name="height" required="" lay-verify="required|h" autocomplete="off" class="layui-input"></div>
            </div>

            <div class="layui-form-item">
                <label for="L_5" class="layui-form-label">
                    <span class="x-red">*</span>影响半径</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_5" name="r" required="" lay-verify="required|r" autocomplete="off" class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>单位km</div>
            </div>
            <div class="layui-form-item">
                <label for="L_6" class="layui-form-label">
                    <span class="x-red">*</span>命名</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_6" name="name" required="" lay-verify="required|name" autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="L_7" class="layui-form-label">
                    <span class="x-red">*</span>频率</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_7" name="hz" required="" lay-verify="required|hz" autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"> <span class="x-red">*</span>任务类型</label>
                <div class="layui-input-block">
                    <input type="radio" name="task" value="探测" title="探测">
                    <input type="radio" name="task" value="制导" title="制导">
                    <input type="radio" name="task" value="通信" title="通信" checked>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><span class="x-red">*</span>设备状态</label>
                <div class="layui-input-block">
                    <select name="state" lay-verify="required">
                        <option value="正常启动">正常启动</option>
                        <option value="关闭">关闭</option>
                        <option value="受干扰">受干扰</option>
                    </select>
                </div>
            </div>


            <div class="layui-form-item">
                <label for="L_10" class="layui-form-label">
                    <span class="x-red">*</span>设备型号</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_10" name="type" required="" lay-verify="required|type" autocomplete="off" class="layui-input"></div>
            </div>




            <div class="layui-form-item">
                <label for="L_1" class="layui-form-label">
                    <span class="x-red">*</span>备注</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_1" name="info" required="" lay-verify="info" autocomplete="off" class="layui-input"></div>
            </div>

            <div class="layui-form-item">
                <label for="L_1" class="layui-form-label"></label>
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
            name: function(value) {
                if (value.length < 2) {
                    return '命名至少得2个字符啊';
                }
            },

            h: function(value) {
                if(!isRealNum(value)){
                    return '海拔必须是数字';
                }
            },
            x: function(value) {
                if(!isRealNum(value)){
                    return '经度必须是数字';
                }
                if($('#L_x').val()>180 || $('#L_x').val()<-180 ){
                    return '经度度必须在180 与 -180间';
                }
            },
            y: function(value) {
                if(!isRealNum(value)){
                    return '纬度必须是数字';
                }
                if($('#L_y').val()>90 || $('#L_x').val()<-90 ){
                    return '纬度必须在90 与 -90间';
                }
            },
        });

        //监听提交
        form.on('submit(add)',
            function(data) {
                console.log(data);
                //发异步，把数据提交给php
                $.ajax({
                    type:"post",
                    url: "../ele_fieldController/insert",
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