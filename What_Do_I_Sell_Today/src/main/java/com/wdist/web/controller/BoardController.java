package com.wdist.web.controller;

import java.sql.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wdist.biz.board.service.BoardService;
import com.wdist.biz.board.vo.BoardVO;

@Controller
public class BoardController {
	@Resource(name="BoardService")
	BoardService service;
	
	@RequestMapping(value="/main.do")
	public String mainDo() {
		return "index";
	}
	
	@RequestMapping(value="/freeBoard.do")
	public String freeBoardDo() {
		return "index.jsp?content=/WEB-INF/views/service/freeBoard";
	}
	
	@RequestMapping(value="/csBoard.do")
	public String csBoardDo() {
		return "index.jsp?content=/WEB-INF/views/service/csBoard";
	}
	
	@RequestMapping(value="/insertBoardGo.do")
	public String insertBoardGo() {
		return "index.jsp?content=/WEB-INF/views/service/insertBoard";
	}

	@RequestMapping(value="/insertBoard.do")
	public String insertBoard(String Type, String Title, String UsersID, String Contents) {	//, FileVO fileVO
		java.util.Date udate = new java.util.Date();
		Date date = new Date(udate.getTime());
		BoardVO boardVO = new BoardVO(Type, Title, UsersID, Contents, date);
		service.insertBoard(boardVO, null);
		if(boardVO.getType().equals("freeBoard"))
			return "redirect:freeBoard.do";
		else
			return "redirect:csBoard.do";
	}
}
