<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>系统主页</title>
    <!-- 加入网站标题icon -->
    <link rel="icon" href="${pageContext.request.contextPath}/static/layui/images/logo.png" type="image/x-icon" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/public.css" media="all">
    <style>
        td {
            text-align: center;
        }
    </style>
</head>
<body>
<!-- 定义容器 -->
<div class="layuimini-container">
    <!-- 定义行 -->
    <div class="layui-row">
        <!-- 标题位置 -->
        <div class="layui-col-md12">
            <div style="width: 400px;height: 100px;text-align: center;line-height: 120px;margin: 0 auto">
                <p style="font-size: 40px">员工信息管理</p>
            </div>
        </div>
        <!-- 用户信息 -->
        <div style="position: absolute;left: 1136px;top: 75px;width: 220px;height: 30px;text-align: center;line-height: 30px">
            <span style="font-size: 18px;">当前用户：</span>
            <i class="layui-icon">&#xe66f;</i>
            <span style="color: red;font-size: 18px">${sessionScope.user.name}</span>
        </div>
        <div style="position: absolute;left: 1300px;top: 75px;width: 200px;height: 30px;text-align: center;line-height: 30px">
            <button class="layui-btn layui-btn-sm" id="logout">
                <i class="layui-icon">&#xe65c;</i>退出登录
            </button>
        </div>
    </div>
    <!-- 搜索栏 -->
    <div class="layui-row">
        <div class="layui-col-md12">
            <fieldset class="table-search-fieldset">
                <legend>搜索信息</legend>
                <div style="margin: 10px 10px 10px 10px">
                    <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/emp/findByCondition" method="post">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">员工编号</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="empId" id="empId" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">员工姓名</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="name" id="name" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">员工性别</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="sex" id="sex" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">部门</label>
                                <div class="layui-input-block" style="width: 200px">
                                    <select name="deptId" id="deptId">
                                        <option value="" disabled>请选择部门</option>
                                        <c:forEach items="${depts}" var="dept">
                                            <option value="${dept.id}">${dept.deptName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <button type="submit" id="btn" class="layui-btn layui-btn-primary" lay-submit lay-filter="data-search-btn">
                                    <i class="layui-icon"></i> 搜 索
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </fieldset>
        </div>
    </div>
    <!-- 按钮行 -->
    <div class="layui-row">
        <div class="layui-col-md12">
            <fieldset class="table-search-fieldset">
                <button class="layui-btn layui-btn-sm layui-btn-normal" id="addBtn">
                    <i class="layui-icon">&#xe61f;</i> 添加
                </button>
                <button class="layui-btn layui-btn-sm layui-btn-danger">
                    <i class="layui-icon">&#xe640;</i> 批量删除
                </button>
            </fieldset>
        </div>
    </div>
    <!-- 表格行 -->
    <div class="layui-row">
        <div class="layui-col-md12">
            <table class="layui-table">
                <tr>
                    <th style="text-align: center;font-weight: bold">员工编号</th>
                    <th style="text-align: center;font-weight: bold">姓名</th>
                    <th style="text-align: center;font-weight: bold">性别</th>
                    <th style="text-align: center;font-weight: bold">年龄</th>
                    <th style="text-align: center;font-weight: bold">手机号码</th>
                    <th style="text-align: center;font-weight: bold">入职日期</th>
                    <th style="text-align: center;font-weight: bold">地址</th>
                    <th style="text-align: center;font-weight: bold">所属部门</th>
                    <th style="text-align: center;font-weight: bold">备注</th>
                    <th style="text-align: center;font-weight: bold">操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <td>${emp.empId}</td>
                        <td>${emp.name}</td>
                        <td>${emp.sex}</td>
                        <td>${emp.age}</td>
                        <td>${emp.phone}</td>
                        <td><fmt:formatDate value="${emp.joinData}" pattern="yyyy-MM-dd"/></td>
                        <td>${emp.address}</td>
                        <td>${emp.dept.deptName}</td>
                        <td>${emp.remark}</td>
                        <td>
                            <button onclick="update(${emp.empId},${pageNum})" class="layui-btn layui-btn-sm" id="editBtn">
                                <i class="layui-icon">&#xe642;</i>编辑
                            </button>
                            <button onclick="del(${emp.empId},${pageNum})" class="layui-btn layui-btn-sm layui-btn-danger">
                                <i class="layui-icon">&#xe640;</i>删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <!-- 分页数据行 -->
    <div class="layui-row">
        <!-- 分页信息 -->
        <div class="layui-col-md8">
            <div style="width: 400px;height: 50px;margin: 0 50px;line-height: 50px">
                <h3>
                    当前第<span style="color: #1E9FFF">${pageInfo.pageNum}</span>页，
                    总共<span style="color: #1E9FFF">${pageInfo.pages}</span>页，
                    总共<span style="color: #1E9FFF">${pageInfo.total}</span>条记录数。
                </h3>
            </div>
        </div>
        <!-- 分页条 -->
        <div class="layui-col-md4">
            <div class="layui-box layui-laypage layui-laypage-default">
                <!-- 首页 -->
                <a href="${pageContext.request.contextPath}/emp/list.html?currentPage=1">首页</a>

                <!-- 上一页 -->
                <c:if test="${pageInfo.hasPreviousPage}">
                    <a class="layui-laypage-prev" href="${pageContext.request.contextPath}/emp/list.html?currentPage=${pageInfo.pageNum-1}">上一页</a>
                </c:if>

                <!-- navigatepageNums是所有页码的集合 -->
                <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                    <!-- 如果遍历的是当前页，那么显示特殊样式 -->
                    <c:if test="${page_Num == pageInfo.pageNum}">
                        <a href="${pageContext.request.contextPath}/emp/list.html?currentPage=${page_Num}" style="background-color: #009688">${page_Num}</a>
                    </c:if>
                    <!-- 如果遍历的不是当前页，那么默认显示 -->
                    <c:if test="${page_Num != pageInfo.pageNum}">
                        <a href="${pageContext.request.contextPath}/emp/list.html?currentPage=${page_Num}">${page_Num}</a>
                    </c:if>
                </c:forEach>

                <!-- 下一页 -->
                <c:if test="${pageInfo.hasNextPage}">
                    <a class="layui-laypage-next" href="${pageContext.request.contextPath}/emp/list.html?currentPage=${pageInfo.pageNum+1}">下一页</a>
                </c:if>

                <!-- 尾页 -->
                <a href="${pageContext.request.contextPath}/emp/list.html?currentPage=${pageInfo.pages}">尾页</a>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/jquery/jquery-1.4.2.min.js"></script>
<script>
    layui.use(['form','layer','jquery'], function () {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.jquery;

        //更新全部表单数据
        form.render();
        
        //退出登录
        $("#logout").click(function () {
            layer.confirm('确定退出吗？', function () {
                window.location.href = "${pageContext.request.contextPath}/logout";
            });
        });

        //监听添加操作
        $("#addBtn").click(function () {
            layer.open({
                title: "新增员工信息",
                type: 2,
                shadeClose: false,
                area: ["50%", "85%"],
                content: "${pageContext.request.contextPath}/emp/dept",
            });
        });

    });

    //删除操作
    function del(empId,pageNum) {
        layer.confirm("确定要删除吗？",function () {
            //发送ajax请求
            $.ajax({
                url: "delete",
                type: "post",
                data: {"empId":empId},
                dataType: "json",
                success:function (data) {
                    if(data.success) {
                        layer.msg(data.message,{time:1000},function () {
                            location.href = "list.html?currentPage="+pageNum;
                        });
                    } else {
                        layer.msg("系统繁忙，请稍后再试",{time:1000});
                    }
                }
            });
        });
    }

    //编辑操作
    function update(empId,pageNum) {
        layer.open({
            title: "编辑员工信息",
            type: 2,
            shadeClose: false,
            area: ["50%", "85%"],
            content: "${pageContext.request.contextPath}/emp/edit.html?empId="+empId+"&currentPage="+pageNum,
        });
    }

</script>
</body>
</html>

