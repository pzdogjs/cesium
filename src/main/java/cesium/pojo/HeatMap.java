package cesium.pojo;

public class HeatMap {
    private int id;
    private float west;
    private float east;
    private float north;
    private float south;
    private String data;
    private String name;
    private String info;

    public String getName() {
        return name;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public void setName(String name) {
        this.name = name;
    }




    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getWest() {
        return west;
    }

    public void setWest(float west) {
        this.west = west;
    }

    public float getEast() {
        return east;
    }

    public void setEast(float east) {
        this.east = east;
    }

    public float getNorth() {
        return north;
    }

    public void setNorth(float north) {
        this.north = north;
    }

    public float getSouth() {
        return south;
    }



    public void setSouth(float south) {
        this.south = south;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "HeatMap{" +
                "id=" + id +
                ", west=" + west +
                ", east=" + east +
                ", north=" + north +
                ", south=" + south +
                ", name='" + name + '\'' +
                ", info='" + info + '\'' +
                ", data='" + data + '\'' +
                '}';
    }
}
