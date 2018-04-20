package com.wdist.biz.board.dao;

import java.util.List;

import com.wdist.biz.board.vo.BoardVO;
import com.wdist.biz.board.vo.FileVO;
import com.wdist.biz.board.vo.ReplyVO;

public interface BoardDAO {
	public List<BoardVO> freeOrCsBoard(String Type);
	
	public BoardVO viewBoard(int BoardNum);
	
	public List<FileVO> viewBoradFile(int BoardNum);
	
	public List<ReplyVO> viewBoardReply(int BoardNum);
	
	public int getBoardNum(BoardVO vo);
	
	public int getFileGroupNum(int num);
	
	public int insertBoard(BoardVO vo);
	
	public int insertFileGroup(int num);
	
	// 덧글을 더 다는 경우에 어떻게 될지 생각해서 수정해야 할 수 있다.
	public int insertReply(ReplyVO vo);
	
	public int deleteReply(int num);
	
	public int deleteBoard(int num);
	
	public int modifyBoard(BoardVO vo);
	
	// 파일 수정의 경우 파일의 개수에 따라 삭제 삽입이 모두 이루어져야한다. 트랜잭션을 통해 컨트롤 해야한다.
	public int insertFile(FileVO vo);
	
	public int deleteFile(int num);
	
	public int deleteFiles(int num);
	
	public int modifyFile(FileVO vo);
	
	public List<FileVO> getFiles(int num, String id);
}
