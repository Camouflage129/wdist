package com.wdist.biz.user.vo;

public class UserVO {
	//로그인용으로 만들었습니다. 회원가입 담당자분은 필요한거 추가해주세요 -YH-
	//18-04-05 16:53 yh 작업함.
	private String id;
	private String pw;
	
	public UserVO() {
		super();
	}
	public UserVO(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
}
