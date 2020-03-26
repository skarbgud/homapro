package com.homa.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.homa.domain.Criteria;
import com.homa.domain.FreeBoardVO;
import com.homa.domain.SearchCriteria;
import com.homa.persistence.FreeBoardDAO;

@Repository
public class FreeBoardServiceImpl implements FreeBoardService {

	@Inject
	private FreeBoardDAO dao;

	// 작성
	@Override
	public void write(FreeBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	// 조회
	@Override
	public FreeBoardVO read(int fb_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(fb_num);
	}

	// 수정
	@Override
	public void update(FreeBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	// 삭제
	@Override
	public void delete(int fb_num) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(fb_num);
	}

	// 목록
	@Override
	public List<FreeBoardVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

	// 목록 + 페이징
	@Override
	public List<FreeBoardVO> listPage(Criteria cri) throws Exception {
		return dao.listPage(cri);
	}

	// 게시물 총 갯수
	@Override
	public int listCount() throws Exception {
		return dao.listCount();
	}

	// 목록 + 페이징 + 검색
	@Override
	public List<FreeBoardVO> listSearch(SearchCriteria scri) throws Exception {
		return dao.listSearch(scri);
	}

	// 검색 결과 갯수
	@Override
	public int countSearch(SearchCriteria scri) throws Exception {
		return dao.countSearch(scri);
	}

}
