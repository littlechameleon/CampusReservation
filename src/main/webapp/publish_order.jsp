<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: giligiliai
  Date: 2017/11/9
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>发布预约</title>

    <link rel="shortcut icon" href="static/image/favicon.ico">

    <!--bootstrap 和 jquery,jquery-ui 引入-->
    <link href="static/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/main.css" type="text/css" rel="stylesheet">
    <link href="static/css/jquery-ui.min.css" type="text/css" rel="stylesheet">

    <!--nifty 动态弹出框引入-->
    <link rel="stylesheet" type="text/css" href="static/niftyModal/css/component.css" />
    <script src="static/niftyModal/js/modernizr.custom.js"></script>

    <!--临时css设置-->
</head>
<body>
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
<div class="md-modal md-effect-1" id="modal-1">
    <div class="md-content">
        <h3>确认取消预约</h3>
        <div class="text-center">
            <p>确认取消8:00-8:30预约？</p>
            <a class="btn btn-default" href="publish_order.html">确认</a>
            <a class="md-close btn btn-default">取消</a>
        </div>
    </div>
</div>
<div class="md-modal md-effect-1" id="modal-2">
    <div class="md-content">
        <h3>确认取消预约</h3>
        <div class="text-center">
            <p>确认取消8:30-9:00预约？</p>
            <a class="btn btn-default" href="publish_order.html">确认</a>
            <a class="md-close btn btn-default">取消</a>
        </div>
    </div>
</div>
<div class="md-modal md-effect-1" id="modal-3">
    <div class="md-content">
        <h3>确认取消预约</h3>
        <div class="text-center">
            <p>确认取消9:00-9:30预约？</p>
            <a class="btn btn-default" href="publish_order.html">确认</a>
            <a class="md-close btn btn-default">取消</a>
        </div>
    </div>
</div>
<div class="md-modal md-effect-1" id="modal-4">
    <div class="md-content">
        <h3>确认取消预约</h3>
        <div class="text-center">
            <p>确认取消9:30-10:00预约？</p>
            <a class="btn btn-default" href="publish_order.html">确认</a>
            <a class="md-close btn btn-default">取消</a>
        </div>
    </div>
</div>
<div class="md-modal md-effect-1" id="modal-23">
    <div class="md-content">
        <h3>确认取消预约</h3>
        <div class="text-center">
            <p>确认取消9:30-10:00预约？</p>
            <a class="btn btn-default" href="publish_order.html">确认</a>
            <a class="md-close btn btn-default">取消</a>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-lg-2 modal-content" id="left">
            <img src="static/image/yellow_people.jpg" class="img-responsive"><br/>
            <span>张三</span><br/>
            <span>1150310604</span><br/>
            <span>女</span><br/>
            <span>计算机科学与技术学院</span><br/>
            <span>1171163631@qq.com</span><br/>
            <span>155044661873</span><br/>
            <p>个人简介:</p>
            <span>力支持舰队开发地方看到看到房价肯定</span><br/><br/>
        </div>
        <div class="col-lg-11 modal-content col-lg-offset-2">
            <br/><br/>
            <div class="col-lg-4 col-lg-offset-3 input-group">
                <input type="date" class="form-control input-lg" value="<s:date format="yyyy-MM-dd" name='date'/>"/><span class="input-group-btn">
                <button class="btn btn-default" type="button" id="date_button">确认</button>
            </span>
            </div>
            <div id="published">
                <table class="table table-striped table-hover" >
                    <caption class="text-center">2017-9-9已经发布预约</caption>
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
                    <tr>
                        <td>8:00-8:30</td>
                        <td>未预约</td>
                        <td>综合楼</td>
                        <td>**</td>
                        <td>**</td>
                        <td>**</td>
                        <td><a class="md-trigger btn btn-default" data-modal="modal-1">取消预约</a></td>
                    </tr>
                    <tr>
                        <td>8:30-9:00</td>
                        <td>已预约</td>
                        <td>综合楼</td>
                        <td>李志琛</td>
                        <td>18845897065</td>
                        <td>机器学习</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>9:00-9:30</td>
                        <td>已完成</td>
                        <td>综合楼</td>
                        <td>李志琛</td>
                        <td>18845897065</td>
                        <td>机器学习</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>9:30-10:00</td>
                        <td>已拒绝</td>
                        <td>综合楼</td>
                        <td>李志琛</td>
                        <td>18845897065</td>
                        <td>机器学习</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>10:00-10:30</td>
                        <td>请求中</td>
                        <td>综合楼</td>
                        <td>李志琛</td>
                        <td>18845897065</td>
                        <td>机器学习</td>
                        <td><a href="#">同意</a> <a href="#">拒绝</a></td>
                    </tr>

                    </tbody>
                </table>
            </div>
            <div id="no_publish">
                <table class="table table-striped table-hover">
                    <caption class="text-center">2017-9-9未发布预约</caption>
                    <thead style="display: block;border-bottom:1px solid #eee;">
                    <tr>
                        <th>时间段</th>
                        <th>预约地点</th>
                        <th>预约</th>
                    </tr>
                    </thead>
                    <tbody style="display:block;overflow-y: scroll;" id="publish_table">
                    <tr>
                        <td>19:30-20:00</td>
                        <td><input type="text" class="form-control input"> </td>
                        <td><div class="checkbox">
                            <label>
                                <input type="checkbox" name="publish_items">
                            </label>
                        </div></td>
                    </tr>
                    <tr>
                        <td>19:30-20:00</td>
                        <td><input type="text" class="form-control input"> </td>
                        <td><div class="checkbox">
                            <label>
                                <input type="checkbox" name="publish_items">
                            </label>
                        </div></td>
                    </tr>
                    <tr>
                        <td>19:30-20:00</td>
                        <td><input type="text" class="form-control input"> </td>
                        <td><div class="checkbox">
                            <label>
                                <input type="checkbox" name="publish_items">
                            </label>
                        </div></td>
                    </tr>
                    <tr>
                        <td>19:30-20:00</td>
                        <td><input type="text" class="form-control input"> </td>
                        <td><div class="checkbox">
                            <label>
                                <input type="checkbox" name="publish_items">
                            </label>
                        </div></td>
                    </tr>
                    <tr>
                        <td>19:30-20:00</td>
                        <td><input type="text" class="form-control input"> </td>
                        <td><div class="checkbox">
                            <label>
                                <input type="checkbox" name="publish_items">
                            </label>
                        </div></td>
                    </tr>
                    <tr>
                        <td>19:30-20:00</td>
                        <td><input type="text" class="form-control input"> </td>
                        <td><div class="checkbox">
                            <label>
                                <input type="checkbox" name="publish_items">
                            </label>
                        </div></td>
                    </tr>
                    <tr>
                        <td>19:30-20:00</td>
                        <td><input type="text" class="form-control input"> </td>
                        <td><div class="checkbox">
                            <label>
                                <input type="checkbox" name="publish_items">
                            </label>
                        </div></td>
                    </tr>
                    </tbody>
                </table>
                <button class="btn btn-lg btn-primary pull-right md-trigger" data-modal="modal-0" id="publish">发布预约</button>
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
    var follow=true;
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
    });
    var order;
    $("#publish").click(function(){
        order=[];
        $("#publishing").empty();
        $('tr:has([name=publish_items]:checkbox:checked)').each(function(){
            var time=$(this).children().eq(0).html();
            var place=$(this).children().eq(1).children().val();
            order.push([time.split('-')[0],place]);
            var contain="<p>时间为："+time+"地点为："+place+"</p>";
            $("#publishing").append(contain);
        });
    });
    $("#confirm_submit").click(function(){
        $.post("#",{
            order:order
        },window.location.reload())
    });

</script>
</body>
</html>
