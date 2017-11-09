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
    <title>个人主页</title>

    <!--bootstrap 和 jquery,jquery-ui 引入-->
    <link href="static/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/main.css" type="text/css" rel="stylesheet">
    <link href="static/css/jquery-ui.min.css" type="text/css" rel="stylesheet">

    <!--nifty 动态弹出框引入-->
    <link rel="stylesheet" type="text/css" href="static/niftyModal/css/component.css"/>
    <script src="static/niftyModal/js/modernizr.custom.js"></script>

</head>
<body background="static/image/681662.jpg">
<!--弹出框-->
<div class="md-modal md-effect-1" id="modal-1">
    <div class="md-content">
        <h3>Modal Dialog</h3>
        <div>
            <p>This is a modal window. You can do the following things with it:</p>
            <ul>
                <li><strong>Read:</strong> modal windows will probably tell you something important so don't forget to
                    read what they say.
                </li>
                <li><strong>Look:</strong> a modal window enjoys a certain kind of attention; just look at it and
                    appreciate its presence.
                </li>
                <li><strong>Close:</strong> click on the button below to close the modal.</li>
            </ul>
            <button class="md-close btn btn-default">确认</button>
        </div>
    </div>
</div>
<div class="md-modal md-effect-2" id="modal-2">
    <div class="md-content">
        <h3>Modal Dialog</h3>
        <div>
            <p>This is a modal window. You can do the following things with it:</p>
            <ul>
                <li><strong>Read:</strong> modal windows will probably tell you something important so don't forget to
                    read what they say.
                </li>
                <li><strong>Look:</strong> a modal window enjoys a certain kind of attention; just look at it and
                    appreciate its presence.
                </li>
                <li><strong>Close:</strong> click on the button below to close the modal.</li>
            </ul>
            <button class="md-close btn btn-default">确认</button>
        </div>
    </div>
</div>
<div class="md-modal md-effect-1" id="modal-3">
    <div class="md-content">
        <h3>Modal Dialog</h3>
        <div>
            <p>This is a modal window. You can do the following things with it:</p>
            <ul>
                <li><strong>Read:</strong> modal windows will probably tell you something important so don't forget to
                    read what they say.
                </li>
                <li><strong>Look:</strong> a modal window enjoys a certain kind of attention; just look at it and
                    appreciate its presence.
                </li>
                <li><strong>Close:</strong> click on the button below to close the modal.</li>
            </ul>
            <button class="md-close btn btn-default">确认</button>
        </div>
    </div>
</div>
<div class="md-modal md-effect-1" id="modal-4">
    <div class="md-content">
        <h3>Modal Dialog</h3>
        <div>
            <p>This is a modal window. You can do the following things with it:</p>
            <ul>
                <li><strong>Read:</strong> modal windows will probably tell you something important so don't forget to
                    read what they say.
                </li>
                <li><strong>Look:</strong> a modal window enjoys a certain kind of attention; just look at it and
                    appreciate its presence.
                </li>
                <li><strong>Close:</strong> click on the button below to close the modal.</li>
            </ul>
            <button class="md-close btn btn-default">确认</button>
        </div>
    </div>
</div>
<div class="md-modal md-effect-1" id="modal-5">
    <div class="md-content">
        <h3>Modal Dialog</h3>
        <div>
            <p>This is a modal window. You can do the following things with it:</p>
            <ul>
                <li><strong>Read:</strong> modal windows will probably tell you something important so don't forget to
                    read what they say.
                </li>
                <li><strong>Look:</strong> a modal window enjoys a certain kind of attention; just look at it and
                    appreciate its presence.
                </li>
                <li><strong>Close:</strong> click on the button below to close the modal.</li>
            </ul>
            <button class="md-close btn btn-default">确认</button>
        </div>
    </div>
</div>
<!--弹出框结束-->
<div class="container">
    <div class="row">
        <div class="col-lg-2 modal-content" id="left">
            <img src="static/image/yellow_people.jpg" class="img-responsive"><br/>
            <span>你好，<s:property value="user.name"/></span><br/>
            <span><s:property value="user.id"/></span><br/>
            <s:if test="sex==0">
                <span>女</span>
            </s:if>
            <s:else>
                <span>男</span>
            </s:else>
            <br/>
            <span><s:property value="user.college"/></span><br/>
            <span><s:property value="user.email"/></span><br/>
            <span><s:property value="user.contact"/> </span><br/>
            <a class="pull-right" href="ModifyAction">编辑</a>
        </div>
        <div class="col-lg-11 modal-content col-lg-offset-2">
            <br/><br/>
            <a class="btn btn-success pull-right" href="publish_order.html">发布预约</a><br/><br/>
            <div class="col-lg-9 col-lg-offset-1 modal-content" id="news">

            </div>
            <div id="2">
                <table class="table table-striped table-hover">
                    <caption class="text-center">已经预约</caption>
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
                    <tbody style="display:block; max-height:200px;overflow-y: scroll;">
                    <tr>
                        <td>2002-01-12</td>
                        <td>13:00-13:30</td>
                        <td><a href="self_page.html" target="_blank">张三</a></td>
                        <td>已接受</td>
                        <td>综合楼</td>
                        <td>机器学习</td>
                        <td>
                            <button class="btn btn-default">接受</button>
                            <button class="btn btn-default">拒绝</button>
                        </td>
                        <td>
                            <button class="md-trigger btn btn-default" data-modal="modal-1">详情</button>
                        </td>
                    </tr>
                    <tr>
                        <td>2002-01-12</td>
                        <td>13:00-13:30</td>
                        <td>张三</td>
                        <td>已接受</td>
                        <td>综合楼</td>
                        <td>机器学习</td>
                        <td>
                            <button class="btn btn-default">接受</button>
                            <button class="btn btn-default">拒绝</button>
                        </td>
                        <td>
                            <button class="md-trigger btn btn-default" data-modal="modal-2">详情</button>
                        </td>
                    </tr>
                    <tr>
                        <td>2002-01-12</td>
                        <td>13:00-13:30</td>
                        <td>张三</td>
                        <td>已接受</td>
                        <td>综合楼</td>
                        <td>机器学习</td>
                        <td>
                            <button class="btn btn-default">拒绝</button>
                            <button class="btn btn-default">拒绝</button>
                        </td>
                        <td>
                            <button class="md-trigger btn btn-default" data-modal="modal-3">详情</button>
                        </td>
                    </tr>
                    <tr>
                        <td>2002-01-12</td>
                        <td>13:00-13:30</td>
                        <td>张三</td>
                        <td>已接受</td>
                        <td>综合楼</td>
                        <td>机器学习</td>
                        <td>
                            <button class="btn btn-default">接受</button>
                            <button class="btn btn-default">拒绝</button>
                        </td>
                        <td>
                            <button class="md-trigger btn btn-default" data-modal="modal-4">详情</button>
                        </td>
                    </tr>
                    <tr>
                        <td>2002-01-12</td>
                        <td>13:00-13:30</td>
                        <td>张三</td>
                        <td>已接受</td>
                        <td>综合楼</td>
                        <td>机器学习</td>
                        <td>
                            <button class="btn btn-default">拒绝</button>
                            <button class="btn btn-default">拒绝</button>
                        </td>
                        <td>
                            <button class="md-trigger btn btn-default" data-modal="modal-5">详情</button>
                        </td>
                    </tr>
                    <tr>
                        <td>2002-01-12</td>
                        <td>13:00-13:30</td>
                        <td>张三</td>
                        <td>已接受</td>
                        <td>综合楼</td>
                        <td>机器学习</td>
                        <td>
                            <button class="btn btn-default">接受</button>
                            <button class="btn btn-default">拒绝</button>
                        </td>
                        <td>
                            <button class="md-trigger btn btn-default" data-modal="modal-6">详情</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <table class="table table-striped table-hover">
                <caption align="center">已发布预约</caption>
                <thead>
                <tr>
                    <th>日期</th>
                    <th>时间段</th>
                    <th>教师</th>
                    <th>地点</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>2002-01-12</td>
                    <td>13:00-13:30</td>
                    <td>张三</td>
                    <td>综合楼</td>
                </tr>
                <tr>
                    <td>2002-01-12</td>
                    <td>13:00-13:30</td>
                    <td>张三</td>
                    <td>综合楼</td>
                </tr>
                <tr>
                    <td>2002-01-12</td>
                    <td>13:00-13:30</td>
                    <td>张三</td>
                    <td>综合楼</td>
                </tr>
                </tbody>
            </table>
            <table class="table table-striped table-hover">
                <caption align="center">已完成预约</caption>
                <thead>
                <tr>
                    <th>日期</th>
                    <th>时间段</th>
                    <th>教师</th>
                    <th>学生</th>
                    <th>地点</th>
                    <th>主题</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>2002-01-12</td>
                    <td>13:00-13:30</td>
                    <td>张三</td>
                    <td>李四</td>
                    <td>综合楼</td>
                    <td>机器学习</td>
                </tr>
                <tr>
                    <td>2002-01-12</td>
                    <td>13:00-13:30</td>
                    <td>张三</td>
                    <td>李四</td>
                    <td>综合楼</td>
                    <td>机器学习</td>
                </tr>
                <tr>
                    <td>2002-01-12</td>
                    <td>13:00-13:30</td>
                    <td>张三</td>
                    <td>李四</td>
                    <td>综合楼</td>
                    <td>机器学习</td>
                </tr>
                </tbody>
            </table>
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
        var _width = $('#2').width();
        var table_th = $("#2 th");
        var table_td = $("#2 td");
        table_th.eq(0).width(_width * 0.15);
        table_td.eq(0).width(_width * 0.15);
        table_th.eq(1).width(_width * 0.15);
        table_td.eq(1).width(_width * 0.15);
        table_th.eq(2).width(_width * 0.05);
        table_td.eq(2).width(_width * 0.05);
        table_th.eq(3).width(_width * 0.08);
        table_td.eq(3).width(_width * 0.08);
        table_th.eq(4).width(_width * 0.1);
        table_td.eq(4).width(_width * 0.1);
        table_th.eq(5).width(_width * 0.25);
        table_td.eq(5).width(_width * 0.25);
        table_th.eq(6).width(_width * 0.12);
        table_td.eq(6).width(_width * 0.12);
        table_th.eq(7).width(_width * 0.05);
        table_td.eq(7).width(_width * 0.05);
    })
</script>
</body>
</html>
