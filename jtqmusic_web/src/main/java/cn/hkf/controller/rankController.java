package cn.hkf.controller;

import cn.hkf.domain.Album;
import cn.hkf.domain.Singer;
import cn.hkf.domain.Songs;
import cn.hkf.domain.SongsAlbumSinger;
import cn.hkf.service.IAlbumService;
import cn.hkf.service.ISingerService;
import cn.hkf.service.ISongsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/rank")
public class rankController {

    @Autowired
    private ISongsService songsService;

    @Autowired
    private IAlbumService albumService;

    @Autowired
    private ISingerService singerService;

    /**
     * 获取排行榜的信息
     * 1. 播放量 下载量 收藏量
     * 2. 歌单  歌手榜  专辑榜
     * 3. 轻音乐 新世纪 古典
     * 4. 中国 韩国 日本 欧美
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/findAll_rank.do")
    public ModelAndView findAll_singers() throws Exception {
        ModelAndView mv = new ModelAndView();

        // 1. 播放量 下载量 收藏量
        // 1.1 播放量 前五
        List<Songs> songs_playCount = songsService.findBy_playCount(5);
        List<SongsAlbumSinger> songs_playCounts_rank = findSongs_info(songs_playCount);

        // 1.2 下载量 前五
        List<Songs> songs_downloadCount = songsService.findBy_downloadCount(5);
        List<SongsAlbumSinger> songs_downloadCounts_rank = findSongs_info(songs_downloadCount);

        // 1.3 收藏量
        List<Songs> songs_collCount = songsService.findBy_collCount(5);
        List<SongsAlbumSinger> songs_collCounts_rank = findSongs_info(songs_collCount);

        // 2. 歌单  歌手榜  专辑榜
        // 2.1 歌单榜 以后再说

        //2.2 歌手榜
        List<Singer> singer_heat_rank = singerService.findBy_heat(5);

        // 2.3 专辑榜
        List<Album> album_collCount_rank = albumService.findBy_collCount(5);
        List<SongsAlbumSinger> album_collCount_ranks = new ArrayList<>();
        // 遍历专辑 赋值 歌手id和名字
        for (Album album : album_collCount_rank) {
            SongsAlbumSinger sas = new SongsAlbumSinger();
            Singer singer = singerService.findById(album.getSinger_id());
            sas.setAlbum(album);
            sas.setSinger(singer);
            album_collCount_ranks.add(sas);
        }


        // 3. 轻音乐 新世纪 古典
        // 3.1 根据分类id 1 查找 前5
        List<Songs> songs_classify_1 = songsService.findBy_classifyId(1, 5);
        List<SongsAlbumSinger> songs_classify_1_ranks = findSongs_info(songs_classify_1);

        // 3.1 新世纪
        List<Songs> songs_classify_2 = songsService.findBy_classifyId(2, 5);
        List<SongsAlbumSinger> songs_classify_2_ranks = findSongs_info(songs_classify_2);

        // 3.1 古典音乐
        List<Songs> songs_classify_3 = songsService.findBy_classifyId(3, 5);
        List<SongsAlbumSinger> songs_classify_3_ranks = findSongs_info(songs_classify_3);

        // 4.中国4 韩国5 日本6 欧美
        // 4.1 中国4
        List<Songs> songs_region_4 = songsService.findBy_regionId(4, 5);
        List<SongsAlbumSinger> songs_region_4_rank = findSongs_info(songs_region_4);

        // 4.2 韩国5
        List<Songs> songs_region_5 = songsService.findBy_regionId(5, 5);
        List<SongsAlbumSinger> songs_region_5_rank = findSongs_info(songs_region_5);

        // 4.3 日本6
        List<Songs> songs_region_6 = songsService.findBy_regionId(6, 5);
        List<SongsAlbumSinger> songs_region_6_rank = findSongs_info(songs_region_6);

        // 4.4 欧美
        List<Songs> songs_region_0 = songsService.findBy_regionId(0, 5);
        List<SongsAlbumSinger> songs_region_0_rank = findSongs_info(songs_region_0);



        mv.addObject("songs_playCounts_rank", songs_playCounts_rank);
        mv.addObject("songs_downloadCounts_rank", songs_downloadCounts_rank);
        mv.addObject("songs_collCounts_rank", songs_collCounts_rank);


//        mv.addObject("songs_playCounts_rank", songs_playCounts_rank);
        mv.addObject("singer_heat_rank", singer_heat_rank);
        mv.addObject("album_collCount_ranks", album_collCount_ranks);


        mv.addObject("songs_classify_1_ranks", songs_classify_1_ranks);
        mv.addObject("songs_classify_2_ranks", songs_classify_2_ranks);
        mv.addObject("songs_classify_3_ranks", songs_classify_3_ranks);


        mv.addObject("songs_region_4_rank", songs_region_4_rank);
        mv.addObject("songs_region_5_rank", songs_region_5_rank);
        mv.addObject("songs_region_6_rank", songs_region_6_rank);
        mv.addObject("songs_region_0_rank", songs_region_0_rank);



        mv.setViewName("rank");
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

}


