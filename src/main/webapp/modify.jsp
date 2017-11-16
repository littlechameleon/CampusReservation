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

    <link href="static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/main.css" type="text/css" rel="stylesheet">
    <link href="static/css/jquery-ui.min.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="text-center">
        <s:if test="usersEntity.type==1">
            <h2><s:property value="usersEntity.name"/> 老师，您好，请确认并完善个人信息</h2>
        </s:if>
        <s:else>
            <h2><s:property value="usersEntity.name"/> 同学，你好，请确认并完善个人信息</h2>
        </s:else>
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
                    <input required class="form-control input" id="institute" placeholder="请输入您所属学院" type="text"
                           name="college" maxlength="20">
                </div>
                <div class="form-group">
                    <label for="phone" class="control-label">联系方式<span class="important">*</span></label>
                    <input required class="form-control input" type="tel" id="phone" placeholder="请输入联系方式"
                           name="contact" maxlength="20">
                </div>
                <div class="form-group">
                    <label for="confirm_email" class="control-label">邮箱<span class="important">*</span></label>
                    <input required class="form-control input" type="tel" id="confirm_email" value="<s:property value='usersEntity.email'/>"
                           name="email" maxlength="20">
                </div>
                <div class="form-group">
                    <label for="pass_ques" class="control-label">密保问题<span class="important">*</span></label>
                    <input required class="form-control input" type="tel" id="pass_ques"
                           maxlength="20">
                </div>
                <div class="form-group">
                    <label for="ans_pass_ques" class="control-label">密保问题答案<span class="important">*</span></label>
                    <input required class="form-control input" type="tel" id="ans_pass_ques"
                           maxlength="20">
                </div>
                <div class="form-group">
                    <label for="indi_resume" class="control-label">个人简介</label>
                    <textarea class="form-control" name="detail" rows="5" maxlength="300" id="indi_resume"
                              placeholder="请输入个人简介.最多300个字符"></textarea>
                </div>
                <div class="form-group " id="sex">
                    <label class="control-label col-lg-2" id="sex_label">性别</label>
                    <label class="radio-inline col-lg-5 text-center">
                        <input type="radio" name="sex" id="male" value="1" checked="checked">男
                    </label>
                    <label class="radio-inline col-lg-5 text-center">
                        <input type="radio" name="sex" id="female" value="0">女
                    </label>
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
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/jquery-ui.min.js"></script>
<script>
    $(function () {
        var institutes = ["经济管理与人文社会科学研究院","航天学院","机电工程学院","材料科学与工程学院","能源科学与工程学院","电气工程及自动化学院",
            "理学院","经济与管理学院","人文社科与法学学院","土木工程学院","建筑学院","交通科学与工程学院","计算机科学与技术学院", "化工与化学学院",
            "外国语学院","电子与信息工程学院","基础与交叉科学研究院","能源学院"];
        $("#institute").autocomplete({
            source: institutes
        });
    });
</script>
</body>
</html>
