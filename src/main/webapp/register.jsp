<%--
  Created by IntelliJ IDEA.
  User: 11873
  Date: 2017/10/24
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>校园预约系统</title>
    <!--用百度的静态资源库的cdn安装bootstrap环境-->
    <!-- Bootstrap 核心 CSS 文件 -->
    <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!--font-awesome 核心我CSS 文件-->
    <link href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- 在bootstrap.min.js 之前引入 -->
    <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
    <!-- Bootstrap 核心 JavaScript 文件 -->
    <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <!--jquery.validate-->
    <script type="text/javascript" src="js/jquery.validate.min.js" ></script>
    <script type="text/javascript" src="js/message.js" ></script>
    <style type="text/css">
        body{background: url(2.jpg) no-repeat;background-size:cover;font-size: 16px;}
        .form{background: rgba(255,255,255,0.2);width:400px;margin:100px auto;}
        .fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
        input[type="text"],input[type="password"]{padding-left:26px;}
    </style>
</head>
<body>


<ul id="myTab" class="nav nav-tabs">
    <li class="active">
        <a href="#home" data-toggle="tab">
            登录
        </a>
    </li>
    <li>
        <a href="#ios" data-toggle="tab">
            注册
        </a>
    </li>
</ul>
<div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id = "home">
        <div class = "form row">
            <form class="form-horizontal col-sm-offset-2 col-md-offset-2" id="login_form" role="form">
                <h3 class="form-title">用户登录</h3>
                <div class="col-sm-12 col-md-12">
                    <div class="form-group">
                        <label for="username" class="col-sm-3 control-label">用户名</label>
                        <!-- <i class="fa fa-user fa-lg"></i>-->
                        <div class="col-sm-8">
                            <input class="form-control required" type="text" id="username" placeholder="Username" name="username" autofocus="autofocus" maxlength="20"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-3 control-label">密码</label>
                        <!-- <i class="fa fa-lock fa-lg"></i>-->
                        <div class="col-sm-8">
                            <input  class="form-control required"  type="password" id = "password" placeholder="Password" name="password" maxlength="8"/>
                        </div>
                    </div>


                    <div class="form-group">
                        <input type="submit" class="btn btn-success pull-right" value="Login "/>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="tab-pane fade" id = "ios">
        <div class="form row">
            <form class="form-horizontal col-sm-offset-2 col-md-offset-2" id="register_form">
                <h3 class="form-title">用户注册</h3>
                <div class="col-sm-12 col-md-12">
                    <div class="form-group">
                        <label for="username" class="col-sm-4 control-label">用户名</label>
                        <div class="col-sm-7">
                            <input class="form-control required" type="text" id="username" placeholder="Username" name="username" autofocus="autofocus"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="register_password" class="col-sm-4 control-label">密码</label>
                        <div class="col-sm-7">
                            <input class="form-control required" type="password" placeholder=" Password" id="register_password" name="password"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="rpassword" class="col-sm-4 control-label">确认密码</label>
                        <div class="col-sm-7">
                            <input class="form-control required" type="password" id="rpassword" placeholder="Re-type Password" name="rpassword"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-4 control-label">姓名</label>
                        <div class="col-sm-7">
                            <input class="form-control name" type="text" id="name" placeholder="Name" name="name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label   class="col-sm-4 control-label">性别</label>
                        <label class="radio-inline">
                            <input type="radio" name="optionsRadiosinline" id="optionsRadios3" value="option1" checked> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="optionsRadiosinline" id="optionsRadios4"  value="option2"> 女
                        </label>
                    </div>
                    <div class="form-group">
                        <label   class="col-sm-4 control-label">身份</label>
                        <label class="radio-inline">
                            <input type="radio" name="optionsRadiosinline" id="optionsRadios3" value="option1" checked> 教师
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="optionsRadiosinline" id="optionsRadios4"  value="option2">学生
                        </label>
                    </div>
                    <div class="form-group">
                        <label for="eamil" class="col-sm-4 control-label">邮箱</label>
                        <div class="col-sm-7">
                            <input class="form-control required" type="text" id="eamil" placeholder=" Email" name="email"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="institu" class="col-sm-4 control-label">学院</label>
                        <div class="col-sm-7">
                            <input class="form-control required" type="text" id="institu" placeholder="Institu" name="institu"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-sm-4 control-label">电话</label>
                        <div class="col-sm-7">
                            <input class="form-control required" type="text" id="phone" placeholder="Phone" name="phone"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name">个人简介</label>
                        <textarea class="form-control" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-success pull-right" value="Sign Up "/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/main.js" ></script>
</body>
</html>