package com.wdist.biz.food.service;

import java.util.List;

import com.wdist.biz.board.vo.BoardVO;
import com.wdist.biz.board.vo.FileVO;
import com.wdist.biz.board.vo.ReplyVO;
import com.wdist.biz.food.vo.FoodAreaVO;

public interface FoodService {
	//public List<BoardVO> freeOrCsBoard(String Type);
	
	public FoodAreaVO getFoodAreaTitle(String foodtitle);
}
