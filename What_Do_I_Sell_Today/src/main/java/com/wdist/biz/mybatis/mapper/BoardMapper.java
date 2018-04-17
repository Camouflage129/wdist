package com.wdist.biz.mybatis.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.wdist.biz.board.vo.BoardVO;
import com.wdist.biz.board.vo.FileVO;
import com.wdist.biz.board.vo.ReplyVO;

public interface BoardMapper {
	@Select("select * from Board where Type = ?")
	public BoardVO freeOrCsBoard(String Type);
	
	@Select("select * from Board where BoardNum = ?")
	public BoardVO viewBoard(int BoardNum);
	
	@Select("select f.FileName, f.HashValue from File f, FileGroup fg where f.FileGroupNum = fg.FileGroupNum and BoardNum = ?")
	public FileVO viewBoradFile(int BoardNum);
	
	@Select("select * from Reply where BoardNum = ?")
	public ReplyVO viewBoardReply(int BoardNum);
	
	@Insert("insert into Board (BoardNum, Type, Title, Contents, UsersID, PostDate)"
			+ "values ((select nvl(max(num),0)+1 from Board), #{Type}, #{Title}, #{Contents}, #{UsersID}, #{PostDate}")
	public int insertBoard(BoardVO vo);
	
	@Insert("insert into File (FileNum, FileName, HashValue, FileGroupNum, FileSize)"
			+ "values ((select nvl(max(num),0)+1 from File), #{FileName}, #{HashValue}, #{FileGroupNum}, #{FileSize}")
	public int insertBoardFile(FileVO vo);
	
	@Insert("insert into Reply (ReplyNum, UsersID, Contents, PostDate, ReplyNums, BoardNum)"
			+ "values ((select nvl(max(num),0)+1 from Reply), #{UsersID}, #{Contents}, #{ReplyNums}, #{BoardNum}")
	public int insertBoardReply(ReplyVO vo);
}
