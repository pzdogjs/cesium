package cesium.service;

import cesium.pojo.Air;
import cesium.pojo.Ele_field;
import cesium.pojo.User;

import java.util.ArrayList;

public interface AirService {
	public ArrayList<Air> showAll();
	public void save(Air air);
	public void delById(int id);
	Air selectById(int id);
	public void updateById(Air air);
}
