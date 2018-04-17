package com.wdist.biz.board.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wdist.biz.board.dao.BoardDAO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService{
	@Resource(name="BoardDAO")
	BoardDAO dao;
}
