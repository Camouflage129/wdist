package com.wdist.biz.food.vo;

public class AreaFoodVO {
	int AreaFoodNum;
	String AreaTitle;
	String FstFood;
	String SndFood;
	String ThdFood;
	String FrthFood;
	String FthFood; 
	
	public AreaFoodVO() {
		super();
	}

	public AreaFoodVO(int areaFoodNum, String areaTitle, String fstFood, String sndFood, String thdFood, String frthFood,
			String fthFood) {
		super();
		AreaFoodNum = areaFoodNum;
		AreaTitle = areaTitle;
		FstFood = fstFood;
		SndFood = sndFood;
		ThdFood = thdFood;
		FrthFood = frthFood;
		FthFood = fthFood;
	}

	
	public int getAreaFoodNum() {
		return AreaFoodNum;
	}

	public void setAreaFoodNum(int areaFoodNum) {
		AreaFoodNum = areaFoodNum;
	}
	
	public String getAreaTitle() {
		return AreaTitle;
	}

	public void setAreaTitle(String areaTitle) {
		AreaTitle = areaTitle;
	}

	public String getFstFood() {
		return FstFood;
	}

	public void setFstFood(String fstFood) {
		FstFood = fstFood;
	}

	public String getSndFood() {
		return SndFood;
	}

	public void setSndFood(String sndFood) {
		SndFood = sndFood;
	}

	public String getThdFood() {
		return ThdFood;
	}

	public void setThdFood(String thdFood) {
		ThdFood = thdFood;
	}

	public String getFrthFood() {
		return FrthFood;
	}

	public void setFrthFood(String frthFood) {
		FrthFood = frthFood;
	}

	public String getFthFood() {
		return FthFood;
	}

	public void setFthFood(String fthFood) {
		FthFood = fthFood;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + AreaFoodNum;
		result = prime * result + ((FrthFood == null) ? 0 : FrthFood.hashCode());
		result = prime * result + ((FstFood == null) ? 0 : FstFood.hashCode());
		result = prime * result + ((FthFood == null) ? 0 : FthFood.hashCode());
		result = prime * result + ((SndFood == null) ? 0 : SndFood.hashCode());
		result = prime * result + ((ThdFood == null) ? 0 : ThdFood.hashCode());
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
		if (AreaFoodNum != other.AreaFoodNum)
			return false;
		if (FrthFood == null) {
			if (other.FrthFood != null)
				return false;
		} else if (!FrthFood.equals(other.FrthFood))
			return false;
		if (FstFood == null) {
			if (other.FstFood != null)
				return false;
		} else if (!FstFood.equals(other.FstFood))
			return false;
		if (FthFood == null) {
			if (other.FthFood != null)
				return false;
		} else if (!FthFood.equals(other.FthFood))
			return false;
		if (SndFood == null) {
			if (other.SndFood != null)
				return false;
		} else if (!SndFood.equals(other.SndFood))
			return false;
		if (ThdFood == null) {
			if (other.ThdFood != null)
				return false;
		} else if (!ThdFood.equals(other.ThdFood))
			return false;
		return true;
	}

	@Override
	public String toString() {
		
		StringBuilder str = new StringBuilder();
		str.append("AreaFoodVO [AreaFoodNum=");
		str.append(AreaFoodNum);
		str.append(", AreaTitle=");
		str.append(AreaTitle);
		str.append(", FstFood=");
		str.append(FstFood);
		str.append(", SndFood=");
		str.append(SndFood);
		str.append(", ThdFood=");
		str.append(ThdFood);
		str.append(", FrthFood=");
		str.append(FrthFood);
		str.append(", FthFood=");
		str.append(FthFood);
		str.append("]");
		
		return str.toString();
	}
}
