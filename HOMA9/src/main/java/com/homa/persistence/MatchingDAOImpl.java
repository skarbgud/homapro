package com.homa.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.homa.domain.MatchingVO;
@Repository
public class MatchingDAOImpl implements MatchingDAO {
	//마이바티스
	@Inject
	private SqlSession sql;
	
	//매퍼
	private static String namespace = "com.homa.mappers.matchingMapper";
	@Override
	public MatchingVO matchingRead(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".matchingRead", userId);
	}

}
