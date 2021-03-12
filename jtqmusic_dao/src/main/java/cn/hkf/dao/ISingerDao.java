package cn.hkf.dao;

import cn.hkf.domain.Singer;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ISingerDao {

    @Select("select * from singer")
    List<Singer> findAll() throws Exception;

    @Insert("insert into singer(singer_name, singer_sex, singer_info, singer_birth, singer_timeOut, singer_collCount, singer_heat," +
            "singer_imgUrl, region_id, classify_id) values(#{singer_name}, #{singer_sex}, #{singer_info}, #{singer_birth}, #{singer_timeOut}, " +
            "#{singer_collCount}, #{singer_heat}, #{singer_imgUrl}, #{region_id}, #{classify_id})")
    int save(Singer singer) throws Exception;

    @Select("select * from singer where classify_id = #{id}")
    List<Singer> findByClassify(Integer classify_id) throws Exception;

    @Select("select * from singer where region_id = #{id}")
    List<Singer> findByRegion(Integer region_id) throws Exception;

    @Select("select * from singer where singer_id = #{id}")
    Singer findById(Integer singer_id) throws Exception;

    @Select("SELECT * FROM singer WHERE singer_sex = #{sex} AND  classify_id = #{idc} AND singer_id <> #{ids};")
    List<Singer> findLikeSinger(@Param("ids") Integer singer_id, @Param("sex") Integer singer_sex,@Param("idc") Integer classify_id) throws Exception;

    @Select("select * from singer where singer_name like concat('%', #{str},'%')")
    List<Singer> findBy_search(String str) throws Exception;

    @Select("SELECT * FROM singer ORDER BY singer_heat DESC LIMIT 0,#{id};")
    List<Singer> findBy_heat(Integer i) throws Exception;
}
