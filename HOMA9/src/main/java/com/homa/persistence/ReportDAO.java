package com.homa.persistence;

import java.util.List;

import com.homa.domain.ReportVO;
import com.homa.domain.SearchCriteria;

public interface ReportDAO {
	// 목록 + 페이징 + 검색
	public List<ReportVO> list(SearchCriteria scri) throws Exception;

	// 게시물 총 갯수
	public int listCount() throws Exception;

	// 검색 결과 갯수
	public int countSearch(SearchCriteria scri) throws Exception;

	//글조회
	public ReportVO read(int rp_num);

	//글삭제
	public void delete(int rp_num);

	//글작성
	public void regist(ReportVO vo);

	//글수정
	public void update(ReportVO vo);

	
	//조회수 증가 
	   void updateViewCnt(int fb_num) throws Exception;
	
	
}
