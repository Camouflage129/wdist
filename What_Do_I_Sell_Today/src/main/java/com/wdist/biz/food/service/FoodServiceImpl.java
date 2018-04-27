package com.wdist.biz.food.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wdist.biz.food.dao.FoodDAO;
import com.wdist.biz.food.vo.AreaFoodVO;
import com.wdist.biz.food.vo.FoodAreaVO;
import com.wdist.biz.food.vo.SaleAvgVO;

@Service("FoodService")
public class FoodServiceImpl implements FoodService{
	@Resource(name="FoodDAO")
	FoodDAO dao;

	/*@Override
	public FoodAreaVO getFoodAreaTitle(String foodtitle) {
		return dao.getFoodAreaTitle(foodtitle);
	}

	@Override
	public AreaFoodVO getAreaFoodTitle(String areatitle) {
		return dao.getAreaFoodtitle(areatitle);
	}*/
	
	
	@Override
	public SaleAvgVO fstSaleAvg(String areatitle) {
		return dao.fstSaleAvg(areatitle);
	}

	@Override
	public SaleAvgVO sndSaleAvg(String areatitle) {
		return dao.sndSaleAvg(areatitle);
	}

	@Override
	public SaleAvgVO thrdSaleAvg(String areatitle) {
		return dao.thrdSaleAvg(areatitle);
	}

	@Override
	public SaleAvgVO frthSaleAvg(String areatitle) {
		return dao.frthSaleAvg(areatitle);
	}
	
	
	
}
