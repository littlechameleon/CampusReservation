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
    <link href="static/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/main.css" type="text/css" rel="stylesheet">
    <link href="static/css/jquery-ui.min.css" type="text/css" rel="stylesheet">

    <!--nifty 动态弹出框引入-->
    <link rel="stylesheet" type="text/css" href="static/niftyModal/css/component.css"/>
    <script src="static/niftyModal/js/modernizr.custom.js"></script>

</head>
<body>
<!--弹出框-->
<s:iterator value="confirmedList">
    <div class="md-modal md-effect-1" id="modal-<s:property value='sreservationEntity.sorder'/>">
        <div class="md-content">
            <h3>已接受预约</h3>
            <div>
                <ul>
                    <ul>
                        <li><strong>日期:</strong> <s:property value="treservationEntity.date"/> </li>
                        <li><strong>时间:</strong> <s:property value="treservationEntity.time"/></li>
                        <li><strong>地点:</strong> <s:property value="treservationEntity.place"/></li>
                        <li><strong>主题:</strong> <s:property value="sreservationEntity.theme"/></li>
                        <li><strong>教师:</strong> <s:property value="usersEntity.name"/></li>
                        <li><strong>教师联系方式:</strong> <s:property value="usersEntity.contact"/></li>
                        <li><strong>教师学院:</strong> <s:property value="usersEntity.college"/></li>
                        <li><strong>教师邮箱:</strong> <s:property value="usersEntity.email"/></li>
                    </ul>
                </ul>
                <button class="md-close btn btn-default">确认</button>
            </div>
        </div>
    </div>
</s:iterator>
<s:iterator value="unconfirmedList">
    <div class="md-modal md-effect-1" id="modal-<s:property value='sreservationEntity.sorder'/>">
        <div class="md-content">
            <h3>已接受预约</h3>
            <div>
                <ul>
                    <ul>
                        <li><strong>日期:</strong> <s:property value="treservationEntity.date"/> </li>
                        <li><strong>时间:</strong> <s:property value="treservationEntity.time"/></li>
                        <li><strong>地点:</strong> <s:property value="treservationEntity.place"/></li>
                        <li><strong>主题:</strong> <s:property value="sreservationEntity.theme"/></li>
                        <li><strong>教师:</strong> <s:property value="usersEntity.name"/></li>
                        <li><strong>教师联系方式:</strong> <s:property value="usersEntity.contact"/></li>
                        <li><strong>教师学院:</strong> <s:property value="usersEntity.college"/></li>
                        <li><strong>教师邮箱:</strong> <s:property value="usersEntity.email"/></li>
                    </ul>
                </ul>
                <button class="md-close btn btn-default">确认</button>
            </div>
        </div>
    </div>
</s:iterator>
<s:iterator value="refusedList">
    <div class="md-modal md-effect-1" id="modal-<s:property value='sreservationEntity.sorder'/>">
        <div class="md-content">
            <h3>已接受预约</h3>
            <div>
                <ul>
                    <ul>
                        <li><strong>日期:</strong> <s:property value="treservationEntity.date"/> </li>
                        <li><strong>时间:</strong> <s:property value="treservationEntity.time"/></li>
                        <li><strong>地点:</strong> <s:property value="treservationEntity.place"/></li>
                        <li><strong>主题:</strong> <s:property value="sreservationEntity.theme"/></li>
                        <li><strong>教师:</strong> <s:property value="usersEntity.name"/></li>
                        <li><strong>教师联系方式:</strong> <s:property value="usersEntity.contact"/></li>
                        <li><strong>教师学院:</strong> <s:property value="usersEntity.college"/></li>
                        <li><strong>教师邮箱:</strong> <s:property value="usersEntity.email"/></li>
                    </ul>
                </ul>
                <button class="md-close btn btn-default">确认</button>
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
            <a class="pull-right" href="EditAction?id=<s:property value='usersEntity.id'/>">编辑</a>
        </div>
        <div class="col-lg-11 modal-content col-lg-offset-2">
            <br/><br/>
            <div class="col-lg-4 col-lg-offset-3 input-group">
                <form action="EnterRequest">
                <input type="text" class="form-control input-lg" id="search_name" name="teacherId"/>
                    <input type="text" class="hidden" name="id" value="<s:property value="usersEntity.id"/> ">
                    <input type="submit" class="hidden">
            </form>
            </div>                <br/><br/>

            <div class="col-lg-9 col-lg-offset-1 modal-content" id="news">

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
                            <td><s:date name="treservationEntity.date" format="yyyy-MM-dd"/> </td>
                            <td><s:property value="treservationEntity.time"/></td>
                            <td><a href="EnterDetail?visitId=<s:property value='usersEntity.id'/>" class="visit" target="_blank"><s:property value="usersEntity.name"/></a></td>
                            <td><s:property value="treservationEntity.place"/> </td>
                            <td><s:property value="sreservationEntity.theme"/> </td>
                            <td>
                                <button class="btn btn-default">请求取消预约</button>
                            </td>
                            <td>
                                <button class="md-trigger btn btn-default" data-modal="modal-<s:property value='sreservationEntity.sorder'/>">详情</button>
                            </td>
                        </tr>
                    </s:iterator>
                    <s:iterator value="unconfirmedList">
                        <tr>
                            <td><s:date name="treservationEntity.date" format="yyyy-MM-dd"/> </td>
                            <td><s:property value="treservationEntity.time"/></td>
                            <td><a href="EnterDetail?visitId=<s:property value='usersEntity.id'/>" class="visit" target="_blank"><s:property value="usersEntity.name"/></a></td>
                            <td><s:property value="treservationEntity.place"/> </td>
                            <td><s:property value="sreservationEntity.theme"/> </td>
                            <td>
                                未接受
                            </td>
                            <td>
                                <button class="md-trigger btn btn-default" data-modal="modal-<s:property value='sreservationEntity.sorder'/>">详情</button>
                            </td>
                        </tr>
                    </s:iterator>
                    <s:iterator value="refusedList">
                        <tr>
                            <td><s:date name="treservationEntity.date" format="yyyy-MM-dd"/> </td>
                            <td><s:property value="treservationEntity.time"/></td>
                            <td><a href="EnterDetail?visitId=<s:property value='usersEntity.id'/>" class="visit" target="_blank"><s:property value="usersEntity.name"/></a></td>
                            <td><s:property value="treservationEntity.place"/> </td>
                            <td><s:property value="sreservationEntity.theme"/> </td>
                            <td>
                                已拒绝
                            </td>
                            <td>
                                <button class="md-trigger btn btn-default" data-modal="modal-<s:property value='sreservationEntity.sorder'/>">详情</button>
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
                    <td><a class="btn btn-default" href="EnterRequest?id=1&teacherId=12">预约</a></td>
                </tr>
                <tr>
                    <td>2002-01-12</td>
                    <td>13:00-13:30</td>
                    <td>李四</td>
                    <td>综合楼</td>
                    <td><a class="btn btn-default" href="EnterRequest?id=1&teacherId=12">预约</a></td>
                </tr>
                <tr>
                    <td>2002-01-12</td>
                    <td>13:00-13:30</td>
                    <td>李四</td>
                    <td>综合楼</td>
                    <td><a class="btn btn-default" href="EnterRequest?id=1&teacherId=12">预约</a></td>
                </tr>
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
                <tr>
                    <td>2002-01-12</td>
                    <td>13:00-13:30</td>
                    <td>张三</td>
                    <td>综合楼</td>
                    <td>机器学习</td>
                    <td>未评分</td>
                </tr>
                <tr>
                    <td>2002-01-12</td>
                    <td>13:00-13:30</td>
                    <td>李四</td>
                    <td>综合楼</td>
                    <td>机器学习</td>
                    <td>1</td>
                </tr>
                <s:iterator value="judgedList">
                    <tr>
                        <td><s:date name="treservationEntity.date" format="yyyy-MM-dd"/></td>
                        <td><s:property value="treservationEntity.time"/></td>
                        <td><a href="EnterDetail?visitId=<s:property value='usersEntity.id'/>" class="visit" target="_blank"><s:property value="usersEntity.name"/></a></td>
                        <td><s:property value="treservationEntity.place"/> </td>
                        <td><s:property value="sreservationEntity.theme"/> </td>
                        <td><div class="br-wrapper br-theme-fontawesome-stars">
                            <select class="example">
                                <option value="1" data-html="未到">1</option>
                            </select>
                        </div> </td>
                    </tr>
                </s:iterator>
                <s:iterator value="unjudgedList">
                    <tr>
                        <td><s:date name="treservationEntity.date" format="yyyy-MM-dd"/></td>
                        <td><s:property value="treservationEntity.time"/></td>
                        <td><a href="EnterDetail?visitId=<s:property value='usersEntity.id'/>" class="visit" target="_blank"><s:property value="usersEntity.name"/></a></td>
                        <td><s:property value="treservationEntity.place"/> </td>
                        <td><s:property value="sreservationEntity.theme"/> </td>
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
//        $("#search_name").autocomplete(names,{
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
        req_table_th.eq(0).width(_width * 0.15);
        req_table_td.eq(0).width(_width * 0.15);
        req_table_th.eq(1).width(_width * 0.15);
        req_table_td.eq(1).width(_width * 0.15);
        req_table_th.eq(2).width(_width * 0.05);
        req_table_td.eq(2).width(_width * 0.05);
        req_table_th.eq(3).width(_width * 0.08);
        req_table_td.eq(3).width(_width * 0.08);
        req_table_th.eq(4).width(_width * 0.25);
        req_table_td.eq(4).width(_width * 0.25);
        req_table_th.eq(5).width(_width * 0.1);
        req_table_td.eq(5).width(_width * 0.1);
        req_table_th.eq(6).width(_width * 0.12);
        req_table_td.eq(6).width(_width * 0.12);
        
        var pub_table_th=$("#published th");
        var pub_table_td=$("#published td");
        pub_table_td.eq(0).width(_width*0.2);
        pub_table_th.eq(0).width(_width*0.2);
        pub_table_td.eq(1).width(_width*0.2);
        pub_table_th.eq(1).width(_width*0.2);
        pub_table_td.eq(2).width(_width*0.2);
        pub_table_th.eq(2).width(_width*0.2);
        pub_table_td.eq(3).width(_width*0.2);
        pub_table_th.eq(3).width(_width*0.2);
        pub_table_td.eq(4).width(_width*0.2);
        pub_table_th.eq(4).width(_width*0.2);

        var fin_table_th=$("#finished th");
        var fin_table_td=$("#finished td");
        fin_table_td.eq(0).width(_width*0.2);
        fin_table_th.eq(0).width(_width*0.2);
        fin_table_td.eq(1).width(_width*0.2);
        fin_table_th.eq(1).width(_width*0.2);
        fin_table_td.eq(2).width(_width*0.1);
        fin_table_th.eq(2).width(_width*0.1);
        fin_table_td.eq(3).width(_width*0.1);
        fin_table_th.eq(3).width(_width*0.1);
        fin_table_td.eq(4).width(_width*0.25);
        fin_table_th.eq(4).width(_width*0.25);
        fin_table_td.eq(5).width(_width*0.1);
        fin_table_th.eq(5).width(_width*0.1);
        $(".visit").each(function(){
            var href=$(this).attr("href");
            $(this).attr("href",href+"&id="+$("#id").html());
        });
    })
</script>
</body>
</html>
