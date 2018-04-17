package com.wdist.biz.board.dao;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.wdist.biz.mybatis.mapper.BoardMapper;

@Component("BoardDAO")
public class BoardDAOImpl implements BoardDAO{
	@Resource(name="sqlSessionTemplateWindow")
	SqlSession mybatis;
	BoardMapper mapper;
	
	@PostConstruct
	public void init() {
		mapper = (BoardMapper) mybatis.getMapper(BoardMapper.class);
	}
	
	
}
