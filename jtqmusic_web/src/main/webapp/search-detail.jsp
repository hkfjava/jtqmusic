<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 陈小心
  Date: 2021/3/5
  Time: 下午 05:16
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

    <script src="js/jquery.min.js"></script>
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
                <section class="vbox" id="bjax-el">
                    <section class="scrollable wrapper-lg">
                        <div class="row">
                            <div class="col-sm-10">
                                <div class="panel wrapper-lg">
                                    <p >
                                        搜索"<b>${sear}"</b>结果,共有 <b>${songs_count + singers_count + albums_count}</b> 条记录
                                    </p>

                                    <%--多页--%>

                                    <section class="panel panel-default">
                                        <header class="panel-heading bg-light">
                                            <ul class="nav nav-tabs nav-justified" id="ul_selectupload">
                                                <li class="active"><a href="#home" data-toggle="tab" >歌曲(${songs_count})</a></li>
                                                <li><a href="#profile" data-toggle="tab" >专辑(${albums_count})</a></li>
                                                <li><a href="#like" data-toggle="tab" >歌手(${singers_count})</a></li>

                                            </ul>
                                        </header>
                                        <div class="panel-body">
                                            <div class="tab-content">
                                                <%-- 歌曲 --%>
                                                <div class="tab-pane active" id="home">

                                                    <ul class="list-group list-group-lg" id="songs_ul">

                                                        <%--歌曲循环--%>
                                                        <c:forEach items="${songs}" var="song">
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
                                                                    <span>${song.songs_name}</span>
                                                                    <span class="text-muted"> -- 04:35</span>
                                                                </div>
                                                            </li>
                                                        </c:forEach>


                                                    </ul>

                                                </div>

                                                    <%--专辑--%>
                                                <div class="tab-pane" id="profile">

                                                    <section class="scrollable padder-lg">
                                                        <div class="row row-sm" id="selectAlbum">
                                                            <c:forEach items="${albums}" var="album">
                                                                <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                                                    <div class="item">
                                                                        <div class="pos-rlt">
                                                                            <div class="item-overlay opacity r r-2x bg-black">
                                                                                <div class="center text-center m-t-n">
                                                                                    <a href="#"><i class="fa fa-play-circle i-2x"></i></a>
                                                                                </div>
                                                                            </div>
                                                                            <a href="track-detail.html"><img src="${album.album_imgUrl}" alt="" class="r r-2x img-full"></a>
                                                                        </div>
                                                                        <div class="padder-v">
                                                                            <a href="track-detail.html" data-bjax data-target="#bjax-target" data-el="#bjax-el" data-replace="true" class="text-ellipsis">${album.album_name}</a>
                                                                            <a href="track-detail.html" data-bjax data-target="#bjax-target" data-el="#bjax-el" data-replace="true" class="text-ellipsis text-xs text-muted">${album.album_issueDate_str}</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:forEach>
                                                        </div>

                                                    </section>




                                                    <%--歌手--%>
                                                 <div class="tab-pane" id="like">

                                                     <section class="scrollable padder-lg">
                                                         <div class="row row-sm" id="selectRegion" >
                                                             <c:forEach items="${singers}" var="singer">
                                                                 <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                                                     <div class="item">
                                                                         <div class="pos-rlt">
                                                                             <div class="item-overlay opacity r r-2x bg-black">
                                                                                 <div class="center text-center m-t-n">
                                                                                     <a href="#"><i class="fa fa-play-circle i-2x"></i></a>
                                                                                 </div>
                                                                             </div>
                                                                             <a href="track-detail.html"><img src="${singer.singer_imgUrl}" alt="" class="r r-2x img-full"></a>
                                                                         </div>
                                                                         <div class="padder-v">
                                                                             <a href="track-detail.html" data-bjax data-target="#bjax-target" data-el="#bjax-el" data-replace="true" class="text-ellipsis">${singer.singer_name}</a>
                                                                             <a href="track-detail.html" data-bjax data-target="#bjax-target" data-el="#bjax-el" data-replace="true" class="text-ellipsis text-xs text-muted">收藏：${singer.singer_collCount}</a>
                                                                         </div>
                                                                     </div>
                                                                 </div>
                                                             </c:forEach>
                                                         </div>

                                                     </section>

                                                 </div>

                                            </div>
                                        </div>
                                        </div>
                                    </section>



                                </div>
                            </div>

                        </div>
                    </section>

                </section>
                <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
            </section>
        </section>
    </section>
</section>

<!-- Bootstrap -->
<script src="js/bootstrap.js"></script>
<!-- App -->
<script src="js/app.js"></script>
<script src="js/slimscroll/jquery.slimscroll.min.js"></script>

<script src="js/app.plugin.js"></script>
<script type="text/javascript" src="js/jPlayer/jquery.jplayer.min.js"></script>
<script type="text/javascript" src="js/jPlayer/add-on/jplayer.playlist.min.js"></script>
<script type="text/javascript" src="js/jPlayer/demo.js"></script>


<script type="text/javascript">
    $(function () {
        var l = $('#ul_selectupload li');
        // alert(l.length);

        if ($(l[0]).attr('class')== 'active') {
            console.log("歌曲默认选中");

            // 异步发请求获取歌曲信息
            // 异步发请求获取歌曲信息
            $.ajax({
                url:'${pageContext.request.contextPath}/songs/findAllBy_SingerId.do?singer_id=${singer.singer_id}',
                contentType:"application/json;charset=utf-8",
                type:"POST",
                dataType:"JSON",
                success:function (res) {
                    $('#songs_ul').empty();
                    for (let i = 0; i < res.length; i++) {
                        console.log('请求成功' + res.length + res[i]['songs_id']);
                        var name = res[i]['songs_name'];
                        var id = res[i]['songs_id']
                        var imgUrl = res[i]['songs_url'];
                        var item = "<li class=\"list-group-item\">\n" +
                            "                                                            <div class=\"pull-right m-l\">\n" +
                            "                                                                <a href=\"#\" class=\"m-r-sm\"><i class=\"icon-heart\"></i></a>\n" +
                            "                                                                <a href=\"#\" class=\"m-r-sm\"><i class=\"icon-cloud-download\"></i></a>\n" +
                            "                                                                <a href=\"#\" class=\"m-r-sm\"><i class=\"icon-plus\"></i></a>\n" +
                            "                                                                <a href=\"#\"><i class=\"icon-close\"></i></a>\n" +
                            "                                                            </div>\n" +
                            "                                                            <a href=\"#\" class=\"jp-play-me m-r-sm pull-left\">\n" +
                            "                                                                <i class=\"icon-control-play  \" id=\"songs_play_"+i+"\"  onclick=\"songs_play("+i+")\" ></i>\n" +
                            "                                                                <i class=\"icon-control-pause text-active\" id=\"songs_pause_"+i+"\" onclick=\"songs_pause("+i+")\" ></i>\n" +
                            "                                                            </a>\n" +
                            "                                                            <div class=\"clear text-ellipsis\">\n" +
                            "                                                                <input hidden  value='"+id+"' />\n" +
                            "                                                                <input hidden  value='"+imgUrl+"' id=\"songs_url_"+i+"\" /><span>"+name+"</span>\n" +
                            "                                                                <span class=\"text-muted\"> -- 04:35</span>\n" +
                            "                                                            </div>\n" +
                            "                                                        </li>";

                        $('#songs_ul').append(item);
                    }
                    // console.log(res);
                }
            });


        }

    });




     getSongs = function () {
        console.log("点击歌曲");

        // 异步发请求获取歌曲信息


    };

     getAlbum = function () {
        console.log("点击专辑:" + ${singer.singer_id});

         // 异步发请求获取歌手专辑信息
         $.ajax({
             url:'${pageContext.request.contextPath}/album/findBySinger_Id.do?singer_id=${singer.singer_id}',
             contentType:"application/json;charset=utf-8",
             type:"POST",
             dataType:"JSON",
             success:function (res) {
                 $('#selectAlbum').empty();
                 for (let i = 0; i < res.length; i++) {
                     console.log('请求成功' + res.length + res[i]['album_id']);
                     var name = res[i]['album_name'];
                     var id = res[i]['album_id']
                     var imgUrl = res[i]['album_imgUrl'];
                     var issueDate = res[i]['album_issueDate_str'];
                     var item = "<div class=\"col-xs-6 col-sm-4 col-md-3 col-lg-2\">\n" +
                         "                        <div class=\"item\">\n" +
                         "                        <div class=\"pos-rlt\">\n" +
                         "                        <div class=\"item-overlay opacity r r-2x bg-black\">\n" +
                         "                        <div class=\"center text-center m-t-n\">\n" +
                         "                        <a href=\"#\"><i class=\"fa fa-play-circle i-2x\"></i></a>\n" +
                         "                    </div>\n" +
                         "                    </div>\n" +
                         "                    <a href=\"track-detail.html\"><img src=\""+ imgUrl+"\" alt=\"\" class=\"r r-2x img-full\"></a>\n" +
                         "                        </div>\n" +
                         "                        <div class=\"padder-v\">\n" +
                         "                        <a href=\"${pageContext.request.contextPath}/album/findById.do?album_id="+id+"&singer_id="+ ${singer.singer_id} +"\" data-bjax data-target=\"#bjax-target\" data-el=\"#bjax-el\" data-replace=\"true\" class=\"text-ellipsis\">"+name+"</a>\n" +
                         "                    <div  data-bjax data-target=\"#bjax-target\" data-el=\"#bjax-el\" data-replace=\"true\" class=\"text-ellipsis text-xs text-muted\">"+ issueDate +"</div>\n" +
                         "                        </div>\n" +
                         "                        </div>\n" +
                         "                        </div>";

                     $('#selectAlbum').append(item);
                 }
                 // console.log(res);
             }
         });

    };



    getSinger = function() {
        console.log("点击相似歌手:" + ${singer.singer_id});


        // 异步发请求获取相似歌手信息
        $.ajax({
            url:'${pageContext.request.contextPath}/singer/findLikeSinger.do?singer_id=${singer.singer_id}&singer_sex=${singer.singer_sex}&classify_id=${classify.classify_id}',
            contentType:"application/json;charset=utf-8",
            type:"POST",
            dataType:"JSON",

            success:function (res) {
                $('#selectRegion').empty();
                for (let i = 0; i < res.length; i++) {
                    console.log('请求成功' + res.length + res[i]['singer_id']);
                    var name = res[i]['singer_name'];
                    var id = res[i]['singer_id']
                    var imgUrl = res[i]['singer_imgUrl'];
                    var collCount = res[i]['singer_collCount'];
                    var item = "<div class=\"col-xs-6 col-sm-4 col-md-3 col-lg-2\">\n" +
                        "                        <div class=\"item\">\n" +
                        "                        <div class=\"pos-rlt\">\n" +
                        "                        <div class=\"item-overlay opacity r r-2x bg-black\">\n" +
                        "                        <div class=\"center text-center m-t-n\">\n" +
                        "                        <a href=\"#\"><i class=\"fa fa-play-circle i-2x\"></i></a>\n" +
                        "                    </div>\n" +
                        "                    </div>\n" +
                        "                    <a href=\"track-detail.html\"><img src=\""+ imgUrl+"\" alt=\"\" class=\"r r-2x img-full\"></a>\n" +
                        "                        </div>\n" +
                        "                        <div class=\"padder-v\">\n" +
                        "                        <a href=\"${pageContext.request.contextPath}/singer/findById.do?singer_id="+id+"\" data-bjax data-target=\"#bjax-target\" data-el=\"#bjax-el\" data-replace=\"true\" class=\"text-ellipsis\">"+name+"</a>\n" +
                        "                    <div  data-bjax data-target=\"#bjax-target\" data-el=\"#bjax-el\" data-replace=\"true\" class=\"text-ellipsis text-xs text-muted\">收藏："+collCount+"</div>\n" +
                        "                        </div>\n" +
                        "                        </div>\n" +
                        "                        </div>";

                    $('#selectRegion').append(item);
                }
                // console.log(res);
            }
        });
    };
    getMV = function() {
        console.log("暂不支持");
    };

    function songs_play(a) {
        console.log("点击歌曲的播放按钮");
        console.log(a);

        var b = $('#songs_ul li');
        // console.log(b,b.length);
        // 遍历获得所有播放和暂停键
        for (var i=0; i<b.length; i++) {
            $('#songs_play_' + i).removeClass("text-active");
            $('#songs_pause_' + i).addClass("text-active");
        }

        $('#songs_play_' + a).addClass("text-active");
        $('#songs_pause_' + a).removeClass("text-active");

        // 获取歌曲地址
        var s_url = $('#songs_url_' +a).val();

        // 播放歌曲
        play_songs(s_url);


    };

    function songs_pause(a) {
        console.log("点击歌曲的暂停按钮");
        $('#songs_play_' + a).removeClass("text-active");
        $('#songs_pause_' + a).addClass("text-active");
    };




</script>
</body>
</html>
