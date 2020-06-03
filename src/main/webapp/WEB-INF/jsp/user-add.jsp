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
                            <input type="text" id="L_id" name="id" required="" lay-verify="id" autocomplete="off" class="layui-input"></div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>将会成为您唯一的登入名</div></div>
                    <div class="layui-form-item">
                        <label for="L_1" class="layui-form-label">
                            <span class="x-red">*</span>姓名</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_1" name="name" required="" lay-verify="name" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_pass" class="layui-form-label">
                            <span class="x-red">*</span>密码</label>
                        <div class="layui-input-inline">
                            <input type="password" id="L_pass" name="password" required="" lay-verify="pass" autocomplete="off" class="layui-input"></div>
                        <div class="layui-form-mid layui-word-aux">3到16个字符</div></div>
                    <div class="layui-form-item">
                        <label for="L_2" class="layui-form-label">
                            <span class="x-red">*</span>年龄</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_2" name="age" required="" lay-verify="age" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class="x-red">*</span>性别
                        </label>
                        <div class="layui-input-block">
                            <input type="radio" name="gender" value="男" title="男">
                            <input type="radio" name="gender" value="女" title="女" checked>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"> <span class="x-red">*</span>学历</label>
                        <div class="layui-input-block">
                            <select name="edu" lay-verify="required">
                                <option value=""></option>
                                <option value="本科">本科</option>
                                <option value="高中">高中</option>
                                <option value="硕士及以上">硕士及以上</option>
                                <option value="初中及以下">初中及以下</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_5" class="layui-form-label">
                            <span class="x-red">*</span>身份证号码</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_5" name="idcard" required="" lay-verify="idcard" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_6" class="layui-form-label">
                            <span class="x-red">*</span>备注</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_6" name="info" required="" lay-verify="info" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label">
                            <span class="x-red">*</span>确认密码</label>
                        <div class="layui-input-inline">
                            <input type="password" id="L_repass" name="repass" required="" lay-verify="repass" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label"></label>
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
                            return '昵称至少得2个字符啊';
                        }
                    },
                    pass: [/(.+){3,12}$/, '密码必须3到12位'],
                    repass: function(value) {
                        if ($('#L_pass').val() != $('#L_repass').val()) {
                            return '两次密码不一致';
                        }
                    },
                    age: function(value){
                        if (value<0 || value>120) {
                            return '年龄0 到120之间';
                        }
                    },
                    idcard:[/(.+){18,18}$/, '身份证必须18位'],
                });

                //监听提交
                form.on('submit(add)',
                function(data) {
                    console.log(data);
                    //发异步，把数据提交给php
                    $.ajax({
                        type:"post",
                        url: "../userController/insert",
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