package cesium.service.impl;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.event.TransactionalEventListener;

import cesium.pojo.Ele_field;
import cesium.dao.Ele_fieldDao;
import cesium.service.Ele_fieldService;


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
	@PreDestroy
	public void destory(){
		;
	}
	@PostConstruct
	public void init(){
		;
	}

}
