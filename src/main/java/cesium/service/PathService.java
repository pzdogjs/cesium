package cesium.service;

import cesium.pojo.Air;
import cesium.pojo.Path;

import java.util.ArrayList;

public interface PathService {
	public ArrayList<Path> showAll();
	public void save(Path path);
	public void delById(int id);
	Path selectById(int id);
	public void updateById(Path path);
}
