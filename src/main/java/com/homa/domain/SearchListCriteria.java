package com.homa.domain;

public class SearchListCriteria extends ListCriteria {

	private String searchType = "";
	private String keyword = "";

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return super.toString() + " SearchListCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
}