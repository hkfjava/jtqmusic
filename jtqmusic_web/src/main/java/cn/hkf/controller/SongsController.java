package cn.hkf.controller;

import cn.hkf.domain.Album;
import cn.hkf.domain.Songs;
import cn.hkf.service.ISongsService;
import cn.hkf.utils.DateUtils;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/songs")
public class SongsController {

    @Autowired
    private ISongsService songsService;

    /**
     * 根据歌手id查找歌手所有歌曲
     */
    @RequestMapping(value = "/findAllBy_SingerId.do", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String findAllBy_SingerId(@RequestParam(value = "singer_id", required = true) Integer singer_id) throws Exception {

        List<Songs> songsList = songsService.findAllBy_SingerId(singer_id);
        Gson gson = new Gson();
        String jsonListString = gson.toJson(songsList);
        return jsonListString;
    }

    /**
     * 根据专辑id查找所有歌曲
     */
    @RequestMapping(value = "/findAllBy_AlbumId.do", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String findAllBy_AlbumId(@RequestParam(value = "album_id", required = true) Integer album_id) throws Exception {

        List<Songs> songsList = songsService.findAllBy_AlbumId(album_id);
        Gson gson = new Gson();
        String jsonListString = gson.toJson(songsList);
        return jsonListString;
    }

    /**
     * 保存 歌曲
     *
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/save.do", method = RequestMethod.POST)
    public String save(Songs songs) throws Exception {
        System.out.println("ajax");
        int res = songsService.save(songs);
        if (res == 1) {
            return "101";
        } else {
            return "100";
        }
    }

}
