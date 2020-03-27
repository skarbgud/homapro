package com.homa.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.homa.domain.MemberVO;
import com.homa.persistence.UserListDAO;
@Repository
public class UserListServiceImpl implements UserListService {
	
	@Inject
	private UserListDAO dao;
	
	//유저리스트
	@Override
	public List<MemberVO> userList() throws Exception {
		// TODO Auto-generated method stub
		return dao.userList();
	}

	//유저삭제
	@Override
	public void userDelete(String userId) throws Exception {
		// TODO Auto-generated method stub
		dao.userDelete(userId);
	}

}
