package com.wdist.biz.user.service;

import com.wdist.biz.user.vo.UserVO;

public interface UserService {
//	public String login(String id,String pw); 
	public int insertAccount(UserVO vo);
	public int deleteAccount(String id);
	public int modifyAccount(UserVO vo);
	public Boolean checkId(UserVO vo);
    public UserVO getUser(String uid);
    public UserVO login(String id, String pw);
}
