package com.homa.service;

import com.homa.domain.MatchingVO;

public interface MatchingService {
	//조회
	public MatchingVO matchingRead(String userId) throws Exception;;
	
	//등록
	public void matchingRegist(MatchingVO vo) throws Exception;
	
	//매칭
	
}
