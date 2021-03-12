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

                                                        <c:forEach items="${user_coll_songs_ids_info}" var="songs" varStatus="status" >
                                                            <li class="list-group-item" id="li_${songs.songs.songs_id}">
                                                                <div class="pull-right m-l">
                                                                    <span  onclick="coll_songs(${songs.songs.songs_id})" class="m-r-sm"><i id="coll_${songs.songs.songs_id}" class="icon-heart"></i></span>
                                                                    <span onclick="download_songs(${songs.songs.songs_id})"  class="m-r-sm"><i class="icon-cloud-download"></i></span>
                                                                    <span onclick="add_songmenu_button(${songs.songs.songs_id})" id="add_playList_${songs.songs.songs_id}" class="m-r-sm dropdown-toggle" data-toggle="dropdown"><i class="icon-plus"></i></span>
                                                                </div>
                                                                <a href="#" class="jp-play-me m-r-sm pull-left">
                                                                    <i id="songs_play_${status.index}" onclick="songs_play(${status.index})" class="icon-control-play text"></i>
                                                                    <i id="songs_pause_${status.index}" onclick="songs_pause(${status.index})" class="icon-control-pause text-active"></i>
                                                                </a>
                                                                <div class="clear text-ellipsis">
                                                                    <input hidden id="album_detail_songs_songs_id_${status.index}"   value="${songs.songs.songs_id}"  />
                                                                    <input hidden id="songs_url_${status.index}"   value="${songs.songs.songs_url}"  />
                                                                    <span id="songs_name_new_${status.index}">${songs.songs.songs_name}</span>
                                                                    <input hidden id="singer_name_new_${status.index}" value="${songs.singer.singer_name}"/>
                                                                    <input hidden id="singer_id_new_${status.index}" value="${songs.singer.singer_id}"/>
                                                                    <input hidden id="album_imgUrl_new_${status.index}" value="${songs.album.album_imgUrl}"/>
                                                                    <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${songs.singer.singer_id}"><span class="text-primary" >------${songs.singer.singer_name}</span></a>
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
                                                                            <a href="${pageContext.request.contextPath}/album/findById.do?album_id=${album.album_id}" data-bjax data-target="#bjax-target" data-el="#bjax-el" data-replace="true" class="text-ellipsis">${album.album_name}</a>
                                                                            <span  data-bjax data-target="#bjax-target" data-el="#bjax-el" data-replace="true" class="text-ellipsis text-xs text-muted">${album.album_issueDate_str}</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:forEach>
                                                        </div>

                                                    </section>






                                            </div>

                                                    <%--歌手--%><div class="tab-pane" id="like">

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
                                                                                <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${singer.singer_id}" data-bjax data-target="#bjax-target" data-el="#bjax-el" data-replace="true" class="text-ellipsis">${singer.singer_name}</a>
                                                                                <span data-bjax data-target="#bjax-target" data-el="#bjax-el" data-replace="true" class="text-ellipsis text-xs text-muted">收藏：${singer.singer_collCount}</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                            </div>

                                                        </section>

                                                    </div>
                                        </div>
                                        </div>
                                    </section>



                                </div>
                            </div>

                        </div>
                    </section>
                    <%-- 引入底部音乐播放页面 --%>
                    <%@ include file="common/footer.jsp" %>
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



</body>
<script type="text/javascript">


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
                        // 移除li
                        $('#li_' + songs_id).remove();

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
        var s_name_singer = $("#singer_name_new_" + a).val();
        var s_id_singer = $("#singer_id_new_" + a).val();
        var s_album_img = $("#album_imgUrl_new_" + a).val();


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

    function download_songs(songs_id) {
        console.log("下载");
        window.location.href = "${pageContext.request.contextPath}/download/downLoadFile.do?fileName="+songs_id;
    };


</script>
</html>
