package com.homa.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.homa.domain.MemberVO;
import com.homa.domain.ReportVO;
import com.homa.domain.SearchCriteria;

import com.homa.persistence.ReportDAO;
@Repository
public class ReportServiceImpl implements ReportService {

	@Inject
	private ReportDAO dao;


	// 게시물 총 갯수
	@Override
	public int listCount() throws Exception {
		return dao.listCount();
	}

	// 검색 결과 갯수
	@Override
	public int countSearch(SearchCriteria scri) throws Exception {
		return dao.countSearch(scri);
	}

	//리스트
	@Override
	public List<ReportVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(scri);
	}
	
	//삭제
	@Override
	public void delete(int rp_num) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(rp_num);
	}
	//작성
	@Override
	public void regist(ReportVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.regist(vo);
	}
	
	//수정
	@Override
	public void update(ReportVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}
	

	 // 조회
	   @Override
	   public ReportVO read(int rp_num) throws Exception {
	      dao.updateViewCnt(rp_num);	      
	      return dao.read(rp_num);
	   }
	}
