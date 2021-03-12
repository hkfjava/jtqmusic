<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 陈小心
  Date: 2021/3/3
  Time: 下午 07:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8"/>
    <title>静听轻音乐网</title>
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
                <section class="hbox stretch">
                    <section>
                        <section class="vbox">
                            <section class="scrollable padder-lg w-f-md" id="bjax-target">
                                <a href="#" class="pull-right text-muted m-t-lg" data-toggle="class:fa-spin"><i
                                        class="icon-refresh i-lg  inline" id="refresh"></i></a>
                                <h2 class="font-thin m-b">发现 <span class="musicbar animate inline m-l-sm"
                                                                   style="width:20px;height:20px">
                    <span class="bar1 a1 bg-primary lter"></span>
                    <span class="bar2 a2 bg-info lt"></span>
                    <span class="bar3 a3 bg-success"></span>
                    <span class="bar4 a4 bg-warning dk"></span>
                    <span class="bar5 a5 bg-danger dker"></span>
                  </span></h2>
                                <div class="row row-sm">

                                    <c:forEach items="${songs_find}" var="song">
                                        <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                            <div class="item">
                                                <div class="pos-rlt">
                                                    <div class="bottom">
                                                        <span class="badge bg-info m-l-sm m-b-sm">03:20</span>
                                                    </div>
                                                    <div class="item-overlay opacity r r-2x bg-black">
                                                        <div class="text-info padder m-t-sm text-sm">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o text-muted"></i>
                                                        </div>
                                                        <div class="center text-center m-t-n">
                                                            <div><i flag="0" onclick="songs_play_pause(this)"
                                                                    id="${song.songs.songs_id}"
                                                                    class="icon-control-play i-2x">
                                                            </i>
                                                                <input hidden
                                                                       id="songs_url_input_${song.songs.songs_id}"
                                                                       value="${song.songs.songs_url}"/>
                                                                    <%-- 歌曲名字 --%>
                                                                <input hidden id="songs_name_find_${song.songs.songs_id}"
                                                                       value="${song.songs.songs_name}"/>
                                                                <input hidden id="songs_singer_name_find_${song.songs.songs_id}"
                                                                       value="${song.singer.singer_name}"/>
                                                                <input hidden id="songs_singer_id_find_${song.songs.songs_id}"
                                                                       value="${song.singer.singer_id}"/>
                                                                <input hidden id="songs_album_imgUrl_find_${song.songs.songs_id}"
                                                                       value="${song.album.album_imgUrl}"/>

                                                            </div>
                                                        </div>
                                                        <div class="bottom padder m-b-sm">
                                                            <span onclick="coll_songs(${song.songs.songs_id})" class="pull-right">

                                                                <i  id="coll_${song.songs.songs_id}" class="fa fa-heart-o

                                                                "></i>
                                                            </span>
                                                            <span >
                                                                <span  class="icon-plus"></span>
                                                            </span>


                                                        </div>
                                                    </div>
                                                    <a href="#"><img src="${song.album.album_imgUrl}" alt=""
                                                                     class="r r-2x img-full"></a>
                                                </div>

                                                <div class="padder-v">
                                                    <div style="color: black">${song.songs.songs_name}</div>
                                                    <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${song.singer.singer_id}"
                                                       class="text-ellipsis text-xs text-muted">${song.singer.singer_name}</a>
                                                </div>

                                            </div>

                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="row">
                                    <div class="col-md-7">
                                        <h3 class="font-thin">最新歌曲</h3>
                                        <div class="row row-sm">
                                            <c:forEach items="${songs_new}" var="song">
                                                <div class="col-xs-6 col-sm-3">
                                                    <div class="item">
                                                        <div class="pos-rlt">
                                                            <div class="item-overlay opacity r r-2x bg-black">
                                                                <div class="center text-center m-t-n">
                                                                    <a href="#"><i flag="0"
                                                                                   onclick="songs_new_play_pause(this)"
                                                                                   id="${song.songs.songs_id + 5}"
                                                                                   class="fa fa-play-circle i-2x"></i></a>
                                                                    <input hidden
                                                                           id="songs_new_url_input_${song.songs.songs_id}"
                                                                           value="${song.songs.songs_url}"/>

                                                                        <%-- 歌曲名字 --%>
                                                                    <input hidden id="songs_name_new1_${song.songs.songs_id}"
                                                                           value="${song.songs.songs_name}"/>
                                                                    <input hidden id="songs_singer_name_new1_${song.songs.songs_id}"
                                                                           value="${song.singer.singer_name}"/>
                                                                    <input hidden id="songs_singer_id_new1_${song.songs.songs_id}"
                                                                           value="${song.singer.singer_id}"/>
                                                                    <input hidden id="songs_album_imgUrl_new1_${song.songs.songs_id}"
                                                                           value="${song.album.album_imgUrl}"/>


                                                                </div>
                                                            </div>
                                                            <a href="#"><img src="${song.album.album_imgUrl}" alt=""
                                                                             class="r r-2x img-full"></a>
                                                        </div>
                                                        <div class="padder-v">
                                                            <div style="color: black">${song.songs.songs_name}</div>
                                                            <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${song.singer.singer_id}"
                                                               class="text-ellipsis text-xs text-muted">${song.singer.singer_name}</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div><h3 class="font-thin">排行榜</h3><h6 style="color: grey">(点击歌曲名可播放)</h6></div>

                                        <div class="list-group bg-white list-group-lg no-bg auto">
                                            <c:forEach items="${songs_rank}" var="song" varStatus="status">
                                                <div class="list-group-item clearfix">
                                                    <span class="pull-right h2 text-muted m-l">${status.count}</span>
                                                    <span class="pull-left thumb-sm avatar m-r">
                            <a href="${pageContext.request.contextPath}/album/findById.do?album_id=${song.album.album_id}&singer_id=${song.singer.singer_id}"><img
                                    src="${song.album.album_imgUrl}" alt="..."></a>
                          </span>
                                                    <span class="clear">
                            <span onclick="songs_play_pause_songName(this)" id="${song.songs.songs_id - 5}"
                                  style="color: black">${song.songs.songs_name}</span>
                                                        <input hidden id="songs_new_url_input_${song.songs.songs_id}"
                                                               value="${song.songs.songs_url}"/>
                                                        <%-- 歌曲名字 --%>
                                                        <input hidden id="songs_name_new_${song.songs.songs_id}"
                                                               value="${song.songs.songs_name}"/>
                                                        <input hidden id="songs_singer_name_new_${song.songs.songs_id}"
                                                               value="${song.singer.singer_name}"/>
                                                        <input hidden id="songs_singer_id_new_${song.songs.songs_id}"
                                                               value="${song.singer.singer_id}"/>
                                                        <input hidden id="songs_album_imgUrl_new_${song.songs.songs_id}"
                                                               value="${song.album.album_imgUrl}"/>
                            <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${song.singer.singer_id}"><small
                                    class="text-muted clear text-ellipsis">${song.singer.singer_name}</small></a>
                          </span>
                                                </div>
                                            </c:forEach>

                                        </div>
                                    </div>
                                </div>
                                <div class="row m-t-lg m-b-lg">
                                    <div class="col-sm-6">
                                        <div class="bg-primary wrapper-md r">
                                            <a href="#">
                                                <span class="h4 m-b-xs block"><i class=" icon-user-follow i-lg"></i> 登录和创建账号</span>
                                                <span class="text-muted">登录和创建账户后可以保存和分享您的歌曲</span>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="bg-black wrapper-md r">
                                            <a href="${pageContext.request.contextPath}/user/findAll.do">
                                                <span class="h4 m-b-xs block"><i class="icon-cloud-download i-lg"></i> 下载app</span>
                                                <span class="text-muted">可在电脑和手机上随时随地听取音乐.</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <%-- 引入底部音乐播放页面 --%>
                            <%@ include file="common/footer.jsp" %>
                        </section>
                    </section>

                </section>
                <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open"
                   data-target="#nav,html"></a>
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

    // 给用户收藏的歌曲 收藏为红
    $(document).ready(function () {
      // 遍历所有歌曲
      v


    });

    // 排行榜点击歌曲名字播放
    function songs_play_pause_songName(obj) {
        console.log("点击排行榜歌曲名字播放");
        // 获取点击的歌曲id和地址
        var id = $(obj).attr("id");

        // console.log(parseInt(id));
        // 获取地址
        var s_url = $('#songs_url_input_' + (parseInt(id) + 5)).val();

        var id_new = parseInt(id) + 5;

        // 获取歌手id，歌曲名字，歌手名字，歌曲id，专辑图片
        var s_name = $("#songs_name_new_" + id_new).val();
        var s_name_singer = $("#songs_singer_name_new_" + id_new).val();
        var s_id_singer = $("#songs_singer_id_new_" + id_new).val();
        var s_album_img = $("#songs_album_imgUrl_new_" + id_new).val();

        // console.log(s_name);
        // console.log(s_name_singer);
        // console.log(s_id_singer);
        // console.log(s_album_img);

        // 执行方法
        getSongs_info_play(s_name, s_name_singer, s_id_singer, s_album_img);

        // 播放
        console.log(s_url);
        play_songs(s_url);


    };



    // 推荐歌曲播放
    function songs_play_pause(obj) {
        console.log("点击首页播放");

        // 获取点击的歌曲id和地址
        var id = $(obj).attr("id");

        song_url_s = id

        console.log(id);
        // 获取地址
        var s_url = $('#songs_url_input_' + id).val();

        console.log(s_url);

        // 修改图标样式 flag的值 0 为三角 1为竖线
        var flag = $(obj).attr("flag");
        if (flag == 0) {
            $(obj).removeClass("icon-control-play");
            $(obj).addClass("icon-control-pause");
            $(obj).attr("flag", 1);
            // 播放歌曲
            play_songs(s_url);
        } else if (flag == 1) {

            $(obj).removeClass("icon-control-pause");
            $(obj).addClass("icon-control-play");
            $(obj).attr("flag", 0);

            // 暂停歌曲
            pauseAudio(s_url);
        }

        // 获取歌手id，歌曲名字，歌手名字，歌曲id，专辑图片
        var s_name = $("#songs_name_find_" + id).val();
        var s_name_singer = $("#songs_singer_name_find_" + id).val();
        var s_id_singer = $("#songs_singer_id_find_" + id).val();
        var s_album_img = $("#songs_album_imgUrl_find_" + id).val();


        // 执行方法
        getSongs_info_play(s_name, s_name_singer, s_id_singer, s_album_img);


    };

    // 创建函数，让歌曲播放按钮从三角到竖线 开始播放 状态：暂停-》播放
    function change_playByPause(id) {
        console.log("改变的根据id获取的i标签对象" + $('#' + id).attr('flag'));
        $('#' + id).removeClass("icon-control-play");
        $('#' + id).addClass("icon-control-pause");
        $('#' + id).attr("flag", 1);

    };

    function change_pauseByPaly(id) {
        $('#' + id).removeClass("icon-control-pause");
        $('#' + id).addClass("icon-control-play");
        $('#' + id).attr("flag", 0);

    };


    // 最新歌曲播放  id名字 +5 和 上面部分区分
    function songs_new_play_pause(obj) {
        console.log("点击最新播放");

        // 获取点击的歌曲id和地址
        var id = $(obj).attr("id");

        song_url_s_new = id;

        console.log("id" + id);
        console.log("song_url_s_new" + song_url_s_new);
        // 获取地址
        var s_url = $('#songs_new_url_input_' + (parseInt(id) - 5)).val();

        console.log(s_url);

        // 修改图标样式 flag的值 0 为三角 1为竖线
        var flag = $(obj).attr("flag");
        if (flag == 0) {
            $(obj).removeClass("fa-play-circle");
            $(obj).addClass("fa-pause");
            $(obj).attr("flag", 1);
            // 播放歌曲
            play_songs(s_url);
        } else if (flag == 1) {

            $(obj).removeClass("fa-pause");
            $(obj).addClass("fa-play-circle");
            $(obj).attr("flag", 0);

            // 暂停歌曲
            pauseAudio(s_url);
        }

        var id_new = parseInt(id) - 5;

        // 获取歌手id，歌曲名字，歌手名字，歌曲id，专辑图片
        var s_name = $("#songs_name_new1_" + id_new).val();
        var s_name_singer = $("#songs_singer_name_new1_" + id_new).val();
        var s_id_singer = $("#songs_singer_id_new1_" + id_new).val();
        var s_album_img = $("#songs_album_imgUrl_new1_" + id_new).val();

        // console.log(s_name);
        // console.log(s_name_singer);
        // console.log(s_id_singer);
        // console.log(s_album_img);

        // 执行方法
        getSongs_info_play(s_name, s_name_singer, s_id_singer, s_album_img);




    };

    // 创建函数，让歌曲播放按钮从三角到竖线 开始播放 状态：暂停-》播放
    function change_playByPause_newSongs(id) {
        console.log("改变的根据id获" + id + "取的i标签对象" + $('#' + id).attr('flag'));
        $('#' + id).removeClass("fa-play-circle");
        $('#' + id).addClass("fa-pause");
        $('#' + id).attr("flag", 1);

    };

    function change_pauseByPaly_newSongs(id) {
        $('#' + id).removeClass("fa-pause");
        $('#' + id).addClass("fa-play-circle");
        $('#' + id).attr("flag", 0);

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


</script>


</html>
