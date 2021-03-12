<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 陈小心
  Date: 2021/3/4
  Time: 上午 09:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8" />
    <title>Musik | Web Application</title>
    <%@include file="common/head.jsp"%>
    <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link rel="stylesheet" href="js/jPlayer/jplayer.flat.css" type="text/css" />
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="css/animate.css" type="text/css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
    <link rel="stylesheet" href="css/simple-line-icons.css" type="text/css" />
    <link rel="stylesheet" href="css/font.css" type="text/css" />
    <link rel="stylesheet" href="css/app.css" type="text/css" />
    <!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js"></script>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/excanvas.js"></script>
    <![endif]-->
</head>
<body class="">

<section class="vbox">
    <%-- 引入头部页面 --%>
    <%@ include file="common/header.jsp" %>
    <section>
        <section class="hbox stretch">
            <!-- .aside -->
            <%-- 引入侧栏页面 --%>
            <%@ include file="common/aside.jsp" %>
            <!-- /.aside -->
            <section id="content">
                <section class="vbox">
                    <section class="w-f-md" id="bjax-target">
                        <section class="hbox stretch">
                            <!-- side content -->
                            <aside class="aside bg-light dk" id="sidebar">
                                <section class="vbox animated fadeInUp">
                                    <section class="scrollable hover">
                                        <div class="list-group no-radius no-border no-bg m-t-n-xxs m-b-none auto" >

                                            <a onclick="setSelected(this)" href="${pageContext.request.contextPath}/singer/findAll.do" class="list-group-item active">
                                                所有
                                            </a>
                                            <div id="classify_select">
                                            <c:forEach items="${classifies}" var="classify">
                                            <a onclick="setSelected(this)" href="${pageContext.request.contextPath}/singer/findAll.do?classify_id=${classify.classify_id}" class="list-group-item ">
                                                ${classify.classify_name}
                                            </a>
                                            </c:forEach>
                                            </div>

                                            <div  class="list-group-item ">

                                            </div>
                                            <div  class="list-group-item ">
                                                地区
                                            </div>
                                            <div id="region_select">
                                            <c:forEach items="${regions}" var="region">
                                                <a  onclick="setSelected(this)" href="${pageContext.request.contextPath}/singer/findAll.do?region_id=${region.region_id}" class="list-group-item ">
                                                        ${region.region_name}
                                                </a>
                                            </c:forEach>
                                        </div>


                                    </section>
                                </section>
                            </aside>
                            <!-- / side content -->
                            <section>
                                <section class="vbox">
                                    <section class="scrollable padder-lg">
                                        <h2 class="font-thin m-b" id="classify_text"></h2>
                                        <div class="row row-sm">
                                            <%-- 遍历所有歌手 --%>
                                            <c:forEach items="${singers}" var="singer">
                                            <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                                <div class="item">
                                                    <div class="pos-rlt">
                                                        <div class="item-overlay opacity r r-2x bg-black">
                                                            <div class="center text-center m-t-n">
                                                                <a href="#"><i class="fa fa-play-circle i-2x"></i></a>
                                                            </div>
                                                        </div>
                                                        <a href="track-detail.html"><img src="${singer.singer_imgUrl}" alt="加载出错" class="r r-2x img-full"></a>
                                                    </div>
                                                    <div class="padder-v">
                                                        <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${singer.singer_id}" data-bjax data-target="#bjax-target" data-el="#bjax-el" data-replace="true" class="text-ellipsis">${singer.singer_name} </a>
                                                        <div  data-bjax data-target="#bjax-target" data-el="#bjax-el" data-replace="true" class="text-ellipsis text-xs text-muted">收藏：${singer.singer_collCount}</div>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:forEach>
                                        </div>


                                        <%--<ul class="pagination pagination">
                                            <li><a href="#"><i class="fa fa-chevron-left"></i></a></li>
                                            <li class="active"><a href="#">1</a></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#">5</a></li>
                                            <li><a href="#"><i class="fa fa-chevron-right"></i></a></li>
                                        </ul>--%>
                                    </section>
                                </section>
                            </section>
                        </section>
                    </section>

                    <%-- 引入底部音乐播放页面 --%>
                    <%@ include file="common/footer.jsp" %>
                </section>
                <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
            </section>
        </section>
    </section>
</section>
<script src="js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="js/bootstrap.js"></script>
<!-- App -->
<script src="js/app.js"></script>
<script src="js/slimscroll/jquery.slimscroll.min.js"></script>
<script src="js/app.plugin.js"></script>
<script type="text/javascript" src="js/jPlayer/jquery.jplayer.min.js"></script>
<script type="text/javascript" src="js/jPlayer/add-on/jplayer.playlist.min.js"></script>
<script type="text/javascript" src="js/jPlayer/demo.js"></script>
</body>
<script type="text/javascript">

    $(function () {
        var classify_id = getUrlParam('classify_id');
        var region_id = getUrlParam('region_id');
        console.log(classify_id+"--"+region_id)

        if (classify_id != null) {
            var a = $('#classify_select a');
            var t = $(a[classify_id-1]).text();
            console.log("a标签内容" + t.replace(/(^\s*)|(\s*$)/g, ""));
            $('#classify_text').append(t.replace(/(^\s*)|(\s*$)/g, ""));
        }

        if (region_id != null) {
            console.log("region_id不为空");
            var a = $('#region_select a');
            var t = $(a[region_id-1]).text();
            console.log("a标签内容" + t.replace(/(^\s*)|(\s*$)/g, ""));
            $('#classify_text').append(t.replace(/(^\s*)|(\s*$)/g, ""));
        }







        /*if (classify_id == 1) {
            $('#classify_text').append('轻音乐');
        } else if (classify_id == 2) {
            $('#classify_text').append('新世纪');
        } else if (classify_id == 3) {
            $('#classify_text').append('古典');
        }*/



    });

    function getUrlParam(name) {
        //构造一个含有目标参数的正则表达式对象
        var reg = new RegExp("(^|&)" +  name + "=([^&]*)(&|$)");
        //匹配目标参数
        var r = window.location.search.substr(1).match(reg);
        if (r != null) {
            return unescape(r[2]);
        } else {
            //返回参数值
            return "";
        }
    };

</script>
</html>