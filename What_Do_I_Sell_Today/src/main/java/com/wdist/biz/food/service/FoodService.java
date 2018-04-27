package com.wdist.biz.food.service;

import com.wdist.biz.food.vo.AreaFoodVO;
import com.wdist.biz.food.vo.FoodAreaVO;
import com.wdist.biz.food.vo.SaleAvgVO;

public interface FoodService {
	
	/*public FoodAreaVO getFoodAreaTitle(String foodtitle);
	
	public AreaFoodVO getAreaFoodTitle(String areatitle);*/
	public SaleAvgVO fstSaleAvg(String areatitle);

	public SaleAvgVO sndSaleAvg(String areatitle);
	
	public SaleAvgVO thrdSaleAvg(String areatitle);
	
	public SaleAvgVO frthSaleAvg(String areatitle);
	
}
