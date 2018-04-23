package com.wdist.web.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wdist.biz.board.service.BoardService;
import com.wdist.biz.board.vo.BoardVO;

@Controller
public class BoardController {
	@Resource(name = "BoardService")
	BoardService service;

	@RequestMapping(value = "/main.do")
	public String mainDo() {
		return "index";
	}

	@RequestMapping(value = "/freeBoard.do")
	public String freeBoardDo(@RequestParam("num") int num, HttpServletRequest request) {
		List<BoardVO> list = service.freeOrCsBoard("freeBoard");
		List<BoardVO> clist = new ArrayList<BoardVO>();
		int postnum = 0;
		int count = 0;
		int pageNum = 0;
		for (int i = ((num - 1) * 10); i < list.size(); i++) {
			if (count == 10)
				break;
			clist.add(list.get(i));
			count++;
		}
		if (list.size() % 10 == 0)
			pageNum = list.size() / 10;
		else
			pageNum = list.size() / 10 + 1;
		postnum = list.size() + 10 - pageNum * 10;
		postnum = (pageNum - num) * 10 + postnum;
		request.setAttribute("type", "freeBoard");
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("list", clist);
		request.setAttribute("postnum", postnum);
		return "index.jsp?content=/WEB-INF/views/service/freeBoard";
	}

	@RequestMapping(value = "/csBoard.do")
	public String csBoardDo(HttpServletRequest request) {
		List<BoardVO> list = service.freeOrCsBoard("csBoard");
		request.setAttribute("type", "csBoard");
		request.setAttribute("list", list);
		return "index.jsp?content=/WEB-INF/views/service/csBoard";
	}

	@RequestMapping(value = "/insertBoardGo.do")
	public String insertBoardGo(@RequestParam("type") String type, HttpServletRequest request) {
		System.out.println(type);
		request.setAttribute("type", type);
		return "index.jsp?content=/WEB-INF/views/service/insertBoard";
	}

	@RequestMapping(value = "/insertBoard.do")
	public String insertBoard(String Type, String Title, String UsersID, String Contents, HttpServletRequest request) {
		java.util.Date udate = new java.util.Date();
		Date date = new Date(udate.getTime());
		BoardVO boardVO = new BoardVO(Type, Title, Contents, UsersID, date);
		service.insertBoard(boardVO, (String) request.getAttribute("userid"));
		if (boardVO.getType().equals("freeBoard"))
			return "redirect:freeBoard.do?num=1";
		else
			return "redirect:csBoard.do";
	}

	@RequestMapping(value = "/deleteFiles.do")
	public String deleteFiles(@RequestParam("type") String type, HttpServletRequest request) {
		String id = (String) request.getAttribute("userid");
		System.out.println(service.deleteFile(id));
		if (type.equals("freeBoard"))
			return "redirect:freeBoard.do?num=1";
		else
			return "redirect:csBoard.do";
	}

	@RequestMapping(value = "/findBoard.do")
	public String findBoard(int num, HttpServletRequest request) {
		BoardVO board = (BoardVO) service.viewBoard(num);
		List<BoardVO> list = service.freeOrCsBoard(board.getType());
		int beforeNum = -1, afterNum = -1;
		for(int i=0; i < list.size(); i++) {
			if(list.get(i).getBoardNum() == num) {
				if(i - 1 >= 0)
					beforeNum = list.get(i - 1).getBoardNum();
				if(i + 1 < list.size())
					afterNum = list.get(i + 1).getBoardNum();
				break;
			}
		}
		request.setAttribute("beforeNum", beforeNum);
		request.setAttribute("afterNum", afterNum);
		request.setAttribute("board", board);
		return "index.jsp?content=/WEB-INF/views/service/viewBoard";
	}
	
	@RequestMapping(value="/deleteBoard.do")
	public String deledtBoard(int num, HttpSession session, HttpServletRequest request) {
		BoardVO vo = service.viewBoard(num);
		String filepath = request.getSession().getServletContext().getRealPath("/upload/");
		System.out.println(service.deleteBoard(num,vo.getContents(),filepath));
		
		return "redirect:freeBoard.do";
	}
	
	@RequestMapping(value="/checkBoard.do")
	public ModelAndView checkBoard(int num) {
		HashMap<String, String> map = new HashMap<>();
		if(service.viewBoard(num) != null)
			map.put("result", "success");
		else
			map.put("result", "fail");
		return new ModelAndView("jsonView", map);
	}
}
