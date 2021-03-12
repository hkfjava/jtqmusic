package cn.hkf.service.impl;

import cn.hkf.dao.ISingerDao;
import cn.hkf.domain.Singer;
import cn.hkf.service.ISingerService;
import cn.hkf.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SingerServiceImpl implements ISingerService {

    @Autowired
    private ISingerDao singerDao;



    @Override
    public List<Singer> findAll() throws Exception {
        return singerDao.findAll();
    }

    @Override
    public int save(Singer singer) throws Exception {
        // 设置收藏和热度为0
        singer.setSinger_collCount(0);
        singer.setSinger_heat(0);
        // 保存歌手
        int res = singerDao.save(singer);
        return res;
    }

    @Override
    public List<Singer> findByClassify(Integer classify_id) throws Exception {
        return singerDao.findByClassify(classify_id);
    }

    @Override
    public List<Singer> findByRegion(Integer region_id) throws Exception {
        return singerDao.findByRegion(region_id);
    }

    @Override
    public Singer findById(Integer singer_id) throws Exception {
        return singerDao.findById(singer_id);
    }

    @Override
    public List<Singer> findLikeSinger(Integer singer_id, Integer singer_sex, Integer classify_id) throws Exception {
        return singerDao.findLikeSinger(singer_id,singer_sex,classify_id);
    }

    @Override
    public List<Singer> findBy_search(String str) throws Exception {
        return singerDao.findBy_search(str);
    }

    @Override
    public List<Singer> findBy_heat(Integer i) throws Exception {
        return singerDao.findBy_heat(i);
    }


}
