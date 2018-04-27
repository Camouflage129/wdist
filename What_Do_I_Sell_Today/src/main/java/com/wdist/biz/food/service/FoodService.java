package com.wdist.biz.food.service;

import java.util.List;

import com.wdist.biz.food.vo.AreaFoodVO;
import com.wdist.biz.food.vo.DangerVO;
import com.wdist.biz.food.vo.FoodAreaVO;
import com.wdist.biz.food.vo.SaleAvgVO;

public interface FoodService {
	
	/*public FoodAreaVO getFoodAreaTitle(String foodtitle);
	
	public AreaFoodVO getAreaFoodTitle(String areatitle);*/
	public List<SaleAvgVO> fstSaleAvg(String areatitle);

	public List<SaleAvgVO> sndSaleAvg(String areatitle);
	
	public List<SaleAvgVO> thrdSaleAvg(String areatitle);
	
	public List<SaleAvgVO> frthSaleAvg(String areatitle);
	
	public DangerVO warninglever(String areatitle);
	
}
