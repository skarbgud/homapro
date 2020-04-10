package com.homa.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.homa.domain.BlackListVO;
import com.homa.domain.MemberVO;
import com.homa.domain.ReportVO;

@Repository
public class UserListDAOImpl implements UserListDAO {

	// 마이바티스
	@Inject
	private SqlSession sql;

	// 매퍼
	private static String namespace = "com.homa.mappers.userListMapper";

	// 유저리스트
	@Override
	public List<MemberVO> userList() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".userList");
	}

	// 유저삭제
	@Override
	public void userDelete(String userId) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".userDelete", userId);
	}

	// 신고 목록
	@Override
	public List<ReportVO> reportList() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}

	// 신고 삭제
	@Override
	public void reportDelete(String userId) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".reportDelete", userId);
	}

	// 블랙리스트 등록
	@Override
	public void blackRegist(BlackListVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".blackRegist", vo);
	}

	// 블랙리스트
	@Override
	public List<BlackListVO> blackList() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".blackList");
	}

	// 블랙리스트 삭제
	@Override
	public void blackDelete(String userId) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".blackDelete", userId);
	}
}
