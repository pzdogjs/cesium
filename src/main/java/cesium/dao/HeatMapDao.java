package cesium.dao;

import cesium.pojo.HeatMap;

import java.util.ArrayList;

public interface HeatMapDao {
    public ArrayList<HeatMap> selectAll();

    public void save(HeatMap heatMap);
    public void delById(int id);
    HeatMap selectById(int id);
    public void updateById(HeatMap heatMap);
}
