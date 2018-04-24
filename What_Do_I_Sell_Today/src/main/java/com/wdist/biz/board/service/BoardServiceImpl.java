package com.wdist.biz.board.service;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wdist.biz.board.dao.BoardDAO;
import com.wdist.biz.board.util.BoardFileManager;
import com.wdist.biz.board.vo.BoardVO;
import com.wdist.biz.board.vo.FileVO;
import com.wdist.biz.board.vo.ReplyVO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService{
	@Resource(name="BoardDAO")
	BoardDAO dao;
	
	BoardFileManager bfm = new BoardFileManager();
	
	@Override
	public List<BoardVO> freeOrCsBoard(String Type) {
		return dao.freeOrCsBoard(Type);
	}

	@Override
	public BoardVO viewBoard(int BoardNum) {
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
	public List<BoardVO> searchBoard(String Type, String searchTitle, String text) {
		return dao.searchBoard(Type, searchTitle, text);
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public int insertBoard(BoardVO boardVO, String id) {
		int rows = 0;
		int boardNum = 0;
		rows += dao.insertBoard(boardVO);
		System.out.println(id);
		List<FileVO> files = dao.getFiles(id);
		System.out.println(files);
		if(files != null) {
			Iterator<FileVO> it = files.iterator();
			boardNum = dao.getBoardNum(boardVO);
			rows += dao.insertFileGroup(boardNum);
			while(it.hasNext()) {
				FileVO data = it.next();
				data.setFileGroupNum(dao.getFileGroupNum(boardNum));
				data.setFlag("");
				dao.modifyFile(data);
			}
		}
		return rows;
	}

	//레스트 풀로 처리하자
	@Override
	public int insertReply(ReplyVO vo) {
		return dao.insertReply(vo);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public int deleteBoard(int num, String content, String filePath) {
		int rows = 0;
		if(dao.getFileGroupNum(num) != -1) {
			rows += dao.deleteFile(dao.getFileGroupNum(num));
			rows += dao.deleteFileGroup(num);
		}
		rows += dao.deleteReply(num);
		rows += dao.deleteBoard(num);
		bfm.contentsFileDelect(content, filePath);
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

	@Override
	public int insertFile(FileVO vo) {
		return dao.insertFile(vo);
	}

	@Override
	public int deleteFile(String id) {
		int rows = 0;
		List<FileVO> files = dao.getFiles(id);
		Iterator<FileVO> it = files.iterator();
		while(it.hasNext()) {
			FileVO data = it.next();
			rows += dao.deleteFiles(data.getFileNum());
		}
		return rows;
	}
}
