package cesium.pojo;

import java.io.Serializable;

public class Ele_field  implements Serializable {
	private int id;
	private double x;
	private double y;
	private double height;
	private double r;
	private String name;

	private float hz;
	private String type;
	private String state;
	private String task;
	private String info;

	public float getHz() {
		return hz;
	}

	public void setHz(float hz) {
		this.hz = hz;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}



	public void setY(double y) {
		this.y = y;
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public double getR() {
		return r;
	}
	public void setR(double r) {
		this.r = r;
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

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Ele_field{" +
				"id=" + id +
				", x=" + x +
				", y=" + y +
				", height=" + height +
				", r=" + r +
				", name='" + name + '\'' +
				", hz=" + hz +
				", type='" + type + '\'' +
				", state='" + state + '\'' +
				", task='" + task + '\'' +
				", info='" + info + '\'' +
				'}';
	}
}
