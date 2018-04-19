package com.wdist.biz.dept.vo;

//업종별 겁색(food.jsp) top5지역 



public class FoodAreaVO {
	
	String fstArea;
	String SndArea;
	String ThdArea;
	String FrthArea;
	String FthArea;
	
		
	public FoodAreaVO() {
		super();
	}
	
	public FoodAreaVO(String fstArea, String sndArea, String thdArea, String frthArea, String fthArea) {
		super();
		this.fstArea = fstArea;
		SndArea = sndArea;
		ThdArea = thdArea;
		FrthArea = frthArea;
		FthArea = fthArea;
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
	
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((FrthArea == null) ? 0 : FrthArea.hashCode());
		result = prime * result + ((FthArea == null) ? 0 : FthArea.hashCode());
		result = prime * result + ((SndArea == null) ? 0 : SndArea.hashCode());
		result = prime * result + ((ThdArea == null) ? 0 : ThdArea.hashCode());
		result = prime * result + ((fstArea == null) ? 0 : fstArea.hashCode());
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
		FoodAreaVO other = (FoodAreaVO) obj;
		if (FrthArea == null) {
			if (other.FrthArea != null)
				return false;
		} else if (!FrthArea.equals(other.FrthArea))
			return false;
		if (FthArea == null) {
			if (other.FthArea != null)
				return false;
		} else if (!FthArea.equals(other.FthArea))
			return false;
		if (SndArea == null) {
			if (other.SndArea != null)
				return false;
		} else if (!SndArea.equals(other.SndArea))
			return false;
		if (ThdArea == null) {
			if (other.ThdArea != null)
				return false;
		} else if (!ThdArea.equals(other.ThdArea))
			return false;
		if (fstArea == null) {
			if (other.fstArea != null)
				return false;
		} else if (!fstArea.equals(other.fstArea))
			return false;
		return true;
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
		str.append("]");
		
		return str.toString();
//		return "FoodAreaVO [fstArea=" + fstArea + ", SndArea=" + SndArea + ", ThdArea=" + ThdArea + ", FrthArea="
//				+ FrthArea + ", FthArea=" + FthArea + "]";
	}
	
	
	
	
}
