package com.wdist.biz.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.wdist.biz.board.vo.BoardVO;
import com.wdist.biz.board.vo.FileVO;
import com.wdist.biz.board.vo.ReplyVO;

public interface BoardMapper {
	@Select("select * from Board where Type = #{Type} order by PostDate DESC")
	public List<BoardVO> freeOrCsBoard(String Type);
	
	@Select("select * from Board where BoardNum = #{BoardNum}")
	public BoardVO viewBoard(int BoardNum);
	
	@Select("select f.FileName, f.HashValue from File f, FileGroup fg where f.FileGroupNum = fg.FileGroupNum and BoardNum = #{BoardNum}")
	public List<FileVO> viewBoradFile(int BoardNum);
	
	@Select("select * from Reply where BoardNum = #{BoardNum}")
	public List<ReplyVO> viewBoardReply(int BoardNum);
	
	@Select("select BoardNum from Board where Type = #{Type} and Title = #{Title} and Contents = #{Contents} and UsersID = #{UsersID} and PostDate = #{DATE}")
	public int getBoardNum(BoardVO vo);
	
	@Select("select ifnull(FileGroupNum, -1) from FileGroup where BoardNum = #{num}")
	public int getFileGroupNum(int num);
	
	@Insert("insert into Board (BoardNum, Type, Title, Contents, UsersID, PostDate)"
			+ "values ((select ifnull(max(BoardNum),0)+1 from Board b), #{Type}, #{Title}, #{Contents}, #{UsersID}, #{DATE})")
	public int insertBoard(BoardVO vo);
	
	@Insert("insert into FileGroup (FileGroupNum, BoardNum) values((select ifnull(max(FileGroupNum),0)+1 from FileGroup f), #{num})")
	public int insertFileGroup(int num);
	
	// 덧글을 더 다는 경우에 어떻게 될지 생각해서 수정해야 할 수 있다.
	@Insert("insert into Reply (ReplyNum, UsersID, Contents, PostDate, ReplyNums, BoardNum)"
			+ "values ((select ifnull(max(BoardNum),0)+1 from Board b), #{UsersID}, #{Contents}, #{DATE}, #{ReplyNums}, #{BoardNum}")
	public int insertReply(ReplyVO vo);
	
	@Delete("delete from Reply where BoardNum = #{num}")
	public int deleteReply(int num);
	
	@Delete("delete from Board where BoardNum = #{num}")
	public int deleteBoard(int num);
	
	@Update("update Board set Title = #{Title}, Contents = #{Contents}, where BoardNum = #{BoardNum}")
	public int modifyBoard(BoardVO vo);
	
	@Insert("insert into Files (FileNum, FileName, HashValue, FileGroupNum, FileSize, flag)"
			+ "values ((select ifnull(max(FileNum),0)+1 from Files f), #{FileName}, #{HashValue}, #{FileGroupNum}, #{FileSize}, #{flag})")
	public int insertFile(FileVO vo);
	
	@Delete("delete from Files where FileGroupNum = #{num}")
	public int deleteFile(int num);
	
	@Delete("delete from Files where FileNum = #{num}")
	public int deleteFiles(int num);
	
	@Update("update Files set FileName = #{FileName}, HashValue = #{HashValue}, FileGroupNum = #{FileGroupNum}, FileSize = #{FileSize} where FileNum = #{FileNum}")
	public int modifyFile(FileVO vo);
	
	@Select("select * from Files where FileGroupNum = #{num} and flag = #{id}")
	public List<FileVO> getFiles(HashMap<String, Object> map);
}
