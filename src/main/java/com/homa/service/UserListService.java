package com.homa.service;

import java.util.List;

import com.homa.domain.BlackListVO;
import com.homa.domain.MemberVO;
import com.homa.domain.ReportVO;

public interface UserListService {
	// 유저목록 출력
	public List<MemberVO> userList() throws Exception;

	// 유저삭제
	public void userDelete(String userId) throws Exception;

	// 신고 목록
	public List<ReportVO> list() throws Exception;

	// 신고 삭제
	public void reportDelete(String userId) throws Exception;

	// 블랙리스트 등록
	public void blackRegist(BlackListVO vo) throws Exception;

	// 블랙리스트 조회
	public List<BlackListVO> blacklist() throws Exception;

	// 블랙리스트 삭제
	public void blackDelete(String userId) throws Exception;
}
