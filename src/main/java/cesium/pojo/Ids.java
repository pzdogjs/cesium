package cesium.pojo;

import java.util.List;

public class Ids {
    private List<String> eleIds;
    private List<String> airIds;

    public List<String> getEleIds() {
        return eleIds;
    }

    public void setEleIds(List<String> eleIds) {
        this.eleIds = eleIds;
    }

    public List<String> getAirIds() {
        return airIds;
    }

    public void setAirIds(List<String> airIds) {
        this.airIds = airIds;
    }

    @Override
    public String toString() {
        return "Ids{" +
                "eleIds=" + eleIds +
                ", airIds=" + airIds +
                '}';
    }
}
