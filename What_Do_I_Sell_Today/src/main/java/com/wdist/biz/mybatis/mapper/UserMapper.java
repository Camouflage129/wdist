package com.wdist.biz.mybatis.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.wdist.biz.user.vo.UserVO;

public interface UserMapper {
	@Insert("insert into users (id, pw, name, email) values(#{id}, #{pw}, #{name}, #{email})")
	public int insertUser(UserVO vo);

	@Delete("delete from users where id = #{id}")
	public int deleteUser(String id);

	@Update("update users set pw = #{pw}, name = #{name}, email = #{email} where id = #{id}")
	public int updateUser(UserVO vo);

	@Select("select * from users where id = #{id}")
	public UserVO login(UserVO vo);


}
