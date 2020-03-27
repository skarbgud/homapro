package com.homa.domain;

import java.util.Date;

public class ReportVO {
	 private int rp_num;
	  	private String rp_subject;
	  	private String rp_content;
	  	private Date rp_date;
	  	private int rp_readCount;
	  	private String rp_reportArticle;
	  	private String userId;
	  	private String rp_passwd;
	  	private String rp_reportId;
	  	
	  	
		public int getRp_num() {
			return rp_num;
		}
		public void setRp_num(int rp_num) {
			this.rp_num = rp_num;
		}
		public String getRp_subject() {
			return rp_subject;
		}
		public void setRp_subject(String rp_subject) {
			this.rp_subject = rp_subject;
		}
		public String getRp_content() {
			return rp_content;
		}
		public void setRp_content(String rp_content) {
			this.rp_content = rp_content;
		}
		public Date getRp_date() {
			return rp_date;
		}
		public void setRp_date(Date rp_date) {
			this.rp_date = rp_date;
		}
		public int getRp_readCount() {
			return rp_readCount;
		}
		public void setRp_readCount(int rp_readCount) {
			this.rp_readCount = rp_readCount;
		}
		public String getRp_reportArticle() {
			return rp_reportArticle;
		}
		public void setRp_reportArticle(String rp_reportArticle) {
			this.rp_reportArticle = rp_reportArticle;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getRp_passwd() {
			return rp_passwd;
		}
		public void setRp_passwd(String rp_passwd) {
			this.rp_passwd = rp_passwd;
		}
		public String getRp_reportId() {
			return rp_reportId;
		}
		public void setRp_reportId(String rp_reportId) {
			this.rp_reportId = rp_reportId;
		}
}
