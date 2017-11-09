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

    <link href="static/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/main.css" type="text/css" rel="stylesheet">
    <link href="static/css/jquery-ui.min.css" type="text/css" rel="stylesheet">
</head>
<body background="static/image/681662.jpg">
<div class="container">
    <div class="text-center">
        <s:if test="user.type==1">
            <h2><s:property value="user.name"/> 老师主页</h2>
        </s:if>
        <s:else>
            <h2><s:property value="user.name"/> 同学主页</h2>
        </s:else>    </div>
    <div class="col-lg-7 col-lg-offset-2" id="self-page">
        <table class="table table-strip table-hover">
            <tr>
                <td><span class="col-lg-4 col-lg-offset-2">姓名：</span><span class="col-lg-5"><s:property value="user.id"></s:property> </span></td>
            </tr>
            <tr>
                <td><span class="col-lg-4 col-lg-offset-2">学号/教工号：</span><span class="col-lg-5"><s:property value="user.id"/></span></td>
            </tr>
            <tr>
                <td><span class="col-lg-4 col-lg-offset-2">性别：</span><span class="col-lg-5"><s:property value="user.sex"/></span></td>
            </tr>
            <tr>
                <td><span class="col-lg-4 col-lg-offset-2">学院：</span><span class="col-lg-5"><s:property value="user.college"/></span></td>
            </tr>
            <tr>
                <td><span class="col-lg-4 col-lg-offset-2">邮箱：</span><span class="col-lg-5"><s:property value="user.email"/></span>
                </td>
            </tr>
            <tr>
                <td><span class="col-lg-4 col-lg-offset-2">联系方式：</span><span class="col-lg-5"><s:property value="user.contact"/> </span></td>
            </tr>

            <tr>
                <td><span class="col-lg-4 col-lg-offset-2">个人简介：</span><span class="col-lg-5"><s:property value="user.detail"/></span>
                </td>
            </tr>
        </table>
    </div>
</div>

<script src="static/js/jquery-3.1.1.min.js"></script>
<script src="static/bootstrap/js/bootstrap.min.js"></script>
<script src="static/js/jquery-ui.min.js"></script>
<script>
</script>
</body>
</html>
