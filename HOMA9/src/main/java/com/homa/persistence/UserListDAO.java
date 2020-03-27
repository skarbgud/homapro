package com.homa.persistence;

import java.util.List;

import com.homa.domain.MemberVO;

public interface UserListDAO {
	//유저목록
	public List<MemberVO> userList() throws Exception;
	
	//유저삭제
	public void userDelete(String userId) throws Exception;
}
