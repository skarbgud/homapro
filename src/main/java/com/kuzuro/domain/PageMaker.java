package com.kuzuro.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private int totalCount;// 게시물의 총 갯수
	private int startPage;// 현재 페이지의 시작번호(1,11,21등등)
	private int endPage;// 현재 페이지의 끝 번호(10,20,30 등
	private boolean prev;// 이전 페이지로 이동하는 링크의 존재 여부
	private boolean next;// 다음 페이지로 이동하는 링크의 존재 여부

	private int displayPageNum = 10;

	private Criteria cri;

	public Criteria getCri() {
		return cri;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcDate();
	}

	private void calcDate() {
		// TODO Auto-generated method stub
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;

		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		} else {
			prev = startPage == 1 ? false : true;
			next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
		}
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
	public String makeQuery(int page)
	{
	 UriComponents uriComponents =
	   UriComponentsBuilder.newInstance()
	   .queryParam("page", page)
	   .queryParam("perPageNum", cri.getPerPageNum())
	   .build();
	   
	 return uriComponents.toUriString();
	}

	public String makeSearch(int page)
	{
		 UriComponents uriComponents = UriComponentsBuilder.newInstance()
										.queryParam("page", page)
										.queryParam("perPageNum", cri.getPerPageNum())
										.queryParam("searchType", ((SearchCriteria)cri).getSearchType())
										.queryParam("keyword", encoding(((SearchCriteria)cri).getKeyword()))
										.build(); 
		 return uriComponents.toUriString();  
	}

	private String encoding(String keyword) {
		 if(keyword == null || keyword.trim().length() == 0)
		 { return ""; }
		 
		 try {
		  return URLEncoder.encode(keyword, "UTF-8");
		 } catch(UnsupportedEncodingException e)
		 { return ""; }
	}
}
