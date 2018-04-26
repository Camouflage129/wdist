package com.wdist.biz.reply.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.wdist.biz.reply.vo.ReplyVO;

@Component("ReplyDAO")
public class ReplyDAOImpl implements ReplyDAO{
	
	@Resource(name="sqlSessionTemplateWindow")
	SqlSession mybatis;
	
	@Override
	public List<ReplyVO> replyList(int BoardNum) {
		return mybatis.selectList("replyList", BoardNum);
	}

	@Override
	public int insertReply(ReplyVO vo) {
		return mybatis.insert("insertReply", vo);
	}

	@Override
	public int insertReReply(ReplyVO vo) {
		return mybatis.insert("insertReReply", vo);
	}

	@Override
	public int modifyParentReply(ReplyVO vo) {
		return mybatis.update("modifyParentReply", vo);
	}

	@Override
	public int modifyReply(ReplyVO vo) {
		return mybatis.update("modifyReply", vo);
	}

	@Override
	public int deleteReply(int replyNum) {
		return mybatis.delete("removeReply", replyNum);
	}

	@Override
	public int deleteChild(int ParentNum) {
		return mybatis.delete("deleteChild", ParentNum);
	}
}
