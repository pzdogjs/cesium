package cesium.service.impl;

import cesium.dao.AirDao;
import cesium.dao.PathDao;
import cesium.pojo.Air;
import cesium.pojo.Path;
import cesium.service.AirService;
import cesium.service.PathService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service("pathService")
@Scope("singleton")
@Transactional
public class PathServiceImpl implements PathService {

    @Resource(name = "pathDao")
    private PathDao pathDao;

    @Override
    public ArrayList<Path> showAll() {
        return pathDao.selectAll();
    }

    @Override
    public void save(Path path) {
        pathDao.save(path);
    }

    @Override
    public void delById(int id) {
        pathDao.delById(id);
    }

    @Override
    public Path selectById(int id) {
        return pathDao.selectById(id);
    }

    @Override
    public void updateById(Path path) {
        pathDao.updateById(path);
    }
}
