package cesium.service.impl;

import cesium.dao.AirDao;
import cesium.dao.HeatMapDao;
import cesium.pojo.Air;
import cesium.pojo.HeatMap;
import cesium.service.AirService;
import cesium.service.HeatMapService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service("heatMapService")
@Scope("singleton")
@Transactional
public class HeatMapServiceImpl implements HeatMapService {

    @Resource(name = "heatMapDao")
    private HeatMapDao heatMapDao;

    @Override
    public ArrayList<HeatMap> showAll() {
        return heatMapDao.selectAll();
    }

    @Override
    public void save(HeatMap heatMap) {
        heatMapDao.save(heatMap);
    }

    @Override
    public void delById(int id) {
        heatMapDao.delById(id);
    }

    @Override
    public HeatMap selectById(int id) {
        return  heatMapDao.selectById(id);
    }

    @Override
    public void updateById(HeatMap heatMap) {
        heatMapDao.updateById(heatMap);
    }
}
