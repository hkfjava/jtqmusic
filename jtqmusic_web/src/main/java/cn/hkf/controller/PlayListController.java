package cn.hkf.controller;

import cn.hkf.domain.Album;
import cn.hkf.domain.PlayList;
import cn.hkf.domain.Singer;
import cn.hkf.domain.Songs;
import cn.hkf.service.IAlbumService;
import cn.hkf.service.ISingerService;
import cn.hkf.service.ISongsService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/playList")
public class PlayListController {

    @Autowired
    private ISongsService songsService;

    @Autowired
    private IAlbumService albumService;

    @Autowired
    private ISingerService singerService;

    /**
     * 获取所有播放列表
     */
    @RequestMapping(value = "/findAll_session.do", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String findAll_session(HttpServletRequest request) throws Exception {

        List<PlayList> playLists = null;
        // 如果 session不为空，获取当前session的key赋值为playLists
        if (request.getSession().getAttribute("playLists") != null) {
            playLists = (List<PlayList>) request.getSession().getAttribute("playLists");
        } else {
            playLists = new ArrayList<>();  // 存放多个实体
        }
        Gson gson = new Gson();
        String jsonListString = gson.toJson(playLists);
        return jsonListString;
    }

    /**
     * 保存 播放列表
     *
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/savePlayList.do", method = RequestMethod.GET)
    public String savePlayList(String[] songs_ids, HttpServletRequest request) throws Exception {
        System.out.println("ajax");

        PlayList playList = null;
        List<PlayList> playLists = null;
        // 如果 session不为空，获取当前session的key赋值为playLists
        if (request.getSession().getAttribute("playLists") != null) {
            request.getSession().removeAttribute("playLists");
        }
        playLists = new ArrayList<>();
        // 根据id查询情况然后给playList实体赋值
        // 遍历 给playLists赋值
        for (String songs_id : songs_ids) {
            int id = Integer.parseInt(songs_id);
             playList = new PlayList(); // 实体
            // 1. 获取歌曲名字和歌曲id并赋值
            Songs newSongs = songsService.findById(id);
            playList.setSongs_id(id);
            playList.setSongs_name(newSongs.getSongs_name());
            playList.setSongs_url(newSongs.getSongs_url());

            // 2. 获取歌手名字和id赋值
            Singer newSinger = singerService.findById(newSongs.getSinger_id());
            playList.setSinger_id(newSinger.getSinger_id());
            playList.setSinger_name(newSinger.getSinger_name());

            // 3. 获取专辑 图片地址和id
            Album newAlbum = albumService.findById(newSongs.getAlbum_id());
            playList.setAlbum_id(newAlbum.getAlbum_id());
            playList.setAlbum_imgUrl(newAlbum.getAlbum_imgUrl());
            playList.setAlbum_name(newAlbum.getAlbum_name());

            // 存到list集合
            playLists.add(playList);
        }


        request.getSession().setAttribute("playLists", playLists);

        int res = 1;
        if (res == 1) {
            return "101";
        } else {
            return "100";
        }
    }
}
