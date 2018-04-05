package com.wdist.biz.user.dao;

import javax.annotation.PostConstruct;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wdist.biz.mybatis.mapper.UserMapper;
import com.wdist.biz.user.vo.UserVO;

@Component("UserVO")
public class UserDAOImpl implements UserDAO {
	@Autowired
	SqlSession mybatis;
	UserMapper mapper;

	@PostConstruct
	public void init() {
		mapper = (UserMapper) mybatis.getMapper(UserMapper.class);
	}

	@Override
	public int insertUser(UserVO vo) {
		return mapper.insertUser(vo);
	}

	@Override
	public int deleteUser(String id) {
		return mapper.deleteUser(id);
	}

	@Override
	public int updateUser(UserVO vo) {
		return mapper.updateUser(vo);
	}

	@Override
	public Boolean checkId(UserVO vo) {
		UserVO user = mapper.login(vo);
		if (user != null) {
			return false;
		} else {
			return true;
		}

	}

}
