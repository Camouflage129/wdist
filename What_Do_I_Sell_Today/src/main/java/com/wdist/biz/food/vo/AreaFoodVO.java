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
