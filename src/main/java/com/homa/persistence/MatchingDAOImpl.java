package com.homa.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.homa.domain.MatchingVO;

@Repository
public class MatchingDAOImpl implements MatchingDAO {
	// 마이바티스
	@Inject
	private SqlSession sql;

	// 매퍼
	private static String namespace = "com.homa.mappers.matchingMapper";

	// 정보조회
	@Override
	public MatchingVO matchingRead(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".matchingRead", userId);
	}

	// 정보등록
	@Override
	public void matchingRegist(MatchingVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".matchingRegist", vo);
	}

	// 매칭정보 등록된 회원
	@Override
	public List<MatchingVO> memberList() {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".memberList");
	}

	// 매칭정보 삭제
	@Override
	public void matchingDelete(String userId) {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".matchingDelete", userId);
	}

	// 카카오톡아이디 찾기
	@Override
	public String searchKakao(String userId) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".searchKakao", userId);
	}

	// 정보수정
	@Override
	public void matchingModify(MatchingVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.selectOne(namespace + ".matchingModify", vo);
	}

}
