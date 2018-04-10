package com.wdist.biz.user.service;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.wdist.biz.user.dao.UserDAO;
import com.wdist.biz.user.vo.UserVO;

@Service("UserService")
public class UserServiceImpl implements UserService {
	
	@Resource(name="userDAO")
	UserDAO dao;

	@Override
	public int insertAccount(UserVO vo) {
		return dao.insertUser(vo);
	}

	@Override
	public int deleteAccount(String id) {
		return dao.deleteUser(id);
	}

	@Override
	public int modifyAccount(UserVO vo) {
		return dao.updateUser(vo);
	}

	@Override
	public Boolean checkId(UserVO vo) {
		return dao.checkId(vo);
	}
	
/*	@Override
	public String login(String id, String pw) {
		return dao.login(id,pw);
	}*/

	@Override
	public UserVO getUser(String uid) {
		return dao.getUser(uid);
	}

	@Override
	public UserVO login(String id, String pw) {
		if(id.equals("") || id == null) {
			throw new RuntimeException("로그인 정보가 필요합니다.");
		}
		return dao.login(id, pw);
	}

	
	
	
	
}
