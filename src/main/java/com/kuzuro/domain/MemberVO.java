package com.kuzuro.domain;

import java.sql.Date;

public class MemberVO {
	private String userId;
	private String userPass;
	private String userName;
	private Date regDate;
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
