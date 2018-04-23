package com.wdist.biz.board.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.wdist.biz.board.vo.BoardVO;
import com.wdist.biz.board.vo.FileVO;
import com.wdist.biz.board.vo.ReplyVO;
import com.wdist.biz.mybatis.mapper.BoardMapper;

@Component("BoardDAO")
public class BoardDAOImpl implements BoardDAO {
	@Resource(name = "sqlSessionTemplateWindow")
	SqlSession mybatis;
	BoardMapper mapper;

	@PostConstruct
	public void init() {
		mapper = (BoardMapper) mybatis.getMapper(BoardMapper.class);
	}

	@Override
	public List<BoardVO> freeOrCsBoard(String Type) {
		return mapper.freeOrCsBoard(Type);
	}

	@Override
	public BoardVO viewBoard(int BoardNum) {
		return mapper.viewBoard(BoardNum);
	}

	@Override
	public List<FileVO> viewBoradFile(int BoardNum) {
		return mapper.viewBoradFile(BoardNum);
	}

	@Override
	public List<ReplyVO> viewBoardReply(int BoardNum) {
		return mapper.viewBoardReply(BoardNum);
	}

	@Override
	public List<BoardVO> searchBoard(String Type, String searchTitle, String text) {
		HashMap<String, String> map = new HashMap<>();
		map.put("Type", Type);
		map.put("searchTitle", searchTitle);
		map.put("text", text);
		System.out.println(map);
		return mapper.searchBoard(map);
	}

	@Override
	public int getBoardNum(BoardVO vo) {
		return mapper.getBoardNum(vo);
	}

	@Override
	public int getFileGroupNum(int num) {
		return mapper.getFileGroupNum(num);
	}

	@Override
	public int insertBoard(BoardVO vo) {
		return mapper.insertBoard(vo);
	}

	@Override
	public int insertFileGroup(int num) {
		return mapper.insertFileGroup(num);
	}

	@Override
	public int insertReply(ReplyVO vo) {
		return mapper.insertReply(vo);
	}

	@Override
	public int deleteReply(int num) {
		return mapper.deleteReply(num);
	}

	@Override
	public int deleteBoard(int num) {
		return mapper.deleteBoard(num);
	}

	@Override
	public int modifyBoard(BoardVO vo) {
		return mapper.modifyBoard(vo);
	}

	@Override
	public int insertFile(FileVO vo) {
		return mapper.insertFile(vo);
	}

	@Override
	public int deleteFile(int num) {
		return mapper.deleteFile(num);
	}

	@Override
	public int deleteFiles(int num) {
		return mapper.deleteFiles(num);
	}

	@Override
	public int modifyFile(FileVO vo) {
		return mapper.modifyFile(vo);
	}

	@Override
	public List<FileVO> getFiles(int num, String id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("id", id);
		return mapper.getFiles(map);
	}
}
