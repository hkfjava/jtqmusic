package cn.hkf.service;

import cn.hkf.domain.Region;

import java.util.List;

public interface IRegionService {

    List<Region> findAll() throws Exception;

    Region findById(Integer region_id) throws Exception;
}
