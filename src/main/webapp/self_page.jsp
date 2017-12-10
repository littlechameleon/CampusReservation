<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: giligiliai
  Date: 2017/11/9
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>个人主页</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" href="static/image/favicon.ico">

    <link href="static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/main.css" type="text/css" rel="stylesheet">
    <link href="static/css/jquery-ui.min.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="text-center">
        <s:if test="usersEntity.type==1">
            <h2><s:property value="usersEntity.name"/> 老师主页</h2>
        </s:if>
        <s:else>
            <h2><s:property value="usersEntity.name"/> 同学主页</h2>
        </s:else>    </div>
    <div class="col-lg-7 col-lg-offset-2" id="self-page">
        <table class="table table-strip table-hover">
            <tr>
                <td><span class="col-lg-4 col-lg-offset-2">姓名：</span><span class="col-lg-5"><s:property value="usersEntity.id"></s:property> </span></td>
            </tr>
            <tr>
                <td><span class="col-lg-4 col-lg-offset-2">学号/教工号：</span><span class="col-lg-5"><s:property value="usersEntity.id"/></span></td>
            </tr>
            <tr>
                <td><span class="col-lg-4 col-lg-offset-2">性别：</span><span class="col-lg-5"><s:property value="usersEntity.sex"/></span></td>
            </tr>
            <tr>
                <td><span class="col-lg-4 col-lg-offset-2">学院：</span><span class="col-lg-5"><s:property value="usersEntity.college"/></span></td>
            </tr>
            <s:if test="usersEntity.type==1">
                <tr>
                    <td><span class="col-lg-4 col-lg-offset-2">常用工作地点：</span><span class="col-lg-5"><s:property value="usersEntity.workplace"/></span></td>
                </tr>
            </s:if>
            <tr>
                <td><span class="col-lg-4 col-lg-offset-2">邮箱：</span><span class="col-lg-5"><s:property value="usersEntity.email"/></span>
                </td>
            </tr>
            <tr>
                <td><span class="col-lg-4 col-lg-offset-2">联系方式：</span><span class="col-lg-5"><s:property value="usersEntity.contact"/> </span></td>
            </tr>

            <tr>
                <td><span class="col-lg-4 col-lg-offset-2">个人简介：</span><span class="col-lg-5"><s:property value="usersEntity.detail"/></span>
                </td>
            </tr>
        </table>
        <a class="btn btn-lg btn-primary pull-left" href="ReturnHomepage?id=<s:property value='id'/> "><span class="glyphicon glyphicon-arrow-left"></span> 返回主页</a>
    </div>
</div>

<script src="static/js/jquery-3.1.1.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/jquery-ui.min.js"></script>
<script>
</script>
</body>
</html>
