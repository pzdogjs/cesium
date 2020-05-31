package cesium.dao;

import cesium.pojo.Air;
import cesium.pojo.Path;

import java.util.ArrayList;

public interface PathDao {
    public ArrayList<Path> selectAll();
    public void save(Path path);
    public void delById(int id);
    Path selectById(int id);
    public void updateById(Path path);
}
