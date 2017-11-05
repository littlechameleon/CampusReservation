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
    <title>登录/注册</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="static/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/main.css" type="text/css" rel="stylesheet">

</head>
<body background="static/image/681662.jpg">

<div class="container">
    <div class="center-block">
        <div id="tabs" class="">
            <ul id="login_signup" class="nav nav-tabs">
                <li class="active"><a href="#login" data-toggle="tab">登录</a></li>
                <li><a href="#signup" data-toggle="tab">注册</a></li>
            </ul>
            <div class="login_signup_tabs tab-content">
                <div id="login" class="tab-pane fade in active ">
                    <form action="" class="col-lg-4 col-lg-offset-0">
                        <div class="form-group" id="username">
                            <input required class="form-control input" id="login_username" placeholder="学号/教工号"
                                   type="text" maxlength="20">
                        </div>
                        <div class="form-group" id="password">
                            <input required type="password" class="form-control input" id="login_password"
                                   placeholder="密码">
                            <a href="#" id="forget_password" class="pull-right">忘记密码</a>
                        </div>
                        <div class="submit-block">
                            &nbsp;
                            <button type="submit" class="btn btn-default center-block" id="login_submit">提交</button>
                        </div>
                    </form>
                    <div class="col-lg-7">
                        <img src="static/image/relax.jpeg" class="img-rounded" width="100%" height="100%">
                    </div>
                </div>
                <div id="signup" class="tab-pane fade">
                    <form action="RegisterAction" class="col-lg-5 col-lg-offset-3">
                        <div class="form-group">
                            <input required class="form-control input" name="name" id="signup_username" placeholder="姓名"
                                   type="text" maxlength="20">
                        </div>
                        <div class="form-group">
                            <input required class="form-control input" name="id" id="signup_number" placeholder="学号/教工号"
                                   type="text" maxlength="20">
                        </div>
                        <div class="form-group">
                            <div class="form-inline">
                                <input required type="password" class="form-control input" name="password" id="signup_password1"
                                       placeholder="密码">
                                <span class="glyphicon glyphicon-eye-open" id="eye"></span>
                            </div>
                            <span class="hidden important" id="password_message">请输入至少六位密码</span>
                            <div id="level" class="pw-strength hidden">
                                <div class="pw-bar"></div>
                                <div class="pw-bar-on"></div>
                                <div class="pw-txt">
                                    <span>弱</span>
                                    <span>中</span>
                                    <span>强</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <input required class="form-control input" name="email" type="email" id="signup_email"
                                   placeholder="邮箱" maxlength="20">
                        </div>
                        <div class="form-group" id="type">
                            <label class="radio-inline col-lg-5 text-center">
                                <input type="radio" name="type" id="student" value="0" checked="checked">学生
                            </label>
                            <label class="radio-inline col-lg-5 text-center">
                                <input type="radio" name="type" id="teacher" value="1">教师
                            </label>
                        </div><br/>
                        <div class="submit-block">
                            &nbsp;
                            <button type="submit" class="btn btn-default center-block" id="signup_submit">提交</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="static/js/jquery-3.1.1.min.js"></script>
<script src="static/bootstrap/js/bootstrap.min.js"></script>
<script>
    $("#signup_password1").blur(function(){
        if($(this).val().length<6){
            $("#password_message").removeClass("hidden");
        }
        else{
            $("#password_message").addClass("hidden");
        }
        $("#level").addClass("hidden");
    });
    $("#signup_password1").focus(function(){
        $("#level").removeClass("hidden");
    });
    $(function(){
        $('#signup_password1').keyup(function () {
            var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
            var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
            var enoughRegex = new RegExp("(?=.{6,}).*", "g");

            var level=$("#level");
            if (false == enoughRegex.test($(this).val())) {
                level.removeClass('pw-weak');
                level.removeClass('pw-medium');
                level.removeClass('pw-strong');
                level.addClass(' pw-defule');
                $("#signup_submit").attr({"disabled":"disabled"});
                //密码小于六位的时候，密码强度图片都为灰色
            }
            else if (strongRegex.test($(this).val())) {
                level.removeClass('pw-weak');
                level.removeClass('pw-medium');
                level.removeClass('pw-strong');
                level.addClass(' pw-strong');
                $("#signup_submit").removeAttr("disabled");
                //密码为八位及以上并且字母数字特殊字符三项都包括,强度最强
            }
            else if (mediumRegex.test($(this).val())) {
                level.removeClass('pw-weak');
                level.removeClass('pw-medium');
                level.removeClass('pw-strong');
                level.addClass(' pw-medium');
                $("#signup_submit").removeAttr("disabled");
                //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等
            }
            else {
                level.removeClass('pw-weak');
                level.removeClass('pw-medium');
                level.removeClass('pw-strong');
                level.addClass('pw-weak');
                $("#signup_submit").removeAttr("disabled");
                //如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的
            }
            return true;
        });
    });
</script>
</body>
</html>
