package com.wdist.biz.user.vo;

public class UserVO {

	private String usersid;
	private String pw;
	private String name;
	private String email;
	private String pwdhint;
	private String pwdans;

	public UserVO() {
	}

	public UserVO(String id, String pw) {
		this.usersid = id;
		this.pw = pw;
	}

	public UserVO(String id, String pw, String name, String email) {
		this.usersid = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
	}
	
	

	public UserVO(String usersid, String pw, String name, String email, String pwdhint, String pwdans) {
		super();
		this.usersid = usersid;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.pwdhint = pwdhint;
		this.pwdans = pwdans;
	}

	public String getId() {
		return usersid;
	}

	public void setId(String id) {
		this.usersid = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwdhint() {
		return pwdhint;
	}

	public void setPwdhint(String pwdhint) {
		this.pwdhint = pwdhint;
	}

	public String getPwdans() {
		return pwdans;
	}

	public void setPwdans(String pwdans) {
		this.pwdans = pwdans;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((usersid == null) ? 0 : usersid.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((pw == null) ? 0 : pw.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserVO other = (UserVO) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (usersid == null) {
			if (other.usersid != null)
				return false;
		} else if (!usersid.equals(other.usersid))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (pw == null) {
			if (other.pw != null)
				return false;
		} else if (!pw.equals(other.pw))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + usersid + ", pw=" + pw + ", name=" + name + ", email=" + email + "]";
	}

}
