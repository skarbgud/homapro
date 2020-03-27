package com.homa.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.homa.domain.MemberVO;
@Repository
public class UserListDAOImpl implements UserListDAO {

	//마이바티스
	@Inject
	private SqlSession sql;
	
	//매퍼
	private static String namespace = "com.homa.mappers.userListMapper";
	
	//유저리스트
	@Override
	public List<MemberVO> userList() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".userList");
	}

	//유저삭제
	@Override
	public void userDelete(String userId) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace+".userDelete",userId);
	}

}
