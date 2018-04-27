package com.wdist.biz.food.dao;

import java.util.List;

import com.wdist.biz.food.vo.SaleAvgVO;

public interface FoodDAO {
	
	/*public FoodAreaVO getFoodAreaTitle(String foodtitle);
	
	public AreaFoodVO getAreaFoodtitle(String areatitle);*/
	
	public List<SaleAvgVO> fstSaleAvg(String areatitle);

	public List<SaleAvgVO> sndSaleAvg(String areatitle);
	
	public List<SaleAvgVO> thrdSaleAvg(String areatitle);
	
	public List<SaleAvgVO> frthSaleAvg(String areatitle);
}
