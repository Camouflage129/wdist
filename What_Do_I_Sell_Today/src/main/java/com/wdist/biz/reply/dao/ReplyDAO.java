package com.wdist.biz.reply.dao;

import java.util.List;

import com.wdist.biz.board.vo.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> replyList(int BoardNum);
	public int insertReply(ReplyVO vo);
	public int insertReReply(ReplyVO vo);
	public int modifyParentReply(ReplyVO vo);
	public int modifyReply(ReplyVO vo);
	public int deleteReply(int replyNum);
}