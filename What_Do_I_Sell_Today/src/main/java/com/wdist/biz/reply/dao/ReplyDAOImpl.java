package com.wdist.biz.reply.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.wdist.biz.reply.vo.ReplyVO;

@Component("ReplyDAO")
public class ReplyDAOImpl implements ReplyDAO{
	
	@Resource(name="sqlSessionTemplateWindow")
	private SqlSession sqlSession;
	
	@Override
	public List<ReplyVO> replyList(int BoardNum) {
		return sqlSession.selectList("replyList", BoardNum);
	}

	@Override
	public int insertReply(ReplyVO vo) {
		return sqlSession.insert("insertReply", vo);
	}

	@Override
	public int insertReReply(ReplyVO vo) {
		return sqlSession.insert("insertReReply", vo);
	}

	@Override
	public int modifyParentReply(ReplyVO vo) {
		return sqlSession.update("modifyParentReply", vo);
	}

	@Override
	public int modifyReply(ReplyVO vo) {
		return sqlSession.update("modifyReply", vo);
	}

	@Override
	public int deleteReply(int replyNum) {
		return sqlSession.delete("deleteReply", replyNum);
	}
}
