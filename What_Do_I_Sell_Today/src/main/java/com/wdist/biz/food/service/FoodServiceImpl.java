package com.wdist.biz.food.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wdist.biz.food.dao.FoodDAO;
import com.wdist.biz.food.vo.FoodAreaVO;

@Service("FoodService")
public class FoodServiceImpl implements FoodService{
	@Resource(name="FoodDAO")
	FoodDAO dao;
	
	@Override
	public FoodAreaVO getFoodAreaTitle(String foodtitle) {
		
		return dao.getFoodAreaTitle(foodtitle);
	}
}
