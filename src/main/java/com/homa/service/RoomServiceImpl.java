package com.homa.service;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.homa.domain.RoomVO;
import com.homa.domain.SearchCriteria;
import com.homa.domain.SearchListCriteria;
import com.homa.persistence.RoomDAO;

@Repository
public class RoomServiceImpl implements RoomService{

	@Inject 
	private RoomDAO dao;
	
	//게시물 총개수
	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount();
	}
	
	//방목록
	@Override
	public List<RoomVO> list(SearchListCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(scri);
	}

	//검색 결과 갯수
	public int countSearch(SearchCriteria scri) throws Exception{
		return dao.countSearch(scri);
	}

	//방등록
	@Override
	public void regist(RoomVO vo) throws Exception{
		// TODO Auto-generated method stub
		dao.regist(vo);
	}
	
	//방 조회
	@Override
	public RoomVO read(int r_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(r_num);
	}
		
	//방 수정
	@Override
	public void update(RoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}
		
	//방 삭제
	@Override
	public void delete(int r_num) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(r_num);
	}
	

}
