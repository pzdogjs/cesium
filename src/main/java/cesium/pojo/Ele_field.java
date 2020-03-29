package cesium.pojo;

import java.io.Serializable;

public class Ele_field implements Serializable {
	private int id;
	private double x;
	private double y;
	private double height;
	private double r;
	private String name;

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
				'}';
	}


}
