package com.wdist.biz.mybatis.mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import com.wdist.biz.user.vo.UserVO;

public interface UserMapper {
	@Select("SELECT * FROM USERS WHERE usersid=#{id} AND PW=#{pw}")
	public UserVO login(UserVO vo);

	@Select("SELECT NAME FROM USERS WHERE usersid=#{id}")
	public String checkId(String id);

	@Insert("insert into users (usersid, pw, name, email, pwdhint) values(#{usersid}, #{pw}, #{name}, #{email}, #{pwdhint})")
	public int insertUser(UserVO vo);

	@Delete("delete from users where usersid = #{id}")
	public int deleteUser(String id);

	@Update("update users set pw = #{pw}, name = #{name}, email = #{email} where usersid = #{id}")
	public int updateUser(UserVO vo);

	@Update("update users set name = #{name}, email = #{email} where usersid = #{id}")
	public int updateUserPwNull(UserVO vo);

	@Select("SELECT USERSID, NAME, EMAIL FROM USERS WHERE = #{id}")
	public UserVO getuser(String uid);
	
	@Update("update users set pw=#{pw} where usersid = #{id}")
	public int modifyNewPwd(UserVO vo);
}
