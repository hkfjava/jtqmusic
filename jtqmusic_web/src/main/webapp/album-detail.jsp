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
    <meta charset="utf-8"/>
    <title>Musik | Web Application</title>
    <%@include file="common/head.jsp" %>
    <meta name="description"
          content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <link rel="stylesheet" href="js/jPlayer/jplayer.flat.css" type="text/css"/>
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css"/>
    <link rel="stylesheet" href="css/animate.css" type="text/css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css"/>
    <link rel="stylesheet" href="css/simple-line-icons.css" type="text/css"/>
    <link rel="stylesheet" href="css/font.css" type="text/css"/>
    <link rel="stylesheet" href="css/app.css" type="text/css"/>

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
                                    <div class="row">
                                        <div class="col-sm-2">
                                            <img id="img_album_img" src="${album.album_imgUrl}" class="img-full r r-2x">
                                        </div>
                                        <div class="col-sm-6">
                                            <h3 class="m-t-none text-black">${album.album_name}</h3>

                                            <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${singer.singer_id}"
                                               class="text-info">
                                                <h4 class="text-info ">${singer.singer_name}</h4>
                                            </a>
                                            <div class="m-b-lg">
                                                <h5 class="m-t-none text-black">${album.album_issueDate_str}</h5>
                                            </div>
                                            <div class="m-b-lg">
                                                <span onclick="coll_album(this,${album.album_id})" coll_flag="0" class="btn btn-info">收藏 </span> <a href="#"
                                                                                            class="btn btn-default">3
                                                评论</a>
                                            </div>

                                        </div>
                                    </div>
                                    <%--<div class="m-t">
                                        <p>歌手简介</p>
                                    </div>--%>
                                    <%--多页--%>

                                    <section class="panel panel-default">
                                        <header class="panel-heading bg-light">
                                            <ul class="nav nav-tabs nav-justified" id="ul_selectupload">
                                                <li class="active"><a href="#home" data-toggle="tab"
                                                                      onclick="getSongs()">歌曲(${album.album_songNumber})</a>
                                                </li>
                                                <li><a href="#messages" data-toggle="tab">专辑信息</a></li>
                                                <li><a href="#like" data-toggle="tab" onclick="getOtherAlbum()">相似专辑</a>
                                                </li>
                                                <li><a href="#settings" data-toggle="tab" onclick="getComment()">评论</a>
                                                </li>
                                            </ul>
                                        </header>
                                        <div class="panel-body">
                                            <div class="tab-content">
                                                <li class="list-group-item">
                                                    <div onclick="play_allSongs()" class="btn btn-info">全部加入播放列表</div>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="btn btn-default">3 评论</a>

                                                </li>


                                            <%-- 歌曲 --%>
                                                <div class="tab-pane active" id="home">
<%--                                                <button class="btn btn-success dropdown-toggle" data-toggle="dropdown">Action <span class="caret"></span></button>--%>

                                                    <ul class="pull-right dropdown-menu" id="songmenu_menu_ul">
                                                        <li><p style="text-align: center">歌单</p></li>
                                                        <li class="divider"></li>
                                                        <c:forEach items="${sessionScope.songMenus}" var="songmenu">
                                                            <li><span style="padding-left: 10px;" class="text-black" onclick="add_songmenu_li(${songmenu.songmenu_id})">${songmenu.songmenu_name}</span></li>
                                                        </c:forEach>

                                                    </ul>
                                                    <ul class="list-group list-group-lg" id="songs_ul">



                                                    </ul>


                                                </div>


                                                <%--专辑详情--%>
                                                <div class="tab-pane" id="messages">
                                                    <p>专辑：${album.album_name}</p>
                                                    <p>演奏：${singer.singer_name}</p>
                                                    <p>发布时间：${album.album_issueDate_str}</p>
                                                    <p>介绍：${album.album_info}</p>
                                                </div>

                                                <%--相似专辑--%>
                                                <div class="tab-pane" id="like">

                                                    <section class="scrollable padder-lg">
                                                        <div class="row row-sm" id="selectAlbum">

                                                        </div>

                                                    </section>

                                                </div>
                                                <div class="tab-pane" id="settings">评论</div>
                                            </div>
                                        </div>
                                    </section>


                                    <h4 class="m-t-lg m-b">3 Comments</h4>
                                    <section class="comment-list block">
                                        <article id="comment-id-1" class="comment-item">
                                            <a class="pull-left thumb-sm">
                                                <img src="images/a0.png" class="img-circle">
                                            </a>
                                            <section class="comment-body m-b">
                                                <header>
                                                    <a href="#"><strong>John smith</strong></a>
                                                    <label class="label bg-info m-l-xs">Editor</label>
                                                    <span class="text-muted text-xs block m-t-xs">
                              24 minutes ago
                            </span>
                                                </header>
                                                <div class="m-t-sm">Lorem ipsum dolor sit amet, consectetur adipiscing
                                                    elit. Morbi id neque quam. Aliquam sollicitudin venenatis ipsum ac
                                                    feugiat. Vestibulum.
                                                </div>
                                            </section>
                                        </article>
                                        <!-- .comment-reply -->
                                        <article id="comment-id-2" class="comment-item comment-reply">
                                            <a class="pull-left thumb-sm">
                                                <img src="images/a1.png" class="img-circle">
                                            </a>
                                            <section class="comment-body m-b">
                                                <header>
                                                    <a href="#"><strong>John smith</strong></a>
                                                    <label class="label bg-dark m-l-xs">Admin</label>
                                                    <span class="text-muted text-xs block m-t-xs">
                              26 minutes ago
                            </span>
                                                </header>
                                                <div class="m-t-sm">Lorem ipsum dolor sit amet, consecteter adipiscing
                                                    elit, sed diam nonummy nibh euismod tincidunt ut laoreet.
                                                </div>
                                            </section>
                                        </article>
                                        <!-- / .comment-reply -->
                                        <article id="comment-id-2" class="comment-item">
                                            <a class="pull-left thumb-sm">
                                                <img src="images/a2.png" class="img-circle">
                                            </a>
                                            <section class="comment-body m-b">
                                                <header>
                                                    <a href="#"><strong>John smith</strong></a>
                                                    <label class="label bg-dark m-l-xs">Admin</label>
                                                    <span class="text-muted text-xs block m-t-xs">
                              26 minutes ago
                            </span>
                                                </header>
                                                <blockquote class="m-t">
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer
                                                        posuere erat a ante.</p>
                                                    <small>Someone famous in <cite title="Source Title">Source
                                                        Title</cite></small>
                                                </blockquote>
                                                <div class="m-t-sm">Lorem ipsum dolor sit amet, consecteter adipiscing
                                                    elit, sed diam nonummy nibh euismod tincidunt ut laoreet.
                                                </div>
                                            </section>
                                        </article>
                                    </section>
                                    <h4 class="m-t-lg m-b">Leave a comment</h4>
                                    <form>
                                        <div class="form-group pull-in clearfix">
                                            <div class="col-sm-6">
                                                <label>Your name</label>
                                                <input type="text" class="form-control" placeholder="Name">
                                            </div>
                                            <div class="col-sm-6">
                                                <label>Email</label>
                                                <input type="email" class="form-control" placeholder="Enter email">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Comment</label>
                                            <textarea class="form-control" rows="5"
                                                      placeholder="Type your comment"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-success">Submit comment</button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </section>
                    <%-- 引入底部音乐播放页面 --%>
                    <%@ include file="common/footer.jsp" %>
                </section>
                <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open"
                   data-target="#nav,html"></a>
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
</body>

<script type="text/javascript">



    var songmenu_songs_id;

    $(function () {

        var l = $('#ul_selectupload li');
        // alert(l.length);


        if ($(l[0]).attr('class') == 'active') {
            console.log("歌曲默认选中");

            // 异步发请求获取歌曲信息
            $.ajax({
                url: '${pageContext.request.contextPath}/songs/findAllBy_AlbumId.do?album_id=${album.album_id}',
                contentType: "application/json;charset=utf-8",
                type: "POST",
                dataType: "JSON",
                success: function (res) {
                    $('#songs_ul').empty();
                    for (let i = 0; i < res.length; i++) {
                        console.log('请求成功' + res.length + res[i]['songs_id']);
                        var name = res[i]['songs_name'];
                        var id = res[i]['songs_id']
                        var imgUrl = res[i]['songs_url'];
                        var item = "<li class=\"list-group-item\">\n" +
                            "                                                            <div class=\"pull-right m-l\">\n" +
                            "                                                                <span onclick=\"coll_songs(" + id + ")\" class=\"m-r-sm\"><i id=\"coll_"+id+"\" class=\"icon-heart\"></i></span>\n" +
                            "                                                                <span onclick=\"download_songs(" + id + ")\"  class=\"m-r-sm\"><i class=\"icon-cloud-download\"></i></span>\n" +
                            "                                                                <span onclick=\"add_songmenu_button("+id+")\" id=\"add_playList_" + id + "\" class=\"m-r-sm dropdown-toggle\" data-toggle=\"dropdown\"><i class=\"icon-plus\"></i></span>\n" +
                            "                                                            </div>\n" +
                            "                                                            <a href=\"#\" class=\"jp-play-me m-r-sm pull-left\">\n" +
                            "                                                                <i class=\"icon-control-play  \" id=\"songs_play_" + i + "\"  onclick=\"songs_play(" + i + ")\" ></i>\n" +
                            "                                                                <i class=\"icon-control-pause text-active\" id=\"songs_pause_" + i + "\" onclick=\"songs_pause(" + i + ")\" ></i>\n" +
                            "                                                            </a>\n" +
                            "                                                            <div class=\"clear text-ellipsis\">\n" +
                            "                                                                <input hidden id=\"album_detail_songs_songs_id_" + i + "\"   value='" + id + "' />\n" +
                            "                                                                <input hidden  value='" + imgUrl + "' id=\"songs_url_" + i + "\" /><span id=\"songs_name_new_" + i + "\">" + name + "</span>\n" +
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

    var getSongs;
    var getOtherAlbum;
    var getComment;

    window.onload = function () {


        getSongs = function () {
            console.log("点击歌曲");

            // 异步发请求获取歌曲信息


        };

        getOtherAlbum = function () {
            console.log("点击相似专辑:" + ${singer.singer_id});

            // 异步发请求获取歌手专辑信息
            $.ajax({
                url: '${pageContext.request.contextPath}/album/findLikeAlbum.do?album_id=${album.album_id}&singer_id=${singer.singer_id}',
                contentType: "application/json;charset=utf-8",
                type: "POST",
                dataType: "JSON",
                success: function (res) {
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
                            "                    <a href=\"${pageContext.request.contextPath}/album/findById.do?album_id=" + id + "&singer_id=" + ${singer.singer_id} +"\"><img src=\"" + imgUrl + "\" alt=\"\" class=\"r r-2x img-full\"></a>\n" +
                            "                        </div>\n" +
                            "                        <div class=\"padder-v\">\n" +
                            "                        <a href=\"${pageContext.request.contextPath}/album/findById.do?album_id=" + id + "&singer_id=" + ${singer.singer_id} +"\" data-bjax data-target=\"#bjax-target\" data-el=\"#bjax-el\" data-replace=\"true\" class=\"text-ellipsis\">" + name + "</a>\n" +
                            "                    <div  data-bjax data-target=\"#bjax-target\" data-el=\"#bjax-el\" data-replace=\"true\" class=\"text-ellipsis text-xs text-muted\">" + issueDate + "</div>\n" +
                            "                        </div>\n" +
                            "                        </div>\n" +
                            "                        </div>";

                        $('#selectAlbum').append(item);
                    }
                    // console.log(res);
                }
            });

        };

    };

    // 收藏歌曲函数
    function coll_songs(songs_id) {
        console.log("点击收藏歌曲coll_songs,歌曲id：" + songs_id)

        var coll_flag = $('#coll_' + songs_id).hasClass("text-danger");

        if (coll_flag == false) {   // 未被收藏 点击收藏
            console.log("异步收藏")
            // 异步请求收藏歌曲
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: '${pageContext.request.contextPath}/user/coll.do?songs_id=' + songs_id,//url
                success: function (result) {
                    console.log(result);//打印服务端返回的数据(调试用)
                    if (result = 101) {
                        // 添加class
                        $('#coll_' + songs_id).addClass("text-danger");
                    } else {
                        alert("收藏失败，该歌曲已经被收藏");
                    }
                },
                error: function () {
                    alert("收藏失败2 请登录或者重新收藏");
                    window.location.href = "${pageContext.request.contextPath}/signin.jsp";
                }
            });
        } else if (coll_flag == true) {
            console.log("异步取消收藏")

            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: '${pageContext.request.contextPath}/user/coll_cancel.do?songs_id=' + songs_id,//url
                success: function (result) {
                    console.log(result);//打印服务端返回的数据(调试用)
                    if (result = 101) {
                        // 添加class
                        $('#coll_' + songs_id).removeClass("text-danger");
                    } else {
                        alert("取消收藏失败，该歌曲已经被收藏");
                    }
                },
                error: function () {
                    alert("取消收藏失败2");
                }
            });
        }



    };


    // 收藏专辑函数
    function coll_album(obj,album_id) {
        console.log("点击收藏专辑coll_album,专辑id：" + album_id)

        console.log($(obj).attr("coll_flag"));

        if ($(obj).attr("coll_flag") == 0){
            console.log("异步收藏专辑");
            // 异步请求收藏歌曲
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: '${pageContext.request.contextPath}/user/coll.do?album_id=' + album_id,//url
                success: function (result) {
                    console.log(result);//打印服务端返回的数据(调试用)
                    if (result = 101) {
                        // 添加class
                        $(obj).text("已收藏");
                        $(obj).attr("coll_flag",1);
                    } else {
                        alert("收藏失败，该歌曲已经被收藏");
                    }
                },
                error: function () {
                    alert("收藏失败2 请登录或者重新收藏");
                    window.location.href = "${pageContext.request.contextPath}/signin.jsp";
                }
            });
        } else if ($(obj).attr("coll_flag") == 1){
            console.log("异步取消收藏专辑");

            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: '${pageContext.request.contextPath}/user/coll_cancel.do?album_id=' + album_id,//url
                success: function (result) {
                    console.log(result);//打印服务端返回的数据(调试用)
                    if (result = 101) {
                        // 添加class
                        $(obj).text("收藏");
                        $(obj).attr("coll_flag",0);
                    } else {
                        alert("取消收藏失败，该歌曲已经被收藏");
                    }
                },
                error: function () {
                    alert("取消收藏失败2");
                }
            });
        }


    };


    function getComment() {
        console.log("暂不支持");
    };

    // 单机播放单首歌曲
    function songs_play(a) {
        console.log("点击歌曲的播放按钮");
        console.log(a);

        song_url_s = a;


        var b = $('#songs_ul li');
        // console.log(b,b.length);
        // 遍历获得所有播放和暂停键
        for (var i = 0; i < b.length; i++) {
            $('#songs_play_' + i).removeClass("text-active");
            $('#songs_pause_' + i).addClass("text-active");
        }

        $('#songs_play_' + a).addClass("text-active");
        $('#songs_pause_' + a).removeClass("text-active");

        // 获取歌曲地址
        var s_url = $('#songs_url_' + a).val();

        // 获取歌手id，歌曲名字，歌手名字，歌曲id，专辑图片
        var s_name = $("#songs_name_new_" + a).text();
        var s_name_singer = "${singer.singer_name}";
        var s_id_singer = "${singer.singer_id}";
        var s_album_img = $('#img_album_img').attr('src');


        // 执行方法

        // getSongs_info_play(s_name, s_name_singer, s_id_singer, s_album_img);

        s_name_arr.push(s_name);
        s_name_singer_arr.push(s_name_singer);
        s_id_singer_arr.push(s_id_singer);
        s_album_img_arr.push(s_album_img);

        // 播放歌曲
        play_songs(s_url);


    };

    function songs_pause(a) {
        console.log("点击歌曲的暂停按钮");
        $('#songs_play_' + a).removeClass("text-active");
        $('#songs_pause_' + a).addClass("text-active");

        // 暂停歌曲
        pauseAudio(a);
    };


    // 创建函数，让歌曲播放按钮从三角到竖线 开始播放 状态：暂停-》播放
    function change_playByPause(a) {
        $('#songs_play_' + a).addClass("text-active");
        $('#songs_pause_' + a).removeClass("text-active");

    };

    function change_pauseByPaly(a) {
        $('#songs_play_' + a).removeClass("text-active");
        $('#songs_pause_' + a).addClass("text-active");

    };

    // 点击播放全部的事件
    // 第三版，发送异步请求，存取数据到PlayList实体，然后存放到session
    function play_allSongs() {

        // 获取所有歌曲id

        console.log("点击播放全部-发送异步请求，存放所有歌曲id到后端");
        var ids = [];
        // 获取该专辑所有歌曲地址和id 再调用
        var b = $('#songs_ul li');  // 获取歌曲所有li
        // console.log(b,b.length);
        // 遍历获得所有播放和暂停键
        for (var i = 0; i < b.length; i++) {

            // 获取歌曲地址
            var id = $('#album_detail_songs_songs_id_' + (i)).val();
            console.log("id类型" + typeof id);
            ids.push(id);

        }
        console.log("所有ids" + ids);

        // 异步发请求存取
        $.ajax({
            url: '${pageContext.request.contextPath}/playList/savePlayList.do',
            contentType: "application/json;charset=utf-8",
            type: "GET",
            data: {"songs_ids": ids},
            traditional: true,
            success: function (res) {
                console.log(res);//打印服务端返回的数据(调试用)
                if (res == 101) {
                    alert("成功");
                } else {
                    alert("插入失败,请重新插入1");
                }
            },
            error: function () {
                alert("插入失败,请重新插入2");
            }
        });


    };


    // 添加到歌单按钮
    function add_songmenu_button(song_id) {
        console.log("song_id:" + song_id);
        // 获取该对象
        songmenu_songs_id = song_id;
        console.log("songmenu_songs_id:" + songmenu_songs_id);
        $('#add_playList_'+song_id).after($('#songmenu_menu_ul'));

    };


    // 选择歌单添加
    function add_songmenu_li(songmenu_id) {
        console.log("add_songmenu_li:" + songmenu_id);

        // 异步发请求存取
        $.ajax({
            url: '${pageContext.request.contextPath}/songsmenu/save_songmenu_songs.do?songsmenu_id='+songmenu_id+"&songs_id="+ songmenu_songs_id,
            contentType: "application/json;charset=utf-8",
            type: "POST",
            traditional: true,
            success: function (res) {
                console.log(res);//打印服务端返回的数据(调试用)
                if (res == 101) {
                    alert("添加歌单成功");
                } else {
                    alert("添加歌单失败,请重新插入1");
                }
            },
            error: function () {
                alert("插入歌单失败,请重新插入2");
            }
        });

    };


    // 第二版
    // function play_allSongs() {
    //     console.log("点击播放全部");
    //     var arr_url=[];
    //     // 获取该专辑所有歌曲地址和id 再调用
    //     var b = $('#songs_ul li');  // 获取歌曲所有li
    //     // console.log(b,b.length);
    //     // 遍历获得所有播放和暂停键
    //     for (var i=b.length; i>=0; i--) {
    //
    //         // 获取歌曲地址
    //         var s_url = $('#songs_url_' +(i-1)).val();
    //         arr_url.push(s_url);
    //
    //     }
    //     console.log(arr_url);
    //
    //     play_all_songs(arr_url);
    //
    // };

    // 第一版
    // function play_allSongs() {
    //     console.log("点击播放全部");
    //     var arr_url=[];
    //     // 获取该专辑所有歌曲地址和id 再调用
    //     var b = $('#songs_ul li');  // 获取歌曲所有li
    //     // console.log(b,b.length);
    //     // 遍历获得所有播放和暂停键
    //     for (var i=b.length; i>=0; i--) {
    //
    //         // 获取歌曲地址
    //         var s_url = $('#songs_url_' +(i-1)).val();
    //         arr_url.push(s_url);
    //
    //     }
    //     console.log(arr_url);
    //
    //     play_all_songs(arr_url);
    //
    // };

    //下载
    function download_songs(songs_id) {
        console.log("下载");
      window.location.href = "${pageContext.request.contextPath}/download/downLoadFile.do?fileName="+songs_id;
    };

</script>
</html>
