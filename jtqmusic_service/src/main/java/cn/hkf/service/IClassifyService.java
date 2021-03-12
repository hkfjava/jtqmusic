package cn.hkf.service;

import cn.hkf.domain.Classify;
import java.util.List;

public interface IClassifyService {

    List<Classify> findAll() throws Exception;

    Classify findById(Integer classify_id) throws Exception;

    Classify findClassifyBySinger_id(Integer singer_id) throws Exception;
}
