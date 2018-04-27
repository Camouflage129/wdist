package com.wdist.biz.food.dao;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.wdist.biz.food.vo.SaleAvgVO;
import com.wdist.biz.food.vo.WordCountVO;
import com.wdist.biz.mybatis.mapper.FoodMapper;

@Component("FoodDAO")
public class FoodDAOImpl implements FoodDAO{
	@Resource(name="sqlSessionTemplateMariadb")
	SqlSession mybatis;
	FoodMapper mapper;
	
	@PostConstruct
	public void init() {
		mapper = (FoodMapper) mybatis.getMapper(FoodMapper.class);
	}

	@Override
	public List<SaleAvgVO> fstSaleAvg(String areatitle) {
		// TODO Auto-generated method stub
		return mapper.frthSaleAvg(areatitle);
	}

	@Override
	public List<SaleAvgVO> sndSaleAvg(String areatitle) {
		// TODO Auto-generated method stub
		return mapper.sndSaleAvg(areatitle);
	}

	@Override
	public List<SaleAvgVO> thrdSaleAvg(String areatitle) {
		// TODO Auto-generated method stub
		return mapper.thrdSaleAvg(areatitle);
	}

	@Override
	public List<SaleAvgVO> frthSaleAvg(String areatitle) {
		// TODO Auto-generated method stub
		return mapper.frthSaleAvg(areatitle);
	}

	@Override
	public List<WordCountVO> getWords(String word) {
		// TODO Auto-generated method stub
		return mapper.getWords(word);
	}

	
	/*@Override
	public FoodAreaVO getFoodAreaTitle(String foodtitle) {
		return mapper.getFoodAreaTitle(foodtitle);
	}

	@Override
	public AreaFoodVO getAreaFoodtitle(String areatitle) {
		return mapper.getAreaFoodTitle(areatitle);
	}*/
	
	
	
	
	
	
	
}
