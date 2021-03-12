package cn.hkf.service.impl;

import cn.hkf.dao.ISongMenuDao;
import cn.hkf.domain.SongMenu;
import cn.hkf.service.ISongMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SongMenuServiceImpl implements ISongMenuService {

    @Autowired
    private ISongMenuDao songMenuDao;

    @Override
    public Integer save(SongMenu songMenu) throws Exception {
        songMenu.setSongmenu_heat(0);
        songMenu.setSongmenu_statu(0);
        return songMenuDao.save(songMenu);
    }

    @Override
    public List<SongMenu> findBy_userId(Integer user_id) throws Exception {
        return songMenuDao.findBy_userId(user_id);
    }

    @Override
    public Integer save_songmenu_songs(Integer songsmenu_id, Integer songs_id) throws Exception {
        return songMenuDao.save_songmenu_songs(songsmenu_id,songs_id,new Date());
    }

    @Override
    public SongMenu findBy_id(Integer songmenu_id) throws Exception {
        return songMenuDao.findBy_id(songmenu_id);
    }

    @Override
    public Integer[] findSongsIds_by_songmenu_id(Integer songmenu_id) throws Exception {
        return songMenuDao.findSongsIds_by_songmenu_id(songmenu_id);
    }

    @Override
    public Integer delete_songmenu_songs(Integer songsmenu_id, Integer songs_id) throws Exception {
        return songMenuDao.delete_songmenu_songs(songsmenu_id,songs_id);
    }


}
