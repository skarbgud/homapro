package com.homa.persistence;

import java.util.List;

import com.homa.domain.Criteria;
import com.homa.domain.FreeBoardVO;
import com.homa.domain.SearchCriteria;

public interface FreeBoardDAO {
	// 작성
	public void write(FreeBoardVO vo) throws Exception;

	// 조회
	public FreeBoardVO read(int fb_num) throws Exception;

	// 수정
	public void update(FreeBoardVO vo) throws Exception;

	// 삭제
	public void delete(int fb_num) throws Exception;

	// 목록
	public List<FreeBoardVO> list() throws Exception;

	// 목록+페이징
	public List<FreeBoardVO> listPage(Criteria cri) throws Exception;

	// 게시물 총 갯수
	public int listCount() throws Exception;

	// 목록 + 페이징 + 검색
	public List<FreeBoardVO> listSearch(SearchCriteria scri) throws Exception;

	// 검색 결과 갯수
	public int countSearch(SearchCriteria scri) throws Exception;

	
}
