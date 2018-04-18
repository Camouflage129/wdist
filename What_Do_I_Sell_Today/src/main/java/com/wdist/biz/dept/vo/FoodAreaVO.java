package com.wdist.biz.dept.vo;

//업종별 겁색(food.jsp) top5지역 



public class FoodAreaVO {
	
	String FoodTitle;
	String fstArea;
	String SndArea;
	String ThdArea;
	String FrthArea;
	String FthArea;
	
		
	public FoodAreaVO() {
		super();
	}
	
	public FoodAreaVO(String fstArea, String sndArea, String thdArea, String frthArea, String fthArea, String foodTitle) {
		super();
		this.fstArea = fstArea;
		SndArea = sndArea;
		ThdArea = thdArea;
		FrthArea = frthArea;
		FthArea = fthArea;
		FoodTitle = foodTitle;
	}

	public String getFstArea() {
		return fstArea;
	}

	public void setFstArea(String fstArea) {
		this.fstArea = fstArea;
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
	
	public String getFoodTitle() {
		return FoodTitle;
	}

	public void setFoodTitle(String foodTitle) {
		FoodTitle = foodTitle;
	}


	@Override
	public String toString() {
		
		StringBuilder str = new StringBuilder();
		str.append("FoodAreaVO [fstArea=");
		str.append(fstArea);
		str.append(", SndArea=");
		str.append(SndArea);
		str.append(", ThdArea=");
		str.append(ThdArea);
		str.append(FrthArea);
		str.append(", FthArea=");
		str.append(FthArea);
		
		return str.toString();
//		return "FoodAreaVO [fstArea=" + fstArea + ", SndArea=" + SndArea + ", ThdArea=" + ThdArea + ", FrthArea="
//				+ FrthArea + ", FthArea=" + FthArea + "]";
	}
	
	
	
	
}
