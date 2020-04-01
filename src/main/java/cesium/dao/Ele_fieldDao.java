package cesium.dao;

import cesium.pojo.Ele_field;
import cesium.pojo.QueryVo;
import org.springframework.stereotype.Repository;

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

	List<Ele_field> selectInIds(QueryVo queryVo);//根据queryvo中int集合，查询

	List<Ele_field> selectAndCamp();//多表查询
}
