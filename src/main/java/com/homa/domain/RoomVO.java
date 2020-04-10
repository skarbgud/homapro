package com.homa.domain;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;
/*
 create table room(
r_num NUMBER   NOT NULL,
r_date   Date   default sysdate,
r_count   NUMBER   default 0,
r_kind   VARCHAR2(50)   NOT NULL,
r_address1   VARCHAR2(100)   NOT NULL,
r_address2   VARCHAR2(100)   NOT NULL,
r_price   NUMBER    NOT NULL,
r_species   VARCHAR2(100)   NOT NULL,
r_enter   VARCHAR2(50)   NOT NULL,
r_live   VARCHAR2(50)   NOT NULL,
r_gender   VARCHAR2(12)   NOT NULL,
r_available   VARCHAR2(12)   NOT NULL,
r_img   VARCHAR2(50)   NOT NULL,
r_content   VARCHAR2(1000) NOT NULL,
r_kakao   VARCHAR2(30) NOT NULL,
r_area   NUMBER   NOT NULL,   
r_option VARCHAR2(100)   NULL,
userId   VARCHAR2(50)   NOT NULL,
primary key(r_num),
foreign key(userId) references tbl_member(userId) on delete cascade
);

 */

public class RoomVO {
	private int r_num;
	private Date r_date;
	private int r_count;
	private String r_kind;
	private String r_address1;
	private String r_address2;
	private int r_price;
	private String r_species;
	private String r_enter;
	private String r_live;
	private String r_gender;
	private String r_available;
	private String r_img;
	private String r_content;
	private String r_kakao;
	private String r_area;
	private String r_option;
	private String userId;
	private String r_thumbimg;
	
	public String getR_thumbimg() {
		return r_thumbimg;
	}
	public void setR_thumbimg(String r_thumbimg) {
		this.r_thumbimg = r_thumbimg;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public int getR_count() {
		return r_count;
	}
	public void setR_count(int r_count) {
		this.r_count = r_count;
	}
	public String getR_kind() {
		return r_kind;
	}
	public void setR_kind(String r_kind) {
		this.r_kind = r_kind;
	}
	public String getR_address1() {
		return r_address1;
	}
	public void setR_address1(String r_address1) {
		this.r_address1 = r_address1;
	}
	public String getR_address2() {
		return r_address2;
	}
	public void setR_address2(String r_address2) {
		this.r_address2 = r_address2;
	}
	
	public int getR_price() {
		return r_price;
	}
	public void setR_price(int r_price) {
		this.r_price = r_price;
	}
	public String getR_species() {
		return r_species;
	}
	public void setR_species(String r_species) {
		this.r_species = r_species;
	}
	public String getR_enter() {
		return r_enter;
	}
	public void setR_enter(String r_enter) {
		this.r_enter = r_enter;
	}
	public String getR_live() {
		return r_live;
	}
	public void setR_live(String r_live) {
		this.r_live = r_live;
	}
	public String getR_gender() {
		return r_gender;
	}
	public void setR_gender(String r_gender) {
		this.r_gender = r_gender;
	}
	public String getR_available() {
		return r_available;
	}
	public void setR_available(String r_available) {
		this.r_available = r_available;
	}
	public String getR_img() {
		return r_img;
	}
	public void setR_img(String r_img) {
		this.r_img = r_img;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_kakao() {
		return r_kakao;
	}
	public void setR_kakao(String r_kakao) {
		this.r_kakao = r_kakao;
	}
	public String getR_area() {
		return r_area;
	}
	public void setR_area(String r_area) {
		this.r_area = r_area;
	}
	public String getR_option() {
		return r_option;
	}
	public void setR_option(String r_option) {
		this.r_option = r_option;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
