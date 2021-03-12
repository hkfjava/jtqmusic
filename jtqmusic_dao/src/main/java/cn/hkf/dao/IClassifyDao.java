package cn.hkf.dao;

import cn.hkf.domain.Classify;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IClassifyDao {

    @Select("select * from classify")
    List<Classify> findAll() throws Exception;

    @Select("select * from classify where classify_id = #{id}")
    Classify findById(Integer classify_id) throws Exception;

    @Select("SELECT classify.`classify_id` AS classify_id,classify_name  FROM singer,classify\n" +
            "WHERE singer.`classify_id` = classify.`classify_id` AND singer_id = #{id}")
    Classify findClassifyBySinger_id(Integer singer_id) throws Exception;
}
