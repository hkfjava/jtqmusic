<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="bg-black dk nav-xs aside hidden-print" id="nav">
    <section class="vbox">
        <section class="w-f-md scrollable">
            <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0"
                 data-size="10px" data-railOpacity="0.2">


                <!-- nav -->
                <nav class="nav-primary hidden-xs">
                    <ul class="nav bg clearfix">
                        <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                            Discover
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/index.do">
                                <i class="icon-disc icon text-success"></i>
                                <span class="font-bold">最新</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/singer/findAll.do">
                                <i class="icon-music-tone-alt icon text-info"></i>
                                <span class="font-bold">歌手</span>
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/rank/findAll_rank.do">
                                <i class="icon-trophy icon  text-info-dker"></i>
                                <span class="font-bold">榜单</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/article/findAll.do">
                                <i class="icon-support icon text-primary-lter"></i>
                                <b class="badge bg-primary pull-right">5</b>
                                <span class="font-bold">博客</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/user/findUserInfo.do">
                                <i class="icon-user icon text-primary-lter"></i>
                                <span class="font-bold">我的</span>
                            </a>
                        </li>
                        <li class="m-b hidden-nav-xs"></li>
                    </ul>
                    <ul class="nav" data-ride="collapse">
                        <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                            Interface
                        </li>
                        <li>
                            <a href="#" class="auto">
                        <span class="pull-right text-muted">
                          <i class="fa fa-angle-left text"></i>
                          <i class="fa fa-angle-down text-active"></i>
                        </span>
                                <i class="icon-screen-desktop icon">
                                </i>
                                <span>Layouts</span>
                            </a>
                            <ul class="nav dk text-sm">
                                <li>
                                    <a href="layout-color.html" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>Color option</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="layout-boxed.html" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>Boxed layout</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="layout-fluid.html" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>Fluid layout</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" class="auto">
                        <span class="pull-right text-muted">
                          <i class="fa fa-angle-left text"></i>
                          <i class="fa fa-angle-down text-active"></i>
                        </span>
                                <i class="icon-chemistry icon">
                                </i>
                                <span>UI Kit</span>
                            </a>
                            <ul class="nav dk text-sm">
                                <li>
                                    <a href="buttons.html" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>Buttons</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="icons.html" class="auto">
                                        <b class="badge bg-info pull-right">369</b>
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>Icons</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="http://www.mobantu.com" class="auto">
                                        <b class="badge bg-info pull-right">369</b>
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>More</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="grid.html" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>Grid</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="widgets.html" class="auto">
                                        <b class="badge bg-dark pull-right">8</b>
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>Widgets</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="components.html" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>Components</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="list.html" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>List group</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#table" class="auto">
                            <span class="pull-right text-muted">
                              <i class="fa fa-angle-left text"></i>
                              <i class="fa fa-angle-down text-active"></i>
                            </span>
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>Table</span>
                                    </a>
                                    <ul class="nav dker">
                                        <li>
                                            <a href="table-static.html">
                                                <i class="fa fa-angle-right"></i>
                                                <span>Table static</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="table-datatable.html">
                                                <i class="fa fa-angle-right"></i>
                                                <span>Datatable</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#form" class="auto">
                            <span class="pull-right text-muted">
                              <i class="fa fa-angle-left text"></i>
                              <i class="fa fa-angle-down text-active"></i>
                            </span>
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>Form</span>
                                    </a>
                                    <ul class="nav dker">
                                        <li>
                                            <a href="form-elements.html">
                                                <i class="fa fa-angle-right"></i>
                                                <span>Form elements</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="form-validation.html">
                                                <i class="fa fa-angle-right"></i>
                                                <span>Form validation</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="form-wizard.html">
                                                <i class="fa fa-angle-right"></i>
                                                <span>Form wizard</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="chart.html" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>Chart</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="portlet.html" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>Portlet</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="timeline.html" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>Timeline</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" class="auto">
                        <span class="pull-right text-muted">
                          <i class="fa fa-angle-left text"></i>
                          <i class="fa fa-angle-down text-active"></i>
                        </span>
                                <i class="icon-grid icon">
                                </i>
                                <span>Pages</span>
                            </a>
                            <ul class="nav dk text-sm">
                                <li>
                                    <a href="profile.html" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>Profile</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="blog.html" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>Blog</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="invoice.html" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>Invoice</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="gmap.html" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>Google Map</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="jvectormap.html" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>Vector Map</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="signin.jsp" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>Signin</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="signup.jsp" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>Signup</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="404.html" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>

                                        <span>404</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav text-sm">
                        <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                            <span class="pull-right"><a href="#"><i class="icon-plus i-lg"></i></a></span>
                            Playlist
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-music-tone icon"></i>
                                <span>Hip-Pop</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-playlist icon text-success-lter"></i>
                                <b class="badge bg-success dker pull-right">9</b>
                                <span>Jazz</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- / nav -->
            </div>
        </section>

        <footer class="footer hidden-xs no-padder text-center-nav-xs">
            <div class="bg hidden-xs ">
                <div class="dropdown dropup wrapper-sm clearfix">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <span class="thumb-sm avatar pull-left m-l-xs">
                        <img id="aside_songs_img" src="images/a3.png" class="dker" alt="...">
                      </span>
                    </a>
                        <span class="hidden-nav-xs">
                        <span class="block m-l">
                          <strong id="aside_songs_name" class="font-bold text-lt"></strong>
                        </span>
                        <a href=""><span id="aside_songs_singer_name" class="text-muted text-xs block m-l"></span></a>
                      </span>


                </div>
            </div>
        </footer>
    </section>
</aside>


<script src="./js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="./js/bootstrap.js"></script>
<!-- App -->
<script src="./js/app.js"></script>
<script src="./js/slimscroll/jquery.slimscroll.min.js"></script>
<script src="./js/app.plugin.js"></script>
<script type="text/javascript" src="./js/jPlayer/jquery.jplayer.min.js"></script>
<script type="text/javascript" src="./js/jPlayer/add-on/jplayer.playlist.min.js"></script>
<script type="text/javascript" src="./js/jPlayer/demo.js"></script>