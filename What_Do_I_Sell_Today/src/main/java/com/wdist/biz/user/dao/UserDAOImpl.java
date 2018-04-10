package com.wdist.biz.user.dao;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.wdist.biz.mybatis.mapper.UserMapper;


	
import com.wdist.biz.user.vo.UserVO;

@Component("userDAO")
public class UserDAOImpl implements UserDAO {
	@Resource(name="sqlSessionTemplateWindow")
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
	//����ü �� �ؿ��� �� �ϰ� �;����� �𸣰���... �Լ���ȯ ���������̶� �̷��� ��� ���� �� �����ؼ� �����Ͻð�
	//mapper�� �α��� �ΰ���� �����߽��ϴ�.
	@Override
	public Boolean checkId(UserVO vo) {
		UserVO user = mapper.checkId(vo.getId(), vo.getPw());
		if (user != null) {
			return false;
		} else {
			return true;
		}

	}
/*	
	@Override
	public String login(String id, String pw) {
		return mapper.login(id);
	}*/

	@Override
	public UserVO getUser(String uid) {
		return mapper.getuser(uid);
	}

	@Override
	public UserVO login(String id, String pw) {
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPw(pw);
		return mapper.login(vo);
	}
	
	
	
}
