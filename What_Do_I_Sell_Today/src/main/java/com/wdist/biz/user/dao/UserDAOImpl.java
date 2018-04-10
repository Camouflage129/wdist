package com.wdist.biz.user.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.wdist.biz.mybatis.mapper.UserMapper;

@Component
public class UserDAOImpl implements UserDAO {
	@Resource(name = "sqlSessionTemplateWindow")
	SqlSession mybatis;
	UserMapper mapper;

	@Override
	public String login(String id, String pw) {
		return mapper.login();
	}

}
