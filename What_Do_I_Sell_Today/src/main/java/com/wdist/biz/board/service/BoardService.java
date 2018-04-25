package com.wdist.biz.board.service;

import java.util.List;

import com.wdist.biz.board.vo.BoardVO;
import com.wdist.biz.board.vo.FileVO;

public interface BoardService {
	public List<BoardVO> freeOrCsBoard(String Type);
	
	public BoardVO viewBoard(int BoardNum);
	
	public List<FileVO> viewBoradFile(int BoardNum);
	
	public List<BoardVO> searchBoard(String Type, String searchTitle, String text);
	
	public int insertBoard(BoardVO boardVO, String string);
	
	public int deleteBoard(int num, String content, String filePath);
	
	public int modifyBoard(BoardVO vo, String content, String filePath);
	
	public int insertFile(FileVO vo);
	
	public int deleteFile(String id);
}
