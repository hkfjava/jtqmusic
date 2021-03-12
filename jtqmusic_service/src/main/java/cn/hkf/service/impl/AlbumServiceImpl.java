package cn.hkf.service.impl;

import cn.hkf.dao.IAlbumDao;
import cn.hkf.domain.Album;
import cn.hkf.service.IAlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AlbumServiceImpl implements IAlbumService {

    @Autowired
    private IAlbumDao albumDao;

    @Override
    public int save(Album album) throws Exception {
        album.setAlbum_collCount(0);
        album.setAlbum_state(0);
        return albumDao.save(album);
    }

    @Override
    public List<Album> findBySinger_Id(Integer singer_id) throws Exception {
        return albumDao.findBySinger_Id(singer_id);
    }

    @Override
    public Album findById(Integer album_id) throws Exception {
        return albumDao.findById(album_id);
    }

    @Override
    public List<Album> findLikeAlbum(Integer singer_id, Integer album_id) throws Exception {
        return albumDao.findLikeAlbum(singer_id,album_id);
    }

    @Override
    public List<Album> findBy_search(String str) throws Exception {
        return albumDao.findBy_search(str);
    }

    @Override
    public List<Album> findBy_collCount(Integer i) throws Exception {
        return albumDao.findBy_collCount(i);
    }

}
