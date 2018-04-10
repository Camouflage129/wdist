package com.wdist.biz.mybatis.mapper;


import org.apache.ibatis.annotations.Select;


public interface UserMapper {
	@Select("SELECT NAME FROM USERS WHERE USERS=#{id} AND PW=#{pw}")
	public String login();
}
