package cesium.dao;

import cesium.pojo.Ele_field;

import java.util.List;

public interface Ele_fieldDao {
	public void save(Ele_field ele_field);

	public void delById(int id);

	public void updateById(Ele_field ele_field);

	public List<Ele_field> selectAll();

	public Ele_field selectById(int id);

	public List<Ele_field> selectByLikeName(String LikeName);

	public int CountNumber();

	public List<Ele_field> selectByCondition(Ele_field ele_field);
}
