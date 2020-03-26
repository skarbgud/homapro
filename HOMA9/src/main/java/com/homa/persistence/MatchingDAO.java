package com.homa.persistence;

import com.homa.domain.MatchingVO;

public interface MatchingDAO {
	//정보조회
	public MatchingVO matchingRead(String userId) throws Exception;
}
