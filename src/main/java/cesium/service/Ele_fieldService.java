package cesium.service;

import cesium.pojo.Air;
import cesium.pojo.Ele_field;
import cesium.pojo.User;

import java.util.ArrayList;
import java.util.List;

public interface Ele_fieldService {
		public void saveEle_field(Ele_field ele_field);
		public ArrayList<Ele_field> showAll();

	public void save(Ele_field ele_field);
	public void delById(int id);
	Ele_field selectById(int id);
	public void updateById(Ele_field ele_field);
}
