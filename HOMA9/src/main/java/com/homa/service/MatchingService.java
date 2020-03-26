package com.homa.service;

import com.homa.domain.MatchingVO;

public interface MatchingService {
	//조회
	public MatchingVO matchingRead(String userId) throws Exception;;
}
