package cn.hkf.service.impl;

import cn.hkf.dao.IClassifyDao;
import cn.hkf.domain.Classify;
import cn.hkf.service.IClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassifyServiceImpl implements IClassifyService {

    @Autowired
    private IClassifyDao classifyDao;

    @Override
    public List<Classify> findAll() throws Exception {
        return classifyDao.findAll();
    }

    @Override
    public Classify findById(Integer classify_id) throws Exception {
        return classifyDao.findById(classify_id);
    }

    @Override
    public Classify findClassifyBySinger_id(Integer singer_id) throws Exception {
        return classifyDao.findClassifyBySinger_id(singer_id);
    }
}
