package cesium.pojo;

import java.util.List;

public class Camp {
    private int id;
    private String name;
    private List<Ele_field> ele_fields;

    public List<Ele_field> getEle_fields() {
        return ele_fields;
    }

    public void setEle_fields(List<Ele_field> ele_fields) {
        this.ele_fields = ele_fields;
    }

    public int getId() {
        return id;
    }



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Camp{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", ele_fields=" + ele_fields +
                '}';
    }

    public void setId(int id) {
        this.id = id;
    }


}
