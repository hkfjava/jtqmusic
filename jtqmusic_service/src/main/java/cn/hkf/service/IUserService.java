package cn.hkf.service;

import cn.hkf.domain.User;

public interface IUserService {
    User login(String account, String password) throws Exception;

    User findUserName(String user_account) throws Exception;

    Integer save(User user) throws Exception;


    Integer coll_songs(Integer songs_id, Integer user_id) throws Exception;

    Integer coll_songs_cancel(Integer songs_id, Integer user_id) throws Exception;

    Integer coll_album(Integer album_id, Integer user_id) throws Exception;

    Integer coll_album_cancel(Integer album_id, Integer user_id) throws Exception;

    Integer coll_singer(Integer singer_id, Integer user_id) throws Exception;

    Integer coll_singer_cancel(Integer singer_id, Integer user_id) throws Exception;

    Integer[] findUser_coll_songs_ids(Integer user_id) throws Exception;

    Integer[] findUser_coll_singer_ids(Integer user_id) throws Exception;

    Integer[] findUser_coll_album_ids(Integer user_id) throws Exception;

    User findById(Integer user_id) throws Exception;
}
