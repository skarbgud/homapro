package com.homa.domain;

import java.util.Date;

public class ReportVO {
/*
 create table report(
    rp_num      NUMBER    not null,
    userId  varchar2(50)   not null,
    rp_content    varchar2(300)    not null,
    rp_reportId   varchar2(50)   not null,
    rp_date    date          default sysdate,
    fb_num    number         not null,
    userName    varchar2(30)    not null,
    primary key(rp_num),
    foreign key(fb_num) references freeBoard(fb_num) on delete cascade, 
    foreign key(userName) references tbl_meber(userName) on delete cascade
);
 */
	private int rp_num;
	private String userId;
	private String rp_content;
	private String rp_reportId;
	private Date rp_date;
	private int fb_num;
	private String userName;
	public int getRp_num() {
		return rp_num;
	}
	public void setRp_num(int rp_num) {
		this.rp_num = rp_num;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRp_content() {
		return rp_content;
	}
	public void setRp_content(String rp_content) {
		this.rp_content = rp_content;
	}
	public String getRp_reportId() {
		return rp_reportId;
	}
	public void setRp_reportId(String rp_reportId) {
		this.rp_reportId = rp_reportId;
	}
	public Date getRp_date() {
		return rp_date;
	}
	public void setRp_date(Date rp_date) {
		this.rp_date = rp_date;
	}
	public int getFb_num() {
		return fb_num;
	}
	public void setFb_num(int fb_num) {
		this.fb_num = fb_num;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

}
