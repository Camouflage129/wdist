package com.wdist.biz.food.dao;

import com.wdist.biz.food.vo.FoodAreaVO;

public interface FoodDAO {
	//public List<BoardVO> freeOrCsBoard(String Type);
	
	public FoodAreaVO getFoodAreaTitle(String foodtitle);
}
