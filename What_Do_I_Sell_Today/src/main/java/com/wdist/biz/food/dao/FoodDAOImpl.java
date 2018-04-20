package com.wdist.biz.food.dao;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.wdist.biz.board.vo.BoardVO;
import com.wdist.biz.board.vo.FileVO;
import com.wdist.biz.board.vo.ReplyVO;
import com.wdist.biz.food.vo.FoodAreaVO;
import com.wdist.biz.mybatis.mapper.BoardMapper;
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
}
