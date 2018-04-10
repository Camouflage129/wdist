package com.wdist.biz.user.dao;

import com.wdist.biz.user.vo.UserVO;

public interface UserDAO {
	public String login(String id, String pw);
	public int insertUser(UserVO vo);
	public int deleteUser(String id);
	public int updateUser(UserVO vo);
	public Boolean checkId(UserVO vo);
}
