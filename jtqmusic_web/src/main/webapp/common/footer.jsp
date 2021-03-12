<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="footer bg-dark">
    <div id="jp_container_N">
        <div class="jp-type-playlist">
            <div id="jplayer_N" class="jp-jplayer hide"></div>
            <div class="jp-gui">
                <div class="jp-video-play hide">
                    <a class="jp-video-play-icon">play</a>
                </div>
                <div class="jp-interface">
                    <div class="jp-controls">
                        <!-- 上一曲按钮 -->
                        <div><a class="jp-previous"><i class="icon-control-rewind i-lg"></i></a>
                        </div>
                        <div>
                            <!-- 播放 -->
                            <a class="jp-pause" id="playA" onclick="playAudio(this)"><i
                                    class="icon-control-play i-2x"></i></a>
                            <!-- 暂停 -->
                            <a class="jp-pause hid" id="playB" onclick="pauseAudio(this)"><i
                                    class="icon-control-pause i-2x"></i></a>
                        </div>
                        <!-- 下一曲 -->
                        <div><a class="jp-next"><i
                                class="icon-control-forward i-lg"></i></a></div>
                        <div class="hide"><a class="jp-stop"><i class="fa fa-stop"></i></a>
                        </div>
                        <%-- 播放列表 --%>
                        <div class="btn-group dropup m-r">
                            <div data-toggle="dropdown" class="icon-list dropdown-toggle" onclick="click_playList_button()">
                                <span class="dropdown-label"></span>
                            </div>
                            <ul class="dropdown-menu dker" style="overflow-y: auto;height: 300px;" id="playList_ul_id">
                                <li>
                                    <div><a href="javascript:;"
                                            class="jp-playlist-item fa fa-play-circle"
                                            tabindex="1">&nbsp;&nbsp;&nbsp;Busted Chump<span
                                            class="jp-artist">by ADG3&nbsp;&nbsp;&nbsp;<i
                                            class="fa fa-times"></i></span></a></div>
                                </li>

                                <li>
                                    <div><a href="javascript:;"
                                            class="jp-playlist-item"
                                            tabindex="1">Chucked
                                        Knuckles <span class="jp-artist">by 3studios&nbsp;&nbsp;&nbsp;<i
                                                class="fa fa-times"></i></span></a></div>
                                </li>




                            </ul>
                        </div>


                        <!-- 进度条 -->
                        <div id="progressbar_bg_bg" class="jp-progress hidden-xs"
                             style="padding-top: 5px;">

                            <div style="height: 5px;"><span id="footer_p_song_name"
                                                            style="color: white">Kevin Kern </span>--- <span
                                    onclick="click_singer_name(this)" singer_id="" id="footer_p_singer_name"
                                    style="color: gold">Velvet Green</span></div>
                            <div style="height: 10px"></div>
                            <!-- 进度条背景 白色 -->
                            <div style="height: 7px;" id="progressbar_bg" class="progress progress-xs m-t-sm">
                                <!-- 进度条设置 -->
                                <div id="progressbar" class="progress-bar bg-info"
                                     data-toggle="tooltip" style="height: 100%;"></div>
                            </div>
                            <!-- <div class="jp-seek-bar dk">
                              <div class="jp-play-bar bg-info">
                              </div>

                              <div class="jp-title text-lt">

                                <ul>
                                  <li></li>
                                </ul>
                              </div>
                            </div> -->

                        </div>
                        <!-- 当前播放时间 -->
                        <div id="currenttime"
                             class="hidden-xs hidden-sm  text-xs text-muted"></div>
                        <!-- 歌曲总时间 -->
                        <div id="duration"
                             class="hidden-xs hidden-sm  text-xs text-muted"></div>
                        <!-- 声音控制 -->
                        <div class="hidden-xs hidden-sm">
                            <a class="jp-unmute" id="muteA" onclick="muteOpen()"
                               title="mute"><i class="icon-volume-2"></i></a>
                            <a class="jp-unmute hid " id="muteB" onclick="unmuteOpen()"
                               title="unmute"><i class="icon-volume-off"></i></a>
                        </div>
                        <!-- 声音进度条 -->
                        <div class="hidden-xs hidden-sm jp-volume">
                            <!-- <div id="volume_bar" class="jp-volume-bar dk"> -->
                            <!-- <div id="volume_value" class="jp-volume-bar-value lter"></div> -->
                            <input type="range" class="jp-volume-bar-value lter"
                                   onchange="setVoice(this)" value="50" max="100" id="v">
                            <!-- </div> -->
                        </div>
                        <div>
                            <a class="jp-shuffle" title="shuffle"><i
                                    class="icon-shuffle text-muted"></i></a>
                            <a class="jp-shuffle-off hid" title="shuffle off"><i
                                    class="icon-shuffle text-lt"></i></a>
                        </div>
                        <div>
                            <a class="jp-repeat-off" id="repeatA" onclick="repeatOpen()"
                               title="repeat"><i class="icon-loop text-muted"></i></a>
                            <a class="jp-repeat-off hid" id="repeatB" onclick="repeatOff()"
                               title="repeat off"><i class="icon-loop text-lt"></i></a>
                        </div>
                        <div class="hide">
                            <a class="jp-full-screen" title="full screen"><i
                                    class="fa fa-expand"></i></a>
                            <a class="jp-restore-screen" title="restore screen"><i
                                    class="fa fa-compress text-lt"></i></a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="jp-no-solution hide">
                <span>Update Required</span>
                To play the media you will need to either update your browser to a recent
                version or update your <a href="http://get.adobe.com/flashplayer/"
                                          target="_blank">Flash plugin</a>.
            </div>
        </div>
    </div>
</footer>

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

<!-- 音乐播放控制 -->
<script type="text/javascript">
    // 获取音频标签对象
    // var _audio = $('#aud')[0];
    var _audio = new Audio();

    // 控制 首页发现歌曲 和 歌曲展示页面 的播放暂停按键函数使用 ，值为 id
    var song_url_s;
    var song_icon_id;

    // 控制 首页最新歌曲的播放暂停按键函数使用 ，值为 id
    var song_url_s_new;

    // (s_name, s_name_singer, s_id_singer, s_album_img) 设置四个数组，用于播放下一曲时 赋值播放列表
    var s_name_arr =  [];
    var s_name_singer_arr =  [];
    var s_id_singer_arr =  [];
    var s_album_img_arr =  [];



    // 总时间
    var duration;

    // 获取播放和暂停
    var play = $('#playA');
    var pause = $('#playB');
    // 当前时间
    var currenttime = _audio.currentTime;

    //音乐进度条
    var p_percent = '0%';


    // 进度条背景坐标位置
    var odiv = document.getElementById('progressbar_bg');
    var pro_lx = odiv.getBoundingClientRect().left;
    var pro_top = odiv.getBoundingClientRect().top;
    var pro_rx = odiv.getBoundingClientRect().right;

    //进度条总长度
    var p_length = pro_rx - pro_lx;

    // 获取声音键
    var mute = $('#muteA');
    var unmute = $('#muteB');

    // 循环按钮
    var repeatA = $('#repeatA');
    var repeatB = $('#repeatB');


    // 全局开始
    var str = "/music/songs/Kevin Kern/Endless Blue Sky/Kevin Kern - Always Near.mp3";
    var str1 = "/music/songs/Kevin Kern/In My Life/Kevin Kern - Bittersweet.mp3";
    var arr = [str];

    $(document).ready(function () {

        // 播放列表
        // 清空原始的
        console.log("清空播放列表前");
        $('#playlist_ul').empty();
        console.log("清空播放列表后");

        console.log("加载前" + arr.length);
        music(_audio, arr.pop());
        _audio.addEventListener('ended', playEndedHandler, false);
        console.log("加载后" + arr.length);


    });

    function playEndedHandler() {
        _audio.load();
        console.log("执行playEndedHandler方法前");
        console.log("真正播放前arr长度：" + arr.length);
        // console.log("真正播放前" + arr);

        _audio.src = arr.pop();
        console.log("真正播放后arr数组长度" + arr.length);
        // console.log("真正播放后" + arr);
        // console.log(_audio.src);

        getSongs_info_play(s_name_arr.pop(),s_name_singer_arr.pop(),s_id_singer_arr.pop(),s_album_img_arr.pop())

        _audio.play();
        play.addClass(" hid");
        pause.removeClass(" hid");
        // console.log(arr.length);
        !arr.length && _audio.removeEventListener('ended', playEndedHandler, false);//只有一个元素时解除绑定
        console.log("执行playEndedHandler方法后");
    };


    function music(audio, url) {
        _audio.src = url;
        console.log("加载中");
        $('#jplayer_N').empty();

        // 最开始赋值歌曲两个时间
        audio.load();

        audio.oncanplay = function () {
            var d = audio.duration;
            // alert(d);
            duration = d;
            // alert(duration);
            $('#currenttime').text(calTime(currenttime));
            $('#duration').text(calTime(duration));
        };
    }


    // 鼠标在进度条上移动(失败)
    odiv.onmousemove = function (e) {
        // var loc = "当前位置 x:"+e.pageX+",y:"+e.pageY;
        // console.log(loc);
        // 鼠标x，y位置
        var mx = e.pageX;
        var my = e.pageY;
        // console.log(mx,my);
    };

    // 鼠标在进度条上按下事件跳到指定时间播放
    odiv.onmousedown = function (e) {
        // 鼠标x，y位置
        var mx = e.pageX;
        var my = e.pageY;
        // 当前鼠标点击位置的百分比
        var l_p = (mx - pro_lx) / p_length;
        var l_p1 = l_p.toFixed(2);
        // 赋值当前获取的播放时间
        currenttime = duration * l_p1;
        console.log(duration);
        p_percent = l_p1 * 100 + '%';
        // 设置当前播放时间
        $('#currenttime').text(calTime(currenttime));
        // 设置进度条百分比
        $('#progressbar').width(p_percent);
        // 设置音频当前播放时间
        _audio.currentTime = currenttime;

        // console.log(l_p1,currenttime);
    };


    //监听音频播放的实时时间事件
    _audio.addEventListener("timeupdate", function () {
        // 音乐播放时候 获取当前时间
        currenttime = _audio.currentTime;
        // console.log(currenttime);
        $('#currenttime').text(calTime(currenttime));

        // 进度条百分比
        // 百分比
        var p = (currenttime / duration).toFixed(3) * 100;
        // console.log(p);
        p_percent = p + '%';

        // 设置进度条
        $('#progressbar').width(p_percent);


    }, false);

    // 音频结束后把暂停按钮恢复到播放按钮
    _audio.onended = function () {
        // 设置暂停按钮为播放按钮
        pause.addClass(" hid");
        play.removeClass(" hid");
    };


    // 计算时间格式为分钟
    function calTime(times) {
        var time = times;
        //分钟
        var minute = time / 60;
        var minutes = parseInt(minute);
        if (minutes < 10) {
            minutes = "0" + minutes;
        }
        //秒
        var second = time % 60;
        var seconds = Math.round(second);
        if (seconds < 10) {
            seconds = "0" + seconds;
        }

        //总共时长的秒数
        var allTime = parseInt(minutes * 60 + seconds);
        var timeString = minutes + ':' + seconds;
        // console.log(time,minutes,seconds,allTime);
        return timeString;
    }

    // 播放按钮事件
    function playAudio(obj) {
        // 播放
        setTimeout(() => {
            _audio.play();
        }, 10);

        // 设置播放按钮为暂停按钮
        play.addClass(" hid");
        pause.removeClass(" hid");
        console.log("主暂停键获取到的地址" + song_url_s);
        change_playByPause(song_url_s); // 该方法在 歌手歌曲界面 专辑歌曲界面 和 首页发现部分通用来改变播放按钮和主要的同步
        change_playByPause_newSongs(song_url_s_new); // 该方法在 首页最新部分通用来改变播放按钮和主要的同步


    };

    // 暂停按钮时间
    function pauseAudio(obj) {
        // 暂停
        _audio.pause();
        // 设置暂停按钮为播放按钮
        pause.addClass(" hid");
        play.removeClass(" hid");

        change_pauseByPaly(song_url_s); // 该方法在 歌手歌曲界面 专辑歌曲界面 和 首页发现部分通用来改变播放按钮和主要的同步
        change_pauseByPaly_newSongs(song_url_s_new); // 该方法在 首页最新部分通用来改变播放按钮和主要的同步

    };

    // 开启音量按钮事件
    function muteOpen() {
        // 声音
        _audio.muted = true;
        // 设置静音开启
        mute.addClass(" hid");
        unmute.removeClass(" hid");
    };

    // 暂停按钮时间
    function unmuteOpen() {
        _audio.muted = false;
        // 设置静音关闭
        unmute.addClass(" hid");
        mute.removeClass(" hid");

    };

    // 音量
    function setVoice(r) {
        _audio.volume = r.value / 100;
    }

    // 开启循环播放
    function repeatOpen() {
        // 声音
        _audio.loop = true;

        // 设置静音开启
        repeatA.addClass(" hid");
        repeatB.removeClass(" hid");
    };

    // 打开循环按钮
    function repeatOff() {
        _audio.loop = false;

        // 设置静音关闭
        repeatB.addClass(" hid");
        repeatA.removeClass(" hid");
    };

    function play_songs(url) {
        console.log("执行play_songs 方法准备播放");
        // console.log(arr.length);
        // console.log(url);
        arr.push(url);
        // console.log(arr.length);
        playEndedHandler();
        // console.log(arr.length);

        // 获取auido标签的id
        <%--var u = '${pageContext.request.contextPath}/' + url;--%>
        // $(_audio).attr("src",u);
        // var fry_audio=$(_audio).get('0');
        // fry_audio.load();

        <%--_audio.src = "${pageContext.request.contextPath}/music/songs/Kevin Kern/In My Life/Kevin Kern - Caring Friend.mp3";--%>
        // 设置audio标签的src为url
        // _audio.load();
        // playAudio();

    };

    // 播放所有歌曲 传入地址数组
    function play_all_songs(arr_url) {
        console.log("准备播放");
        console.log(arr.length);
        for (var i = 0; i < arr_url.length; i++) {
            arr.push(arr_url[i]);
        }
        console.log("播放全部歌曲后arr数组长度：" + arr.length);
        // console.log("播放全部歌曲后arr数组内容：" +arr);
        playEndedHandler();

        console.log("播放全部歌曲后arr数组长度：" + arr.length);
        // console.log("播放全部歌曲后arr数组内容：" +arr);


    };

    // 点击歌曲名字 触发函数
    function click_singer_name(obj) {
        var id = $(obj).attr("singer_id");
        console.log("click_singer_name函数的 ref" + id);
        window.location.href = "${pageContext.request.contextPath}/singer/findById.do?singer_id=" + id;
    };


    // 创建一个函数 为 getSongs_info_play 参数为 歌曲名字 歌手名字，歌手id，专辑图片地址
    function getSongs_info_play(s_name, s_name_singer, s_id_singer, s_album_img) {
        console.log("执行getSongs_info_play方法");
        // console.log(s_name);
        // console.log(s_name_singer);
        // console.log(s_id_singer);
        // console.log(s_album_img);

        // 获取音乐播放控制台的信息
        // 获取aside 的
        $('#aside_songs_img').attr("src", s_album_img); // 设置专辑图片


        $('#aside_songs_name').text(s_name);
        $('#aside_songs_singer_name').html(s_name_singer);
        var href_str_singer = "${pageContext.request.contextPath}/singer/findById.do?singer_id=" + s_id_singer;
        $('#aside_songs_singer_name').parent().attr('href', href_str_singer);

        // 获取 播放器的对象
        $('#footer_p_song_name').html(s_name);
        $('#footer_p_singer_name').html(s_name_singer);

        //给 播放界面 的歌手添加href属性赋值
        $('#footer_p_singer_name').attr("singer_id", s_id_singer);

    };


    // 点击播放列表按钮
    function click_playList_button() {
        console.log("click_playList_buttonh函数");

        // 发送异步请求
        $.ajax({
            url:'${pageContext.request.contextPath}/playList/findAll_session.do',
            contentType:"application/json;charset=utf-8",
            type:"POST",
            dataType:"JSON",
            success:function (res) {
                $('#playList_ul_id').empty();
                for (var i = res.length-1;i>=0;i--){
                    var songs_url = res[i]['songs_url'];
                    console.log('请求播放列表成功' + res.length + res[i]['songs_url']);
                    var songs_name = res[i]['songs_name'];
                    var songs_id = res[i]['songs_id'];
                    var singer_id = res[i]['singer_id'];
                    var singer_name = res[i]['singer_name'];
                    // 赋值playList给arr全局数组
                    var songs_imgUrl = res[i]['album_imgUrl'];

                    // 赋值playList给arr全局数组
                    arr.push(songs_url);

                    s_name_arr.push(songs_name);
                    s_name_singer_arr.push(singer_name);
                    s_id_singer_arr.push(singer_id);
                    s_album_img_arr.push(songs_imgUrl);

                    var item = " <li>\n" +
                        "     <div><a onclick=\"click_playList_a("+i+")\"\n" +
                        "       class=\"jp-playlist-item\"\n" +
                        "         tabindex=\"1\" >"+songs_name+" <span class=\"jp-artist\">"+singer_name+"&nbsp;&nbsp;&nbsp;<i\n" +
                        "   class=\"fa fa-times\"></i></span></a></div>\n" +
                            " <input hidden id=\"songs_name_playList_"+i+"\"\n" +
                        "                                                               value=\""+songs_name+"\"/>\n" +
                        "                                                        <input hidden id=\"songs_singer_name_playList_"+i+"\"\n" +
                        "                                                               value=\""+singer_name+"\"/>\n" +
                        "                                                        <input hidden id=\"songs_singer_id_playList_"+i+"\"\n" +
                        "                                                               value=\""+singer_id+"\"/>\n" +
                        "                                                        <input hidden id=\"songs_url_playList_"+i+"\"\n" +
                        "                                                               value=\""+songs_url+"\"/>" +
                        "                                                        <input hidden id=\"songs_id_playList_"+i+"\"\n" +
                        "                                                               value=\""+songs_id+"\"/>" +
                        "                                                        <input hidden id=\"songs_imgUrl_playList_"+i+"\"\n" +
                        "                                                               value=\""+songs_imgUrl+"\"/>" +
                        "\n" +
                        "   </li>";

                    $('#playList_ul_id').append(item);
                }
                // console.log(arr);
            }
        });

    };

    // 点击播放列表其中的歌曲
    function click_playList_a(a) {
        console.log("点击click_playList_a函数:"+ a);
        // 获取信息
        var s_name = $('#songs_name_playList_' + a).val();
        var songs_url = $('#songs_url_playList_' + a).val();
        var s_name_singer = $('#songs_singer_name_playList_' + a).val();
        var s_id_singer = $('#songs_singer_id_playList_' + a).val();
        var s_album_img = $('#songs_imgUrl_playList_' + a).val();

        console.log("点击click_playList_a函数:"+ s_name +"==" + songs_url);


        // 执行方法
        getSongs_info_play(s_name, s_name_singer, s_id_singer, s_album_img);

        // 播放歌曲
        play_songs(songs_url);



    };






</script>