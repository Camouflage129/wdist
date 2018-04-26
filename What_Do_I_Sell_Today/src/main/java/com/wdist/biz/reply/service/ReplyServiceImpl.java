package com.wdist.biz.reply.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wdist.biz.reply.dao.ReplyDAO;
import com.wdist.biz.reply.vo.ReplyVO;

@Service("ReplyService")
public class ReplyServiceImpl implements ReplyService{
	
	@Resource(name="ReplyDAO")
	ReplyDAO dao;
	
	@Override
	public List<ReplyVO> replyList(int BoardNum) {
		return dao.replyList(BoardNum);
	}

	@Override
	public int insertReply(ReplyVO vo) {
		return dao.insertReply(vo);
	}

	@Override
	public int insertReReply(ReplyVO vo) {
		return dao.insertReply(vo);
	}

	@Override
	public int modifyParentReply(ReplyVO vo) {
		return dao.modifyParentReply(vo);
	}

	@Override
	public int modifyReply(ReplyVO vo) {
		return dao.modifyReply(vo);
	}

	@Override
	public int deleteReply(int replyNum) {
		int rows = dao.deleteChild(replyNum);
		return rows + dao.deleteReply(replyNum);
	}
}
