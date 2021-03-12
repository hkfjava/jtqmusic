<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <section class="scrollable">
              <section class="hbox stretch">
                <aside class="aside-lg bg-light lter b-r">
                  <section class="vbox">
                    <section class="scrollable">
                      <div class="wrapper">
                        <div class="text-center m-b m-t">
                          <a href="#" class="thumb-lg">
                            <img src="${user.user_imgUrl}" class="img-circle">
                          </a>
                          <div>
                            <div class="h3 m-t-xs m-b-xs">${user.user_name}</div>
                            <small class="text-muted"><i class="icon-users"></i>&nbsp;&nbsp;&nbsp; <c:if test="${user.user_sex == 0}">男</c:if> <c:if test="${user.user_sex == 1}">女</c:if></small>
                          </div>
                        </div>

                        <div>
                          <p >个人信息：</p>
                        </div>
                          <div><small class="text-uc text-xs">账户名称：${user.user_account}</small></div>
                        <div><small class="text-uc text-xs">用户类型：<c:if test="${user.user_type == 0}">普通用户</c:if> <c:if test="${user.user_type == 1}">vip用户</c:if></small></div>
                        <div><small class="text-uc text-xs">注册时间：${user.user_signupTime_str}</small></div>
                        <div><small class="text-uc text-xs">电话：${user.user_phone}</small></div>
                      </div>
                    </section>
                  </section>
                </aside>
                <aside class="bg-white">
                  <section class="vbox">
                    <header class="header bg-light lt">
                      <ul class="nav nav-tabs nav-white">
                        <li class="active"><a href="#activity" data-toggle="tab">歌曲</a></li>
                        <li class=""><a href="#events" data-toggle="tab">专辑</a></li>
                        <li class=""><a href="#singer" data-toggle="tab">歌手</a></li>
                        <li class=""><a href="#interaction" data-toggle="tab">歌单</a></li>
                      </ul>
                    </header>
                    <section class="scrollable">
                      <div class="tab-content">
                        <div class="tab-pane active" id="activity">
                            <li class="list-group-item">
                                <div onclick="play_allSongs()" class="btn btn-info">私人电台</div>&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="btn btn-default">3 评论</a>
                            </li>
                          <ul class="pull-right dropdown-menu" id="songmenu_menu_ul">
                            <li><p style="text-align: center">歌单</p></li>
                            <li class="divider"></li>
                            <c:forEach items="${sessionScope.songMenus}" var="songmenu">
                              <li><span style="padding-left: 10px;" class="text-black"
                                        onclick="add_songmenu_li(${songmenu.songmenu_id})">${songmenu.songmenu_name}</span>
                              </li>
                            </c:forEach>

                          </ul>
                          <ul class="list-group list-group-lg" id="songs_ul">

                            <c:forEach items="${user_coll_songs_ids_info}" var="songs" varStatus="status" >
                              <li class="list-group-item" id="li_${songs.songs.songs_id}">
                                <div class="pull-right m-l">
                                  <span  onclick="coll_songs(${songs.songs.songs_id})" class="m-r-sm"><i id="coll_${songs.songs.songs_id}" class="icon-heart text-danger"></i></span>
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
                        <div class="tab-pane" id="events">
                          <ul class="list-group no-radius m-b-none m-t-n-xxs list-group-lg no-border">
                            <c:forEach items="${user_coll_album_ids_info}" var="albums">
                              <li class="list-group-item">
                                <a href="${pageContext.request.contextPath}/album/findById.do?album_id=${albums.album.album_id}&singer_id=${albums.album.singer_id}" class="thumb-sm pull-left m-r-sm">
                                  <img src="${albums.album.album_imgUrl}" class="img-circle">
                                </a>
                                  <a href="${pageContext.request.contextPath}/album/findById.do?album_id=${albums.album.album_id}&singer_id=${albums.album.singer_id}">
                                    <strong class="block">${albums.album.album_name}</strong></a>
                                  <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${albums.album.singer_id}">
                                    <small>${albums.singer.singer_name}</small>
                                    <span  class="m-r-sm pull-right"><i class="icon-heart text-danger"></i></span>
                                </a>

                              </li>
                            </c:forEach>

                          </ul>
                        </div>

                        <div class="tab-pane" id="singer">
                          <ul class="list-group no-radius m-b-none m-t-n-xxs list-group-lg no-border">
                            <c:forEach items="${user_coll_singer_ids_info}" var="singers">
                              <li class="list-group-item">
                                <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${singers.singer_id}" class="thumb-sm pull-left m-r-sm">
                                  <img src="${singers.singer_imgUrl}" class="img-circle">
                                </a>
                                <a href="#" class="clear">
                                  <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${singers.singer_id}">
                                    <strong class="block">${singers.singer_name}</strong></a>
                                  <small>热度：${singers.singer_heat}</small>
                                  <span  class="m-r-sm pull-right"><i class="icon-heart text-danger"></i></span>
                                </a>
                              </li>
                            </c:forEach>
                          </ul>
                        </div>
                        <div class="tab-pane" id="interaction">
                          <ul class="list-group no-radius m-b-none m-t-n-xxs list-group-lg no-border">
                            <c:forEach items="${songMenus}" var="songmenu">
                              <li class="list-group-item">

                                <span href="#" class="clear">
                                  <small class="pull-right">${songmenu.songmenu_label}</small>
                                  <a href="${pageContext.request.contextPath}/songsmenu/findBy_id.do?songmenu_id=${songmenu.songmenu_id}"><strong class="block">${songmenu.songmenu_name}</strong></a>
                                  <small>${songmenu.songmenu_info} </small>
                                </span>
                              </li>
                            </c:forEach>

                          </ul>
                        </div>
                      </div>
                    </section>
                  </section>
                </aside>
                <aside class="col-lg-3 b-l">
                  <section class="vbox">
                    <section class="scrollable padder-v">
                      <div class="panel">
                        <h4 class="font-thin padder">Latest Tweets</h4>
                        <ul class="list-group">
                          <li class="list-group-item">
                              <p>Wellcome <a href="#" class="text-info">@Drew Wllon</a> and play this web application template, have fun1 </p>
                              <small class="block text-muted"><i class="fa fa-clock-o"></i> 2 minuts ago</small>
                          </li>
                          <li class="list-group-item">
                              <p>Morbi nec <a href="#" class="text-info">@Jonathan George</a> nunc condimentum ipsum dolor sit amet, consectetur</p>
                              <small class="block text-muted"><i class="fa fa-clock-o"></i> 1 hour ago</small>
                          </li>
                          <li class="list-group-item">
                              <p><a href="#" class="text-info">@Josh Long</a> Vestibulum ullamcorper sodales nisi nec adipiscing elit. Morbi id neque quam. Aliquam sollicitudin venenatis</p>
                              <small class="block text-muted"><i class="fa fa-clock-o"></i> 2 hours ago</small>
                          </li>
                        </ul>
                      </div>
                      <div class="panel clearfix">
                        <div class="panel-body">
                          <a href="#" class="thumb pull-left m-r">
                            <img src="images/a0.png" class="img-circle">
                          </a>
                          <div class="clear">
                            <a href="#" class="text-info">@Mike Mcalidek <i class="fa fa-twitter"></i></a>
                            <small class="block text-muted">2,415 followers / 225 tweets</small>
                            <a href="#" class="btn btn-xs btn-success m-t-xs">Follow</a>
                          </div>
                        </div>
                      </div>
                    </section>
                  </section>
                </aside>
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
  <script src="js/charts/easypiechart/jquery.easy-pie-chart.js"></script>
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