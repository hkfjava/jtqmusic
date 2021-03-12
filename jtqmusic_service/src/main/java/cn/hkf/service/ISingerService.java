package cn.hkf.service;

import cn.hkf.domain.Singer;

import java.util.List;

public interface ISingerService {

    List<Singer> findAll() throws Exception;

    int save(Singer singer) throws Exception;


    List<Singer> findByClassify(Integer classify_id) throws Exception;

    List<Singer> findByRegion(Integer region_id) throws Exception;

    Singer findById(Integer singer_id) throws Exception;

    List<Singer> findLikeSinger(Integer singer_id, Integer singer_sex, Integer classify_id) throws Exception;

    List<Singer> findBy_search(String str) throws Exception;

    List<Singer> findBy_heat(Integer i) throws Exception;
}
