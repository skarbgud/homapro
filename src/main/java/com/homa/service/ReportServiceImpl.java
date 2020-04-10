package com.homa.service;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.homa.domain.ReportVO;
import com.homa.persistence.ReportDAO;
@Repository
public class ReportServiceImpl implements ReportService {

	@Inject
	private ReportDAO dao;
	
	//작성
	@Override
	public void regist(ReportVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.regist(vo);
	}
}
