package com.wdist.web.controller;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String freeBoardDo(HttpSession session) {
		List<BoardVO> list = service.freeOrCsBoard("freeBoard");
		session.setAttribute("type", "freeBoard");
		session.setAttribute("list", list);
		return "index.jsp?content=/WEB-INF/views/service/freeBoard";
	}
	
	@RequestMapping(value="/csBoard.do")
	public String csBoardDo(HttpSession session) {
		List<BoardVO> list = service.freeOrCsBoard("csBoard");
		session.setAttribute("type", "csBoard");
		session.setAttribute("list", list);
		return "index.jsp?content=/WEB-INF/views/service/csBoard";
	}
	
	@RequestMapping(value="/insertBoardGo.do")
	public String insertBoardGo(HttpSession session) {
		session.setAttribute("type", session.getAttribute("type"));
		return "index.jsp?content=/WEB-INF/views/service/insertBoard";
	}

	@RequestMapping(value="/insertBoard.do")
	public String insertBoard(String Type, String Title, String UsersID, String Contents, HttpSession session) {	//, FileVO fileVO
		java.util.Date udate = new java.util.Date();
		Date date = new Date(udate.getTime());
		BoardVO boardVO = new BoardVO(Type, Title, Contents ,UsersID, date);
		service.insertBoard(boardVO, (String) session.getAttribute("userid"));
		if(boardVO.getType().equals("freeBoard"))
			return "redirect:freeBoard.do";
		else
			return "redirect:csBoard.do";
	}
	
	@RequestMapping(value="/deleteFiles.do")
	public String deleteFiles(HttpSession session) {
		String type = (String) session.getAttribute("type");
		String id = (String) session.getAttribute("userid");
		System.out.println(service.deleteFile(id));
		if(type.equals("freeBoard"))
			return "redirect:freeBoard.do";
		else
			return "redirect:csBoard.do"; 
	}
	
	@RequestMapping(value="/findBoard.do")
	public String findBoard(int num,HttpServletRequest request) {
		BoardVO board = (BoardVO) service.viewBoard(num);
		System.out.println(board);
		request.setAttribute("board", board);
		return "index.jsp?content=/WEB-INF/views/service/viewBoard";
	}
}
