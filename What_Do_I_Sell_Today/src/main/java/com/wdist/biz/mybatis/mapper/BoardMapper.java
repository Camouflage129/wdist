package com.wdist.biz.mybatis.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.wdist.biz.board.vo.BoardVO;
import com.wdist.biz.board.vo.FileVO;
import com.wdist.biz.board.vo.ReplyVO;

public interface BoardMapper {
	@Select("select * from Board where Type = ?")
	public List<BoardVO> freeOrCsBoard(String Type);
	
	@Select("select * from Board where BoardNum = ?")
	public List<BoardVO> viewBoard(int BoardNum);
	
	@Select("select f.FileName, f.HashValue from File f, FileGroup fg where f.FileGroupNum = fg.FileGroupNum and BoardNum = ?")
	public List<FileVO> viewBoradFile(int BoardNum);
	
	@Select("select * from Reply where BoardNum = ?")
	public List<ReplyVO> viewBoardReply(int BoardNum);
	
	@Select("select BoardNum from Board where Type = #{Type} and Title = #{Title} and Contents = #{Contents} and UsersID = #{UsersID} and PostDate = #{PostDate}")
	public int getBoardNum(BoardVO vo);
	
	@Select("select FileGroupNum from FileGroup where BoardNum = #{num}")
	public int getFileGroupNum(int num);
	
	@Insert("insert into Board (BoardNum, Type, Title, Contents, UsersID, PostDate)"
			+ "values ((select nvl(max(num),0)+1 from Board), #{Type}, #{Title}, #{Contents}, #{UsersID}, #{PostDate}")
	public int insertBoard(BoardVO vo);
	
	@Insert("insert into FileGroup (FileGroupNum, BoardNum) values((select nvl(max(num),0)+1 from FileGroup), #{num})")
	public int insertFileGroup(int num);
	
	// 덧글을 더 다는 경우에 어떻게 될지 생각해서 수정해야 할 수 있다.
	@Insert("insert into Reply (ReplyNum, UsersID, Contents, PostDate, ReplyNums, BoardNum)"
			+ "values ((select nvl(max(num),0)+1 from Reply), #{UsersID}, #{Contents}, #{ReplyNums}, #{BoardNum}")
	public int insertReply(ReplyVO vo);
	
	@Delete("delete from Reply where BoardNum = #{num}")
	public int deleteReply(int num);
	
	@Delete("delete from Board where BoardNum = #{num}")
	public int deleteBoard(int num);
	
	@Update("update Board set Title = #{Title}, Contents = #{Contents}, where BoardNum = #{BoardNum}")
	public int modifyBoard(BoardVO vo);
	
	// 파일 수정의 경우 파일의 개수에 따라 삭제 삽입이 모두 이루어져야한다. 트랜잭션을 통해 컨트롤 해야한다.
	@Insert("insert into File (FileNum, FileName, HashValue, FileGroupNum, FileSize)"
			+ "values ((select nvl(max(num),0)+1 from File), #{FileName}, #{HashValue}, #{FileGroupNum}, #{FileSize}")
	public int insertFile(FileVO vo);
	
	@Delete("delete from File where FileGroupNum = #{num}")
	public int deleteFile(int num);
	
	@Update("update Board set FileName = #{FileName}, HashValue = #{HashValue}, FileGroupNum = #{FileGroupNum}, FileSize = #{FileSize} where FileNum = #{FileNum}")
	public int modifyFile(FileVO vo);
}
