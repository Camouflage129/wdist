package com.wdist.biz.dept.vo;

public class AreaFoodVO {
	String food1;
	String food2;
	String food3;
	String food4;
	String food5;
	
	public AreaFoodVO() {
		super();
	}

	public AreaFoodVO(String food1, String food2, String food3, String food4, String food5) {
		super();
		this.food1 = food1;
		this.food2 = food2;
		this.food3 = food3;
		this.food4 = food4;
		this.food5 = food5;
	}

	public String getFood1() {
		return food1;
	}

	public void setFood1(String food1) {
		this.food1 = food1;
	}

	public String getFood2() {
		return food2;
	}

	public void setFood2(String food2) {
		this.food2 = food2;
	}

	public String getFood3() {
		return food3;
	}

	public void setFood3(String food3) {
		this.food3 = food3;
	}

	public String getFood4() {
		return food4;
	}

	public void setFood4(String food4) {
		this.food4 = food4;
	}

	public String getFood5() {
		return food5;
	}

	public void setFood5(String food5) {
		this.food5 = food5;
	}
	
	
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((food1 == null) ? 0 : food1.hashCode());
		result = prime * result + ((food2 == null) ? 0 : food2.hashCode());
		result = prime * result + ((food3 == null) ? 0 : food3.hashCode());
		result = prime * result + ((food4 == null) ? 0 : food4.hashCode());
		result = prime * result + ((food5 == null) ? 0 : food5.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AreaFoodVO other = (AreaFoodVO) obj;
		if (food1 == null) {
			if (other.food1 != null)
				return false;
		} else if (!food1.equals(other.food1))
			return false;
		if (food2 == null) {
			if (other.food2 != null)
				return false;
		} else if (!food2.equals(other.food2))
			return false;
		if (food3 == null) {
			if (other.food3 != null)
				return false;
		} else if (!food3.equals(other.food3))
			return false;
		if (food4 == null) {
			if (other.food4 != null)
				return false;
		} else if (!food4.equals(other.food4))
			return false;
		if (food5 == null) {
			if (other.food5 != null)
				return false;
		} else if (!food5.equals(other.food5))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder str = new StringBuilder();
		str.append("AreaFoodVO [food1=");
		str.append(food1);
		str.append(", food2=");
		str.append(food2);
		str.append(", food3=");
		str.append(food3);
		str.append(", food4=");
		str.append(food4);
		str.append(", food5=");
		str.append(food5);
		str.append("]");
		return str.toString();
		/*return "AreaFoodVO [food1=" + food1 + ", food2=" + food2 + ", food3=" + food3 + ", food4=" + food4 + ", food5="
				+ food5 + "]";*/
	}
	
	
	
	
}
