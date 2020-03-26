package com.homa.domain;

import java.util.Date;

public class NoticeVO {
/*
 no_num number not null,
    no_subject varchar2(30) not null,
    no_date DATE default sysdate,
    no_readCount number default 0,
    no_content varchar2(3000) not null,
    userId varchar2(50) not null,
    primary key(no_num),
    foreign key(userId) references tbl_member(userId) on delete cascade
 */
	private int no_num;
	private String no_subject;
	private Date no_date;
	private int no_readCount;
	private String no_content;
	private String userId;
	public int getNo_num() {
		return no_num;
	}
	public void setNo_num(int no_num) {
		this.no_num = no_num;
	}
	public String getNo_subject() {
		return no_subject;
	}
	public void setNo_subject(String no_subject) {
		this.no_subject = no_subject;
	}
	public Date getNo_date() {
		return no_date;
	}
	public void setNo_date(Date no_date) {
		this.no_date = no_date;
	}
	public int getNo_readCount() {
		return no_readCount;
	}
	public void setNo_readCount(int no_readCount) {
		this.no_readCount = no_readCount;
	}
	public String getNo_content() {
		return no_content;
	}
	public void setNo_content(String no_content) {
		this.no_content = no_content;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
