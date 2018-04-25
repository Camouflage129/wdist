package com.wdist.web.controller;

import java.util.List;

import javax.annotation.Resource;

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
@RequestMapping(value="/replies")
public class ReplyController {
	
	@Resource(name="ReplyService")
	ReplyService service;
	
	@RequestMapping(value = "/replyList/{boardNum}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> replyList(@PathVariable("boardNum") Integer boardNum) {
		System.out.println("넘어왔을까 ?");
		ResponseEntity<List<ReplyVO>> resEntity = null;
		try {
			System.out.println(service.replyList(boardNum));
			resEntity = new ResponseEntity<>(service.replyList(boardNum), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return resEntity;
	}
	
	@RequestMapping(value = "/insertReply", method = RequestMethod.POST)
	public ResponseEntity<String> insertReply(@RequestBody ReplyVO vo) {
		ResponseEntity<String> resEntity = null;
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
	public ResponseEntity<String> updateReply(@PathVariable("replyNum") Integer replyNum,
			@RequestBody ReplyVO vo) {

		ResponseEntity<String> resEntity = null;

		try {
			vo.setReplyNum(replyNum);
			service.modifyReply(vo);

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
