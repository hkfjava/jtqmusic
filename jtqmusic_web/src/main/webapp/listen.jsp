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
                    <section class="w-f-md">
                        <section class="hbox stretch bg-black dker">
                            <!-- side content -->
                            <aside class="col-sm-5 no-padder" id="sidebar">
                                <section class="vbox animated fadeInUp">
                                    <section class="scrollable">
                                        <div class="m-t-n-xxs item pos-rlt">
                                            <div class="top text-right">
                        <span class="musicbar animate bg-success bg-empty inline m-r-lg m-t" style="width:25px;height:30px">
                          <span class="bar1 a3 lter"></span>
                          <span class="bar2 a5 lt"></span>
                          <span class="bar3 a1 bg"></span>
                          <span class="bar4 a4 dk"></span>
                          <span class="bar5 a2 dker"></span>
                        </span>
                                            </div>
                                            <div class="bottom gd bg-info wrapper-lg">
                                                <span class="pull-right text-sm">101,400 <br>Followers</span>
                                                <span class="h2 font-thin">Soph Ashe</span>
                                            </div>
                                            <img class="img-full" src="images/m43.jpg" alt="...">
                                        </div>
                                        <ul class="list-group list-group-lg no-radius no-border no-bg m-t-n-xxs m-b-none auto">
                                            <li class="list-group-item">
                                                <div class="pull-right m-l">
                                                    <a href="#" class="m-r-sm"><i class="icon-cloud-download"></i></a>
                                                    <a href="#" class="m-r-sm"><i class="icon-plus"></i></a>
                                                    <a href="#"><i class="icon-close"></i></a>
                                                </div>
                                                <a href="#" class="jp-play-me m-r-sm pull-left">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <div class="clear text-ellipsis">
                                                    <span>E.T.M</span>
                                                    <span class="text-muted"> -- 04:35</span>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="pull-right m-l">
                                                    <a href="#" class="m-r-sm"><i class="icon-cloud-download"></i></a>
                                                    <a href="#"><i class="icon-plus"></i></a>
                                                </div>
                                                <a href="#" class="jp-play-me m-r-sm pull-left">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <div class="clear text-ellipsis">
                                                    <span>Vestibulum id ligula porta</span>
                                                    <span class="text-muted"> -- 04:15</span>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="pull-right m-l">
                                                    <a href="#" class="m-r-sm"><i class="icon-cloud-download"></i></a>
                                                    <a href="#"><i class="icon-plus"></i></a>
                                                </div>
                                                <a href="#" class="jp-play-me m-r-sm pull-left">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <div class="clear text-ellipsis">
                                                    <span>Praesent commodo cursus magna</span>
                                                    <span class="text-muted"> -- 02:25</span>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="pull-right m-l">
                                                    <a href="#" class="m-r-sm"><i class="icon-cloud-download"></i></a>
                                                    <a href="#"><i class="icon-plus"></i></a>
                                                </div>
                                                <a href="#" class="jp-play-me m-r-sm pull-left">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <div class="clear text-ellipsis">
                                                    <span>Curabitur blandit tempus</span>
                                                    <span class="text-muted"> -- 05:00</span>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="pull-right m-l">
                                                    <a href="#" class="m-r-sm"><i class="icon-cloud-download"></i></a>
                                                    <a href="#"><i class="icon-plus"></i></a>
                                                </div>
                                                <a href="#" class="jp-play-me m-r-sm pull-left">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <div class="clear text-ellipsis">
                                                    <span>Faucibus dolor auctor</span>
                                                    <span class="text-muted"> -- 03:50</span>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="pull-right m-l">
                                                    <a href="#" class="m-r-sm"><i class="icon-cloud-download"></i></a>
                                                    <a href="#"><i class="icon-plus"></i></a>
                                                </div>
                                                <a href="#" class="jp-play-me m-r-sm pull-left">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <div class="clear text-ellipsis">
                                                    <span>Get lacinia odio sem nec elit cibus dolor auctor sed odio dui mollis ornare</span>
                                                    <span class="text-muted"> -- 04:05</span>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="pull-right m-l">
                                                    <a href="#" class="m-r-sm"><i class="icon-cloud-download"></i></a>
                                                    <a href="#"><i class="icon-plus"></i></a>
                                                </div>
                                                <a href="#" class="jp-play-me m-r-sm pull-left">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <div class="clear text-ellipsis">
                                                    <span>Faucibus dolor auctor</span>
                                                    <span class="text-muted"> -- 02:55</span>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="pull-right m-l">
                                                    <a href="#" class="m-r-sm"><i class="icon-cloud-download"></i></a>
                                                    <a href="#"><i class="icon-plus"></i></a>
                                                </div>
                                                <a href="#" class="jp-play-me m-r-sm pull-left">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <div class="clear text-ellipsis">
                                                    <span>Donec sed odio dui</span>
                                                    <span class="text-muted"> -- 04:35</span>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="pull-right m-l">
                                                    <a href="#" class="m-r-sm"><i class="icon-cloud-download"></i></a>
                                                    <a href="#"><i class="icon-plus"></i></a>
                                                </div>
                                                <a href="#" class="jp-play-me m-r-sm pull-left">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <div class="clear text-ellipsis">
                                                    <span>Urna mollis ornare vel eu leo</span>
                                                    <span class="text-muted"> -- 05:10</span>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="pull-right m-l">
                                                    <a href="#" class="m-r-sm"><i class="icon-cloud-download"></i></a>
                                                    <a href="#"><i class="icon-plus"></i></a>
                                                </div>
                                                <a href="#" class="jp-play-me m-r-sm pull-left">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <div class="clear text-ellipsis">
                                                    <span>Vivamus sagittis lacus vel augue</span>
                                                    <span class="text-muted"> -- 02:35</span>
                                                </div>
                                            </li>
                                        </ul>
                                    </section>
                                </section>
                            </aside>
                            <!-- / side content -->
                            <section class="col-sm-4 no-padder bg">
                                <section class="vbox">
                                    <section class="scrollable hover">
                                        <ul class="list-group list-group-lg no-bg auto m-b-none m-t-n-xxs">
                                            <li class="list-group-item clearfix">
                                                <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <a href="#" class="pull-left thumb-sm m-r">
                                                    <img src="images/m0.jpg" alt="...">
                                                </a>
                                                <a class="clear" href="#">
                                                    <span class="block text-ellipsis">Little Town</span>
                                                    <small class="text-muted">by Soph Ashe</small>
                                                </a>
                                            </li>
                                            <li class="list-group-item clearfix">
                                                <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <a href="#" class="pull-left thumb-sm m-r">
                                                    <img src="images/a1.png" alt="...">
                                                </a>
                                                <a class="clear" href="#">
                                                    <span class="block text-ellipsis">Get lacinia odio sem nec elit</span>
                                                    <small class="text-muted">by Filex</small>
                                                </a>
                                            </li>
                                            <li class="list-group-item clearfix">
                                                <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <a href="#" class="pull-left thumb-sm m-r">
                                                    <img src="images/a2.png" alt="...">
                                                </a>
                                                <a class="clear" href="#">
                                                    <span class="block text-ellipsis">Donec sed odio du</span>
                                                    <small class="text-muted">by Dan Doorack</small>
                                                </a>
                                            </li>
                                            <li class="list-group-item clearfix">
                                                <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <a href="#" class="pull-left thumb-sm m-r">
                                                    <img src="images/a3.png" alt="...">
                                                </a>
                                                <a class="clear" href="#">
                                                    <span class="block text-ellipsis">Curabitur blandit tempu</span>
                                                    <small class="text-muted">by Foxes</small>
                                                </a>
                                            </li>
                                            <li class="list-group-item clearfix">
                                                <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <a href="#" class="pull-left thumb-sm m-r">
                                                    <img src="images/a4.png" alt="...">
                                                </a>
                                                <a class="clear" href="#">
                                                    <span class="block text-ellipsis">Urna mollis ornare vel eu leo</span>
                                                    <small class="text-muted">by Chris Fox</small>
                                                </a>
                                            </li>
                                            <li class="list-group-item clearfix">
                                                <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <a href="#" class="pull-left thumb-sm m-r">
                                                    <img src="images/a5.png" alt="...">
                                                </a>
                                                <a class="clear" href="#">
                                                    <span class="block text-ellipsis">Faucibus dolor auctor</span>
                                                    <small class="text-muted">by Lauren Taylor</small>
                                                </a>
                                            </li>
                                            <li class="list-group-item clearfix">
                                                <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <a href="#" class="pull-left thumb-sm m-r">
                                                    <img src="images/a6.png" alt="...">
                                                </a>
                                                <a class="clear" href="#">
                                                    <span class="block text-ellipsis">Praesent commodo cursus magn</span>
                                                    <small class="text-muted">by Chris Fox</small>
                                                </a>
                                            </li>
                                            <li class="list-group-item clearfix">
                                                <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <a href="#" class="pull-left thumb-sm m-r">
                                                    <img src="images/a7.png" alt="...">
                                                </a>
                                                <a class="clear" href="#">
                                                    <span class="block text-ellipsis">Vestibulum id</span>
                                                    <small class="text-muted">by Milian</small>
                                                </a>
                                            </li>
                                            <li class="list-group-item clearfix">
                                                <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <a href="#" class="pull-left thumb-sm m-r">
                                                    <img src="images/a8.png" alt="...">
                                                </a>
                                                <a class="clear" href="#">
                                                    <span class="block text-ellipsis">Blandit tempu</span>
                                                    <small class="text-muted">by Amanda Conlan</small>
                                                </a>
                                            </li>
                                            <li class="list-group-item clearfix">
                                                <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <a href="#" class="pull-left thumb-sm m-r">
                                                    <img src="images/a9.png" alt="...">
                                                </a>
                                                <a class="clear" href="#">
                                                    <span class="block text-ellipsis">Vestibulum ullamcorpe quis malesuada augue mco rpe</span>
                                                    <small class="text-muted">by Dan Doorack</small>
                                                </a>
                                            </li>
                                            <li class="list-group-item clearfix">
                                                <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <a href="#" class="pull-left thumb-sm m-r">
                                                    <img src="images/a10.png" alt="...">
                                                </a>
                                                <a class="clear" href="#">
                                                    <span class="block text-ellipsis">Natis ipsum ac feugiat</span>
                                                    <small class="text-muted">by Hamburg</small>
                                                </a>
                                            </li>
                                            <li class="list-group-item clearfix">
                                                <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                                                    <i class="icon-control-play text"></i>
                                                    <i class="icon-control-pause text-active"></i>
                                                </a>
                                                <a href="#" class="pull-left thumb-sm m-r">
                                                    <img src="images/a0.png" alt="...">
                                                </a>
                                                <a class="clear" href="#">
                                                    <span class="block text-ellipsis">Sec condimentum au</span>
                                                    <small class="text-muted">by Amanda Conlan</small>
                                                </a>
                                            </li>
                                        </ul>
                                    </section>
                                </section>
                            </section>
                            <section class="col-sm-3 no-padder lt">
                                <section class="vbox">
                                    <section class="scrollable hover">
                                        <div class="m-t-n-xxs">
                                            <div class="item pos-rlt">
                                                <a href="#" class="item-overlay active opacity wrapper-md font-xs">
                                                    <span class="block h3 font-bold text-info">Find</span>
                                                    <span class="text-muted">Search the music you like</span>
                                                    <span class="bottom wrapper-md block">- <i class="icon-arrow-right i-lg pull-right"></i></span>
                                                </a>
                                                <a href="#">
                                                    <img class="img-full" src="images/m40.jpg" alt="...">
                                                </a>
                                            </div>
                                            <div class="item pos-rlt">
                                                <a href="#" class="item-overlay active opacity wrapper-md font-xs text-right">
                                                    <span class="block h3 font-bold text-warning text-u-c">Listen</span>
                                                    <span class="text-muted">Find the peace in your heart</span>
                                                    <span class="bottom wrapper-md block"><i class="icon-arrow-right i-lg pull-left"></i> -</span>
                                                </a>
                                                <a href="#">
                                                    <img class="img-full" src="images/m41.jpg" alt="...">
                                                </a>
                                            </div>
                                            <div class="item pos-rlt">
                                                <a href="#" class="item-overlay active opacity wrapper-md font-xs">
                                                    <span class="block h3 font-bold text-success text-u-c">Share</span>
                                                    <span class="text-muted">Share the good songs with your loves</span>
                                                    <span class="bottom wrapper-md block">- <i class="icon-arrow-right i-lg pull-right"></i></span>
                                                </a>
                                                <a href="#">
                                                    <img class="img-full" src="images/m42.jpg" alt="...">
                                                </a>
                                            </div>
                                            <div class="item pos-rlt">
                                                <a href="#" class="item-overlay active opacity wrapper-md font-xs text-right">
                                                    <span class="block h3 font-bold text-white text-u-c">2014</span>
                                                    <span class="text-muted">Find, Listen & Share</span>
                                                    <span class="bottom wrapper-md block"><i class="icon-arrow-right i-lg pull-left"></i> -</span>
                                                </a>
                                                <a href="#">
                                                    <img class="img-full" src="images/m44.jpg" alt="...">
                                                </a>
                                            </div>
                                            <div class="item pos-rlt">
                                                <a href="#" class="item-overlay active opacity wrapper-md font-xs">
                                                    <span class="block h3 font-bold text-danger-lter text-u-c">Top10</span>
                                                    <span class="text-muted">Selected songs</span>
                                                    <span class="bottom wrapper-md block">- <i class="icon-arrow-right i-lg pull-right"></i></span>
                                                </a>
                                                <a href="#">
                                                    <img class="img-full" src="images/m45.jpg" alt="...">
                                                </a>
                                            </div>
                                        </div>
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
</html>