package com.homa.service;

import java.util.List;

import com.homa.domain.MemberVO;
import com.homa.domain.ReportVO;
import com.homa.domain.SearchCriteria;

public interface ReportService {
	// 게시물 총 갯수
	public int listCount() throws Exception;

	// 목록 + 페이징 + 검색
	public List<ReportVO> list(SearchCriteria scri) throws Exception;

	// 검색 결과 갯수
	public int countSearch(SearchCriteria scri) throws Exception;

	//글읽기
	public ReportVO read(int rp_num) throws Exception;
	
	// 삭제
	public void delete(int rp_num) throws Exception;

	//작성
	public void regist(ReportVO vo) throws Exception;

	//수정
	public void update(ReportVO vo) throws Exception;

	
	

}
