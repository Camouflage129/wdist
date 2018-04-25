package com.wdist.biz.mybatis.mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import com.wdist.biz.user.vo.UserVO;

public interface UserMapper {
	@Select("SELECT * FROM USERS WHERE usersid=#{id} AND PW=#{pw}")
	public UserVO login(UserVO vo);
	
	@Select("SELECT USERSID, NAME, EMAIL, PWDHINT, PWDANS FROM USERS WHERE usersid = #{id} and email = #{email} and pwdhint = #{pwdhint} and pwdans=#{pwdans} and name = #{name}")
	public UserVO pwSearchUser(UserVO vo);
	
	@Select("SELECT NAME FROM USERS WHERE usersid=#{id}")
	public String checkId(String id);

	@Insert("insert into users (usersid, pw, name, email, pwdhint, pwdans) values(#{usersid}, #{pw}, #{name}, #{email}, #{pwdhint}, #{pwdans})")
	public int insertUser(UserVO vo);

	@Delete("delete from users where usersid = #{id}")
	public int deleteUser(String id);

	@Update("update users set pw = #{pw}, name = #{name}, email = #{email}, pwdhint = #{pwdhint}, pwdans = #{pwdans} where usersid = #{id}")
	public int updateUser(UserVO vo);

	@Update("update users set name = #{name}, email = #{email} where usersid = #{id}")
	public int updateUserPwNull(UserVO vo);

	@Select("SELECT USERSID, NAME, EMAIL, PWDHINT, PWDANS FROM USERS WHERE usersid = #{id}")
	public UserVO getuser(String uid);
	
	@Update("update users set pw=#{pw} where usersid = #{id}")
	public int modifyNewPwd(UserVO vo);
	
	@Select("select usersid from users where name=#{name} and email=#{email}")
	public UserVO searchId(UserVO vo);
}
