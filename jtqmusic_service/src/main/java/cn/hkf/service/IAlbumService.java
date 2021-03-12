package cn.hkf.service;

import cn.hkf.domain.Album;

import java.util.List;

public interface IAlbumService {
    int save(Album album) throws Exception;

    List<Album> findBySinger_Id(Integer singer_id) throws Exception;

    Album findById(Integer album_id) throws Exception;

    List<Album> findLikeAlbum(Integer singer_id, Integer album_id) throws Exception;

    List<Album> findBy_search(String str) throws Exception;

    List<Album> findBy_collCount(Integer i) throws Exception;
}
