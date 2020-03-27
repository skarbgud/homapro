package com.homa.domain;

import java.util.Date;

public class FreeBoardVO {
/*
 fb_num number not null,
    fb_subject varchar2(30) not null,
    fb_content varchar2(3000) not null,
    userId varchar2(50) not null,
    fb_date Date default sysdate,
    fb_readCount number default 0,
 */
	private int fb_num;
	private String fb_subject;
	private String fb_content;
	private String userId;
	private Date fb_date;
	private int fb_readCount;
	public int getFb_num() {
		return fb_num;
	}
	public void setFb_num(int fb_num) {
		this.fb_num = fb_num;
	}
	public String getFb_subject() {
		return fb_subject;
	}
	public void setFb_subject(String fb_subject) {
		this.fb_subject = fb_subject;
	}
	public String getFb_content() {
		return fb_content;
	}
	public void setFb_content(String fb_content) {
		this.fb_content = fb_content;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getFb_date() {
		return fb_date;
	}
	public void setFb_date(Date fb_date) {
		this.fb_date = fb_date;
	}
	public int getFb_readCount() {
		return fb_readCount;
	}
	public void setFb_readCount(int fb_readCount) {
		this.fb_readCount = fb_readCount;
	}
	
}
