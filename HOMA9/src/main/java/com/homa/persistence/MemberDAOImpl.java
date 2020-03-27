package com.homa.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.homa.domain.MemberVO;
@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sql;
	
	//매퍼 
	private static String namespace = "com.homa.mappers.memberMapper";
	
	//회원가입
	@Override
	public void join(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
			sql.insert(namespace+".join",vo);
	}

	//로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".login",vo);
	}
	
	//회원정보 수정
	@Override
	public void modify(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		 sql.update(namespace+".modify",vo);
	}
	
	//회원정보 삭제
	@Override
	public void remove(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace+".remove",vo);
		
	}
		
	//아이디 확인
	@Override
	public MemberVO idCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".idCheck",userId);
	}

	
	//패스워드체크(마이페이지)
	@Override
	public MemberVO passCheck(MemberVO vo) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".passCheck",vo);
	}
	
	
}
