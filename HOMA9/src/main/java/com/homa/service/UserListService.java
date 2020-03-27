package com.homa.service;

import java.util.List;

import com.homa.domain.MemberVO;

public interface UserListService {
	//유저목록 출력
	public List<MemberVO> userList() throws Exception;
	
	//유저삭제
	public void userDelete(String userId) throws Exception;
	
}
