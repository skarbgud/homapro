package com.homa.persistence;

import java.util.List;

import com.homa.domain.MatchingVO;

public interface MatchingDAO {

	// 정보조회
	public MatchingVO matchingRead(String userId) throws Exception;

	// 정보등록
	public void matchingRegist(MatchingVO vo) throws Exception;

	// 매칭정보 등록된 회원
	public List<MatchingVO> memberList();

	// 매칭정보 삭제
	public void matchingDelete(String userId);

	// 카카오톡아이디 찾기
	public String searchKakao(String userId);

	// 정보수정
	public void matchingModify(MatchingVO vo) throws Exception;
}
