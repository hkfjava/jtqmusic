package cn.hkf.dao;

import cn.hkf.domain.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public interface IUserDao {

    @Select("SELECT * FROM USER WHERE user_account = #{account} AND user_password = #{password};")
    User login(@Param("account") String account, @Param("password") String password) throws Exception;

    @Select("SELECT * FROM USER WHERE user_account = #{user_account};")
    User findUserName(String user_account) throws Exception;

    @Insert("insert into user(user_account, user_password, user_name, user_statu, user_email, user_sex, user_signupTime, user_imgUrl, user_type, user_phone)" +
            " values(#{user_account}, #{user_password}, #{user_name}, #{user_statu}, #{user_email}, #{user_sex}, #{user_signupTime}, #{user_imgUrl}, #{user_type}, #{user_phone})")
    Integer save(User user) throws Exception;

    /**
     * 收藏歌曲 在用户歌曲表中存数据
     * @param songs_id
     * @param user_id
     * @return
     * @throws Exception
     */
    @Insert("insert into user_songs(uss_collTime, user_id, songs_id) values(#{ctime}, #{uid}, #{sid})")
    Integer coll_songs(@Param("sid") Integer songs_id,@Param("uid") Integer user_id,@Param("ctime") Date collTime) throws Exception;

    @Delete("delete from user_songs where songs_id = #{sid} and user_id = #{uid} ")
    Integer coll_songs_cancel(@Param("sid")Integer songs_id,@Param("uid") Integer user_id) throws Exception;

    @Insert("insert into user_album(uam_collTime, user_id, album_id) values(#{ctime}, #{uid}, #{aid})")
    Integer coll_album(@Param("aid")Integer album_id, @Param("uid")Integer user_id, @Param("ctime")Date date) throws Exception;

    @Delete("delete from user_album where album_id = #{aid} and user_id = #{uid} ")
    Integer coll_album_cancel(@Param("aid")Integer album_id, @Param("uid")Integer user_id) throws Exception;

    @Insert("insert into user_singer(usr_collTime, user_id, singer_id) values(#{ctime}, #{uid}, #{sid})")
    Integer coll_singer(@Param("sid")Integer singer_id, @Param("uid")Integer user_id,@Param("ctime") Date date) throws Exception;

    @Delete("delete from user_singer where singer_id = #{sid} and user_id = #{uid} ")
    Integer coll_singer_cancel(@Param("sid")Integer singer_id, @Param("uid")Integer user_id) throws Exception;

    @Select("select songs_id from user_songs where user_id = #{id}")
    Integer[] findUser_coll_songs_ids(Integer user_id) throws Exception;

    @Select("select singer_id from user_singer where user_id = #{id}")
    Integer[] findUser_coll_singer_ids(Integer user_id) throws Exception;

    @Select("select album_id from user_album where user_id = #{id}")
    Integer[] findUser_coll_album_ids(Integer user_id) throws Exception;

    @Select("select * from `user` where user_id = #{id}")
    User findById(Integer user_id) throws Exception;
}
