package cn.hkf.dao;

import cn.hkf.domain.Songs;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ISongsDao {

    @Insert("insert into songs( songs_name, songs_issueDate, songs_language, songs_url, songs_downloadCount," +
            "songs_collCount, songs_playCount,singer_id, album_id , classify_id ) values(#{songs_name}, " +
            "#{songs_issueDate}, #{songs_language}, #{songs_url}, #{songs_downloadCount}, #{songs_collCount}," +
            " #{songs_playCount}, #{singer_id}, #{album_id}, #{classify_id})")
    int save(Songs songs) throws Exception;

    @Select("select * from songs where album_id = #{id}")
    List<Songs> findAllBy_AlbumId(Integer album_id) throws Exception;

    @Select("SELECT * FROM songs WHERE singer_id=#{id} ORDER BY songs_playCount DESC;")
    List<Songs> findAllBy_SingerId(Integer singer_id) throws Exception;

    @Select("select * from songs where songs_name like concat('%', #{str},'%') ")
    List<Songs> findBy_search(String str) throws Exception;

    @Select("SELECT * FROM songs ORDER BY songs_playCount DESC LIMIT 0,#{id};")
    List<Songs> findBy_playCount(Integer count) throws Exception;

    @Select("SELECT * FROM songs ORDER BY songs_issueDate DESC LIMIT 0,#{id};")
    List<Songs> findBy_issueDate(Integer issueDate) throws Exception;

    @Select("select * from songs where songs_id = #{id}")
    Songs findById(int songs_id) throws Exception;

    @Select("SELECT * FROM songs ORDER BY songs_downloadCount DESC LIMIT 0,#{id};")
    List<Songs> findBy_downloadCount(Integer i) throws Exception;

    @Select("SELECT * FROM songs ORDER BY songs_collCount DESC LIMIT 0,#{id};")
    List<Songs> findBy_collCount(Integer i) throws Exception;

    @Select("SELECT * FROM songs WHERE classify_id = #{cid} ORDER BY songs_playCount DESC LIMIT 0,#{count};")
    List<Songs> findBy_classifyId(@Param("cid") Integer i, @Param("count") Integer i1) throws Exception;

    @Select("SELECT * FROM \n" +
            "singer,songs\n" +
            "WHERE region_id = #{rid} AND singer.`singer_id` = songs.`singer_id`\n" +
            "ORDER BY songs_playCount DESC LIMIT 0,#{count};")
    List<Songs> findBy_regionId(@Param("rid") Integer region_id,@Param("count") Integer i) throws Exception;

    @Select("SELECT * FROM \n" +
            "singer,songs\n" +
            "WHERE region_id not in (4,5,6) AND singer.`singer_id` = songs.`singer_id`\n" +
            "ORDER BY songs_playCount DESC LIMIT 0,#{id};")
    List<Songs> findBy_regionId_other(Integer i1) throws Exception;
}
