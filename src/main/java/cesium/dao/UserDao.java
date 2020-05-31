package cesium.dao;

import cesium.pojo.User;

import java.util.ArrayList;
import java.util.List;

public interface UserDao {
    public void save(User user);

    public void delByName(User user);
    public void delById(int id);

    public void updateById(User user);

    public ArrayList<User> selectAll();

    public User  selectById(int id);

    public int CountNumber();
    public User selectByName (String s);
}
