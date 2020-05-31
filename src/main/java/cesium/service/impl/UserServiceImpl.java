package cesium.service.impl;

import cesium.dao.Ele_fieldDao;
import cesium.dao.UserDao;
import cesium.pojo.User;
import cesium.service.UserService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service("userService")
@Scope("singleton")
@Transactional
public class UserServiceImpl implements UserService {

    @Resource(name = "userDao")
    private UserDao userDao;
    @Override
    public void saveUser(User user) {
        userDao.save(user);
    }

    @Override
    public void delById(int id) {
        userDao.delById(id);
    }

    @Override
    public ArrayList<User> showAll() {
        return userDao.selectAll();
    }

    @Override
    public int count() {
        return userDao.CountNumber();
    }

    @Override
    public User selectById(int id) {
        return userDao.selectById(id);
    }

    @Override
    public User selectByName(String s) {
        return userDao.selectByName(s);
    }

    @Override
    public void updateById(User user) {
        userDao.updateById(user);
    }
}
