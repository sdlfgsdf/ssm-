<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>修改密码</title>
    <!-- 加入网站标题icon -->
    <link rel="icon" href="${pageContext.request.contextPath}/static/layui/images/logo.png" type="image/x-icon" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/public.css" media="all">
    <style>
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<div style="width: 200px;height: 50px;text-align: center;line-height: 50px;font-size: 24px;margin: 0 auto">修改密码</div>
<div class="layui-form layuimini-form" style="width: 700px;margin: 0 auto;">
    <div class="layui-form-item">
        <label class="layui-form-label required">用户名</label>
        <div class="layui-input-block">
            <input type="text" name="username" lay-verify="required" lay-reqtext="用户名不能为空" placeholder="请输入用户名"class="layui-input" style="width: 400px">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">密码</label>
        <div class="layui-input-block">
            <input type="password" name="password" lay-verify="required" lay-reqtext="密码不能为空" placeholder="请输入密码" class="layui-input" style="width: 400px">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="text" name="name" placeholder="请输入姓名" class="layui-input" style="width: 400px">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注信息</label>
        <div class="layui-input-block">
            <textarea name="remark" class="layui-textarea" placeholder="请输入备注信息" style="width: 400px;height: 100px"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认保存</button>
        </div>
    </div>
</div>
</div>
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.$;

        //修改密码
        form.on('submit(saveBtn)', function (data) {
            $.ajax({
                url: "${pageContext.request.contextPath}/updatePwd",
                type: "post",
                data: data.field,
                dataType: "json",
                success:function (data) {
                    if(data.success) {
                        layer.msg(data.message,function () {
                            location.href = "${pageContext.request.contextPath}/pages/login.jsp";
                        });
                    } else {
                        layer.msg("系统繁忙，请稍后再试",{time:1500});
                    }
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
