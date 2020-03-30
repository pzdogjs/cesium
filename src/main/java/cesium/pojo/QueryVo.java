package cesium.pojo;

import java.util.List;

public class QueryVo {
    private Ele_field ele_field;
    private List<Integer> ids;

    public Ele_field getEle_field() {
        return ele_field;
    }

    public List<Integer> getIds() {
        return ids;
    }

    public void setIds(List<Integer> ids) {
        this.ids = ids;
    }

    public void setEle_field(Ele_field ele_field) {
        this.ele_field = ele_field;
    }
}
