package com.homa.persistence;

import java.util.List;

import com.homa.domain.RoomVO;
import com.homa.domain.SearchCriteria;
import com.homa.domain.SearchListCriteria;

public interface RoomDAO {
	
	//게시물 총개수
	public int listCount() throws Exception;
		
	//방 목록
	public List<RoomVO> list(SearchListCriteria scri) throws Exception;
	
	//검색 결과 갯수
	public int countSearch(SearchCriteria scri) throws Exception;

	//방 등록
	public void regist(RoomVO vo) throws Exception;
	
	//방 조회
	public RoomVO read(int r_num) throws Exception;

	//방 수정
	public void update(RoomVO vo) throws Exception;

	//방 삭제
	public void delete(int r_num) throws Exception;
	
}
