package cn.hkf.controller;


import cn.hkf.domain.Album;
import cn.hkf.domain.Classify;
import cn.hkf.domain.Region;
import cn.hkf.domain.Singer;
import cn.hkf.service.IAlbumService;
import cn.hkf.service.IClassifyService;
import cn.hkf.service.IRegionService;
import cn.hkf.service.ISingerService;
import cn.hkf.utils.DateUtils;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/album")
public class AlbumController {

    @Autowired
    private ISingerService singerService;

    @Autowired
    private IAlbumService albumService;

    /**
     * 异步 根据专辑id查找专辑时间和 剩余可上传
     */
    @RequestMapping(value = "/findBy_albumId.do",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String findBy_albumId(@RequestParam(value = "album_id",required = true) Integer album_id) throws Exception {
        String str = "yyyy-MM-dd";
        Album album = albumService.findById(album_id);
        album.setAlbum_issueDate_str(DateUtils.date2String(album.getAlbum_issueDate(), str));
        Gson gson = new Gson();
        String jsonListString = gson.toJson(album);
        return jsonListString;

    }

    /**
     * 专辑详情页面的相似专辑 利用该歌手的其他专辑为推荐
     * @param singer_id
     * @param
     * @param
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/findLikeAlbum.do",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String findLikeAlbum(@RequestParam(value = "singer_id",required = true) Integer singer_id,
                                 @RequestParam(value = "album_id",required = true) Integer album_id) throws Exception {

        List<Album> albums = albumService.findLikeAlbum(singer_id,album_id);
        String str = "yyyy-MM-dd";
        for (Album album : albums) {
            album.setAlbum_issueDate_str(DateUtils.date2String(album.getAlbum_issueDate(), str));
        }


        Gson gson = new Gson();
        String jsonListString = gson.toJson(albums);

        return jsonListString;
    }

    /**
     * 根据专辑id查询专辑
     * 根据歌手id查询歌手名字和id
     */
    @RequestMapping(value = "/findById.do",method = RequestMethod.GET)
    public ModelAndView findById(@RequestParam(value = "album_id",required = true) Integer album_id,
                                 @RequestParam(value = "singer_id",required = true) Integer singer_id) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 根据歌手id 查询歌手的信息，页面专辑详情取出歌手id，歌手名字，歌手流派
        Singer singer = singerService.findById(singer_id);

        // 根据专辑id 查找专辑信息， 页面展示所有
        Album album = albumService.findById(album_id);
    //        设置一下专辑时间格式
        String str = "yyyy-MM-dd";
        album.setAlbum_issueDate_str(DateUtils.date2String(album.getAlbum_issueDate(), str));

        mv.addObject("singer", singer);
        mv.addObject("album", album);

        mv.setViewName("album-detail");
        return mv;
    }


    /**
     * 根据g歌手id查找 该歌手专辑
     */
    @RequestMapping(value = "/findBySinger_Id.do",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String findBySinger_Id(@RequestParam(value = "singer_id",required = true) Integer singer_id) throws Exception {
        String str = "yyyy-MM-dd";
        List<Album> albums = albumService.findBySinger_Id(singer_id);
        for (Album album : albums) {
            album.setAlbum_issueDate_str(DateUtils.date2String(album.getAlbum_issueDate(), str));
        }

        Gson gson = new Gson();
        String jsonListString = gson.toJson(albums);
        return jsonListString;

    }


    /**
     * 上传专辑页面的 异步获取歌手
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/findAllSinger.do", produces = {"application/json;charset=UTF-8"})
    public String findAllSinger() throws Exception {
        List<Singer> singers = singerService.findAll();
        Gson gson = new Gson();
        String jsonListString = gson.toJson(singers);
        return jsonListString;
    }


    /**
     * 保存 专辑
     *
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/save.do",method = RequestMethod.POST)
    public String save(Album album) throws Exception {
        System.out.println("ajax");
        int res =  albumService.save(album);
        if( res == 1) {
            return "101";
        } else {
            return "100";
        }
    }








}
