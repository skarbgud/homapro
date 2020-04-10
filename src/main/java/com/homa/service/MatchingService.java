package com.homa.service;

import java.util.List;

import com.homa.domain.MatchingVO;

public interface MatchingService {
	// 조회
	public MatchingVO matchingRead(String userId) throws Exception;;

	// 등록
	public void matchingRegist(MatchingVO vo) throws Exception;

	// 매칭등록된 회원정보
	public List<MatchingVO> memberList();

	// 매칭정보삭제
	public void matchingDelete(String userId);

	// 카카오톡아이디 찾기
	public String searchKakao(String userId);

	// 수정
	public void matchingModify(MatchingVO vo) throws Exception;

}
