package cn.hkf.service;

import cn.hkf.domain.Songs;

import java.util.List;

public interface ISongsService {

    int save(Songs songs) throws Exception;

    List<Songs> findAllBy_AlbumId(Integer album_id) throws Exception;

    List<Songs> findAllBy_SingerId(Integer singer_id) throws Exception;


    List<Songs> findBy_search(String str) throws Exception;

    List<Songs> findBy_playCount(Integer count) throws Exception;

    List<Songs> findBy_issueDate(Integer issueDate) throws Exception;

    Songs findById(int songs_id) throws Exception;

    List<Songs> findBy_downloadCount(Integer i) throws Exception;

    List<Songs> findBy_collCount(Integer i) throws Exception;

    List<Songs> findBy_classifyId(Integer i, Integer i1) throws Exception;


    List<Songs> findBy_regionId(Integer i, Integer i1) throws Exception;
}
