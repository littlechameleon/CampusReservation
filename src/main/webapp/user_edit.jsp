<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 11873
  Date: 2017/11/5
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>修改个人信息</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" href="static/image/favicon.ico">

    <link href="static/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/main.css" type="text/css" rel="stylesheet">
    <link href="static/css/jquery-ui.min.css" type="text/css" rel="stylesheet">
</head>
<body background="static/image/681662.jpg">
<div class="container">
    <div class="text-center">
        <h2>修改个人信息</h2>
    </div><br/><br/>
    <div class="center-block">
        <div id="signup">
            <form action="ModifyAction" class=" col-lg-6 col-lg-offset-3" method="post">
                <div class="form-group">
                    <label for="confirm_username" class="control-label">姓名<span class="important">*</span></label>
                    <input required class="form-control input" id="confirm_username" value="<s:property value='usersEntity.name'/>" type="text"
                           name="name" maxlength="20">
                </div>
                <div class="form-group">
                    <label for="number" class="control-label">学号/教工号</label>
                    <input class="form-control input" id="number" value="<s:property value='usersEntity.id'/>" type="text"
                           name="id" readonly="readonly">
                </div>
                <div class="form-group">
                    <label for="institute" class="control-label">学院<span class="important">*</span></label>
                    <input required class="form-control input" id="institute" placeholder="请输入您所属学院" value="<s:property value='usersEntity.college'/>" type="text"
                           name="college" maxlength="20">
                </div>
                <div class="form-group">
                    <label for="phone" class="control-label">联系方式<span class="important">*</span></label>
                    <input required class="form-control input" type="tel" id="phone" placeholder="请输入联系方式" value="<s:property value='usersEntity.contact'/>"
                           name="contact" maxlength="20">
                </div>
                <div class="form-group">
                    <label for="confirm_email" class="control-label">邮箱<span class="important">*</span></label>
                    <input required class="form-control input" type="tel" id="confirm_email" value="<s:property value='usersEntity.email'/>"
                           name="email" maxlength="20">
                </div>
                <div class="form-group">
                    <label for="indi_resume" class="control-label">个人简介</label>
                    <textarea class="form-control" name="detail" rows="5" maxlength="300" id="indi_resume"
                              placeholder="请输入个人简介.最多300个字符"><s:property value="detail"/></textarea>
                </div>
                <div class="submit-block">
                    &nbsp;
                    <button type="submit" class="btn btn-default center-block" id="signup_submit">提交</button>
                </div>
            </form>
        </div>
    </div>
</div>
s
<script src="static/js/jquery-3.1.1.min.js"></script>
<script src="static/bootstrap/js/bootstrap.min.js"></script>
<script src="static/js/jquery-ui.min.js"></script>
<script>
    $(function () {
        var institutes = ["计算机科学与技术学院", "能源学院", "经济管理学院"];
        $("#institute").autocomplete({
            source: institutes
        });
    });
</script>
</body>
</html>
