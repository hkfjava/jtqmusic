package cn.hkf.dao;

import cn.hkf.domain.Album;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IAlbumDao {

    @Insert("insert into album(album_info,album_collCount,album_imgUrl, album_state,album_name,album_songNumber, album_issueDate," +
            "singer_id) values(#{album_info}, #{album_collCount}, #{album_imgUrl}, #{album_state}, #{album_name}, #{album_songNumber}," +
            " #{album_issueDate}, #{singer_id})")
    int save(Album album) throws Exception;

    @Select("select * from album where singer_id = #{id}")
    List<Album> findBySinger_Id(Integer singer_id) throws Exception;

    @Select("select * from album where album_id = #{id}")
    Album findById(Integer album_id) throws Exception;

    @Select("SELECT * FROM album WHERE singer_id = #{ids} AND album_id <> #{ida};")
    List<Album> findLikeAlbum(@Param("ids") Integer singer_id, @Param("ida") Integer album_id) throws Exception;

    @Select("select * from album where album_name like concat('%', #{str},'%')")
    List<Album> findBy_search(String str) throws Exception;

    @Select("SELECT * FROM album ORDER BY album_collCount DESC LIMIT 0,#{id};")
    List<Album> findBy_collCount(Integer i) throws Exception;
}
