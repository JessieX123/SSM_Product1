<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'list.jsp' starting page</title>

    <link href="<%=request.getContextPath() %>/css/content.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        #down table {
            position: relative;
            left: 50%;
            margin-left: -500px;
            top: 50px;
            border-top: 1px #999 solid;
            border-right: 1px #999 solid;
        }

        #down tr {
            height: 60px;
        }

        #down tr td {
            text-align: center;
            border-left: 1px #999 solid;
            border-bottom: 1px #999 solid;
        }

        #up a:VISITED, #up a:LINK {
            color: #4C8FBD;
            text-decoration: none;
        }

        #up a:HOVER {
            color: #4C8FBD;
            text-decoration: none;
        }

        .head {
            background: #438EB9;
            color: #fff;
        }

        tbody tr:nth-child(odd) {
            background: #e5e5e5;
        }

        tbody tr:nth-child(even) {
            background: #d5d5d5;
        }
    </style>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.8.3.js"></script>
    <script type="text/javascript">

    </script>
</head>

<body>
<div id="up">
    <ul>
        <li><span>职务列表</span></li>
    </ul>
</div>
<div id="down">
    <table width="1000px" cellpadding="0" cellspacing="0">
        <thead>
        <tr class="head">
            <td>序号</td>
            <td>职务主键</td>
            <td>职员名</td>
            <td>月薪</td>
            <td>职务等级</td>
            <c:if test="${user1.role_id==1}">
                <td>操作</td>
            </c:if>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${jobList}" var="job" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${job.id}</td>
                <td>${job.name}</td>
                <td>${job.salary}</td>
                <td>${job.job_level.name}</td>
                <c:if test="${user1.role_id==1}">
                    <td>
                        <a href="/job/getJobById?id=${job.id}">修改</a>&nbsp;
                        <a href="/job/delJob?id=${job.id}" onclick="return confirm('确认删除？');">删除</a>&nbsp;
                    </td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
