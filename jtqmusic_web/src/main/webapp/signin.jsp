<%--
  Created by IntelliJ IDEA.
  User: 陈小心
  Date: 2021/3/4
  Time: 上午 09:49
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
<body class="bg-info dker">
<section id="content" class="m-t-lg wrapper-md animated fadeInUp">
    <div class="container aside-xl">
        <a class="navbar-brand block" href="${pageContext.request.contextPath}/index.do"><span class="h1 font-bold">JTQMusic</span></a>
        <section class="m-b-lg">
            <header class="wrapper text-center">
                <strong>登录享用更多功能</strong>
            </header>
            <form id="login_form">
                <div class="form-group">
                    <input type="text" placeholder="账号" onchange="findUserAccount(this)" name="user_account"  id="user_account" class="form-control rounded input-lg text-center no-border">
                </div>
                <div class="form-group">
                    <input type="password" placeholder="密码" name="user_password" id="user_password" class="form-control rounded input-lg text-center no-border">
                </div>
                <button type="submit" id="login_button" class="btn btn-lg btn-warning lt b-white b-2x btn-block btn-rounded"><i class="icon-arrow-right pull-right"></i><span class="m-r-n-lg">登录</span></button>
                <div class="text-center m-t m-b"><a href="#"><small>忘记密码?</small></a></div>
                <div class="line line-dashed"></div>
                <p class="text-muted text-center"><small>没有账户?</small>&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/index.do" class="text-muted text-center"><small>游客登入</small></a></p>
                <a href="signup.jsp" class="btn btn-lg btn-info btn-block rounded">创建一个账户</a>

            </form>
        </section>
    </div>
</section>
<!-- footer -->
<footer id="footer">
    <div class="text-center padder">
        <p>
            <small>Web app framework base on Bootstrap<br>&copy; 2014</small>
        </p>
    </div>
</footer>
<!-- / footer -->
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

    $('#login_button').click(function () {
        console.log("点击了登录提交按钮");
        var a  = $('#login_form').serialize();
        console.log(a);

        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: '${pageContext.request.contextPath}/user/login.do' ,//url
            data: $('#login_form').serialize(),
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                if (result==101) {
                    alert("成功登录");
                    window.location.href = '${pageContext.request.contextPath}/index.do';
                }else{
                    alert("密码或账户不正确");
                    $(':input','#form_uploadSinger')
                        .not(':button, :submit, :reset, :hidden')
                        .val('')
                        .removeAttr('checked')
                        .removeAttr('selected');
                }
            },
            error : function() {
                alert("登录失败2");
            }
        });
    });

    // 异步验证用户名是否可登录
    function findUserAccount(obj){
        var user_account = $(obj).val();
        console.log("验证用户名:" + user_account);
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: '${pageContext.request.contextPath}/user/findUserCount.do?user_account=' + user_account ,//url
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                if (result != 101) {
                    alert("用户名不可用，请更换");
                    $(obj).empty();
                }
            },
            error : function() {
                alert("验证用户名失败，请检查参数");
            }
        });

    };
</script>
</html>