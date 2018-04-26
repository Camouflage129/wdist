package com.wdist.web.controller;

import java.sql.Date;
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
	
	@Resource(name="ReplyService")
	ReplyService service;
	
	@RequestMapping(value = "/replyList/{boardNum}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> replyList(@PathVariable("boardNum") Integer boardNum) {
		ResponseEntity<List<ReplyVO>> resEntity = null;
		try {
			resEntity = new ResponseEntity<>(service.replyList(boardNum), HttpStatus.OK);
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
	
	@RequestMapping(value = "/updateReply/{replyNum}", method = { RequestMethod.PUT,
			RequestMethod.PATCH })
	public ResponseEntity<String> updateReply(@PathVariable("replyNum") Integer replyNum, @RequestBody ReplyVO vo) {
		ResponseEntity<String> resEntity = null;
		try {
			vo.setReplyNum(replyNum);
			System.out.println(service.modifyReply(vo));
			resEntity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<String>(e.getMessage(),
					HttpStatus.BAD_REQUEST);
		}
		return resEntity;
	}
	
	@RequestMapping(value = "/deleteReply/{replyNum}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteReply(@PathVariable("replyNum") Integer replyNum) {
		ResponseEntity<String> resEntity = null;
		try {
			service.deleteReply(replyNum);
			resEntity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<>(e.getMessage(),
					HttpStatus.BAD_REQUEST);
		}
		return resEntity;
	}

}
