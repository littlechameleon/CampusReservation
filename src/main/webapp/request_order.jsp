<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: giligiliai
  Date: 2017/11/12
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>请求预约</title>
    <link rel="shortcut icon" href="static/image/favicon.ico">

    <link rel="stylesheet" type="text/css" href="static/css/css/font-awesome.min.css">
    <!--bootstrap 和 jquery,jquery-ui 引入-->
    <link href="static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/main.css" type="text/css" rel="stylesheet">
    <link href="static/css/jquery-ui.min.css" type="text/css" rel="stylesheet">

    <!--nifty 动态弹出框引入-->
    <link rel="stylesheet" type="text/css" href="static/css/component.css"/>

</head>
<body>
<%--modal--%>
<s:iterator value="list">
    <div class="md-modal md-effect-1" id="modal-<s:property value='torder'/>">
        <div class="md-content">
            <h3>确认预约</h3>
            <div class="text-center">
                <p></p>
                <a class="btn btn-default confirm_submit" href="RequestAction?torder=<s:property value='torder'/>">确认</a>
                <a class="md-close btn btn-default">取消</a>
            </div>
        </div>
    </div>
</s:iterator>
<%--end modal--%>
<div class="container">
    <div class="row">
        <div class="col-lg-2 modal-content" id="left">
            <img src="static/image/yellow_people.jpg" class="img-responsive"><br/>
            <span>你好，<s:property value="usersEntity.name"/></span><br/>
            <span id="teacherId"><s:property value="usersEntity.id"/></span><br/>
            <s:if test="sex==0">
                <span>女</span>
            </s:if>
            <s:else>
                <span>男</span>
            </s:else>
            <br/>
            <span><s:property value="usersEntity.college"/></span><br/>
            <span><s:property value="usersEntity.email"/></span><br/>
            <span><s:property value="usersEntity.contact"/> </span><br/>
            <div id="isFollow">
            <s:if test="isFollow!=1">
            <p id="follow" class="follow_type">关注<i class="fa fa-star-o fa-lg"></i></p>
            </s:if>
            <s:else>
            <p id="followed" class="follow_type">取消关注<i class="fa fa-star fa-lg"></i></p>
            </s:else>
            </div>
        </div>

        <div class="col-lg-11 modal-content col-lg-offset-2">
            <br/><br/>
            <p id="Msg"></p>
            <form action="EnterRequest" method="post">
                <div class="col-lg-4 col-lg-offset-3 input-group">
                    <input type="date" class="form-control input-lg" value="<s:date format='yyyy-MM-dd' name='date'/>" id="date" name="date"/>
                    <input type="text" class="hidden" value="<s:property value='usersEntity.id'/>" name="teacherId">
                    <span class="input-group-btn">
                        <button class="btn btn-default" id="date_button" type="submit">确认</button>
                    </span>
                </div>
            </form>
            <div id="2">
                <table class="table table-striped table-hover">
                    <caption class="text-center"><s:date format="yyyy-MM-dd" name='date'/></caption>
                    <thead style="display:block;border-bottom:1px solid #eee;">
                    <tr>
                        <th>时间段</th>
                        <th>预约状态</th>
                        <th>预约地点</th>
                        <th>预约主题</th>
                        <th>预约人</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody style="display:block;overflow-y: scroll;" id="request_table">
                    <s:iterator value="arrayList">
                        <s:if test="treservationEntity.tstate==1">
                            <tr>
                                <td><s:property value="treservationEntity.time"/></td>
                                <td>已预约</td>
                                <td><s:property value="treservationEntity.place"/></td>
                                <td><s:property value="sreservationEntity.theme"/></td>
                                <td><a href="EnterDetail?visitId=<s:property value='usersEntity.id'/>" class="visit" target="_blank"><s:property value="usersEntity.name"/></a></td>
                                <td><s:if test="#session.user.id==usersEntity.id">
                                    <%--<a class="btn btn-default md-trigger" data-modal="modal-<s:property value='treservation.torder'/>">取消预约</a>--%>
                                    你已预约
                                </s:if></td>
                            </tr>
                        </s:if>
                        <s:if test="treservationEntity.tstate==2">
                            <tr>
                                <td><s:property value="treservationEntity.time"/></td>
                                <td>已完成</td>
                                <td><s:property value="treservationEntity.place"/></td>
                                <td><s:property value="sreservationEntity.theme"/></td>
                                <td><a href="EnterDetail?visitId=<s:property value='usersEntity.id'/>" class="visit" target="_blank"><s:property value="usersEntity.name"/></a></td>
                                <td>评分：<s:property value="treservationEntity.score"/></td>
                            </tr>
                        </s:if>
                        <s:if test="treservationEntity.tstate==3">
                            <tr>
                                <td><s:property value="treservationEntity.time"/></td>
                                <td>已完成</td>
                                <td><s:property value="treservationEntity.place"/></td>
                                <td><s:property value="sreservationEntity.theme"/></td>
                                <td><a href="EnterDetail?visitId=<s:property value='usersEntity.id'/>" class="visit" target="_blank"><s:property value="usersEntity.name"/></a></td>
                                <td>教师未评分</td>
                            </tr>
                        </s:if>
                    </s:iterator>
                        <s:iterator value="list">
                            <s:if test="tstate==4">
                            <tr>
                                <td><s:property value="time"/></td>
                                <td>未预约</td>
                                <td><s:property value="place"/></td>
                                <td><input type="text" value="无主题" name="theme" class="input_request"></td>
                                <td></td>
                                <td><a class="btn btn-default md-trigger request" data-modal="modal-<s:property value='torder'/>">请求预约</a></td>
                            </tr>
                            </s:if>
                            <s:elseif test="tstate==0">
                                <tr>
                                    <td><s:property value="time"/></td>
                                    <td>正在预约</td>
                                    <td><s:property value="place"/></td>
                                    <td></td>
                                    <td></td>
                                    <td class="you_request" id="<s:property value='torder'/>">
                                        <a class="btn btn-default md-trigger request" data-modal="modal-<s:property value='torder'/>">请求预约</a>
                                    </td>
                                </tr>
                            </s:elseif>
                        </s:iterator>

                    </tbody>
                </table>
                <a class="btn btn-lg btn-primary pull-left" href="ReturnHomepage"><span class="glyphicon glyphicon-arrow-left"></span> 返回主页</a>
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

    $(document).ready(function () {
        var _width = $('#2').width();
        var table_th = $("#2 th");
        var table_td = $("#2 td");
        table_th.eq(0).width(_width * 0.1);
        table_td.eq(0).width(_width * 0.1);
        table_th.eq(1).width(_width * 0.1);
        table_td.eq(1).width(_width * 0.1);
        table_th.eq(2).width(_width * 0.2);
        table_td.eq(2).width(_width * 0.2);
        table_th.eq(3).width(_width * 0.25);
        table_td.eq(3).width(_width * 0.25);
        table_th.eq(4).width(_width * 0.15);
        table_td.eq(4).width(_width * 0.15);
        table_th.eq(5).width(_width * 0.1);
        table_td.eq(5).width(_width * 0.1);
    });
    $(function(){
        o_date = new Date($("#date").val().replace(/-/,"/"));
        date=new Date();
        date.setHours(0);
        date.setMinutes(0);
        date.setSeconds(0);
        if(o_date<date){
            $(".input_request").addClass("hidden");
            $(".request").addClass("hidden");
            $("#Msg").text("请提前一天进行预约")
        }

        $(".request").click(function(){
            var order=$(this).attr('data-modal');
            var time=$(this).parent().parent().children().eq(0).html();
            var theme=$(this).parent().parent().children().eq(3).children().eq(0).val();
            var date=$("#date").val();
            var teacherId=$("#teacherId").text();
            var href=$("#"+order+" .confirm_submit").attr("href");
            $("#"+order+" p").html("日期："+date+"时间："+time+"主题："+theme);
            $("#"+order+" .confirm_submit").attr("href",href+"&theme="+theme+"&date="+date+"&teacherId="+teacherId);
        });
        $(".visit").each(function(){
            var href=$(this).attr("href");
            $(this).attr("href",href+"&id="+$("#id").val());
        });
    });
    $(function () {
        var id=$("#teacherId").text();
        var follow_type;
        $(".follow_type").click(function () {
            if($(".follow_type").attr('id')=="follow"){
                follow_type=1;
            }
            else{
                follow_type=0;
            }
            alert(follow_type);
            $.ajax({
                url:"FollowAction",
                type:"POST",
                data:{"teacherId":id,"followType":follow_type},
                success:function () {
                    if(follow_type==0){
                        $("#followed").html('<p id="follow" class="follow_type">关注<i class="fa fa-star-o fa-lg"></i></p>');
                        alert("取消关注成功！");
                    }else{
                        $("#follow").html('<p id="followed" class="follow_type">取消关注<i class="fa fa-star fa-lg"></i></p>');
                        alert("关注成功！");
                    }
                },
                error:function () {
                    alert("无法连接到服务器！");
                }
            })
        })
    });
    $(function () {
        $(".you_request").each(function () {
            id = $(this).attr("id");
            the = $(this).children("a");
            $.ajax({
                async:false,
                url:"IsReservation",
                type:"POST",
                data:{"torder":id},
                success:function (e) {
                    if(e.reservation==false){
                        the.addClass("hidden");
                    }
                }
            })
        })
    })
</script>
</body>
</html>