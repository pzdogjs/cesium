package cesium.service.impl;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.annotation.Resource;

import cesium.pojo.User;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cesium.pojo.Ele_field;
import cesium.dao.Ele_fieldDao;
import cesium.service.Ele_fieldService;

import java.util.ArrayList;
import java.util.List;


@Service("ele_fieldService")
@Scope("singleton")
@Transactional
public class Ele_fieldServiceImpl implements Ele_fieldService {
    
	@Resource(name = "ele_fieldDao")
	private Ele_fieldDao ele_fieldDao;
	@Override
	public void saveEle_field(Ele_field ele_field) {
		ele_fieldDao.save(ele_field);
	}

	@Override
	public ArrayList<Ele_field> showAll() {
		return ele_fieldDao.selectAll();
	}

	@Override
	public void save(Ele_field ele_field) {
		ele_fieldDao.save(ele_field);
	}

	@Override
	public void delById(int id) {
		ele_fieldDao.delById(id);
	}

	@Override
	public Ele_field selectById(int id) {
		return ele_fieldDao.selectById(id);
	}

	@Override
	public void updateById(Ele_field ele_field) {
		ele_fieldDao.updateById(ele_field);
	}

	@PreDestroy
	public void destory(){
		;
	}
	@PostConstruct
	public void init(){
		;
	}

}
