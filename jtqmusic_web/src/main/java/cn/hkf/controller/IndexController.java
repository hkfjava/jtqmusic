package cn.hkf.controller;

import cn.hkf.domain.Album;
import cn.hkf.domain.Singer;
import cn.hkf.domain.Songs;
import cn.hkf.domain.SongsAlbumSinger;
import cn.hkf.service.IAlbumService;
import cn.hkf.service.ISingerService;
import cn.hkf.service.ISongsService;
import cn.hkf.utils.DateUtils;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private ISongsService songsService;

    @Autowired
    private IAlbumService albumService;

    @Autowired
    private ISingerService singerService;

    /**
     * 发现 查找最热的前 12 首歌曲 根据播放量
     * 最新歌曲，根据 事件的 逆序 所有歌曲
     * 排行榜： 最热的前5首
     * <p>
     * 3个sql 也就是三个方法
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/index.do")
    public ModelAndView findAll_singers() throws Exception {
        ModelAndView mv = new ModelAndView();

        // 前12 播放量的歌曲
        List<Songs> songs_find = songsService.findBy_playCount(12);

        List<SongsAlbumSinger> songsAlbumSingers_find = new ArrayList<>();
        // 获取专辑图片
        for (Songs songs : songs_find) {
            SongsAlbumSinger s = new SongsAlbumSinger();
            s.setSinger(singerService.findById(songs.getSinger_id()));
            s.setAlbum(albumService.findById(songs.getAlbum_id()));
            s.setSongs(songs);
            songsAlbumSingers_find.add(s);
        }

        // 最新歌曲，根据时间
        List<Songs> songs_new = songsService.findBy_issueDate(8);

        List<SongsAlbumSinger> songsAlbumSingers_new = new ArrayList<>();
        // 获取专辑图片
        for (Songs songs : songs_new) {
            SongsAlbumSinger s = new SongsAlbumSinger();
            s.setSinger(singerService.findById(songs.getSinger_id()));
            s.setAlbum(albumService.findById(songs.getAlbum_id()));
            s.setSongs(songs);
            songsAlbumSingers_new.add(s);
        }

        // 前五歌曲  播放量
        List<Songs> songs_rank = songsService.findBy_playCount(5);

        List<SongsAlbumSinger> songsAlbumSingers_rank = new ArrayList<>();
        // 获取专辑图片
        for (Songs songs : songs_rank) {
            SongsAlbumSinger s = new SongsAlbumSinger();
            s.setSinger(singerService.findById(songs.getSinger_id()));
            s.setAlbum(albumService.findById(songs.getAlbum_id()));
            s.setSongs(songs);
            songsAlbumSingers_rank.add(s);
        }

        mv.addObject("songs_find", songsAlbumSingers_find);
        mv.addObject("songs_new", songsAlbumSingers_new);
        mv.addObject("songs_rank", songsAlbumSingers_rank);

        mv.setViewName("index");
        return mv;
    }

}
