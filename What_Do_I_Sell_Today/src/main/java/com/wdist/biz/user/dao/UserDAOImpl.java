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
	//도대체 이 밑에는 뭘 하고 싶었는지 모르겠음... 함수반환 데이터형이랑 이런거 어떻게 쓸지 잘 생각해서 수정하시고
	//mapper에 로그인 두개였어서 수정했습니다.
	
	@Override
	public Boolean checkId(String id) {
		String user = mapper.checkId(id);
		if (user != null) {
			return true;
		}else {
			return false;
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

	@Override
	public int updateUserPwNull(UserVO vo) {
		return mapper.updateUserPwNull(vo);
	}
	
	
	
}
