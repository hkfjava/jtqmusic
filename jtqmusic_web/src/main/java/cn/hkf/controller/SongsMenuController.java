package cn.hkf.controller;

import cn.hkf.domain.SongMenu;
import cn.hkf.domain.Songs;
import cn.hkf.domain.SongsAlbumSinger;
import cn.hkf.domain.User;
import cn.hkf.service.IAlbumService;
import cn.hkf.service.ISingerService;
import cn.hkf.service.ISongMenuService;
import cn.hkf.service.ISongsService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/songsmenu")
public class SongsMenuController {

    @Autowired
    private ISongMenuService songMenuService;

    @Autowired
    private ISongsService songsService;

    @Autowired
    private ISingerService singerService;

    @Autowired
    private IAlbumService albumService;



    /**
     * 歌单信息页面
     *
     * @return
     * @throws Exception
     */

    @RequestMapping(value = "/findBy_id.do")
    public ModelAndView findBy_id(Integer songmenu_id) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 1.根据歌单id查找歌单信息
        SongMenu songMenu = songMenuService.findBy_id(songmenu_id);

        // 2. 根据歌单id查找所有歌曲id 为数组
        Integer[] songs_ids = songMenuService.findSongsIds_by_songmenu_id(songmenu_id);
        // 根据歌手id找出所有歌曲信息

        List<SongsAlbumSinger> user_coll_songs_ids_info = new ArrayList<>();

        // 1. 歌曲信息 遍历用户的歌曲id 返回信息 SongsAlbumSinger
        List<Songs> songsList = new ArrayList<>();
        for (Integer songs_id : songs_ids) {  //便利歌曲id
            songsList.add(songsService.findById(songs_id));
        }

        user_coll_songs_ids_info = findSongs_info(songsList);

        mv.addObject("user_coll_songs_ids_info",user_coll_songs_ids_info);
        mv.addObject("songMenu",songMenu);
        mv.addObject("songMenu_songs_size",songs_ids.length);

        mv.setViewName("songmenu-detail");
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
     * 保存 歌曲到歌单
     *
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/save_songmenu_songs.do", method = RequestMethod.POST)
    public String save_songmenu_songs(Integer songsmenu_id,  Integer songs_id) throws Exception {
        int res = songMenuService.save_songmenu_songs(songsmenu_id,songs_id);
        if (res == 1) {
            return "101";
        } else {
            return "100";
        }
    }

    /**
     * 删除 歌单 的歌曲
     *
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/delete_songmenu_songs.do", method = RequestMethod.POST)
    public String delete_songmenu_songs(Integer songsmenu_id,  Integer songs_id) throws Exception {
        int res = songMenuService.delete_songmenu_songs(songsmenu_id,songs_id);
        if (res == 1) {
            return "101";
        } else {
            return "100";
        }
    }

    /**
     * 保存 歌单
     *
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/save.do", method = RequestMethod.POST)
    public String save(SongMenu songMenu, HttpSession session) throws Exception {
        User user = (User) session.getAttribute("loginUser");
        songMenu.setUser_id(user.getUser_id());
        int res = songMenuService.save(songMenu);
        if (res == 1) {
            return "101";
        } else {
            return "100";
        }
    }




}
