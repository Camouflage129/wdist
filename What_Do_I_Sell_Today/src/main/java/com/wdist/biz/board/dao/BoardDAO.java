package com.wdist.biz.board.dao;

import java.util.ArrayList;
import java.util.List;

import com.wdist.biz.board.vo.BoardVO;
import com.wdist.biz.board.vo.FileVO;

public interface BoardDAO {
	public List<BoardVO> freeOrCsBoard(String Type);
	
	public BoardVO viewBoard(int BoardNum);
	
	public List<FileVO> viewBoradFile(int BoardNum);
	
	public List<BoardVO> searchBoard(String Type, String searchTitle, String text);
	
	public int getBoardNum(BoardVO vo);
	
	public int getFileGroupNum(int num);
	
	public int insertBoard(BoardVO vo);
	
	public int insertFileGroup(int num);
	
	public int deleteFileGroup(int num);
	
	public int deleteBoard(int num);
	
	public int modifyBoard(BoardVO vo);
	
	public int deleteReply(int num);
	
	public int insertFile(FileVO vo);
	
	public int deleteFile(int num);
	
	public int deleteFiles(int num);
	
	public int modifyFile(FileVO vo);
	
	public ArrayList<FileVO> fileGroupSelect(int groupnum);
	
	public int filecount(String HashValue);
	public List<FileVO> getFiles(String id);
}
