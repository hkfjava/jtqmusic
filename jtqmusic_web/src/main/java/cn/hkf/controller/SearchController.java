package cn.hkf.controller;

import cn.hkf.domain.*;
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

import java.util.List;

@Controller
@RequestMapping("/search")
public class SearchController {

    @Autowired
    private ISongsService songsService;

    @Autowired
    private ISingerService singerService;

    @Autowired
    private IAlbumService albumService;

    /**
     * 根据搜索内容 模糊查询 所有歌曲 专辑 歌单，歌手 用户
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/findAll.do")
    public ModelAndView findAll(@RequestParam("search_text") String search_text) throws Exception {
        ModelAndView mv = new ModelAndView();

        String str = search_text.trim();

        // 调用方法
        List<Songs> songs = songsService.findBy_search(str);

        List<Album> albums = albumService.findBy_search(str);

        List<Singer> singers = singerService.findBy_search(str);



        String patt = "yyyy-MM-dd";
        for (Album album : albums) {
            album.setAlbum_issueDate_str(DateUtils.date2String(album.getAlbum_issueDate(), patt));
        }

        mv.addObject("singers", singers);
        mv.addObject("songs", songs);
        mv.addObject("albums", albums);

        mv.addObject("albums_count", albums.size());
        mv.addObject("songs_count", songs.size());
        mv.addObject("singers_count", singers.size());

        mv.addObject("sear", str);
//        mv.addObject("songmenus", classifies);
//        mv.addObject("user", classifies);
        mv.setViewName("search-detail");
        return mv;
    }

}
