package com.wdist.biz.food.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wdist.biz.food.dao.FoodDAO;
import com.wdist.biz.food.vo.AreaFoodVO;
import com.wdist.biz.food.vo.DangerVO;
import com.wdist.biz.food.vo.FoodAreaVO;
import com.wdist.biz.food.vo.SaleAvgVO;
import com.wdist.biz.food.vo.WordCountVO;

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
	public List<SaleAvgVO> fstSaleAvg(String areatitle) {
		return dao.fstSaleAvg(areatitle);
	}

	@Override
	public List<SaleAvgVO> sndSaleAvg(String areatitle) {
		return dao.sndSaleAvg(areatitle);
	}

	@Override
	public List<SaleAvgVO> thrdSaleAvg(String areatitle) {
		return dao.thrdSaleAvg(areatitle);
	}

	@Override
	public List<SaleAvgVO> frthSaleAvg(String areatitle) {
		return dao.frthSaleAvg(areatitle);
	}

	@Override
	public DangerVO warninglever(String areatitle) {
		// TODO Auto-generated method stub
		return dao.warninglever(areatitle);
	}

	@Override
	public List<WordCountVO> getWords(String word) {
		return dao.getWords(word);
	}
	
	
	
}
