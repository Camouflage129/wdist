package com.wdist.biz.food.dao;

import org.apache.ibatis.annotations.Select;

import com.wdist.biz.food.vo.AreaFoodVO;
import com.wdist.biz.food.vo.FoodAreaVO;
import com.wdist.biz.food.vo.SaleAvgVO;

public interface FoodDAO {
	
	/*public FoodAreaVO getFoodAreaTitle(String foodtitle);
	
	public AreaFoodVO getAreaFoodtitle(String areatitle);*/
	
	public SaleAvgVO fstSaleAvg(String areatitle);

	public SaleAvgVO sndSaleAvg(String areatitle);
	
	public SaleAvgVO thrdSaleAvg(String areatitle);
	
	public SaleAvgVO frthSaleAvg(String areatitle);
}
