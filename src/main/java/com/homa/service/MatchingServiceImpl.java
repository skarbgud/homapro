package com.homa.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.homa.domain.MatchingVO;
import com.homa.persistence.MatchingDAO;

@Service
public class MatchingServiceImpl implements MatchingService {
	@Inject
	private MatchingDAO dao;

	// 조회
	@Override
	public MatchingVO matchingRead(String userId) throws Exception {
		// TODO Auto-generated method stub
		return dao.matchingRead(userId);
	}

	// 등록
	@Override
	public void matchingRegist(MatchingVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.matchingRegist(vo);
		;
	}

	// 매칭등록된 회원정보
	@Override
	public List<MatchingVO> memberList() {
		// TODO Auto-generated method stub
		return dao.memberList();
	}

	// 매칭정보삭제
	@Override
	public void matchingDelete(String userId) {
		// TODO Auto-generated method stub
		dao.matchingDelete(userId);
	}

	// 카카오톡 아이디찾기
	@Override
	public String searchKakao(String userId) {
		// TODO Auto-generated method stub
		return dao.searchKakao(userId);
	}

	// 수정
	@Override
	public void matchingModify(MatchingVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.matchingModify(vo);
	}
}
