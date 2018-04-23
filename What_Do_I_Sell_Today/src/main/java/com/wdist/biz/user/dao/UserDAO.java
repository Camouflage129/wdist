package com.wdist.biz.user.dao;

import com.wdist.biz.user.vo.UserVO;

public interface UserDAO {
	public int insertUser(UserVO vo);
	public int deleteUser(String id);
	public int updateUser(UserVO vo);
	public int updateUserPwNull(UserVO vo);
	public Boolean checkId(String id);
    public UserVO getUser(String uid);
    public UserVO login(String id, String pw);
    public int modifyNewPwd(UserVO vo);
}
