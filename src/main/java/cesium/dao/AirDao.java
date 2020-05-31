package cesium.dao;

import cesium.pojo.Air;

import java.util.ArrayList;

public interface AirDao {
    public ArrayList<Air> selectAll();
    public void save(Air air);
    public void delById(int id);
    Air selectById(int id);
    public void updateById(Air air);
}
