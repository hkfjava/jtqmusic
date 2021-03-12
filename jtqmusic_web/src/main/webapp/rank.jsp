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
    <%@include file="common/head.jsp"%>
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
                                <h2 class="font-thin m-b">排行榜 <span class="musicbar animate inline m-l-sm"
                                                                   style="width:20px;height:20px">
                    <span class="bar1 a1 bg-primary lter"></span>
                    <span class="bar2 a2 bg-info lt"></span>
                    <span class="bar3 a3 bg-success"></span>
                    <span class="bar4 a4 bg-warning dk"></span>
                    <span class="bar5 a5 bg-danger dker"></span>
                  </span></h2>
                                <h6 style="color: grey">(点击歌曲名可播放)</h6>

                                <%-- 第一行 --%>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div><h3 class="font-thin">播放量榜</h3></div>

                                        <div class="list-group bg-white list-group-lg no-bg auto">
                                            <c:forEach items="${songs_playCounts_rank}" var="song" varStatus="status">
                                                <div class="list-group-item clearfix">
                                                    <span class="pull-right h2 text-muted m-l">${status.count}</span>
                                                    <span class="pull-left thumb-sm avatar m-r">
                            <a href="${pageContext.request.contextPath}/album/findById.do?album_id=${song.album.album_id}&singer_id=${song.singer.singer_id}"><img
                                    src="${song.album.album_imgUrl}" alt="..."></a>
                          </span>
                                                    <span class="clear">
                            <span onclick="songs_play_pause_songName(this,'playCount')" id_playCount="${song.songs.songs_id}"
                                  style="color: black">${song.songs.songs_name}</span>
                                                        <input hidden id="songs_playCount_url_input_${song.songs.songs_id}"
                                                               value="${song.songs.songs_url}"/>
                                                        <%-- 歌曲名字 --%>
                                                        <input hidden id="songs_name_playCount_${song.songs.songs_id}"
                                                               value="${song.songs.songs_name}"/>
                                                        <input hidden id="songs_singer_name_playCount_${song.songs.songs_id}"
                                                               value="${song.singer.singer_name}"/>
                                                        <input hidden id="songs_singer_id_playCount_${song.songs.songs_id}"
                                                               value="${song.singer.singer_id}"/>
                                                        <input hidden id="songs_album_imgUrl_playCount_${song.songs.songs_id}"
                                                               value="${song.album.album_imgUrl}"/>
                            <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${song.singer.singer_id}"><small
                                    class="text-muted clear text-ellipsis">${song.singer.singer_name}</small></a>
                          </span>
                                                </div>
                                            </c:forEach>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div><h3 class="font-thin">下载榜</h3></div>

                                        <div class="list-group bg-white list-group-lg no-bg auto">
                                            <c:forEach items="${songs_downloadCounts_rank}" var="song" varStatus="status">
                                                <div class="list-group-item clearfix">
                                                    <span class="pull-right h2 text-muted m-l">${status.count}</span>
                                                    <span class="pull-left thumb-sm avatar m-r">
                            <a href="${pageContext.request.contextPath}/album/findById.do?album_id=${song.album.album_id}&singer_id=${song.singer.singer_id}"><img
                                    src="${song.album.album_imgUrl}" alt="..."></a>
                          </span>
                                                    <span class="clear">
                            <span onclick="songs_play_pause_songName(this,'downloadCount')" id_downloadCount="${song.songs.songs_id}"
                                  style="color: black">${song.songs.songs_name}</span>
                                                        <input hidden id="songs_downloadCount_url_input_${song.songs.songs_id}"
                                                               value="${song.songs.songs_url}"/>
                                                        <%-- 歌曲名字 --%>
                                                        <input hidden id="songs_name_downloadCount_${song.songs.songs_id}"
                                                               value="${song.songs.songs_name}"/>
                                                        <input hidden id="songs_singer_name_downloadCount_${song.songs.songs_id}"
                                                               value="${song.singer.singer_name}"/>
                                                        <input hidden id="songs_singer_id_downloadCount_${song.songs.songs_id}"
                                                               value="${song.singer.singer_id}"/>
                                                        <input hidden id="songs_album_imgUrl_downloadCount_${song.songs.songs_id}"
                                                               value="${song.album.album_imgUrl}"/>
                            <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${song.singer.singer_id}"><small
                                    class="text-muted clear text-ellipsis">${song.singer.singer_name}</small></a>
                          </span>
                                                </div>
                                            </c:forEach>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div><h3 class="font-thin">收藏榜</h3></div>

                                        <div class="list-group bg-white list-group-lg no-bg auto">
                                            <c:forEach items="${songs_collCounts_rank}" var="song" varStatus="status">
                                                <div class="list-group-item clearfix">
                                                    <span class="pull-right h2 text-muted m-l">${status.count}</span>
                                                    <span class="pull-left thumb-sm avatar m-r">
                            <a href="${pageContext.request.contextPath}/album/findById.do?album_id=${song.album.album_id}&singer_id=${song.singer.singer_id}"><img
                                    src="${song.album.album_imgUrl}" alt="..."></a>
                          </span>
                                                    <span class="clear">
                            <span onclick="songs_play_pause_songName(this,'collCount')" id_collCount="${song.songs.songs_id}"
                                  style="color: black">${song.songs.songs_name}</span>
                                                        <input hidden id="songs_collCount_url_input_${song.songs.songs_id}"
                                                               value="${song.songs.songs_url}"/>
                                                        <%-- 歌曲名字 --%>
                                                        <input hidden id="songs_name_collCount_${song.songs.songs_id}"
                                                               value="${song.songs.songs_name}"/>
                                                        <input hidden id="songs_singer_name_collCount_${song.songs.songs_id}"
                                                               value="${song.singer.singer_name}"/>
                                                        <input hidden id="songs_singer_id_collCount_${song.songs.songs_id}"
                                                               value="${song.singer.singer_id}"/>
                                                        <input hidden id="songs_album_imgUrl_collCount_${song.songs.songs_id}"
                                                               value="${song.album.album_imgUrl}"/>
                            <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${song.singer.singer_id}"><small
                                    class="text-muted clear text-ellipsis">${song.singer.singer_name}</small></a>
                          </span>
                                                </div>
                                            </c:forEach>

                                        </div>
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-md-4">
                                        <div><h3 class="font-thin">歌手榜</h3></div>

                                        <div class="list-group bg-white list-group-lg no-bg auto">
                                            <c:forEach items="${singer_heat_rank}" var="singer" varStatus="status">
                                                <div class="list-group-item clearfix">
                                                    <span class="pull-right h2 text-muted m-l">${status.count}</span>
                                                    <span class="pull-left thumb-sm avatar m-r">
                            <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${singer.singer_id}"><img
                                    src="${singer.singer_imgUrl}" alt="..."></a>
                          </span>
                                                    <span class="clear">
                            <span style="color: black">${singer.singer_name}</span>
                            <span><small
                                    class="text-muted clear text-ellipsis"><i class="icon-fire">&nbsp;&nbsp;${singer.singer_heat}</i></small></span>
                          </span>
                                                </div>
                                            </c:forEach>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div><h3 class="font-thin">专辑榜</h3></div>

                                        <div class="list-group bg-white list-group-lg no-bg auto">
                                            <c:forEach items="${album_collCount_ranks}" var="album" varStatus="status">
                                                <div class="list-group-item clearfix">
                                                    <span class="pull-right h2 text-muted m-l">${status.count}</span>
                                                    <span class="pull-left thumb-sm avatar m-r">
                            <a href="${pageContext.request.contextPath}/album/findById.do?album_id=${album.album.album_id}&singer_id=${album.singer.singer_id}"><img
                                    src="${album.album.album_imgUrl}" alt="..."></a>
                          </span>
                                                    <span class="clear">
                            <span
                                  style="color: black">${album.album.album_name}</span>
                            <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${album.singer.singer_id}"><small
                                    class="text-muted clear text-ellipsis">${album.singer.singer_name}</small></a>
                          </span>
                                                </div>
                                            </c:forEach>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <h3 class="font-thin">专辑榜</h3>
                                        <div class="list-group bg-white list-group-lg no-bg auto">
                                            <a href="#" class="list-group-item clearfix">
                                                <span class="pull-right h2 text-muted m-l">1</span>
                                                <span class="pull-left thumb-sm avatar m-r">
                            <img src="images/a4.png" alt="...">
                          </span>
                                                <span class="clear">
                            <span>Little Town</span>
                            <small class="text-muted clear text-ellipsis">by Chris Fox</small>
                          </span>
                                            </a>
                                            <a href="#" class="list-group-item clearfix">
                                                <span class="pull-right h2 text-muted m-l">2</span>
                                                <span class="pull-left thumb-sm avatar m-r">
                            <img src="images/a5.png" alt="...">
                          </span>
                                                <span class="clear">
                            <span>Lementum ligula vitae</span>
                            <small class="text-muted clear text-ellipsis">by Amanda Conlan</small>
                          </span>
                                            </a>
                                            <a href="#" class="list-group-item clearfix">
                                                <span class="pull-right h2 text-muted m-l">3</span>
                                                <span class="pull-left thumb-sm avatar m-r">
                            <img src="images/a6.png" alt="...">
                          </span>
                                                <span class="clear">
                            <span>Aliquam sollicitudin venenatis</span>
                            <small class="text-muted clear text-ellipsis">by Dan Doorack</small>
                          </span>
                                            </a>
                                            <a href="#" class="list-group-item clearfix">
                                                <span class="pull-right h2 text-muted m-l">4</span>
                                                <span class="pull-left thumb-sm avatar m-r">
                            <img src="images/a7.png" alt="...">
                          </span>
                                                <span class="clear">
                            <span>Aliquam sollicitudin venenatis ipsum</span>
                            <small class="text-muted clear text-ellipsis">by Lauren Taylor</small>
                          </span>
                                            </a>
                                            <a href="#" class="list-group-item clearfix">
                                                <span class="pull-right h2 text-muted m-l">5</span>
                                                <span class="pull-left thumb-sm avatar m-r">
                            <img src="images/a8.png" alt="...">
                          </span>
                                                <span class="clear">
                            <span>Vestibulum ullamcorper</span>
                            <small class="text-muted clear text-ellipsis">by Dan Doorack</small>
                          </span>
                                            </a>
                                        </div>
                                    </div>


                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div><h3 class="font-thin">轻音乐榜</h3></div>

                                        <div class="list-group bg-white list-group-lg no-bg auto">
                                            <c:forEach items="${songs_classify_1_ranks}" var="song" varStatus="status">
                                                <div class="list-group-item clearfix">
                                                    <span class="pull-right h2 text-muted m-l">${status.count}</span>
                                                    <span class="pull-left thumb-sm avatar m-r">
                            <a href="${pageContext.request.contextPath}/album/findById.do?album_id=${song.album.album_id}&singer_id=${song.singer.singer_id}"><img
                                    src="${song.album.album_imgUrl}" alt="..."></a>
                          </span>
                                                    <span class="clear">
                            <span onclick="songs_play_pause_songName(this,'classify_1')" id_classify_1="${song.songs.songs_id}"
                                  style="color: black">${song.songs.songs_name}</span>
                                                        <input hidden id="songs_classify_1_url_input_${song.songs.songs_id}"
                                                               value="${song.songs.songs_url}"/>
                                                        <%-- 歌曲名字 --%>
                                                        <input hidden id="songs_name_classify_1_${song.songs.songs_id}"
                                                               value="${song.songs.songs_name}"/>
                                                        <input hidden id="songs_singer_name_classify_1_${song.songs.songs_id}"
                                                               value="${song.singer.singer_name}"/>
                                                        <input hidden id="songs_singer_id_classify_1_${song.songs.songs_id}"
                                                               value="${song.singer.singer_id}"/>
                                                        <input hidden id="songs_album_imgUrl_classify_1_${song.songs.songs_id}"
                                                               value="${song.album.album_imgUrl}"/>
                            <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${song.singer.singer_id}"><small
                                    class="text-muted clear text-ellipsis">${song.singer.singer_name}</small></a>
                          </span>
                                                </div>
                                            </c:forEach>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div><h3 class="font-thin">新世纪榜</h3></div>

                                        <div class="list-group bg-white list-group-lg no-bg auto">
                                            <c:forEach items="${songs_classify_2_ranks}" var="song" varStatus="status">
                                                <div class="list-group-item clearfix">
                                                    <span class="pull-right h2 text-muted m-l">${status.count}</span>
                                                    <span class="pull-left thumb-sm avatar m-r">
                            <a href="${pageContext.request.contextPath}/album/findById.do?album_id=${song.album.album_id}&singer_id=${song.singer.singer_id}"><img
                                    src="${song.album.album_imgUrl}" alt="..."></a>
                          </span>
                                                    <span class="clear">
                            <span onclick="songs_play_pause_songName(this,'classify_2')" id_classify_2="${song.songs.songs_id}"
                                  style="color: black">${song.songs.songs_name}</span>
                                                        <input hidden id="songs_classify_2_url_input_${song.songs.songs_id}"
                                                               value="${song.songs.songs_url}"/>
                                                        <%-- 歌曲名字 --%>
                                                        <input hidden id="songs_name_classify_2_${song.songs.songs_id}"
                                                               value="${song.songs.songs_name}"/>
                                                        <input hidden id="songs_singer_name_classify_2_${song.songs.songs_id}"
                                                               value="${song.singer.singer_name}"/>
                                                        <input hidden id="songs_singer_id_classify_2_${song.songs.songs_id}"
                                                               value="${song.singer.singer_id}"/>
                                                        <input hidden id="songs_album_imgUrl_classify_2_${song.songs.songs_id}"
                                                               value="${song.album.album_imgUrl}"/>
                            <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${song.singer.singer_id}"><small
                                    class="text-muted clear text-ellipsis">${song.singer.singer_name}</small></a>
                          </span>
                                                </div>
                                            </c:forEach>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div><h3 class="font-thin">古典榜</h3></div>

                                        <div class="list-group bg-white list-group-lg no-bg auto">
                                            <c:forEach items="${songs_classify_3_ranks}" var="song" varStatus="status">
                                                <div class="list-group-item clearfix">
                                                    <span class="pull-right h2 text-muted m-l">${status.count}</span>
                                                    <span class="pull-left thumb-sm avatar m-r">
                            <a href="${pageContext.request.contextPath}/album/findById.do?album_id=${song.album.album_id}&singer_id=${song.singer.singer_id}"><img
                                    src="${song.album.album_imgUrl}" alt="..."></a>
                          </span>
                                                    <span class="clear">
                            <span onclick="songs_play_pause_songName(this,'classify_3')" id_classify_3="${song.songs.songs_id}"
                                  style="color: black">${song.songs.songs_name}</span>
                                                        <input hidden id="songs_classify_3_url_input_${song.songs.songs_id}"
                                                               value="${song.songs.songs_url}"/>
                                                        <%-- 歌曲名字 --%>
                                                        <input hidden id="songs_name_classify_3_${song.songs.songs_id}"
                                                               value="${song.songs.songs_name}"/>
                                                        <input hidden id="songs_singer_name_classify_3_${song.songs.songs_id}"
                                                               value="${song.singer.singer_name}"/>
                                                        <input hidden id="songs_singer_id_classify_3_${song.songs.songs_id}"
                                                               value="${song.singer.singer_id}"/>
                                                        <input hidden id="songs_album_imgUrl_classify_3_${song.songs.songs_id}"
                                                               value="${song.album.album_imgUrl}"/>
                            <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${song.singer.singer_id}"><small
                                    class="text-muted clear text-ellipsis">${song.singer.singer_name}</small></a>
                          </span>
                                                </div>
                                            </c:forEach>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div><h3 class="font-thin">中国榜</h3></div>

                                        <div class="list-group bg-white list-group-lg no-bg auto">
                                            <c:forEach items="${songs_region_4_rank}" var="song" varStatus="status">
                                                <div class="list-group-item clearfix">
                                                    <span class="pull-right h2 text-muted m-l">${status.count}</span>
                                                    <span class="pull-left thumb-sm avatar m-r">
                            <a href="${pageContext.request.contextPath}/album/findById.do?album_id=${song.album.album_id}&singer_id=${song.singer.singer_id}"><img
                                    src="${song.album.album_imgUrl}" alt="..."></a>
                          </span>
                                                    <span class="clear">
                            <span onclick="songs_play_pause_songName(this,'region_4')" id_region_4="${song.songs.songs_id}"
                                  style="color: black">${song.songs.songs_name}</span>
                                                        <input hidden id="songs_region_4_url_input_${song.songs.songs_id}"
                                                               value="${song.songs.songs_url}"/>
                                                        <%-- 歌曲名字 --%>
                                                        <input hidden id="songs_name_region_4_${song.songs.songs_id}"
                                                               value="${song.songs.songs_name}"/>
                                                        <input hidden id="songs_singer_name_region_4_${song.songs.songs_id}"
                                                               value="${song.singer.singer_name}"/>
                                                        <input hidden id="songs_singer_id_region_4_${song.songs.songs_id}"
                                                               value="${song.singer.singer_id}"/>
                                                        <input hidden id="songs_album_imgUrl_region_4_${song.songs.songs_id}"
                                                               value="${song.album.album_imgUrl}"/>
                            <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${song.singer.singer_id}"><small
                                    class="text-muted clear text-ellipsis">${song.singer.singer_name}</small></a>
                          </span>
                                                </div>
                                            </c:forEach>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div><h3 class="font-thin">韩国榜</h3></div>

                                        <div class="list-group bg-white list-group-lg no-bg auto">
                                            <c:forEach items="${songs_region_5_rank}" var="song" varStatus="status">
                                                <div class="list-group-item clearfix">
                                                    <span class="pull-right h2 text-muted m-l">${status.count}</span>
                                                    <span class="pull-left thumb-sm avatar m-r">
                            <a href="${pageContext.request.contextPath}/album/findById.do?album_id=${song.album.album_id}&singer_id=${song.singer.singer_id}"><img
                                    src="${song.album.album_imgUrl}" alt="..."></a>
                          </span>
                                                    <span class="clear">
                            <span onclick="songs_play_pause_songName(this,'region_5')" id_region_5="${song.songs.songs_id}"
                                  style="color: black">${song.songs.songs_name}</span>
                                                        <input hidden id="songs_region_5_url_input_${song.songs.songs_id}"
                                                               value="${song.songs.songs_url}"/>
                                                        <%-- 歌曲名字 --%>
                                                        <input hidden id="songs_name_region_5_${song.songs.songs_id}"
                                                               value="${song.songs.songs_name}"/>
                                                        <input hidden id="songs_singer_name_region_5_${song.songs.songs_id}"
                                                               value="${song.singer.singer_name}"/>
                                                        <input hidden id="songs_singer_id_region_5_${song.songs.songs_id}"
                                                               value="${song.singer.singer_id}"/>
                                                        <input hidden id="songs_album_imgUrl_region_5_${song.songs.songs_id}"
                                                               value="${song.album.album_imgUrl}"/>
                            <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${song.singer.singer_id}"><small
                                    class="text-muted clear text-ellipsis">${song.singer.singer_name}</small></a>
                          </span>
                                                </div>
                                            </c:forEach>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div><h3 class="font-thin">日本榜</h3></div>

                                        <div class="list-group bg-white list-group-lg no-bg auto">
                                            <c:forEach items="${songs_region_6_rank}" var="song" varStatus="status">
                                                <div class="list-group-item clearfix">
                                                    <span class="pull-right h2 text-muted m-l">${status.count}</span>
                                                    <span class="pull-left thumb-sm avatar m-r">
                            <a href="${pageContext.request.contextPath}/album/findById.do?album_id=${song.album.album_id}&singer_id=${song.singer.singer_id}"><img
                                    src="${song.album.album_imgUrl}" alt="..."></a>
                          </span>
                                                    <span class="clear">
                            <span onclick="songs_play_pause_songName(this,'region_6')" id_region_6="${song.songs.songs_id}"
                                  style="color: black">${song.songs.songs_name}</span>
                                                        <input hidden id="songs_region_6_url_input_${song.songs.songs_id}"
                                                               value="${song.songs.songs_url}"/>
                                                        <%-- 歌曲名字 --%>
                                                        <input hidden id="songs_name_region_6_${song.songs.songs_id}"
                                                               value="${song.songs.songs_name}"/>
                                                        <input hidden id="songs_singer_name_region_6_${song.songs.songs_id}"
                                                               value="${song.singer.singer_name}"/>
                                                        <input hidden id="songs_singer_id_region_6_${song.songs.songs_id}"
                                                               value="${song.singer.singer_id}"/>
                                                        <input hidden id="songs_album_imgUrl_region_6_${song.songs.songs_id}"
                                                               value="${song.album.album_imgUrl}"/>
                            <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${song.singer.singer_id}"><small
                                    class="text-muted clear text-ellipsis">${song.singer.singer_name}</small></a>
                          </span>
                                                </div>
                                            </c:forEach>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div><h3 class="font-thin">欧美榜</h3></div>

                                        <div class="list-group bg-white list-group-lg no-bg auto">
                                            <c:forEach items="${songs_region_0_rank}" var="song" varStatus="status">
                                                <div class="list-group-item clearfix">
                                                    <span class="pull-right h2 text-muted m-l">${status.count}</span>
                                                    <span class="pull-left thumb-sm avatar m-r">
                            <a href="${pageContext.request.contextPath}/album/findById.do?album_id=${song.album.album_id}&singer_id=${song.singer.singer_id}"><img
                                    src="${song.album.album_imgUrl}" alt="..."></a>
                          </span>
                                                    <span class="clear">
                            <span onclick="songs_play_pause_songName(this,'region_0')" id_region_0="${song.songs.songs_id}"
                                  style="color: black">${song.songs.songs_name}</span>
                                                        <input hidden id="songs_region_0_url_input_${song.songs.songs_id}"
                                                               value="${song.songs.songs_url}"/>
                                                        <%-- 歌曲名字 --%>
                                                        <input hidden id="songs_name_region_0_${song.songs.songs_id}"
                                                               value="${song.songs.songs_name}"/>
                                                        <input hidden id="songs_singer_name_region_0_${song.songs.songs_id}"
                                                               value="${song.singer.singer_name}"/>
                                                        <input hidden id="songs_singer_id_region_0_${song.songs.songs_id}"
                                                               value="${song.singer.singer_id}"/>
                                                        <input hidden id="songs_album_imgUrl_region_0_${song.songs.songs_id}"
                                                               value="${song.album.album_imgUrl}"/>
                            <a href="${pageContext.request.contextPath}/singer/findById.do?singer_id=${song.singer.singer_id}"><small
                                    class="text-muted clear text-ellipsis">${song.singer.singer_name}</small></a>
                          </span>
                                                </div>
                                            </c:forEach>

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

    // 排行榜点击歌曲名字播放
    function songs_play_pause_songName(obj,rank_info) {

        console.log("点击排行榜歌曲名字播放" + rank_info);

        // 获取点击的歌曲id和地址
        var id = $(obj).attr("id_" + rank_info);

        // console.log(parseInt(id));
        // 获取地址
        var s_url = $('#songs_'+rank_info+'_url_input_' + parseInt(id)).val();

        // console.log(s_url);
        var id_new = parseInt(id);

        // 获取歌手id，歌曲名字，歌手名字，歌曲id，专辑图片
        var s_name = $("#songs_name_"+rank_info+"_" + id_new).val();
        var s_name_singer = $("#songs_singer_name_"+rank_info+"_" + id_new).val();
        var s_id_singer = $("#songs_singer_id_"+rank_info+"_" + id_new).val();
        var s_album_img = $("#songs_album_imgUrl_"+rank_info+"_" + id_new).val();

        // console.log(s_name);
        // console.log(s_name_singer);
        // console.log(s_id_singer);
        // console.log(s_album_img);

        s_name_arr.push(s_name);
        s_name_singer_arr.push(s_name_singer);
        s_id_singer_arr.push(s_id_singer);
        s_album_img_arr.push(s_album_img);

        // 执行方法
        getSongs_info_play(s_name, s_name_singer, s_id_singer, s_album_img);

        // 播放
        // console.log(s_url);
        play_songs(s_url);


    };






</script>


</html>
