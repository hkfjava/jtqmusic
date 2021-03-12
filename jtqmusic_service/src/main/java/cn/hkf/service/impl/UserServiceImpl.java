package cn.hkf.service.impl;

import cn.hkf.dao.IUserDao;
import cn.hkf.domain.User;
import cn.hkf.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;

    @Override
    public User login(String account, String password) throws Exception {
        return userDao.login(account, password);
    }

    @Override
    public User findUserName(String user_account) throws Exception {
        return userDao.findUserName(user_account);
    }

    @Override
    public Integer save(User user) throws Exception {
        // 设置状态
        user.setUser_statu(0);
        // 设置注册时间
        user.setUser_signupTime(new Date());
        // 设置用户类型
        user.setUser_type(0);

        return userDao.save(user);
    }

    @Override
    public Integer coll_songs(Integer songs_id, Integer user_id) throws Exception {
        return userDao.coll_songs(songs_id, user_id, new Date());
    }

    @Override
    public Integer coll_songs_cancel(Integer songs_id, Integer user_id) throws Exception {
        return userDao.coll_songs_cancel(songs_id, user_id);
    }

    @Override
    public Integer coll_album(Integer album_id, Integer user_id) throws Exception {
        return userDao.coll_album(album_id, user_id, new Date());
    }

    @Override
    public Integer coll_album_cancel(Integer album_id, Integer user_id) throws Exception {
        return userDao.coll_album_cancel(album_id, user_id);
    }

    @Override
    public Integer coll_singer(Integer singer_id, Integer user_id) throws Exception {
        return userDao.coll_singer(singer_id, user_id, new Date());
    }

    @Override
    public Integer coll_singer_cancel(Integer singer_id, Integer user_id) throws Exception {
        return userDao.coll_singer_cancel(singer_id, user_id);
    }

    @Override
    public Integer[] findUser_coll_songs_ids(Integer user_id) throws Exception {
        return userDao.findUser_coll_songs_ids(user_id);
    }

    @Override
    public Integer[] findUser_coll_singer_ids(Integer user_id) throws Exception {
        return userDao.findUser_coll_singer_ids(user_id);
    }

    @Override
    public Integer[] findUser_coll_album_ids(Integer user_id) throws Exception {
        return userDao.findUser_coll_album_ids(user_id);
    }

    @Override
    public User findById(Integer user_id) throws Exception {
        return userDao.findById(user_id);
    }
}
