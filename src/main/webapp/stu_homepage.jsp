<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 11873
  Date: 2017/11/6
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人主页</title>
    <%--网页图标--%>
    <link rel="shortcut icon" href="static/image/favicon.ico">

    <!--bootstrap 和 jquery,jquery-ui 引入-->
    <link href="static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/main.css" type="text/css" rel="stylesheet">
    <link href="static/css/jquery-ui.min.css" type="text/css" rel="stylesheet">

    <!--nifty 动态弹出框引入-->
    <link rel="stylesheet" type="text/css" href="static/css/component.css"/>

</head>
<body>
<!--弹出框-->
<div class="md-modal md-effect-1" id="modal-edit">
    <div class="md-content">
        <div class="text-center">
            <h2>修改个人信息</h2>
        </div>
        <br/><br/>
        <div class="center-block">
            <form action="ModifyAction" method="post" class="form-horizontal">
                <div class="form-group">
                    <label for="confirm_username" class="control-label col-sm-2">姓名：<span class="important">*</span></label>
                    <div class="col-sm-10">
                    <input required class="form-control input col-sm-10" id="confirm_username" value="${user.name}" type="text"
                           name="name" maxlength="20">
                    </div>
                </div>
                <div class="form-group">
                    <label for="number" class="control-label col-sm-2">学号/教工号：</label>
                    <div class="col-sm-10">
                    <input class="form-control input col-sm-10" id="number" value="${user.id}" type="text"
                           name="id" readonly="readonly">
                    </div>
                </div>
                <div class="form-group">
                    <label for="institute" class="control-label col-sm-2">学院：<span class="important">*</span></label>
                    <div class="col-sm-10">
                    <input required class="form-control input col-sm-10" id="institute" placeholder="请输入您所属学院"
                           value="${user.college}" type="text"
                           name="college" maxlength="20">
                    </div>
                </div>
                <div class="form-group">
                    <label for="phone" class="control-label col-sm-2">联系方式：<span class="important">*</span></label>
                    <div class="col-sm-10">
                    <input required class="form-control input col-sm-10" type="tel" id="phone" placeholder="请输入联系方式"
                           value="${user.contact}"
                           name="contact" maxlength="20">
                    </div>
                </div>
                <div class="form-group">
                    <label for="confirm_email" class="control-label col-sm-2">邮箱：<span class="important">*</span></label>
                    <div class="col-sm-10">
                    <input required class="form-control input col-sm-10" type="tel" id="confirm_email" value="${user.email}"
                           name="email" maxlength="20">
                    </div>
                </div>
                <div class="form-group">
                    <label for="indi_resume" class="control-label col-sm-2">个人简介：</label>
                    <div class="col-md-10">
                    <textarea class="form-control col-sm-10" name="detail" rows="5" maxlength="300" id="indi_resume"
                              placeholder="请输入个人简介.最多300个字符">${user.detail}</textarea>
                    </div>
                </div>
                <div class="submit-block text-center">
                    <input type="submit" class="btn btn-default btn-lg edit" value="提交"/>
                    <a class="md-close btn btn-default btn-lg edit">取消</a>
                </div>
            </form>
        </div>
    </div>
</div>

<s:iterator value="confirmedList">
    <div class="md-modal md-effect-1" id="modal-<s:property value='sreservationEntity.sorder'/>">
        <div class="md-content">
            <h3>已接受预约</h3>
            <div>
                <ul>
                    <li><strong>日期:</strong> <s:property value="treservationEntity.date"/></li>
                    <li><strong>时间:</strong> <s:property value="treservationEntity.time"/></li>
                    <li><strong>地点:</strong> <s:property value="treservationEntity.place"/></li>
                    <li><strong>主题:</strong> <s:property value="sreservationEntity.theme"/></li>
                    <li><strong>教师:</strong> <s:property value="usersEntity.name"/></li>
                    <li><strong>教师联系方式:</strong> <s:property value="usersEntity.contact"/></li>
                    <li><strong>教师学院:</strong> <s:property value="usersEntity.college"/></li>
                    <li><strong>教师邮箱:</strong> <s:property value="usersEntity.email"/></li>
                </ul>
                <div class="text-center">
                    <a class="md-close btn btn-default">确认</a>
                </div>
            </div>
        </div>
    </div>
</s:iterator>
<s:iterator value="unconfirmedList">
    <div class="md-modal md-effect-1" id="modal-<s:property value='sreservationEntity.sorder'/>">
        <div class="md-content">
            <h3>未接受预约</h3>
            <div>
                <ul>
                    <li><strong>日期:</strong> <s:property value="treservationEntity.date"/></li>
                    <li><strong>时间:</strong> <s:property value="treservationEntity.time"/></li>
                    <li><strong>地点:</strong> <s:property value="treservationEntity.place"/></li>
                    <li><strong>主题:</strong> <s:property value="sreservationEntity.theme"/></li>
                    <li><strong>教师:</strong> <s:property value="usersEntity.name"/></li>
                    <li><strong>教师联系方式:</strong> <s:property value="usersEntity.contact"/></li>
                    <li><strong>教师学院:</strong> <s:property value="usersEntity.college"/></li>
                    <li><strong>教师邮箱:</strong> <s:property value="usersEntity.email"/></li>
                </ul>
                <div class="text-center">
                    <a class="md-close btn btn-default">确认</a>
                </div>
            </div>
        </div>
    </div>
</s:iterator>
<s:iterator value="refusedList">
    <div class="md-modal md-effect-1" id="modal-<s:property value='sreservationEntity.sorder'/>">
        <div class="md-content">
            <h3>已拒绝预约</h3>
            <div>
                <ul>
                    <li><strong>日期:</strong> <s:property value="treservationEntity.date"/></li>
                    <li><strong>时间:</strong> <s:property value="treservationEntity.time"/></li>
                    <li><strong>地点:</strong> <s:property value="treservationEntity.place"/></li>
                    <li><strong>主题:</strong> <s:property value="sreservationEntity.theme"/></li>
                    <li><strong>教师:</strong> <s:property value="usersEntity.name"/></li>
                    <li><strong>教师联系方式:</strong> <s:property value="usersEntity.contact"/></li>
                    <li><strong>教师学院:</strong> <s:property value="usersEntity.college"/></li>
                    <li><strong>教师邮箱:</strong> <s:property value="usersEntity.email"/></li>
                </ul>
                <div class="text-center">
                    <a class="md-close btn btn-default">确认</a>
                </div>
            </div>
        </div>
    </div>
</s:iterator>
<s:iterator value="judgedList">
    <div class="md-modal md-effect-1" id="modal-<s:property value='sreservationEntity.sorder'/>">
        <div class="md-content">
            <h3>已评分预约</h3>
            <div>
                <ul>
                    <li><strong>日期:</strong> <s:property value="treservationEntity.date"/></li>
                    <li><strong>时间:</strong> <s:property value="treservationEntity.time"/></li>
                    <li><strong>地点:</strong> <s:property value="treservationEntity.place"/></li>
                    <li><strong>主题:</strong> <s:property value="sreservationEntity.theme"/></li>
                    <li><strong>教师:</strong> <s:property value="usersEntity.name"/></li>
                    <li><strong>教师联系方式:</strong> <s:property value="usersEntity.contact"/></li>
                    <li><strong>教师学院:</strong> <s:property value="usersEntity.college"/></li>
                    <li><strong>教师邮箱:</strong> <s:property value="usersEntity.email"/></li>
                    <li><strong>评分:</strong> <s:property value="treservationEntity.Score"/></li>
                </ul>
                <div class="text-center">
                    <a class="md-close btn btn-default">确认</a>
                </div>
            </div>
        </div>
    </div>
</s:iterator>
<s:iterator value="unjudgedList">
    <div class="md-modal md-effect-1" id="modal-<s:property value='sreservationEntity.sorder'/>">
        <div class="md-content">
            <h3>未评分预约</h3>
            <div>
                <ul>
                    <li><strong>日期:</strong> <s:property value="treservationEntity.date"/></li>
                    <li><strong>时间:</strong> <s:property value="treservationEntity.time"/></li>
                    <li><strong>地点:</strong> <s:property value="treservationEntity.place"/></li>
                    <li><strong>主题:</strong> <s:property value="sreservationEntity.theme"/></li>
                    <li><strong>教师:</strong> <s:property value="usersEntity.name"/></li>
                    <li><strong>教师联系方式:</strong> <s:property value="usersEntity.contact"/></li>
                    <li><strong>教师学院:</strong> <s:property value="usersEntity.college"/></li>
                    <li><strong>教师邮箱:</strong> <s:property value="usersEntity.email"/></li>
                </ul>
                <div class="text-center">
                    <a class="md-close btn btn-default">确认</a>
                </div>
            </div>
        </div>
    </div>
</s:iterator>
<s:iterator value="followList">
    <div class="md-modal md-effect-1" id="modal-none-<s:property value='treservationEntity.sorder'/>">
        <div class="md-content">
            <h3>请求预约</h3>
            <ul>
                <li><strong>日期:</strong> <s:property value="treservationEntity.date"/></li>
                <li><strong>时间:</strong> <s:property value="treservationEntity.time"/></li>
                <li><strong>地点:</strong> <s:property value="treservationEntity.place"/></li>
                <li><strong>教师:</strong> <s:property value="usersEntity.name"/></li>
                <li><strong>教师联系方式:</strong> <s:property value="usersEntity.contact"/></li>
                <li><strong>教师学院:</strong> <s:property value="usersEntity.college"/></li>
                <li><strong>教师邮箱:</strong> <s:property value="usersEntity.email"/></li>
            </ul>
            <form action="requestAction" method="post">
                <div class="form-group">
                    <label for="confirm_username" class="control-label">预约主题：</label>
                    <input required class="form-control input" id="theme" type="text"
                           name="theme" maxlength="20">
                    <input type="text" name="torder" value="<s:property value='treservationEntity.torder'/>">
                </div>
                <div class="submit-block text-center">
                    <input type="submit" class="btn btn-default btn-lg edit" value="提交"/>
                    <a class="md-close btn btn-default btn-lg edit">取消</a>
                </div>
            </form>
        </div>
    </div>
</s:iterator>
<!--弹出框结束-->
<div class="container">
    <div class="row">
        <div class="col-lg-2 modal-content" id="left">
            <img src="static/image/yellow_people.jpg" class="img-responsive"><br/>
            <span>你好，${user.name} 同学</span><br/>
            <span id="id">${user.id}</span><br/>
            <s:if test="#session.user.sex==0">
                <span>女</span>
            </s:if>
            <s:else>
                <span>男</span>
            </s:else>
            <br/>
            <span>${user.college}</span><br/>
            <span>${user.email}</span><br/>
            <span>${user.contact}</span><br/>
            <a class="pull-left" href="LogoutAction">退出登录</a>
            <button class="pull-right btn btn-default md-trigger" data-modal="modal-edit">编辑</button>
        </div>
        <div class="col-lg-11 modal-content col-lg-offset-2">
            <br/><br/>
            <div class="col-lg-4 col-lg-offset-3 input-group">
                <form action="EnterRequest" method="post">
                    <input type="text" class="form-control input-lg" id="search_name" name="teacherId"/>
                </form>
            </div>
            <br/><br/>

            <div class="col-lg-9 col-lg-offset-1 modal-content" id="news">
                <s:iterator value="newList">
                    <s:if test="serservationEntity.Sstate==1">
                        <p>你请求的预约已经被<s:iterator value="users.name"/>同意，详情点击<a class="md-trigger" data-modal="modal-<s:property value='sreservationEntity.Sorder'/>">查看</a> </p>
                    </s:if>
                    <s:if test="serservationEntity.Sstate==3">
                        <p>你已完成的预约已经被<s:iterator value="users.name"/>评分为<s:property value='treservationEntity.Score'/>，详情点击<a class="md-trigger" data-modal="modal-<s:property value='sreservationEntity.Sorder'/>">查看</a> </p>
                    </s:if>
                    <s:if test="serservationEntity.Sstate==4">
                        <p>你请求的<s:iterator value="users.name"/>老师在<s:property value='treservationEntity.date'/><s:property value='treservationEntity.time'/> 的预约已经被拒绝，请继续努力！</p>
                    </s:if>
                </s:iterator>
            </div>
            <div id="requested">
                <table class="table table-striped table-hover">
                    <caption class="text-center">已请求预约</caption>
                    <thead style="display:block;border-bottom:1px solid #eee;">
                    <tr>
                        <th>日期</th>
                        <th>时间段</th>
                        <th>教师</th>
                        <th>地点</th>
                        <th>主题</th>
                        <th>操作</th>
                        <th>详情</th>
                    </tr>
                    </thead>
                    <tbody style="display:block; max-height:200px;overflow-y: scroll;">
                    <s:iterator value="confirmedList">
                        <tr>
                            <td><s:date name="treservationEntity.date" format="yyyy-MM-dd"/></td>
                            <td><s:property value="treservationEntity.time"/></td>
                            <td><a href="EnterDetail?visitId=<s:property value='usersEntity.id'/>" class="visit"
                                   target="_blank"><s:property value="usersEntity.name"/></a></td>
                            <td><s:property value="treservationEntity.place"/></td>
                            <td><s:property value="sreservationEntity.theme"/></td>
                            <td>
                                <button class="btn btn-default">请求取消预约</button>
                            </td>
                            <td>
                                <button class="md-trigger btn btn-default"
                                        data-modal="modal-<s:property value='sreservationEntity.sorder'/>">详情
                                </button>
                            </td>
                        </tr>
                    </s:iterator>
                    <s:iterator value="unconfirmedList">
                        <tr>
                            <td><s:date name="treservationEntity.date" format="yyyy-MM-dd"/></td>
                            <td><s:property value="treservationEntity.time"/></td>
                            <td><a href="EnterDetail?visitId=<s:property value='usersEntity.id'/>" class="visit"
                                   target="_blank"><s:property value="usersEntity.name"/></a></td>
                            <td><s:property value="treservationEntity.place"/></td>
                            <td><s:property value="sreservationEntity.theme"/></td>
                            <td>
                                未接受
                            </td>
                            <td>
                                <button class="md-trigger btn btn-default"
                                        data-modal="modal-<s:property value='sreservationEntity.sorder'/>">详情
                                </button>
                            </td>
                        </tr>
                    </s:iterator>
                    <s:iterator value="refusedList">
                        <tr>
                            <td><s:date name="treservationEntity.date" format="yyyy-MM-dd"/></td>
                            <td><s:property value="treservationEntity.time"/></td>
                            <td><a href="EnterDetail?visitId=<s:property value='usersEntity.id'/>" class="visit"
                                   target="_blank"><s:property value="usersEntity.name"/></a></td>
                            <td><s:property value="treservationEntity.place"/></td>
                            <td><s:property value="sreservationEntity.theme"/></td>
                            <td>
                                已拒绝
                            </td>
                            <td>
                                <button class="md-trigger btn btn-default"
                                        data-modal="modal-<s:property value='sreservationEntity.sorder'/>">详情
                                </button>
                            </td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
            </div>
            <div id="published">
                <table class="table table-striped table-hover">
                    <caption class="text-center">关注教师一周内发布预约</caption>
                    <thead style="display:block;border-bottom:1px solid #eee;">
                    <tr>
                        <th>日期</th>
                        <th>时间段</th>
                        <th>教师</th>
                        <th>地点</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody style="display:block; max-height:200px;overflow-y: scroll;">
                    <tr>
                        <td>2002-01-12</td>
                        <td>13:00-13:30</td>
                        <td>李四</td>
                        <td>综合楼</td>
                        <td><a class="btn btn-default" href="EnterRequest?teacherId=12">预约</a></td>
                    </tr>
                    <s:iterator value="followList">
                    <tr>
                        <td><s:property value="treservationEntity.date"/></td>
                        <td><s:property value="treservationEntity.time"/></td>
                        <td><s:property value="usersEntity.name"/></td>
                        <td><s:property value="treservationEntity.place"/></td>
                        <td><a class="btn btn-default md-trigger" data-modal="modal-none-<s:property value="treservationEntity.torder"/>">预约</a></td>
                    </tr>
                    </s:iterator>
                    </tbody>
                </table>
            </div>
            <div id="finished">
                <table class="table table-striped table-hover">
                    <caption class="text-center">已完成预约</caption>
                    <thead style="display:block;border-bottom:1px solid #eee;">
                    <tr>
                        <th>日期</th>
                        <th>时间段</th>
                        <th>教师</th>
                        <th>地点</th>
                        <th>主题</th>
                        <th>评分</th>
                    </tr>
                    </thead>
                    <tbody style="display:block; max-height:200px;overflow-y: scroll;">
                    <s:iterator value="judgedList">
                        <tr>
                            <td><s:date name="treservationEntity.date" format="yyyy-MM-dd"/></td>
                            <td><s:property value="treservationEntity.time"/></td>
                            <td><a href="EnterDetail?visitId=<s:property value='usersEntity.id'/>" class="visit"
                                   target="_blank"><s:property value="usersEntity.name"/></a></td>
                            <td><s:property value="treservationEntity.place"/></td>
                            <td><s:property value="sreservationEntity.theme"/></td>
                            <td>
                                <div class="br-wrapper br-theme-fontawesome-stars">
                                    <select class="example">
                                        <option value="1" data-html="未到">1</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                    </s:iterator>
                    <s:iterator value="unjudgedList">
                        <tr>
                            <td><s:date name="treservationEntity.date" format="yyyy-MM-dd"/></td>
                            <td><s:property value="treservationEntity.time"/></td>
                            <td><a href="EnterDetail?visitId=<s:property value='usersEntity.id'/>" class="visit"
                                   target="_blank"><s:property value="usersEntity.name"/></a></td>
                            <td><s:property value="treservationEntity.place"/></td>
                            <td><s:property value="sreservationEntity.theme"/></td>
                            <td>未评分</td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="md-overlay"></div>
<!--jquery bootstrap jquery-ui js文件引入-->
<script src="static/js/jquery-3.1.1.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/jquery-ui.min.js"></script>
<script src="static/js/modal.js"></script>
<!--自己的js-->
<script>

//    $(function(){
//        var names=[];
//        $("#search_name").keyup(function(){
//            if($(this).val()!=''){
//                $("#load_img").removeClass("hidden");
//                $.post("SearchAction",{
//                    name:$("#search_name").val()
//                },function(data,textStatus){
//                    for(var i in data.usersEntity){
//                        names.push(name);
//                    }
//                    $("#load_img").addClass("hidden");
//                })
//            }
//            else{
//                $("#load_img").addClass("hidden")
//            }
//        });
//
//        $("#segitarch_name").autocomplete(names,{
//            max:12,
//            minChars:0,
//            width:400,
//            scrollHeight:300,
//            matchContains:true,
//            autoFill:false,
//            formateItem:function(row,i,max){
//                return row.name+":"+row.college;
//            },
//            formateMatch:function(row,i,max){
//                return row.name;
//            },
//            formateResult:function(row,i,max){
//                return row;
//            }
//        }).result(function(row,i,n){
//            location.href = "RequestAction?id="+row.id;
//        });
//    });
    $(document).ready(function () {
        var _width = $('#requested').width();
        var req_table_th = $("#requested th");
        var req_table_td = $("#requested td");
        req_table_th.eq(0).width(_width * 0.1);
        req_table_td.eq(0).width(_width * 0.1);
        req_table_th.eq(1).width(_width * 0.1);
        req_table_td.eq(1).width(_width * 0.1);
        req_table_th.eq(2).width(_width * 0.08);
        req_table_td.eq(2).width(_width * 0.08);
        req_table_th.eq(3).width(_width * 0.2);
        req_table_td.eq(3).width(_width * 0.2);
        req_table_th.eq(4).width(_width * 0.25);
        req_table_td.eq(4).width(_width * 0.25);
        req_table_th.eq(5).width(_width * 0.1);
        req_table_td.eq(5).width(_width * 0.1);
        req_table_th.eq(6).width(_width * 0.12);
        req_table_td.eq(6).width(_width * 0.12);

        var pub_table_th = $("#published th");
        var pub_table_td = $("#published td");
        pub_table_td.eq(0).width(_width * 0.2);
        pub_table_th.eq(0).width(_width * 0.2);
        pub_table_td.eq(1).width(_width * 0.2);
        pub_table_th.eq(1).width(_width * 0.2);
        pub_table_td.eq(2).width(_width * 0.2);
        pub_table_th.eq(2).width(_width * 0.2);
        pub_table_td.eq(3).width(_width * 0.2);
        pub_table_th.eq(3).width(_width * 0.2);
        pub_table_td.eq(4).width(_width * 0.2);
        pub_table_th.eq(4).width(_width * 0.2);

        var fin_table_th = $("#finished th");
        var fin_table_td = $("#finished td");
        fin_table_td.eq(0).width(_width * 0.2);
        fin_table_th.eq(0).width(_width * 0.2);
        fin_table_td.eq(1).width(_width * 0.2);
        fin_table_th.eq(1).width(_width * 0.2);
        fin_table_td.eq(2).width(_width * 0.1);
        fin_table_th.eq(2).width(_width * 0.1);
        fin_table_td.eq(3).width(_width * 0.1);
        fin_table_th.eq(3).width(_width * 0.1);
        fin_table_td.eq(4).width(_width * 0.25);
        fin_table_th.eq(4).width(_width * 0.25);
        fin_table_td.eq(5).width(_width * 0.1);
        fin_table_th.eq(5).width(_width * 0.1);
        $(".visit").each(function () {
            var href = $(this).attr("href");
            $(this).attr("href", href + "&id=" + $("#id").html());
        });
    });
    $(function () {
        var data=[];
        $.ajax({
            async:false,
            type: "POST", //post请求
            url: "SearchAction", //请求action的URL
            dataType:"json",//返回类型
            success: function(result){ //回调函数
                datas=result.teacherList;
                for(i in datas){
                    var d=Object();
                    d.label=datas[i].name;
                    d.id=datas[i].id;
                    d.value=datas[i].name;
                    d.desc=datas[i].college;
                    data.push(d);
                }
            },
            error:function(){
                alert("无法连接到服务器")
            }
        });
        $("#search_name").autocomplete({
            source:data,
            minLength:0,
            focus:function (event,ui) {
                $("#search_name").val(ui.item.name)
            },
            select:function(event,ui){
                window.location.href="EnterRequest?teacherId="+ui.item.id;
            }
        }).data( "ui-autocomplete" )._renderItem = function( ul, item ) {
            return $( "<li>" )
                .append( "<div style='font-size: 20px;'><span>" + item.value + "</span><br/><span>学院：" + item.desc + "</span><div>" )
                .appendTo( ul );
        };
    })
</script>
</body>
</html>
