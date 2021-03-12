package cn.hkf.service;

import cn.hkf.domain.SongMenu;

import java.util.List;

public interface ISongMenuService {
    Integer save(SongMenu songMenu) throws Exception;

    List<SongMenu> findBy_userId(Integer user_id) throws Exception;

    Integer save_songmenu_songs(Integer songsmenu_id, Integer songs_id) throws Exception;

    SongMenu findBy_id(Integer songmenu_id) throws Exception;

    Integer[] findSongsIds_by_songmenu_id(Integer songmenu_id) throws Exception;

    Integer delete_songmenu_songs(Integer songsmenu_id, Integer songs_id) throws Exception;
}
