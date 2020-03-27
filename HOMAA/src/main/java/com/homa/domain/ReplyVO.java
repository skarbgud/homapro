package com.homa.domain;

import java.util.Date;

public class ReplyVO {
/*
	 fb_num number not null,
	 c_num number not null,
	 c_content varchar2(2000) not null,
	 userId varchar2(20) not null,
	 c_date date default sysdate,
	 primary key(fb_num, c_num)
 */
	private int fb_num;
	private int c_num;
	private String c_content;
	private String userId;
	private Date c_date;
	public int getFb_num() {
		return fb_num;
	}
	public void setFb_num(int fb_num) {
		this.fb_num = fb_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
}
