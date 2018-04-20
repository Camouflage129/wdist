package com.wdist.biz.food.dao;

import com.wdist.biz.food.vo.AreaFoodVO;
import com.wdist.biz.food.vo.FoodAreaVO;

public interface FoodDAO {
	
	public FoodAreaVO getFoodAreaTitle(String foodtitle);
	
	public AreaFoodVO getAreaFoodtitle(String areatitle);
}
