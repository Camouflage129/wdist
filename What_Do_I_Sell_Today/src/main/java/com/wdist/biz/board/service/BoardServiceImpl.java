package com.wdist.biz.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wdist.biz.board.dao.BoardDAO;
import com.wdist.biz.board.vo.BoardVO;
import com.wdist.biz.board.vo.FileVO;
import com.wdist.biz.board.vo.ReplyVO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService{
	@Resource(name="BoardDAO")
	BoardDAO dao;

	@Override
	public List<BoardVO> freeOrCsBoard(String Type) {
		return dao.freeOrCsBoard(Type);
	}

	@Override
	public List<BoardVO> viewBoard(int BoardNum) {
		return dao.viewBoard(BoardNum);
	}

	@Override
	public List<FileVO> viewBoradFile(int BoardNum) {
		return dao.viewBoradFile(BoardNum);
	}

	@Override
	public List<ReplyVO> viewBoardReply(int BoardNum) {
		return dao.viewBoardReply(BoardNum);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public int insertBoard(BoardVO boardVO, FileVO fileVO) {
		int rows = 0;
		int boardNum = dao.getBoardNum(boardVO);
		rows += dao.insertBoard(boardVO);
		rows += dao.insertFileGroup(boardNum);
		fileVO.setFileGroupNum(dao.getFileGroupNum(boardNum));
		if(fileVO != null)
			rows += dao.insertFile(fileVO);
		return rows;
	}

	//레스트 풀로 처리하자
	@Override
	public int insertReply(ReplyVO vo) {
		return dao.insertReply(vo);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public int deleteBoard(int num) {
		int rows = 0;
		rows += dao.deleteFile(dao.getFileGroupNum(num));
		rows += dao.deleteReply(num);
		rows += dao.deleteBoard(num);
		return rows;
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public int modifyBoard(BoardVO vo, FileVO fileVO) {
		int rows = 0;
		rows += dao.modifyBoard(vo);
		if(fileVO != null)
			rows += dao.modifyFile(fileVO);
		return rows;
	}
}
