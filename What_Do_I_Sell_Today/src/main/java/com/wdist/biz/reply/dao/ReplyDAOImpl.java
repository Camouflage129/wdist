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
		System.out.println("dao : "+vo);
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

	@Override
	public int selectchicout(ReplyVO vo) {
		return mybatis.selectOne("selectchicout", vo);
	}

	@Override
	public ReplyVO selecyChild(ReplyVO vo) {
		return mybatis.selectOne("selecyChild",vo);
	}

	@Override
	public int updateParentReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return mybatis.update("updateParentReply", vo);
	}
	
}
