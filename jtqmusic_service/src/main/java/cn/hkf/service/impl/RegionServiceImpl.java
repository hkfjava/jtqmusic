package cn.hkf.service.impl;

import cn.hkf.dao.IRegionDao;
import cn.hkf.domain.Region;
import cn.hkf.service.IRegionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegionServiceImpl implements IRegionService {

    @Autowired
    private IRegionDao regionDao;

    @Override
    public List<Region> findAll() throws Exception {
        return regionDao.findAll();
    }

    @Override
    public Region findById(Integer region_id) throws Exception {
        return regionDao.findById(region_id);
    }
}
