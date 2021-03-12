package cn.hkf.dao;

import cn.hkf.domain.SongMenu;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface ISongMenuDao {

    @Insert("insert into songmenu(songmenu_name, songmenu_label, songmenu_statu, songmenu_heat, songmenu_info, classify_id, user_id)" +
            " values(#{songmenu_name}, #{songmenu_label}, #{songmenu_statu}, #{songmenu_heat}, #{songmenu_info}, #{classify_id}, #{user_id})")
    Integer save(SongMenu songMenu) throws Exception;

    @Select("select * from songmenu where user_id = #{id}")
    List<SongMenu> findBy_userId(Integer user_id) throws Exception;

    @Insert("insert into songmenu_songs(songmenu_id, songs_id, sms_collTime) values(#{songsmenu_id}, #{songs_id}, #{ctime})")
    Integer save_songmenu_songs(@Param("songsmenu_id") Integer songsmenu_id,@Param("songs_id") Integer songs_id,@Param("ctime") Date collTime) throws Exception;

    @Select("select * from songmenu where songmenu_id = #{id}")
    SongMenu findBy_id(Integer songmenu_id) throws Exception;

    @Select("select songs_id from songmenu_songs where songmenu_id = #{id}")
    Integer[] findSongsIds_by_songmenu_id(Integer songmenu_id) throws Exception;

    @Delete("delete from songmenu_songs where songmenu_id = #{ssmid} and songs_id = #{ssid}")
    Integer delete_songmenu_songs(@Param("ssmid") Integer songsmenu_id,@Param("ssid") Integer songs_id) throws Exception;
}
