package com.wdist.biz.food.dao;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.wdist.biz.food.vo.AreaFoodVO;
import com.wdist.biz.food.vo.FoodAreaVO;
import com.wdist.biz.mybatis.mapper.FoodMapper;

@Component("FoodDAO")
public class FoodDAOImpl implements FoodDAO{
	@Resource(name="sqlSessionTemplateWindow")
	SqlSession mybatis;
	FoodMapper mapper;
	
	@PostConstruct
	public void init() {
		mapper = (FoodMapper) mybatis.getMapper(FoodMapper.class);
	}
	
	@Override
	public FoodAreaVO getFoodAreaTitle(String foodtitle) {
		return mapper.getFoodAreaTitle(foodtitle);
	}

	@Override
	public AreaFoodVO getAreaFoodtitle(String areatitle) {
		return mapper.getAreaFoodTitle(areatitle);
	}
}
