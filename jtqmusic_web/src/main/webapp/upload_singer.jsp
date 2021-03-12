<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 陈小心

  Date: 2021/3/4
  Time: 下午 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8"/>
    <title>Musik | Web Application</title>
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
                <section class="vbox">
                    <section class="scrollable padder">
                        <div class="m-b-md">
                            <h3 class="m-b-none">上传页面</h3>
                        </div>


                        <%-- 切换面板 --%>
                        <section class="panel panel-default">
                            <header class="panel-heading bg-light">
                                <ul class="nav nav-tabs nav-justified" id="ul_selectupload">
                                    <li class="active"><a href="#home" data-toggle="tab" onclick="getSinger()">歌手</a></li>
                                    <li><a href="#profile" data-toggle="tab" onclick="getAlbum()">专辑</a></li>
                                    <li><a href="#messages" data-toggle="tab" onclick="getSongs()">歌曲</a></li>
                                    <li><a href="#settings" data-toggle="tab" onclick="getSongMenu()">歌单</a></li>
                                </ul>
                            </header>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <%--上传歌手页面 --%>
                                    <div class="tab-pane active" id="home">
                                        <div class="col-sm-6 ">
                                            <form data-validate="parsley" id="form_uploadSinger">
                                                <section class="panel panel-default">
                                                    <header class="panel-heading">
                                                        <span class="h4">上传歌手</span>
                                                    </header>
                                                    <div class="panel-body">
                                                        <p class="text-muted">请输入正确信息</p>
                                                        <div class="form-group pull-in clearfix">
                                                            <div class="col-sm-6">
                                                                <label>歌手名字</label>
                                                                <input type="text" class="form-control" data-required="true"
                                                                       id="singer_name" name="singer_name">
                                                            </div>

                                                            <div class="col-sm-6">
                                                                <label>流派</label>
                                                                <%--<input type="password" class="form-control" data-required="true" id="pwd">--%>
                                                                <select data-required="true" class="form-control" id="classify_id" name="classify_id">
                                                                    <option value="" id="selectClassify">请选择</option>



                                                                </select>
                                                            </div>
                                                        </div>

                                                        <%--<div class="form-group" style="width: 20%">
                                                            <label>性别</label>
                                                            <select data-required="true" class="form-control m-t">
                                                                <option value="">请选择</option>
                                                                <option value="0">男</option>
                                                                <option value="1">女</option>
                                                            </select>

                                                        </div>--%>

                                                        <div class="form-group pull-in clearfix">
                                                            <div class="col-sm-6">
                                                                <label>性别</label>
                                                                <%--<input type="password" class="form-control" data-required="true" id="pwd">--%>
                                                                <select data-required="true" class="form-control" id="singer_sex" name="singer_sex">
                                                                    <option value="">请选择</option>
                                                                    <option value="0">男</option>
                                                                    <option value="1">女</option>
                                                                </select>
                                                            </div>

                                                            <div class="col-sm-6">
                                                                <label>生日</label>
                                                                <%--<input type="password" class="form-control" data-equalto="#pwd" data-required="true">--%>
                                                                <input type="date" data-type="dateIso" id="singer_birth"
                                                                       class="form-control" placeholder="YYYY-MM-DD" name="singer_birth">
                                                            </div>
                                                        </div>
                                                        <div class="form-group pull-in clearfix">
                                                            <div class="col-sm-6">
                                                                <label>地区</label>
                                                                <%--<input type="password" class="form-control" data-required="true" id="pwd">--%>
                                                                <select data-required="true" class="form-control" id="region_id" name="region_id" >
                                                                    <option value="" id="selectRegion">请选择</option>

                                                                </select>
                                                            </div>

                                                            <div class="col-sm-6">
                                                                <label>出道时间</label>
                                                                <%--<input type="password" class="form-control" data-equalto="#pwd" data-required="true">--%>
                                                                <input type="date" data-type="dateIso"
                                                                       class="form-control" placeholder="YYYY-MM-DD" id="singer_timeOut" name="singer_timeOut">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>头像地址</label>
                                                            <input type="text" data-type="url" class="form-control"
                                                                   placeholder="右键头像复制图片地址" name="singer_imgUrl" id="singer_imgUrl">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>简介</label>
                                                            <textarea class="form-control" rows="6" data-minwords="6"
                                                                      data-required="true"
                                                                      placeholder="Type your message" name="singer_info" id="singer_info"></textarea>
                                                        </div>
                                                        <div class="checkbox i-checks">
                                                            <label>
                                                                <input type="checkbox" name="check" checked
                                                                       data-required="true"><i></i> I agree to the <a
                                                                    href="#" class="text-info">Terms of Service</a>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <footer class="panel-footer text-right bg-light lter">
                                                        <button type="submit" id="submit_uploadSinger" class="btn btn-success btn-s-xs">Submit
                                                        </button>
                                                    </footer>
                                                </section>
                                            </form>
                                        </div>
                                    </div>

                                    <%--上传专辑页面--%>
                                    <div class="tab-pane" id="profile">
                                        <div class="col-sm-6 ">
                                            <form data-validate="parsley" id="form_uploadAlbum">
                                                <section class="panel panel-default">
                                                    <header class="panel-heading">
                                                        <span class="h4">上传专辑</span>
                                                    </header>
                                                    <div class="panel-body">
                                                        <p class="text-muted">请输入正确信息</p>
                                                        <div class="form-group">
                                                            <label>专辑名字</label>
                                                            <input type="text" class="form-control" data-required="true"
                                                                   name="album_name" id="album_name">
                                                        </div>


                                                        <%--<div class="form-group" style="width: 20%">
                                                            <label>性别</label>
                                                            <select data-required="true" class="form-control m-t">
                                                                <option value="">请选择</option>
                                                                <option value="0">男</option>
                                                                <option value="1">女</option>
                                                            </select>

                                                        </div>--%>

                                                        <div class="form-group pull-in clearfix">
                                                            <div class="col-sm-6">
                                                                <label>歌曲数量</label>
                                                                <input type="text" data-type="number"
                                                                       class="form-control" placeholder="number"
                                                                name="album_songNumber" id="album_songNumber">
                                                            </div>

                                                            <div class="col-sm-6">
                                                                <label>发布时间</label>
                                                                <%--<input type="password" class="form-control" data-equalto="#pwd" data-required="true">--%>
                                                                <input type="date" data-type="dateIso"
                                                                       class="form-control" placeholder="YYYY-MM-DD"
                                                                name="album_issueDate" id="album_issueDate">
                                                            </div>
                                                        </div>
                                                        <div class="form-group pull-in clearfix">
                                                            <div class="col-sm-6">
                                                                <label>歌手</label>
                                                                <%--<input type="password" class="form-control" data-required="true" id="pwd">--%>
                                                                <select data-required="true" class="form-control" name="singer_id" id="singer_id">
                                                                    <option value="" id="selectSinger">请选择</option>

                                                                </select>
                                                            </div>

                                                        </div>
                                                        <div class="form-group">
                                                            <label>专辑图片地址</label>
                                                            <input type="text" data-type="url" class="form-control"
                                                                   placeholder="右键头像复制图片地址" name="album_imgUrl" id="album_imgUrl">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>专辑简介</label>
                                                            <textarea class="form-control" rows="6" data-minwords="6"
                                                                      data-required="true"
                                                                      placeholder="Type your message" name="album_info" id="album_info"></textarea>
                                                        </div>
                                                        <div class="checkbox i-checks">
                                                            <label>
                                                                <input type="checkbox" name="check" checked
                                                                       data-required="true"><i></i> I agree to the <a
                                                                    href="#" class="text-info">Terms of Service</a>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <footer class="panel-footer text-right bg-light lter">
                                                        <button type="submit" id="submit_uploadAlbum" class="btn btn-success btn-s-xs">Submit
                                                        </button>
                                                    </footer>
                                                </section>
                                            </form>
                                        </div>
                                    </div>

                                    <%--上传歌曲页面--%>
                                    <div class="tab-pane" id="messages">
                                        <div class="col-sm-6 ">
                                            <form data-validate="parsley" id="form_uploadSongs">
                                                <section class="panel panel-default">
                                                    <header class="panel-heading">
                                                        <span class="h4">上传歌曲</span>
                                                    </header>
                                                    <div class="panel-body">
                                                        <p class="text-muted">请输入正确信息</p>
                                                        <div class="form-group">
                                                            <label>歌曲名字</label>
                                                            <input type="text" class="form-control" data-required="true"
                                                                   name="songs_name">
                                                        </div>

                                                        <div class="form-group pull-in clearfix">
                                                            <div class="col-sm-6">
                                                                <label>歌手</label>
                                                                <%--<input type="password" class="form-control" data-required="true" id="pwd">--%>
                                                                <select data-required="true" class="form-control" name="singer_id" id="downSelect_singer">
                                                                    <option value="" id="selectSinger_songs">请选择</option>


                                                                </select>
                                                            </div>

                                                            <div class="col-sm-6">
                                                                <label>专辑</label>
                                                                <%--<input type="password" class="form-control" data-required="true" id="pwd">--%>
                                                                <select data-required="true" class="form-control" name="album_id" id="downSelect_album" >
                                                                    <option value="" id="option_songs_album">请选择</option>

                                                                </select>
                                                            </div>


                                                        </div>

                                                        <div class="form-group pull-in clearfix">
                                                            <div class="col-sm-6">
                                                                <label>语种</label>
                                                                <%--<input type="password" class="form-control" data-required="true" id="pwd">--%>
                                                                <select data-required="true" class="form-control" name="songs_language" id="songs_language">
                                                                    <option value="">请选择</option>
                                                                    <option value="0">英语</option>
                                                                    <option value="1">中文</option>
                                                                    <option value="2">其他</option>

                                                                </select>
                                                            </div>

                                                            <div class="col-sm-6">
                                                                <label>发布时间(请选择专辑)</label>
                                                                <%--<input type="password" class="form-control" data-equalto="#pwd" data-required="true">--%>
                                                                <input type="text" class="form-control" data-required="true"
                                                                       name="songs_issueDate_str" id="songs_issueDate_str_div">




                                                            </div>
                                                        </div>

                                                        <div class="form-group pull-in clearfix">
                                                            <div class="col-sm-6">
                                                                <label>流派（请选择歌手）</label>
                                                                <div type="text" class="form-control" data-required="true"
                                                                     name="classify_id"   id="classify_div"></div>
                                                                <input type="hidden" class="form-control" data-required="true"
                                                                       name="classify_id"   id="classify_input"/>

                                                            </div>
                                                            <div class="col-sm-4">
                                                                <label>歌曲剩余上传数量</label>
                                                                <input type="text" data-type="number"
                                                                       class="form-control" placeholder="number"
                                                                       name="album_songNumber" id="album_songNumber_div"/>


                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>歌曲地址</label>
                                                            <input type="text"  class="form-control"
                                                                   placeholder="url" name="songs_url">
                                                        </div>
                                                        <div class="checkbox i-checks">
                                                            <label>
                                                                <input type="checkbox" name="check" checked
                                                                       data-required="true"><i></i> I agree to the <a
                                                                    href="#" class="text-info">Terms of Service</a>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <footer class="panel-footer text-right bg-light lter">
                                                        <button type="submit" id="submit_uploadSongs" class="btn btn-success btn-s-xs">Submit
                                                        </button>
                                                    </footer>
                                                </section>
                                            </form>
                                        </div>
                                    </div>

                                    <%--上传歌单页面--%>
                                    <div class="tab-pane" id="settings">
                                        <div class="col-sm-6 ">
                                            <form data-validate="parsley" id="form_uploadSongsMenu">
                                                <section class="panel panel-default">
                                                    <header class="panel-heading">
                                                        <span class="h4">上传歌单</span>
                                                    </header>
                                                    <div class="panel-body">
                                                        <p class="text-muted">请输入正确信息</p>
                                                        <div class="form-group">
                                                            <label>歌单名字</label>
                                                            <input type="text" class="form-control" data-required="true"
                                                                   name="songmenu_name">
                                                        </div>

                                                        <div class="form-group pull-in clearfix">
                                                            <div class="col-sm-6">
                                                                <label>歌单分类</label>
                                                                <%--<input type="password" class="form-control" data-required="true" id="pwd">--%>
                                                                <select data-required="true" class="form-control" id="classify_id" name="classify_id">
                                                                    <option value="" id="selectClassify_songmenu">请选择</option>



                                                                </select>
                                                            </div>

                                                        </div>

                                                        <div class="form-group">
                                                            <label>标签</label>
                                                            <input type="text" data-notblank="true" name="songmenu_label" class="form-control"
                                                                   placeholder="not blank field 空格分开">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>简介</label>
                                                            <textarea class="form-control" name="songmenu_info" rows="6" data-minwords="6"
                                                                      data-required="true"
                                                                      placeholder="Type your message"></textarea>
                                                        </div>
                                                        <div class="checkbox i-checks">
                                                            <label>
                                                                <input type="checkbox" name="check" checked
                                                                       data-required="true"><i></i> I agree to the <a
                                                                    href="#" class="text-info">Terms of Service</a>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <footer class="panel-footer text-right bg-light lter">
                                                        <button id="submit_uploadSongsMenu" type="submit" class="btn btn-success btn-s-xs">Submit
                                                        </button>
                                                    </footer>
                                                </section>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>


                        <div class="col-sm-6">
                            <form data-validate="parsley">
                                <section class="panel panel-default">
                                    <header class="panel-heading">
                                        <span class="h4">Contact</span>
                                    </header>
                                    <div class="panel-body">
                                        <p class="text-muted">Need support? please fill the fields below.</p>
                                        <div class="form-group pull-in clearfix">
                                            <div class="col-sm-6">
                                                <label>Your name</label>
                                                <input type="text" class="form-control" placeholder="Name"
                                                       data-required="true">
                                            </div>
                                            <div class="col-sm-6">
                                                <label>Email</label>
                                                <input type="email" class="form-control" placeholder="Enter email"
                                                       data-required="true">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Your website</label>
                                            <input type="text" data-type="url" data-required="true" class="form-control"
                                                   placeholder="Your website url">
                                        </div>
                                        <div class="form-group">
                                            <label>Message</label>
                                            <textarea class="form-control" rows="6" data-minwords="6"
                                                      data-required="true" placeholder="Type your message"></textarea>
                                        </div>
                                    </div>
                                    <footer class="panel-footer text-right bg-light lter">
                                        <button type="submit" class="btn btn-success btn-s-xs">Submit</button>
                                    </footer>
                                </section>
                            </form>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <form class="form-horizontal" data-validate="parsley">
                                    <section class="panel panel-default">
                                        <header class="panel-heading">
                                            <strong>Basic constraints</strong>
                                        </header>
                                        <div class="panel-body">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Required</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" data-required="true"
                                                           placeholder="required field">
                                                    <select data-required="true" class="form-control m-t">
                                                        <option value="">Please choose</option>
                                                        <option value="foo">Foo</option>
                                                        <option value="bar">Bar</option>
                                                    </select>
                                                    <label class="checkbox i-checks">
                                                        <input type="checkbox" name="inlineCheckbox1" value="option1"
                                                               data-required="true"
                                                               data-error-message="You must agree to the site policy."><i></i>
                                                        Agree to the policy
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Not blank</label>
                                                <div class="col-sm-9">
                                                    <input type="text" data-notblank="true" class="form-control"
                                                           placeholder="not blank field">
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Min Length</label>
                                                <div class="col-sm-9">
                                                    <input type="text" data-minlength="6" class="form-control"
                                                           placeholder="minlength = 6">
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Max Length</label>
                                                <div class="col-sm-9">
                                                    <input type="text" data-maxlength="6" class="form-control"
                                                           placeholder="maxlength = 6">
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Range Length</label>
                                                <div class="col-sm-9">
                                                    <input type="text" data-rangelength="[5,10]" class="form-control"
                                                           placeholder="data-rangelength = [5,10]">
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Min</label>
                                                <div class="col-sm-9">
                                                    <input type="text" data-min="6" class="form-control"
                                                           placeholder="min = 6">
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Max</label>
                                                <div class="col-sm-9">
                                                    <input type="text" data-max="100" class="form-control"
                                                           placeholder="max = 100">
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Range</label>
                                                <div class="col-sm-9">
                                                    <input type="text" data-range="[6, 100]" class="form-control"
                                                           placeholder="data-range = [6, 100]">
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">RegExp</label>
                                                <div class="col-sm-9">
                                                    <input type="text" data-regexp="#[A-Fa-f0-9]{6}"
                                                           class="form-control" placeholder="hexa color code">
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Equal To</label>
                                                <div class="col-sm-9">
                                                    <div class="row">
                                                        <div class="col-sm-6"><input type="text" value="foo" id="foo"
                                                                                     class="form-control"></div>
                                                        <div class="col-sm-6"><input type="text" data-equalto="#foo"
                                                                                     placeholder="equal to foo"
                                                                                     class="form-control"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <footer class="panel-footer text-right bg-light lter">
                                            <button type="submit" class="btn btn-success btn-s-xs">Submit</button>
                                        </footer>
                                    </section>
                                </form>
                            </div>
                            <div class="col-sm-6">
                                <form class="form-horizontal" data-validate="parsley">
                                    <section class="panel panel-default">
                                        <header class="panel-heading">
                                            <strong>Type constraints</strong>
                                        </header>
                                        <div class="panel-body">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Email</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" data-type="email"
                                                           data-required="true" placeholder="email">
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Url</label>
                                                <div class="col-sm-9">
                                                    <input type="text" data-type="url" class="form-control"
                                                           placeholder="url">
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Url strict</label>
                                                <div class="col-sm-9">
                                                    <input type="text" data-type="urlstrict" class="form-control"
                                                           placeholder="urlstrict">
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Digits</label>
                                                <div class="col-sm-9">
                                                    <input type="text" data-type="digits" class="form-control"
                                                           placeholder="digits">
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Number</label>
                                                <div class="col-sm-9">
                                                    <input type="text" data-type="number" class="form-control"
                                                           placeholder="number">
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Alphanum</label>
                                                <div class="col-sm-9">
                                                    <input type="text" data-type="alphanum" class="form-control"
                                                           placeholder="alphanumeric string">
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Date Iso</label>
                                                <div class="col-sm-9">
                                                    <input type="text" data-type="dateIso" class="form-control"
                                                           placeholder="YYYY-MM-DD">
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Phone</label>
                                                <div class="col-sm-9">
                                                    <input type="text" data-type="phone" class="form-control"
                                                           placeholder="(XXX) XXXX XXX">
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Min Words</label>
                                                <div class="col-sm-9">
                                                    <input type="text" data-minwords="6" class="form-control"
                                                           placeholder="min 6 words">
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Max Words</label>
                                                <div class="col-sm-9">
                                                    <input type="text" data-maxwords="6" class="form-control"
                                                           placeholder="max 6 words">
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Range Words</label>
                                                <div class="col-sm-9">
                                                    <input type="text" data-rangewords="[6,10]" class="form-control"
                                                           placeholder="min 6 words & max 10 words">
                                                </div>
                                            </div>
                                        </div>
                                        <footer class="panel-footer text-right bg-light lter">
                                            <button type="submit" class="btn btn-success btn-s-xs">Submit</button>
                                        </footer>
                                    </section>
                                </form>
                            </div>
                        </div>
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
<!-- parsley -->
<script src="js/parsley/parsley.min.js"></script>
<script src="js/parsley/parsley.extend.js"></script>
<script src="js/app.plugin.js"></script>
<script type="text/javascript" src="js/jPlayer/jquery.jplayer.min.js"></script>
<script type="text/javascript" src="js/jPlayer/add-on/jplayer.playlist.min.js"></script>
<script type="text/javascript" src="js/jPlayer/demo.js"></script>
</body>
<script type="text/javascript">
    $(function () {
        var l = $('#ul_selectupload li');
        // alert(l.length);

         if ($(l[0]).attr('class')== 'active') {
             console.log("歌手默认选中");

             // 异步发请求获取地区信息
             $.ajax({
                 url:'${pageContext.request.contextPath}/singer/findAllRegion.do',
                 contentType:"application/json;charset=utf-8",
                 type:"POST",
                 dataType:"JSON",
                 success:function (res) {
                     for (let i = 0; i < res.length; i++) {
                         console.log('请求地区成功' + res.length + res[i]['region_id']);
                         var value = res[i]['region_id'];
                         var name = res[i]['region_name'];
                         var item = "<option value='" + value +"'>"+ name +"</option>";
                         $('#selectRegion').after(item);
                     }
                 }
             });

             // 异步发请求获取分类信息
             $.ajax({
                 url:'${pageContext.request.contextPath}/singer/findAllClassify.do',
                 contentType:"application/json;charset=utf-8",
                 type:"POST",
                 dataType:"JSON",
                 success:function (res) {
                     for (let i = 0; i < res.length; i++) {
                         console.log('请求分类成功' + res.length + res[i]['classify_id']);
                         var value = res[i]['classify_id'];
                         var name = res[i]['classify_name'];
                         var item = "<option value='" + value +"'>"+ name +"</option>";
                         $('#selectClassify').after(item);
                     }
                 }
             });

         }





    });

    // 提交歌曲的时候歌曲下拉框改变时 获取专辑数据
    $('#downSelect_singer').change(function() {
        console.log("歌手下拉框改变了");
        var v = $('#downSelect_singer option:selected').val();
        console.log("选中的歌手id值为：" + v)
        // 异步发请求获取专辑信息
        getAlbum_songs(v);
        // 异步根据选中的歌手id 获取指定流派名字
        getClassify_songs(v);

    });

    // 提交歌曲的时候专辑下拉框改变时 获取专辑时间数据
    $('#downSelect_album').change(function() {
        console.log("歌手下拉框改变了");
        var v = $('#downSelect_album option:selected').val();
        console.log("选中的专辑id值为：" + v)
        // 获取专辑时间函数 和歌曲数量
        getAlbum_timeOutAndNumber(v);


    });

    function getAlbum_timeOutAndNumber(id){
        console.log("上传歌曲页面的获取专辑时间 函数");
        // 异步发请求获取指定歌手的专辑 信息
        $('#songs_issueDate_str_div').empty();
        $('#album_songNumber_div').empty();
        $.ajax({
            url:'${pageContext.request.contextPath}/album/findBy_albumId.do?album_id=' + id,
            contentType:"application/json;charset=utf-8",
            type:"POST",
            dataType:"JSON",
            success:function (res) {
                console.log("上传歌曲页面根据专辑id获取专辑 时间 成功");
                $('#songs_issueDate_str_div').val(res['album_issueDate_str']);
                $('#album_songNumber_div').val(res['album_songNumber']);

            }
        });

    };


    function getClassify_songs(id){
        console.log("上传歌曲页面的获取流派 函数");
        $('#classify_div').empty();
        $('#classify_input').empty();

        // 异步发请求获取指定歌手的流派 信息
        $.ajax({
            url:'${pageContext.request.contextPath}/singer/findClassifyBySinger_id.do?singer_id=' + id,
            contentType:"application/json;charset=utf-8",
            type:"POST",
            dataType:"JSON",
            success:function (res) {
                console.log("上传歌曲页面的获取所有立即派 成功")
                    $('#classify_div').append(res['classify_name']);
                    $('#classify_input').val(res['classify_id']);
            }
        });

    };

    function getAlbum_songs(id){
        console.log("上传歌曲页面的获取专辑 函数");
        // 异步发请求获取指定歌手的专辑 信息
        $('#downSelect_album').empty();
        $.ajax({
            url:'${pageContext.request.contextPath}/album/findBySinger_Id.do?singer_id=' + id,
            contentType:"application/json;charset=utf-8",
            type:"POST",
            dataType:"JSON",
            success:function (res) {
                console.log("上传歌曲页面的获取专辑 成功");
                $('#downSelect_album').append("<option value=''>请选择</option>");
                for (let i = 0; i < res.length; i++) {
                    var value = res[i]['album_id'];
                    var name = res[i]['album_name'];
                    var item = "<option value='" + value +"'>"+ name +"</option>";
                    $('#downSelect_album').append(item);
                }
            }
        });

    };

    // 提交歌手按钮
    $('#submit_uploadSinger').click(function () {
        console.log("点击了歌手提交按钮");
        var a  = $('#form_uploadSinger').serialize();
        console.log(a);

        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: '${pageContext.request.contextPath}/singer/save.do' ,//url
            data: $('#form_uploadSinger').serialize(),
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                if (result==101) {
                    alert("成功");
                    $(':input','#form_uploadSinger')
                        .not(':button, :submit, :reset, :hidden')
                        .val('')
                        .removeAttr('checked')
                        .removeAttr('selected');
                }else{
                    alert("插入失败,请重新插入1");
                }
            },
            error : function() {
                alert("插入失败,请重新插入2");
            }
        });

    });

    // 提交专辑按钮
    $('#submit_uploadAlbum').click(function () {
        console.log("点击了专辑提交按钮");
        var a  = $('#form_uploadAlbum').serialize();
        console.log(a);

        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: '${pageContext.request.contextPath}/album/save.do' ,//url
            data: $('#form_uploadAlbum').serialize(),
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                if (result==101) {
                    alert("成功");
                    $(':input','#form_uploadAlbum')
                        .not(':button, :submit, :reset, :hidden')
                        .val('')
                        .removeAttr('checked')
                        .removeAttr('selected');
                    window.location.href = '${pageContext.request.contextPath}/upload_singer.jsp';
                }else{
                    alert("插入失败,请重新插入1");
                }
            },
            error : function() {
                alert("插入失败,请重新插入2");
            }
        });

    });

    // 提交歌曲按钮
    $('#submit_uploadSongs').click(function () {
        console.log("点击了提交歌曲按钮");
        var a  = $('#form_uploadSongs').serialize();
        console.log(a);

        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: '${pageContext.request.contextPath}/songs/save.do' ,//url
            data: $('#form_uploadSongs').serialize(),
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                if (result==101) {
                    alert("成功");
                    $(':input','#form_uploadAlbum')
                        .not(':button, :submit, :reset, :hidden')
                        .val('')
                        .removeAttr('checked')
                        .removeAttr('selected');
                    window.location.href = '${pageContext.request.contextPath}/upload_singer.jsp';
                }else{
                    alert("插入失败,请重新插入1");
                }
            },
            error : function() {
                alert("插入失败,请重新插入2");
            }
        });

    });

    // 提交歌单按钮
    $('#submit_uploadSongsMenu').click(function () {
        console.log("点击了歌手提交按钮");
        var a  = $('#form_uploadSongsMenu').serialize();
        console.log(a);

        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: '${pageContext.request.contextPath}/songsmenu/save.do' ,//url
            data: $('#form_uploadSongsMenu').serialize(),
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                if (result==101) {
                    alert("插入歌单成功");
                    $(':input','#form_uploadSongsMenu')
                        .not(':button, :submit, :reset, :hidden')
                        .val('')
                        .removeAttr('checked')
                        .removeAttr('selected');
                }else{
                    alert("插入失败,请重新插入1");
                }
            },
            error : function() {
                alert("插入失败,请重新插入2");
            }
        });

    });


    function getSinger() {
        console.log("点击歌手");
        // 异步发请求获取地区信息
        $.ajax({
            url:'${pageContext.request.contextPath}/singer/findAllRegion.do',
            contentType:"application/json;charset=utf-8",
            type:"POST",
            dataType:"JSON",
            success:function (res) {
                for (let i = 0; i < res.length; i++) {
                    console.log('请求成功' + res.length + res[i]['region_id']);
                    var value = res[i]['region_id'];
                    var name = res[i]['region_name'];
                    var item = "<option value='" + value +"'>"+ name +"</option>";
                    $('#selectRegion').after(item);
                }
            }
        });

        // 异步发请求获取分类信息
        $.ajax({
            url:'${pageContext.request.contextPath}/singer/findAllClassify.do',
            contentType:"application/json;charset=utf-8",
            type:"POST",
            dataType:"JSON",
            success:function (res) {
                for (let i = 0; i < res.length; i++) {
                    console.log('请求分类成功' + res.length + res[i]['classify_id']);
                    var value = res[i]['classify_id'];
                    var name = res[i]['classify_name'];
                    var item = "<option value='" + value +"'>"+ name +"</option>";
                    $('#selectClassify').after(item);
                }
            }
        });

    };
    function getAlbum() {
        console.log("点击专辑");
        // 异步发请求获取歌手信息
        $.ajax({
            url:'${pageContext.request.contextPath}/album/findAllSinger.do',
            contentType:"application/json;charset=utf-8",
            type:"POST",
            dataType:"JSON",
            success:function (res) {
                for (let i = 0; i < res.length; i++) {
                    console.log('上传专辑请求歌手成功' + res.length + res[i]['singer_id']);
                    var value = res[i]['singer_id'];
                    var name = res[i]['singer_name'];
                    var item = "<option value='" + value +"'>"+ name +"</option>";
                    $('#selectSinger').after(item);
                }
            }
        });
    };
    function getSongs() {
        console.log("点击歌曲");
        // 异步发请求获取歌手信息
        $.ajax({
            url:'${pageContext.request.contextPath}/album/findAllSinger.do',
            contentType:"application/json;charset=utf-8",
            type:"POST",
            dataType:"JSON",
            success:function (res) {
                for (let i = 0; i < res.length; i++) {
                    console.log('上传专辑请求歌手成功' + res.length + res[i]['singer_id']);
                    var value = res[i]['singer_id'];
                    var name = res[i]['singer_name'];
                    var item = "<option value='" + value +"'>"+ name +"</option>";
                    $('#selectSinger_songs').after(item);
                }
            }
        });


    };
    function getSongMenu() {
        console.log("点击歌单");
        // 异步发请求获取分类信息
        $.ajax({
            url:'${pageContext.request.contextPath}/singer/findAllClassify.do',
            contentType:"application/json;charset=utf-8",
            type:"POST",
            dataType:"JSON",
            success:function (res) {
                for (let i = 0; i < res.length; i++) {
                    console.log('请求分类成功' + res.length + res[i]['classify_id']);
                    var value = res[i]['classify_id'];
                    var name = res[i]['classify_name'];
                    var item = "<option value='" + value +"'>"+ name +"</option>";
                    $('#selectClassify_songmenu').after(item);
                }
            }
        });

    };

</script>
</html>