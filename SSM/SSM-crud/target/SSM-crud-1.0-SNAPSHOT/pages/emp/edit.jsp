<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>编辑</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/public.css" media="all">
    <style>
        body {
            background-color: #f8f8f8;
        }
    </style>
</head>
<body>
<div class="layui-form layuimini-form">
    <div class="layui-form-item">
        <input type="hidden" name="empId" value="${emp.empId}">
        <label class="layui-form-label required">员工姓名</label>
        <div class="layui-input-block">
            <input type="text" name="name" value="${emp.name}" lay-verify="required" lay-reqtext="用户名不能为空" placeholder="请输入用户名" class="layui-input" style="width: 500px">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" <c:if test="${emp.sex=='男'}">checked="checked"</c:if>title="男">
            <input type="radio" name="sex" value="女" <c:if test="${emp.sex=='女'}">checked="checked"</c:if>title="女">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">年龄</label>
        <div class="layui-input-block">
            <input type="text" name="age" value="${emp.age}"lay-verify="required" lay-reqtext="年龄不能为空" placeholder="请输入手机" class="layui-input" style="width: 500px">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号码</label>
        <div class="layui-input-block">
            <input type="text" name="phone" value="${emp.phone}"placeholder="请输入手机号" class="layui-input" style="width: 500px">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">入职日期</label>
        <div class="layui-input-block">
            <input type="text" name="joinDate" value="<fmt:formatDate value='${emp.joinData}' pattern='yyyy-MM-dd'/>" placeholder="请输入职日期" class="layui-input" style="width: 500px">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-block">
            <input type="text" name="address" value="${emp.address}"placeholder="请输入地址" value="" class="layui-input" style="width: 500px">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">部门</label>
        <div class="layui-input-block" style="width: 200px">
            <select name="deptId">
                <option value="${emp.dept.deptName}">请选择部门</option>
                <c:forEach items="${depts}" var="dept">
                    <option value="${dept.id}" <c:if test="${emp.deptId == dept.id}">selected</c:if>>${dept.deptName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注信息</label>
        <div class="layui-input-block">
            <textarea name="remark" class="layui-textarea" placeholder="请输入备注信息" style="width: 500px">${emp.remark}</textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="editBtn">确认保存</button>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/jquery/jquery-1.4.2.min.js"></script>
<script>
    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.$;

        //更新全部表单数据
        form.render();

        //获取窗口索引
        var index = parent.layer.getFrameIndex(window.name);

        //监听提交
        form.on('submit(editBtn)', function (data) {
            console.log(data.field);
            //发送ajax请求，完成修改操作
            $.ajax({
                url: "update",
                type: "post",
                data: data.field,
                dataType: "json",
                success:function (data) {
                    if(data.success) {
                        layer.msg(data.message,{time:1000},function () {
                            //刷新父窗口内容
                            parent.location.href = "list?currentPage="+${pageNum};
                            parent.layer.close(index);
                        });
                    } else {
                        layer.msg("系统繁忙，请稍后再试",{time:1000});
                    }
                }
            });
            return false;
        });

    });
</script>
</body>
</html>