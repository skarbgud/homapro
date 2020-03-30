package com.homa.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.homa.domain.MatchingVO;
import com.homa.persistence.MatchingDAO;
@Service
public class MatchingServiceImpl implements MatchingService {
	@Inject
	private MatchingDAO dao;
	//조회
	@Override
	public MatchingVO matchingRead(String userId) throws Exception {
		// TODO Auto-generated method stub
		return dao.matchingRead(userId);
	}
	
	//등록
	@Override
	public void matchingRegist(MatchingVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.matchingRegist(vo);;
	}

}
