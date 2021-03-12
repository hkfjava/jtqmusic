package cn.hkf.controller;

import cn.hkf.domain.*;
import cn.hkf.service.*;
import cn.hkf.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    @Autowired
    private ISongsService songsService;

    @Autowired
    private IAlbumService albumService;

    @Autowired
    private ISingerService singerService;

    @Autowired
    private ISongMenuService songMenuService;

    /**
     * 注册用户
     *
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/save.do", method = RequestMethod.POST)
    public String save(User user) throws Exception {
        Integer res = userService.save(user);
        if (res == 1) {
            return "101";
        } else {
            return "100";
        }
    }

    /**
     * 异步验证
     *
     * @param user_account
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/findUserCount.do", method = RequestMethod.POST)
    public String findUserCount(String user_account) throws Exception {
        User user_new = userService.findUserName(user_account);
        if (user_new != null) {
            return "101";
        } else {
            return "100";
        }
    }

    /**
     * 异步登录
     *
     * @param user_account
     * @param user_password
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String login(String user_account, String user_password, HttpSession session) throws Exception {
        User user_new = userService.login(user_account, user_password);
        session.setAttribute("loginUser", user_new);


        // 用户喜欢的专辑，歌曲，歌手，歌单
        // 查找用户喜欢的歌曲id
        Integer[] user_coll_songs_ids = userService.findUser_coll_songs_ids(user_new.getUser_id());
        Integer[] user_coll_singer_ids = userService.findUser_coll_singer_ids(user_new.getUser_id());
        Integer[] user_coll_album_ids = userService.findUser_coll_album_ids(user_new.getUser_id());
        List<SongMenu> songMenus = songMenuService.findBy_userId(user_new.getUser_id());


        session.setAttribute("user_coll_songs_ids", user_coll_songs_ids);
        session.setAttribute("user_coll_singer_ids", user_coll_singer_ids);
        session.setAttribute("user_coll_album_ids", user_coll_album_ids);
        session.setAttribute("songMenus", songMenus);



        if (user_new != null) {
            return "101";
        } else {
            return "100";
        }
    }

    /**
     * 异步注销
     *
     * @return
     * @throws Exception
     */

    @RequestMapping(value = "/logout.do")
    public ModelAndView logout(HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView();
        User user = (User) session.getAttribute("loginUser");
        session.removeAttribute("loginUser");
        mv.setViewName("redirect:/index.do");
        return mv;
    }


    /**
     * 获取用户个人信息页面
     *
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/findUserInfo.do")
    public ModelAndView findUserInfo(HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView();
        User user = (User) session.getAttribute("loginUser");

        String patt = "yyyy-MM-dd";
        user.setUser_signupTime_str(DateUtils.date2String(user.getUser_signupTime(), patt));

        // 用户喜欢的专辑，歌曲，歌手，歌单

        // 查找用户喜欢的歌曲id
        Integer[] user_coll_songs_ids = userService.findUser_coll_songs_ids(user.getUser_id());
        Integer[] user_coll_singer_ids = userService.findUser_coll_singer_ids(user.getUser_id());
        Integer[] user_coll_album_ids = userService.findUser_coll_album_ids(user.getUser_id());

        List<SongsAlbumSinger> user_coll_songs_ids_info = new ArrayList<>();
        List<Singer> user_coll_singer_ids_info = new ArrayList<>();
        List<SongsAlbumSinger> user_coll_album_ids_info = new ArrayList<>();

        // 1. 歌曲信息 遍历用户的歌曲id 返回信息 SongsAlbumSinger
        List<Songs> songsList = new ArrayList<>();
        for (Integer songs_id : user_coll_songs_ids) {  //便利歌曲id
            songsList.add(songsService.findById(songs_id));
        }

        user_coll_songs_ids_info = findSongs_info(songsList);

        // 2. 歌手信息
        for (Integer singer_id : user_coll_singer_ids) {    // 遍历歌手id数组
            user_coll_singer_ids_info.add(singerService.findById(singer_id));
        }

        // 3. 专辑信息

        for (Integer album_id : user_coll_album_ids) {
            SongsAlbumSinger sas = new SongsAlbumSinger();
            Album album = albumService.findById(album_id);
            Singer singer = singerService.findById(album.getSinger_id());
            sas.setSinger(singer);
            sas.setAlbum(album);
            user_coll_album_ids_info.add(sas);
        }

        // 4. 歌单信息 根据用户id查找歌单
        List<SongMenu> songMenus = songMenuService.findBy_userId(user.getUser_id());

        // 添加用户信息
        mv.addObject("user", user);
        mv.addObject("user_coll_songs_ids_info", user_coll_songs_ids_info);
        mv.addObject("user_coll_singer_ids_info", user_coll_singer_ids_info);
        mv.addObject("user_coll_album_ids_info", user_coll_album_ids_info);
        mv.addObject("songMenus", songMenus);
        mv.setViewName("profile");
        return mv;
    }

    // 方法 根据 歌曲集合，返回排行榜歌曲信息集合
    public List<SongsAlbumSinger> findSongs_info(List<Songs> songsList) throws Exception {
        List<SongsAlbumSinger> songs_playCounts = new ArrayList<>();
        // 获取专辑图片
        for (Songs songs : songsList) {
            SongsAlbumSinger s = new SongsAlbumSinger();
            s.setSinger(singerService.findById(songs.getSinger_id()));
            s.setAlbum(albumService.findById(songs.getAlbum_id()));
            s.setSongs(songs);
            songs_playCounts.add(s);
        }
        return songs_playCounts;
    }


    /**
     * 异步收藏
     *
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/coll.do", method = RequestMethod.POST)
    public String coll(Integer songs_id, Integer singer_id, Integer album_id, HttpSession session) throws Exception {
        int res = 0;
        User user = (User) session.getAttribute("loginUser");
        // 收藏歌曲
        if (songs_id != null) {
            res = userService.coll_songs(songs_id, user.getUser_id());
        } else if (album_id != null) { // 收藏专辑
            res = userService.coll_album(album_id, user.getUser_id());

        } else if (singer_id != null) { // 收藏专辑
            res = userService.coll_singer(singer_id, user.getUser_id());

        }

        if (res == 1) {
            return "101";
        } else {
            return "100";
        }

    }


    /**
     * 异步取消收藏
     *
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/coll_cancel.do", method = RequestMethod.POST)
    public String coll_cancel(Integer songs_id, Integer singer_id, Integer album_id, HttpSession session) throws Exception {
        int res = 0;
        User user = (User) session.getAttribute("loginUser");
        // 取消收藏歌曲
        if (songs_id != null) {
            res = userService.coll_songs_cancel(songs_id, user.getUser_id());
        } else if (album_id != null) { // 收藏专辑
            res = userService.coll_album_cancel(album_id, user.getUser_id());

        } else if (singer_id != null) { // 收藏专辑
            res = userService.coll_singer_cancel(singer_id, user.getUser_id());

        }

        if (res == 1) {
            return "101";
        } else {
            return "100";
        }
    }


}
