<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 陈小心
  Date: 2021/3/4
  Time: 上午 09:52
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
                    <section class="scrollable wrapper-lg">

                        <div class="row">
                            <div class="col-sm-9">
                                <h4 class="m-t-lg m-b">发布文章</h4>
                                <form id="article_public_form">
                                    <div class="form-group pull-in clearfix">
                                        <div class="col-sm-6">
                                            <label>标题</label>
                                            <input type="text" class="form-control" id="article_title"
                                                   name="article_title" placeholder="标题">
                                        </div>
                                        <div class="col-sm-6">
                                            <label>主题</label>
                                            <input type="text" name="article_theme" id="article_theme"
                                                   class="form-control" placeholder="主题">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>内容</label>
                                        <textarea class="form-control" id="article_content" name="article_content"
                                                  rows="5" placeholder="输入内容最长200字"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <button id="article_public_button" type="submit"
                                                class="btn btn-s-md btn-primary">发布
                                        </button>
                                    </div>
                                </form>
                                <div class="blog-post">


                                    <c:forEach items="${articles}" var="article">
                                        <div class="post-item">
                                            <div class="caption wrapper-lg">
                                                <h2 class="post-title"><span href="#">${article.article_title}</span>
                                                </h2>
                                                <div class="post-sum">
                                                    <p>${article.article_content}</p>
                                                </div>
                                                <div class="line line-lg"></div>
                                                <div class="text-muted">
                                                    <i class="fa fa-user icon-muted"></i> by <a href="#"
                                                                                                class="m-r-sm">${article.user.user_name}</a>
                                                    <i class="fa fa-clock-o icon-muted"></i> ${article.article_time_str}
                                                    <a href="#" class="m-l-sm"><i
                                                            class="fa fa-comment-o icon-muted"></i> 4 comments</a>
                                                </div>
                                            </div>
                                        </div>
                                        <section class="comment-list block">
                                            <c:forEach items="${article.comments}" var="commont">
                                                <article id="comment-id-1" class="comment-item">
                                                    <a class="pull-left thumb-sm">
                                                        <img src="${commont.user.user_imgUrl}" class="img-circle">
                                                    </a>
                                                    <section class="comment-body m-b">
                                                        <header>
                                                            <a href="#"><strong>${commont.user.user_name}</strong></a>
                                                            <label class="label bg-info m-l-xs"><c:if test="${commont.user.user_type == 0}">普通用户</c:if>
                                                                <c:if test="${commont.user.user_type == 1}"><i style="color: yellow;">VIP用户</i></c:if></label>
                                                            <span class="text-muted text-xs block m-t-xs">
                            ${commont.comment_time_str}
                          </span>
                                                        </header>
                                                        <div class="m-t-sm">${commont.comment_content}
                                                        </div>
                                                    </section>
                                                </article>
                                            </c:forEach>
                                        </section>
                                        <form id="comment_form_${article.article_id}">
                                            <div class="form-group pull-in clearfix">
                                                <div class="col-sm-8">
                                                    <input type="text" name="comment_content"
                                                           id="comment_content_${article.article_id}"
                                                           class="form-control" placeholder="输入评论">
                                                </div>
                                                <div class="form-group">
                                                    <span onclick="add_comment(${article.article_id})" type="submit"
                                                          class="btn btn-success">发布</span>
                                                </div>
                                            </div>
                                        </form>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <h5 class="font-bold">热门主题</h5>
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        <a href="#">
                                            <span class="badge pull-right">15</span>
                                            Photograph
                                        </a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="#">
                                            <span class="badge pull-right">30</span>
                                            Life style
                                        </a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="#">
                                            <span class="badge pull-right">9</span>
                                            Food
                                        </a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="#">
                                            <span class="badge pull-right">4</span>
                                            Travel world
                                        </a>
                                    </li>
                                </ul>
                                <h5 class="font-bold">热门文章</h5>
                                <div>
                                    <article class="media">
                                        <a class="pull-left thumb thumb-wrapper m-t-xs">
                                            <img src="images/m1.jpg">
                                        </a>
                                        <div class="media-body">
                                            <a href="#" class="font-semibold">Bootstrap 3: What you need to know</a>
                                            <div class="text-xs block m-t-xs"><a href="#">Travel</a> 2 minutes ago</div>
                                        </div>
                                    </article>
                                    <div class="line"></div>
                                    <article class="media m-t-none">
                                        <a class="pull-left thumb thumb-wrapper m-t-xs">
                                            <img src="images/m2.jpg">
                                        </a>
                                        <div class="media-body">
                                            <a href="#" class="font-semibold">Lorem ipsum dolor sit amet, consectetur
                                                adipiscing elit.</a>
                                            <div class="text-xs block m-t-xs"><a href="#">Design</a> 2 hours ago</div>
                                        </div>
                                    </article>
                                    <div class="line"></div>
                                    <article class="media m-t-none">
                                        <a class="pull-left thumb thumb-wrapper m-t-xs">
                                            <img src="images/m3.jpg">
                                        </a>
                                        <div class="media-body">
                                            <a href="#" class="font-semibold">Sed diam nonummy nibh euismod tincidunt ut
                                                laoreet</a>
                                            <div class="text-xs block m-t-xs"><a href="#">MFC</a> 1 week ago</div>
                                        </div>
                                        <div class="media-body">
                                            <div>${users}</div>
                                        </div>
                                    </article>
                                </div>
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

<script src="js/app.plugin.js"></script>
<script type="text/javascript" src="js/jPlayer/jquery.jplayer.min.js"></script>
<script type="text/javascript" src="js/jPlayer/add-on/jplayer.playlist.min.js"></script>
<script type="text/javascript" src="js/jPlayer/demo.js"></script>
</body>
<script type="text/javascript">
    $('#article_public_button').click(function () {

        var title = $('#article_title').val().trim();
        var theme = $('#article_theme').val().trim();
        var content = $('#article_content').val().trim();

        if (content.length > 200) {
            alert("内容过多");
        }

        if (title == null || theme == null || content == null) {
            alert("发布文章不可以为空");
        } else {

            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: '${pageContext.request.contextPath}/article/save.do',//url
                data: $('#article_public_form').serialize(),
                success: function (result) {
                    console.log(result);//打印服务端返回的数据(调试用)
                    if (result == 101) {
                        alert("发布成功");
                        $(':input', '#article_public_form')
                            .not(':button, :submit, :reset, :hidden')
                            .val('')
                            .removeAttr('checked')
                            .removeAttr('selected');
                    } else if (result = 102) {
                        alert("请登录");
                        window.location.href = "${pageContext.request.contextPath}/signin.jsp";
                    } else {
                        alert("发布失败,请重新插入1");
                    }
                },
                error: function () {
                    alert("内容过多请删减到200");
                }
            });

        }
    });

    // 点击发布评论按钮
    function add_comment(article_id) {
        console.log("点击发布评论anniu" + article_id)

        var content = $('#comment_content_' + article_id).val().trim();
        var id_str = "comment_form_" + article_id;

        if (content.length > 200) {
            alert("内容过多");
        }

        if (content == null) {
            alert("发布评论不可以为空");
        } else {

            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: '${pageContext.request.contextPath}/article/saveComment.do?article_id='+ article_id,//url
                data: $('#'+ id_str).serialize(),
                success: function (result) {
                    console.log(result);//打印服务端返回的数据(调试用)
                    if (result == 101) {
                        alert("发布成功");
                        $(':input', '#'+id_str)
                            .not(':button, :submit, :reset, :hidden')
                            .val('')
                            .removeAttr('checked')
                            .removeAttr('selected');
                    } else if (result = 102) {
                        alert("请登录");
                        window.location.href = "${pageContext.request.contextPath}/signin.jsp";
                    } else {
                        alert("发布失败,请重新插入1");
                    }
                },
                error: function () {
                    alert("内容过多请删减到200");
                }
            });

        }


    };

</script>
</html>