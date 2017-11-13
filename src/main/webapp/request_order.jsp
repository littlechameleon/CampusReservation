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

    <!--bootstrap 和 jquery,jquery-ui 引入-->
    <link href="static/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/main.css" type="text/css" rel="stylesheet">
    <link href="static/css/jquery-ui.min.css" type="text/css" rel="stylesheet">

    <!--nifty 动态弹出框引入-->
    <link rel="stylesheet" type="text/css" href="static/niftyModal/css/component.css"/>
    <script src="static/niftyModal/js/modernizr.custom.js"></script>

</head>
<body>
<%--modal--%>
<div class="md-modal md-effect-1" id="modal-1">
    <div class="md-content">
        <h3>确认请求预约</h3>
        <div class="text-center">
            <p>dfd1</p>
            <a class="btn btn-default confirm_submit">确认</a>
            <a class="md-close btn btn-default">取消</a>
        </div>
    </div>
</div>
<s:iterator value="arrayList">
    <s:if test="treservationEntity.tstate==4">
    <div class="md-modal md-effect-1" id="modal-<s:property value='treservation.torder'/>">
    <div class="md-content">
        <h3>确认请求预约</h3>
        <div class="text-center">
            <p></p>
            <a class="btn btn-default confirm_submit">确认</a>
            <a class="md-close btn btn-default">取消</a>
        </div>
    </div>
</div>
</s:if>
    <s:elseif test="treservationEntity.tstate==0&&id==usersEntity.id">
        <div class="md-modal md-effect-1" id="modal-1">
            <div class="md-content">
                <h3>确认取消预约</h3>
                <div class="text-center">
                    <p></p>
                    <a class="btn btn-default" href="request_order.html">确认</a>
                    <a class="md-close btn btn-default">取消</a>
                </div>
            </div>
        </div>
    </s:elseif>
</s:iterator>

<%--end modal--%>
<div class="container">
    <div class="row">
        <div class="col-lg-2 modal-content" id="left">
            <img src="static/image/yellow_people.jpg" class="img-responsive"><br/>
            <span>你好，<s:property value="usersEntity.name"/></span><br/>
            <span><s:property value="usersEntity.id"/></span><br/>
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
            <p id="follow">关注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
                    class="glyphicon glyphicon-star-empty"></span></p>
            <p id="followed">取消关注 <span class="glyphicon glyphicon-star"></span></p>
        </div>

        <div class="col-lg-11 modal-content col-lg-offset-2">
            <br/><br/>
            <form action="RequestAction" method="post">
                <div class="col-lg-4 col-lg-offset-3 input-group">
                    <input type="date" class="form-control input-lg" value="<s:date format='yyyy-MM-dd' name='date'/>" id="date" name="date"/>
                    <input type="text" class="hidden" value="<s:property value='usersEntity.id'/>" name="teacherId" id="teacherId">
                    <input type="text" class="hidden" value="<s:property value='id'/>" name="id" id="id">
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
                        <s:if test="treservationEntity.tstate==4">
                            <tr>
                                <td><s:property value="treservationEntity.time"/></td>
                                <td>未预约</td>
                                <td><s:property value="treservationEntity.place"/></td>
                                <td></td>
                                <td><input type="text" value="无主题" name="theme"></td>
                                <td><a class="btn btn-default md-trigger request" data-modal="modal-<s:property value='treservation.torder'/>">请求预约</a></td>
                            </tr>
                        </s:if>
                        <s:elseif test="treservationEntity.tstate==1">
                            <tr>
                                <td><s:property value="treservationEntity.time"/></td>
                                <td>已预约</td>
                                <td><s:property value="treservationEntity.place"/></td>
                                <td><s:property value="sreservationEntity.theme"/></td>
                                <td><a href="EnterDetail?id=<s:property value='usersEntity.id'/>"><s:property value="usersEntity.name"/></a></td>

                                <td><s:if test="#id==userEntity.id"><a class="btn btn-default md-trigger" data-modal="modal-<s:property value='treservation.torder'/>">取消预约</a></s:if></td>
                            </tr>
                        </s:elseif>
                    </s:iterator>
                    </tbody>
                </table>
                <a class="btn btn-lg btn-primary pull-left" href="ReturnHomepage?id=<s:property value='id'/> "><span class="glyphicon glyphicon-arrow-left"></span> 返回主页</a>
            </div>
        </div>
    </div>
</div>
<div class="md-overlay"></div>
<!--jquery bootstrap jquery-ui js文件引入-->
<script src="static/js/jquery-3.1.1.min.js"></script>
<script src="static/bootstrap/js/bootstrap.min.js"></script>
<script src="static/js/jquery-ui.min.js"></script>
<!--niftyModal js文件引入及必要操作-->
<script src="static/niftyModal/js/classie.js"></script>
<script src="static/niftyModal/js/modalEffects.js"></script>
<script>
    var polyfilter_scriptpath = '/js/';
</script>
<script src="static/niftyModal/js/css-filters-polyfill.js"></script>
<!--自己的js-->
<script>
    $(document).ready(function () {
//        var follow = true;
//        $("#follow").toggleClass("hidden");
//        $("#followed").toggleClass("hidden");

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
        $(".request").click(function(){
            var order=$(this).attr('data-modal');
            var time=$(this).parent().parent().children().eq(0).html();
            var theme=$(this).parent().parent().children().eq(3).children().eq(0).val();
            var date=$("#date").val();
            var id=$("#id").val();
            var teacherId=$("#teacherId").val();
            $("#"+order+" p").html("时间是："+time+"主题是："+theme);
            $("#"+order+" .confirm_submit").attr("href","RequestAction?theme="+theme+"&date="+date+"&id="+id+"&teacherId="+teacherId+"&time="+time);
        });
    });

</script>
</body>
</html>