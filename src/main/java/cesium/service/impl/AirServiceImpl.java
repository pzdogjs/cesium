package cesium.service.impl;

import cesium.dao.AirDao;
import cesium.pojo.Air;
import cesium.pojo.User;
import cesium.service.AirService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service("airService")
@Scope("singleton")
@Transactional
public class AirServiceImpl implements AirService {

    @Resource(name = "airDao")
    private AirDao airDao;

    @Override
    public ArrayList<Air> showAll() {
        return airDao.selectAll();
    }

    @Override
    public void save(Air air) {
        airDao.save(air);
    }

    @Override
    public void delById(int id) {
        airDao.delById(id);
    }

    @Override
    public Air selectById(int id) {
        return airDao.selectById(id);
    }

    @Override
    public void updateById(Air air) {
        airDao.updateById(air);
    }
}
