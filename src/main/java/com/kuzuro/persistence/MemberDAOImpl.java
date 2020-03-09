package com.kuzuro.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.kuzuro.domain.MemberVO;

@Service
public class MemberDAOImpl implements MemberDAO {

	//마이바티스
	@Inject
	private SqlSession sql;
	
	//매퍼
	private static String namespace = "com.kuzuro.mappers.memberMapper";
	
	//회원가입
	@Override
	public void register(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace+".register",vo);
	}
	
	//로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		//return sql.selectOne(namespace+".login",vo);
		return sql.selectOne(namespace+".loginBcrypt",vo);
	}
	
	//회원정보 수정
	@Override
	public void modify(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace+".modify", vo);
	}
	
	//회원정보 삭제
	@Override
	public void delete(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace+".delete",vo);
	}
	
	//아이디 중복
	@Override
	public MemberVO idCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".idCheck",userId);
	}
}
