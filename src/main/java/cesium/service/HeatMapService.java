package cesium.service;

import cesium.pojo.Air;
import cesium.pojo.HeatMap;
import cesium.pojo.User;

import java.util.ArrayList;

public interface HeatMapService {
		public ArrayList<HeatMap> showAll();

	public void save(HeatMap heatMap);
	public void delById(int id);
	HeatMap selectById(int id);
	public void updateById(HeatMap heatMap);
}
