package cesium.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.event.TransactionalEventListener;

import cesium.pojo.Ele_field;
import cesium.dao.Ele_fieldDao;
import cesium.service.Ele_fieldService;


@Service
@Transactional
public class Ele_fieldServiceImpl implements Ele_fieldService {
    
	@Autowired
	private Ele_fieldDao ele_fieldDao;
	@Override
	public void saveEle_field(Ele_field ele_field) {
		ele_fieldDao.save(ele_field);
	}
}
