package com.wdist.biz.user.service;

import com.wdist.biz.user.vo.UserVO;

public interface UserService {
	public int insertAccount(UserVO vo);
	public int deleteAccount(String id);
	public int modifyAccount(UserVO vo);
	public Boolean checkId(UserVO vo);

}
