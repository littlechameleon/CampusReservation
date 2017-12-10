<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: giligiliai
  Date: 2017/11/9
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>发布预约</title>

    <link rel="shortcut icon" href="static/image/favicon.ico">

    <!--bootstrap 和 jquery,jquery-ui 引入-->
    <link href="static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/main.css" type="text/css" rel="stylesheet">
    <link href="static/css/jquery-ui.min.css" type="text/css" rel="stylesheet">

    <!--nifty 动态弹出框引入-->
    <link rel="stylesheet" type="text/css" href="static/css/component.css" />

    <!--临时css设置-->
</head>
<body>
<%--modal--%>
<div class="md-modal md-effect-1" id="modal-0">
    <div class="md-content">
        <h3>确认发布预约</h3>
        <div class="text-center">
            <p>确认发布以下预约？</p>
            <div id="publishing">

            </div>
            <a class="btn btn-default" id="confirm_submit">确认</a>
            <a class="md-close btn btn-default">取消</a>
        </div>
    </div>
</div>
<%--end modal--%>
<div class="container">
    <div class="row">
        <div class="col-lg-2 modal-content" id="left">
            <img src="static/image/yellow_people.jpg" class="img-responsive"><br/>
            <span>你好，${user.name}</span><br/>
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
            <p>个人简介:</p>
            <span>${user.detail}</span><br/><br/>
            <span class="hidden" id="workplace">${user.workplace}</span>
        </div>
        <div class="col-lg-11 modal-content col-lg-offset-2">
            <br/><br/>
            <form action="ReleaseAction" method="post">
                <div class="col-lg-4 col-lg-offset-3 input-group">
                    <input type="date" class="form-control input-lg" value="<s:date format='yyyy-MM-dd' name='date'/>" id="date" name="date"/>
                    <span class="input-group-btn">
                        <button class="btn btn-default" id="date_button" type="submit">确认</button>
                    </span>
                </div>
            </form>
            <div id="published">
                <table class="table table-striped table-hover" >
                    <caption class="text-center"><s:date format="yyyy-MM-dd" name='date'/>已经发布预约</caption>
                    <thead style="display:block;border-bottom:1px solid #eee;">
                    <tr>
                        <th>时间段</th>
                        <th>预约状态</th>
                        <th>预约地点</th>
                        <th>学生姓名</th>
                        <th>学生联系方式</th>
                        <th>预约主题</th>
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
                                <td><a href="EnterDetail?visitId=<s:property value='usersEntity.id'/>" class="visit" target="_blank"><s:property value="usersEntity.name"/></a></td>
                                <td><s:property value="usersEneity.contact"/></td>
                                <td><s:property value="sreservationEntity.theme"/></td>
                                <td>无</td>
                            </tr>
                        </s:if>
                        <s:elseif test="treservationEntity.tstate==2">
                            <tr>
                                <td><s:property value="treservationEntity.time"/></td>
                                <td>未评分</td>
                                <td><s:property value="treservationEntity.place"/></td>
                                <td><a href="EnterDetail?visitId=<s:property value='usersEntity.id'/>" class="visit" target="_blank"><s:property value="usersEntity.name"/></a></td>
                                <td><s:property value="usersEneity.contact"/></td>
                                <td><s:property value="sreservationEntity.theme"/></td>
                                <td><div class="br-wrapper br-theme-fontawesome-stars">
                                    <select class="example">
                                        <option value="1" data-html="未到">1</option>
                                        <option value="2" data-html="迟到">2</option>
                                        <option value="3" data-html="准时">3</option>
                                        <option value="4" data-html="提前">4</option>
                                    </select>
                                </div></td>
                            </tr>
                        </s:elseif>
                        <s:elseif test="treservationEntity.tstate==3">
                            <tr>
                                <td><s:property value="treservationEntity.time"/></td>
                                <td>已评分</td>
                                <td><s:property value="treservationEntity.place"/></td>
                                <td><a href="EnterDetail?visitId=<s:property value='usersEntity.id'/>" class="visit" target="_blank"><s:property value="usersEntity.name"/></a></td>
                                <td><s:property value="usersEneity.contact"/></td>
                                <td><s:property value="sreservationEntity.theme"/></td>
                                <td>评分为：<s:property value="treservationEntity.score"/></td>
                            </tr>
                        </s:elseif>
                    </s:iterator>
                    <s:iterator value="list">
                        <s:if test="tstate==4">
                        <tr>
                            <td><s:property value="time"/></td>
                            <td>无人预约 </td>
                            <td><s:property value="place"/></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><a class="btn btn-default">取消预约</a></td>
                        </tr>
                        </s:if>
                        <s:elseif test="tstate==0">
                            <tr>
                                <td><s:property value="time"/></td>
                                <td>预约中</td>
                                <td><s:property value="place"/></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><a class="btn btn-default">取消预约</a></td>
                            </tr>
                        </s:elseif>
                    </s:iterator>
                    </tbody>
                </table>
            </div>
            <div id="no_publish">
                <table class="table table-striped table-hover">
                    <caption class="text-center"><s:date format="yyyy-MM-dd" name='date'/>未发布预约</caption>
                    <thead style="display: block;border-bottom:1px solid #eee;">
                    <tr>
                        <th>时间段</th>
                        <th>预约地点</th>
                        <th>预约</th>
                    </tr>
                    </thead>
                    <tbody style="display:block;overflow-y: scroll;max-height: 500px" id="publish_table">
                    </tbody>
                </table>
                <a class="btn btn-lg btn-primary pull-left" href="ReturnHomepage"><span class="glyphicon glyphicon-arrow-left"></span> 返回主页</a>
                <button class="btn btn-lg btn-primary pull-right md-trigger" data-modal="modal-0" id="publish">发布预约</button>
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
    $(function(){
        var times=["8:00:00","8:30:00","9:00:00","9:30:00","10:00:00","10:30:00","11:00:00","11:30:00","12:00:00",
            "12:30:00","13:00:00","13:30:00","14:00:00","14:30:00","15:00:00","15:30:00","16:00:00","16:30:00","17:00:00",
            "17:30:00","18:00:00","18:30:00","19:00:00","19:30:00","20:00:00"];
        var time=[];
        $("#published table tbody tr").each(function(){
            time.push($(this).children().eq(0).text());
        });
        var flag;
        var workplace=$("#workplace").text();
        for(var i=0;i<times.length;i++){
            flag=0;
            for(var j=0;j<time.length;j++){
                if(times[i]==time[j]){
                    flag=1;
                    break;
                }
            }
            if(flag==0){
                $("#publish_table").append("<tr><td>"+times[i]+"</td><td><input type='text' class='form-control input' value='"+workplace+"'> </td><td><div class='checkbox'><label><input type='checkbox' name='publish_items'></label></div></td></tr>")
            }

        }
    });
    $(document).ready(function(){
        $("#request_table").css("max-height",$(window).height()*0.6);

        var _width=$('#published').width();
        var published_th=$("#published th");
        var published_td=$("#published td");
        published_th.eq(0).width(_width*0.11);
        published_td.eq(0).width(_width*0.11);
        published_th.eq(1).width(_width*0.1);
        published_td.eq(1).width(_width*0.1);
        published_th.eq(2).width(_width*0.1);
        published_td.eq(2).width(_width*0.1);
        published_th.eq(3).width(_width*0.08);
        published_td.eq(3).width(_width*0.08);
        published_th.eq(4).width(_width*0.12);
        published_td.eq(4).width(_width*0.12);
        published_th.eq(5).width(_width*0.25);
        published_td.eq(5).width(_width*0.25);
        published_th.eq(6).width(_width*0.1);
        published_td.eq(6).width(_width*0.1);

        var no_publish_th=$("#no_publish th");
        var no_publish_td=$("#no_publish td");
        no_publish_td.eq(0).width(_width*0.3);
        no_publish_th.eq(0).width(_width*0.3);
        no_publish_td.eq(1).width(_width*0.5);
        no_publish_th.eq(1).width(_width*0.5);
        no_publish_td.eq(2).width(_width*0.2);
        no_publish_th.eq(2).width(_width*0.2);

        $(".visit").each(function(){
            var href=$(this).attr("href");
            $(this).attr("href",href+"&id="+$("#id").html());
        });
    });
    var order;
    $("#publish").click(function(){
        order=[];
        $("#publishing").empty();
        $('tr:has([name=publish_items]:checkbox:checked)').each(function(){
            var time=$(this).children().eq(0).html();
            var place=$(this).children().eq(1).children().val();
            if(place!=''){
                order.push([time,place]);
                var contain="<p>时间为："+time+"地点为："+place+"</p>";
                $("#publishing").append(contain);
            }
        });
    });
    $("#confirm_submit").click(function(){
        $.ajax({
            url:"ReleaseAction",
            type:"POST",
            data:{
                releaseList:order,
                date:$("#date").val(),
                id:$("#id").html()
            },
            traditional: true,
            success:function(){
                return window.location.reload()
            }
        });
    });

</script>
</body>
</html>
