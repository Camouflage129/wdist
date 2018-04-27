package com.wdist.biz.food.vo;

public class DangerVO {
	int num;
	String area;
	String level;
	Double fail;
	
	
	
	public DangerVO() {
		super();
	}
	public DangerVO(int num, String area, String level, Double fail) {
		super();
		this.num = num;
		this.area = area;
		this.level = level;
		this.fail = fail;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public Double getFail() {
		return fail;
	}
	public void setFail(Double fail) {
		this.fail = fail;
	}
	@Override
	public String toString() {
		return "DangerVO [num=" + num + ", area=" + area + ", level=" + level + ", fail=" + fail + "]";
	}
	
	
}
