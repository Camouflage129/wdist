package com.wdist.web.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wdist.biz.reply.service.ReplyService;
import com.wdist.biz.reply.vo.ReplyVO;

@RestController
public class ReplyController {

	@Resource(name = "ReplyService")
	ReplyService service;

	@RequestMapping(value = "/replyList/{boardNum}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> replyList(@PathVariable("boardNum") Integer boardNum) {
		ResponseEntity<List<ReplyVO>> resEntity = null;
		try {
			List<ReplyVO> list = new ArrayList<ReplyVO>();
			List<ReplyVO> list2 = new ArrayList<ReplyVO>();
			list = service.replyList(boardNum);
			System.out.println(list);
			Iterator<ReplyVO> iter1 = list.iterator();
			int where1 = 0, where2 = 0;
			while (iter1.hasNext()) {
				ReplyVO listvo1 = iter1.next();
				if (listvo1.getChildCount() == 0 && listvo1.getParentNum()==0)
					list2.add(listvo1);
				else {
					if(listvo1.getParentNum()==0)list2.add(listvo1);
					Iterator<ReplyVO> iter2 = list.iterator();
					while (iter2.hasNext()) {
						ReplyVO listvo2 = iter2.next();
						if (listvo1.getReplyNum() == listvo2.getParentNum()) {
							list2.add(listvo2);
						}
					}
				}
			}
			resEntity = new ResponseEntity<>(list2, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return resEntity;
	}

	@RequestMapping(value = "/insertReply", method = RequestMethod.POST)
	public ResponseEntity<String> insertReply(@RequestBody ReplyVO vo, HttpSession session) {
		ResponseEntity<String> resEntity = null;
		java.util.Date udate = new java.util.Date();
		Date date = new Date(udate.getTime());
		vo.setPostDate(date);
		vo.setUsersID((String) session.getAttribute("userid"));
		try {
			System.out.println(service.insertReply(vo));
			resEntity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return resEntity;
	}

	@RequestMapping(value = "/insertReReply", method = RequestMethod.POST)
	public ResponseEntity<String> insertReReply(@RequestBody ReplyVO vo, HttpSession session) {
		ResponseEntity<String> resEntity = null;
		java.util.Date udate = new java.util.Date();
		Date date = new Date(udate.getTime());
		vo.setPostDate(date);
		vo.setCount(service.selectchicout(vo) + 1);
		vo.setUsersID((String) session.getAttribute("userid"));
		vo.setChildCount(vo.getCount());
		System.out.println("대댓요청");
		System.out.println("부모수정" + service.modifyParentReply(vo));
		System.out.println(vo);
		try {
			System.out.println("자식등록" + service.insertReReply(vo));
			resEntity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return resEntity;
	}

	@RequestMapping(value = "/updateReply/{replyNum}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> updateReply(@PathVariable("replyNum") Integer replyNum, @RequestBody ReplyVO vo) {
		ResponseEntity<String> resEntity = null;
		try {
			vo.setReplyNum(replyNum);
			System.out.println(service.modifyReply(vo));
			resEntity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return resEntity;
	}

	@RequestMapping(value = "/deleteReply/{replyNum}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteReply(@PathVariable("replyNum") Integer replyNum) {
		ResponseEntity<String> resEntity = null;
		ReplyVO vo = new ReplyVO();
		vo.setReplyNum(replyNum);
		ReplyVO count = service.selecyChild(vo);
		if(count!=null) {
			service.updateParentReply(vo);
		}
		try {
			service.deleteReply(replyNum);
			resEntity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return resEntity;
	}

}
