<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 11873
  Date: 2017/11/6
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>教师个人主页</title>

    <link rel="shortcut icon" href="static/image/favicon.ico">

    <!--bootstrap 和 jquery,jquery-ui 引入-->
    <link href="static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/main.css" type="text/css" rel="stylesheet">
    <link href="static/css/jquery-ui.min.css" type="text/css" rel="stylesheet">

    <!--nifty 动态弹出框引入-->
    <link rel="stylesheet" type="text/css" href="static/css/component.css" />
    <style>
        .container{
            font-size: 20px;
        }
    </style>
</head>
<body>
<!--弹出框-->

<div class="md-modal md-effect-1" id="modal-edit">
    <div class="md-content">
        <div class="text-center">
            <h2>修改个人信息</h2>
        </div><br/><br/>
        <div class="center-block">
            <form action="ModifyAction" method="post">
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
                <div class="submit-block text-center">
                    <input type="submit" class="btn btn-default btn-lg edit" value="提交"/>
                    <a class="md-close btn btn-default btn-lg edit">取消</a>
                </div>
            </form>
        </div>
    </div>
</div>
<s:iterator value="unconfirmedList">
    <div class="md-modal md-effect-1" id="modal-<s:property value='sreservationEntity.sorder'/>">
        <div class="md-content">
            <h3>请求详情</h3>
            <div>
                <ul>
                    <li><strong>日期:</strong> <s:property value="treservationEntity.date"/> </li>
                    <li><strong>时间:</strong> <s:property value="treservationEntity.time"/></li>
                    <li><strong>地点:</strong> <s:property value="treservationEntity.place"/></li>
                    <li><strong>主题:</strong> <s:property value="sreservationEntity.theme"/></li>
                    <li><strong>学生:</strong> <s:property value="usersEntity.name"/></li>
                    <li><strong>学生联系方式:</strong> <s:property value="usersEntity.contact"/></li>
                    <li><strong>学生学院:</strong> <s:property value="usersEntity.college"/></li>
                    <li><strong>学生邮箱:</strong> <s:property value="usersEntity.email"/></li>
                </ul>
                <div class="text-center">
                    <a class="md-close btn btn-default">确认</a>
                </div>
            </div>
        </div>
    </div>
</s:iterator>
<s:iterator value="confirmedList">
    <div class="md-modal md-effect-1" id="modal-<s:property value='sreservationEntity.sorder'/>">
        <div class="md-content">
            <h3>已接受请求详情</h3>
            <div>
                <ul>
                    <li><strong>日期:</strong> <s:property value="treservationEntity.date"/> </li>
                    <li><strong>时间:</strong> <s:property value="treservationEntity.time"/></li>
                    <li><strong>地点:</strong> <s:property value="treservationEntity.place"/></li>
                    <li><strong>主题:</strong> <s:property value="sreservationEntity.theme"/></li>
                    <li><strong>学生:</strong> <s:property value="usersEntity.name"/></li>
                    <li><strong>学生联系方式:</strong> <s:property value="usersEntity.contact"/></li>
                    <li><strong>学生学院:</strong> <s:property value="usersEntity.college"/></li>
                    <li><strong>学生邮箱:</strong> <s:property value="usersEntity.email"/></li>
                </ul>
                <div class="text-center">
                    <a class="md-close btn btn-default">确认</a>
                </div>
            </div>
        </div>
    </div>
</s:iterator>
<!--弹出框结束-->
<div class="container">
    <div class="row">
        <div class="col-lg-2 modal-content" id="left">
            <img src="static/image/yellow_people.jpg" class="img-responsive"><br/>
            <span>你好，<s:property value="usersEntity.name"/></span><br/>
            <span id="id"><s:property value="usersEntity.id"/></span><br/>
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
            <a class="pull-left" href="LogoutAction?id=<s:property value='usersEntity.id'/>">退出登录</a>
            <a class="pull-right btn btn-default md-trigger" data-modal="modal-edit">编辑</a>
        </div>
        <div class="col-lg-11 modal-content col-lg-offset-2">
            <br/><br/>
            <a class="btn btn-success pull-right" href="EnterRelease?id=<s:property value="usersEntity.id"/>">发布预约</a><br/><br/>
            <div id="new_table">
                <table class="table table-striped table-hover" >
                    <caption class="text-center">最新消息</caption>
                    <thead style="display:block;border-bottom:1px solid #eee;">
                    <tr>
                        <th>日期</th>
                        <th>时间段</th>
                        <th>学生</th>
                        <th>状态</th>
                        <th>地点</th>
                        <th>主题</th>
                        <th>操作</th>
                        <th>详情</th>
                    </tr>
                    </thead>
                    <tbody style="display:block; max-height:400px;overflow-y: scroll;min-height: 100px;">
                    <s:iterator value="unconfirmedList">
                    <tr>
                        <td><s:date name="treservationEntity.date" format="yyyy-MM-dd"/> </td>
                        <td><s:property value="treservationEntity.time"/></td>
                        <td><a href="EnterDetail?visitId=<s:property value='usersEntity.id'/>" class="visit" target="_blank"><s:property value="usersEntity.name"/></a></td>
                        <td>未接受</td>
                        <td><s:property value="treservationEntity.place"/></td>
                        <td><s:property value="sreservationEntity.theme"/></td>
                        <td><a class="btn btn-default agree" href="AgreeRequest?sorder=<s:property value='sreservationEntity.sorder'/>">接受</a><button class="btn btn-default">拒绝</button></td>
                        <td><button class="md-trigger btn btn-default" data-modal="modal-<s:property value='sreservationEntity.sorder'/>">详情</button></td>
                    </tr>
                    </s:iterator>
                    </tbody>
                </table>
            </div>
            <div id="acc_table">
                <table class="table table-striped table-hover" >
                    <caption class="text-center">已接受预约</caption>
                    <thead style="display:block;border-bottom:1px solid #eee;">
                    <tr>
                        <th>日期</th>
                        <th>时间段</th>
                        <th>学生</th>
                        <th>状态</th>
                        <th>地点</th>
                        <th>主题</th>
                        <th>详情</th>
                    </tr>
                    </thead>
                    <tbody style="display:block; max-height:400px;overflow-y: scroll;min-height: 100px;">
                    <s:iterator value="confirmedList">
                    <tr>
                        <td><s:date name="treservationEntity.date" format="yyyy-MM-dd"/></td>
                        <td><s:property value="treservationEntity.time"/></td>
                        <td><s:property value="usersEntity.name"/></td>
                        <td>已接受</td>
                        <td><s:property value="treservationEntity.place"/> </td>
                        <td><s:property value="sreservationEntity.theme"/> </td>
                        <td><button class="md-trigger btn btn-default" data-modal="modal-<s:property value='sreservationEntity.sorder'/>">详情</button></td>
                    </tr>
                    </s:iterator>
                    </tbody>
                </table>
            </div>
            <div id="published_table">
                <table class="table table-striped table-hover" >
                    <caption class="text-center">未接受（已发布）预约</caption>
                    <thead style="display:block;border-bottom: 1px solid #eee">
                    <tr>
                        <th>日期</th>
                        <th>时间段</th>
                        <th>地点</th>
                        <th>取消预约</th>
                    </tr>
                    </thead>
                    <tbody style="display:block; max-height:400px;overflow-y: scroll;min-height: 100px;">
                    <s:iterator value="nullList">
                    <tr>
                        <td><s:date name="date" format="yyyy-MM-dd"/></td>
                        <td><s:property value="time"/> </td>
                        <td><s:property value="place"/> </td>
                        <td><a class="btn btn-default cancel" href="CancelRelease?torder=<s:property value='torder'/>">取消预约</a></td>
                    </tr>
                    </s:iterator>
                    </tbody>
                </table>
            </div>
            <div id="finished_table">
                <table class="table table-striped table-hover" >
                    <caption class="text-center">已完成预约</caption>
                    <thead style="display: block;border-bottom: 1px solid #eee">
                    <tr>
                        <th>日期</th>
                        <th>时间段</th>
                        <th>学生</th>
                        <th>地点</th>
                        <th>主题</th>
                        <th>评分</th>
                    </tr>
                    </thead>
                    <tbody style="display:block; max-height:400px;overflow-y: scroll;min-height: 100px;">
                    <s:iterator value="unjudgedList">
                        <tr>
                            <td><s:date name="treservationEntity.date" format="yyyy-MM-dd"/></td>
                            <td><s:property value="treservationEntity.time"/></td>
                            <td><s:property value="usersEntity.name"/></td>
                            <td><s:property value="treservationEntity.place"/> </td>
                            <td><s:property value="sreservationEntity.theme"/> </td>
                            <td><div class="br-wrapper br-theme-fontawesomeff-stars">
                                <select class="example">
                                    <option value="1" data-html="未到">1</option>
                                    <option value="2" data-html="迟到">2</option>
                                    <option value="3" data-html="准时">3</option>
                                    <option value="4" data-html="提前">4</option>
                                </select>
                            </div> </td>
                        </tr>
                    </s:iterator>
                    <s:iterator value="judgedList">
                        <tr>
                            <td><s:date name="treservationEntity.date" format="yyyy-MM-dd"/></td>
                            <td><s:property value="treservationEntity.time"/></td>
                            <td><s:property value="usersEntity.name"/></td>
                            <td><s:property value="treservationEntity.place"/> </td>
                            <td><s:property value="sreservationEntity.theme"/> </td>
                            <td><div class="br-wrapper br-theme-fontawesome-stars">
                                <select class="example">
                                    <option value="1" data-html="未到">1</option>
                                </select>
                            </div> </td>
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
<script src="static/js/jquery.barrating.min.js"></script>
<script src="static/js/modal.js"></script>

<!--自己的js-->
<script>
    $(document).ready(function(){
        var _width=$('#new_table').width();
        var new_table_th=$("#new_table th");
        var new_table_td=$("#new_table td");
        new_table_th.eq(0).width(_width*0.15);
        new_table_td.eq(0).width(_width*0.15);
        new_table_th.eq(1).width(_width*0.15);
        new_table_td.eq(1).width(_width*0.15);
        new_table_th.eq(2).width(_width*0.05);
        new_table_td.eq(2).width(_width*0.05);
        new_table_th.eq(3).width(_width*0.08);
        new_table_td.eq(3).width(_width*0.08);
        new_table_th.eq(4).width(_width*0.1);
        new_table_td.eq(4).width(_width*0.1);
        new_table_th.eq(5).width(_width*0.25);
        new_table_td.eq(5).width(_width*0.25);
        new_table_th.eq(6).width(_width*0.12);
        new_table_td.eq(6).width(_width*0.12);
        new_table_th.eq(7).width(_width*0.05);
        new_table_td.eq(7).width(_width*0.05);

        var acc_table_th=$("#acc_table th");
        var acc_table_td=$("#acc_table td");
        acc_table_td.eq(0).width(_width*0.15);
        acc_table_th.eq(0).width(_width*0.15);
        acc_table_td.eq(1).width(_width*0.15);
        acc_table_th.eq(1).width(_width*0.15);
        acc_table_td.eq(2).width(_width*0.1);
        acc_table_th.eq(2).width(_width*0.1);
        acc_table_td.eq(3).width(_width*0.08);
        acc_table_th.eq(3).width(_width*0.08);
        acc_table_td.eq(4).width(_width*0.1);
        acc_table_th.eq(4).width(_width*0.1);
        acc_table_td.eq(5).width(_width*0.2);
        acc_table_th.eq(5).width(_width*0.2);
        acc_table_td.eq(6).width(_width*0.12);
        acc_table_th.eq(6).width(_width*0.12);


        var pub_table_th=$("#published_table th");
        var pub_table_td=$("#published_table td");
        pub_table_td.eq(0).width(_width*0.2);
        pub_table_th.eq(0).width(_width*0.2);
        pub_table_td.eq(1).width(_width*0.2);
        pub_table_th.eq(1).width(_width*0.2);
        pub_table_td.eq(2).width(_width*0.3);
        pub_table_th.eq(2).width(_width*0.3);
        pub_table_td.eq(3).width(_width*0.3);
        pub_table_th.eq(3).width(_width*0.3);

        var fin_table_th=$("#finished_table th");
        var fin_table_td=$("#finished_table td");
        fin_table_td.eq(0).width(_width*0.15);
        fin_table_th.eq(0).width(_width*0.15);
        fin_table_td.eq(1).width(_width*0.15);
        fin_table_th.eq(1).width(_width*0.15);
        fin_table_td.eq(2).width(_width*0.08);
        fin_table_th.eq(2).width(_width*0.08);
        fin_table_td.eq(3).width(_width*0.1);
        fin_table_th.eq(3).width(_width*0.1);
        fin_table_td.eq(4).width(_width*0.2);
        fin_table_th.eq(4).width(_width*0.2);
        fin_table_td.eq(5).width(_width*0.27);
        fin_table_th.eq(5).width(_width*0.27);

        $('.example').barrating({
            theme: 'bootstrap-stars',
            showValues:true,
            initialRating:4
        });

        $(".agree").each(function(){
                var href=$(this).attr("href");
                $(this).attr("href",href+"&id="+$("#id").html());
            }
        );
        $(".cancel").each(function(){
            var href=$(this).attr("href");
            $(this).attr("href",href+"&id="+$("#id").html());
        });
        $(".visit").each(function(){
            var href=$(this).attr("href");
            $(this).attr("href",href+"&id="+$("#id").html());
        });
    });
</script>
</body>
</html>