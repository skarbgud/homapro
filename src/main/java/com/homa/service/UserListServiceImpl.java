package com.homa.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.homa.domain.BlackListVO;
import com.homa.domain.MemberVO;
import com.homa.domain.ReportVO;
import com.homa.persistence.UserListDAO;

@Repository
public class UserListServiceImpl implements UserListService {

	@Inject
	private UserListDAO dao;

	// 유저리스트
	@Override
	public List<MemberVO> userList() throws Exception {
		// TODO Auto-generated method stub
		return dao.userList();
	}

	// 유저삭제
	@Override
	public void userDelete(String userId) throws Exception {
		// TODO Auto-generated method stub
		dao.userDelete(userId);
	}

	// 신고 목록
	@Override
	public List<ReportVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.reportList();
	}

	// 신고 삭제
	@Override
	public void reportDelete(String userId) throws Exception {
		// TODO Auto-generated method stub
		dao.reportDelete(userId);
	}

	// 블랙리스트 등록
	@Override
	public void blackRegist(BlackListVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.blackRegist(vo);
	}

	// 블랙리스트
	@Override
	public List<BlackListVO> blacklist() throws Exception {
		// TODO Auto-generated method stub
		return dao.blackList();
	}

	// 블랙리스트 삭제
	@Override
	public void blackDelete(String userId) throws Exception {
		// TODO Auto-generated method stub
		dao.blackDelete(userId);
	}
}
