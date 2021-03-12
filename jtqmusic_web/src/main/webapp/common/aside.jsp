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
                        <li>
                            <a href="${pageContext.request.contextPath}/upload_singer.jsp">
                                <i class="fa fa-cloud icon  text-info-dker"></i>
                                <span class="font-bold">上传</span>
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