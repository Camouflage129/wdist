package com.wdist.biz.food.vo;

//업종별 겁색(food.jsp) top5지역 



public class FoodAreaVO {
	
	int FoodAreaNum;
	String FoodTitle;
	String FstArea;
	String SndArea;
	String ThdArea;
	String FrthArea;
	String FthArea;
	
		
	public FoodAreaVO() {
		super();
	}		
	
	public FoodAreaVO(int foodAreaNum, String foodTitle, String fstArea, String sndArea, String thdArea, String frthArea,
			String fthArea) {
		super();
		FoodAreaNum = foodAreaNum;
		FoodTitle = foodTitle;
		FstArea = fstArea;
		SndArea = sndArea;
		ThdArea = thdArea;
		FrthArea = frthArea;
		FthArea = fthArea;
	}

	
	public int getFoodAreaNum() {
		return FoodAreaNum;
	}

	public void setFoodAreaNum(int foodAreaNum) {
		FoodAreaNum = foodAreaNum;
	}

	public String getFoodTitle() {
		return FoodTitle;
	}

	public void setFoodTitle(String foodTitle) {
		FoodTitle = foodTitle;
	}

	public String getFstArea() {
		return FstArea;
	}

	public void setFstArea(String fstArea) {
		this.FstArea = fstArea;
	}

	public String getSndArea() {
		return SndArea;
	}

	public void setSndArea(String sndArea) {
		SndArea = sndArea;
	}

	public String getThdArea() {
		return ThdArea;
	}

	public void setThdArea(String thdArea) {
		ThdArea = thdArea;
	}

	public String getFrthArea() {
		return FrthArea;
	}

	public void setFrthArea(String frthArea) {
		FrthArea = frthArea;
	}

	public String getFthArea() {
		return FthArea;
	}

	public void setFthArea(String fthArea) {
		FthArea = fthArea;
	}

	

	@Override
	public String toString() {
		
		StringBuilder str = new StringBuilder();
		str.append("FoodAreaVO [FoodAreaNum=");
		str.append(FoodAreaNum);
		str.append(", FoodTitle=");
		str.append(FoodTitle);
		str.append(", FstArea=");
		str.append(FstArea);
		str.append(", SndArea=");
		str.append(SndArea);
		str.append(", ThdArea=");
		str.append(ThdArea);
		str.append(", FrthArea=");
		str.append(FrthArea);
		str.append(", FthArea=");
		str.append(FthArea);
		str.append("]");
		
		return str.toString();
	
	}
	
}
