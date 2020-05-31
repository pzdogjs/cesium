package cesium.service;

import cesium.pojo.User;

import java.util.ArrayList;

public interface UserService {
    public void saveUser(User user);
    public void delById(int id);
    User selectById(int id);
    public void updateById(User user);
    public ArrayList<User> showAll();
    public int count();

    User selectByName(String s);


}
