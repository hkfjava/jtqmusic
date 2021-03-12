package cn.hkf.dao;

import cn.hkf.domain.Region;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 获取数据库信息 返回List集合
 */
@Repository
public interface IRegionDao {

    @Select("select * from region")
    List<Region> findAll() throws Exception;

    @Select("select * from region where region_id = #{id}")
    Region findById(Integer region_id) throws Exception;
}
