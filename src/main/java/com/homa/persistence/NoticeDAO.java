package com.homa.persistence;

import java.util.List;

import com.homa.domain.Criteria;
import com.homa.domain.NoticeVO;
import com.homa.domain.SearchCriteria;

public interface NoticeDAO {
	// 작성
	public void write(NoticeVO vo) throws Exception;

	// 조회
	public NoticeVO read(int no_num) throws Exception;

	// 수정
	public void update(NoticeVO vo) throws Exception;

	// 삭제
	public void delete(int no_num) throws Exception;

	// 목록
	public List<NoticeVO> list() throws Exception;

	// 목록+페이징
	public List<NoticeVO> listPage(Criteria cri) throws Exception;

	// 게시물 총 갯수
	public int listCount() throws Exception;

	// 목록 + 페이징 + 검색
	public List<NoticeVO> listSearch(SearchCriteria scri) throws Exception;

	// 검색 결과 갯수
	public int countSearch(SearchCriteria scri) throws Exception;

	//조회수
	public void readCountUpdate(int no_num) throws Exception;
}
