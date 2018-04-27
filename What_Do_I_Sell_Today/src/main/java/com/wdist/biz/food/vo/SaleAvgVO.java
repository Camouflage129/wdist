package com.wdist.biz.food.vo;

public class SaleAvgVO {
	String sale_species; 
	int asale;
	
	
	public SaleAvgVO() {
		super();
	}
	public SaleAvgVO(String sale_species, int asale) {
		super();
		this.sale_species = sale_species;
		this.asale = asale;
	}
	public String getSale_species() {
		return sale_species;
	}
	public void setSale_species(String sale_species) {
		this.sale_species = sale_species;
	}
	public int getAsale() {
		return asale;
	}
	public void setAsale(int asale) {
		this.asale = asale;
	}
	@Override
	public String toString() {
		return "SaleAvgVO [sale_species=" + sale_species + ", asale=" + asale + "]";
	}
}
