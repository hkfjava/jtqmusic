package cn.hkf.service.impl;

import cn.hkf.dao.ISongsDao;
import cn.hkf.domain.Songs;
import cn.hkf.service.ISongsService;
import cn.hkf.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SongsServiceImpl implements ISongsService {

    @Autowired
    private ISongsDao songsDao;

    @Override
    public int save(Songs songs) throws Exception {
        songs.setSongs_downloadCount(0);
        songs.setSongs_playCount(0);
        songs.setSongs_collCount(0);
        String str = "yyyy-MM-dd";
        songs.setSongs_issueDate(DateUtils.string2Date(songs.getSongs_issueDate_str(), str));
        return songsDao.save(songs);
    }

    @Override
    public List<Songs> findAllBy_AlbumId(Integer album_id) throws Exception {
        return songsDao.findAllBy_AlbumId(album_id);
    }

    @Override
    public List<Songs> findAllBy_SingerId(Integer singer_id) throws Exception {
        return songsDao.findAllBy_SingerId(singer_id);
    }

    @Override
    public List<Songs> findBy_search(String str) throws Exception {
        return songsDao.findBy_search(str);
    }

    @Override
    public List<Songs> findBy_playCount(Integer count) throws Exception {
        return songsDao.findBy_playCount(count);
    }

    @Override
    public List<Songs> findBy_issueDate(Integer issueDate) throws Exception {
        return songsDao.findBy_issueDate(issueDate);
    }

    @Override
    public Songs findById(int songs_id) throws Exception {
        return songsDao.findById(songs_id);
    }

    @Override
    public List<Songs> findBy_downloadCount(Integer i) throws Exception {
        return songsDao.findBy_downloadCount(i);
    }

    @Override
    public List<Songs> findBy_collCount(Integer i) throws Exception {
        return songsDao.findBy_collCount(i);
    }

    @Override
    public List<Songs> findBy_classifyId(Integer i, Integer i1) throws Exception {
        return songsDao.findBy_classifyId(i,i1);
    }

    @Override
    public List<Songs> findBy_regionId(Integer i, Integer i1) throws Exception {

        if (i == 0) {
            return songsDao.findBy_regionId_other(i1);
        }else {
            return songsDao.findBy_regionId(i,i1);
        }

    }


}
