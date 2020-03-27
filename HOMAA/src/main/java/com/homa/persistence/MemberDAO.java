package com.homa.persistence;

import java.util.List;

import com.homa.domain.MemberVO;

public interface MemberDAO {
	//회원가입
	public void join(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	//회원정보 수정
	public void modify(MemberVO vo)throws Exception;
	
	//회원정보 삭제
	public void remove(MemberVO vo)throws Exception;
	
	//아이디 중복
	public MemberVO idCheck(String userId) throws Exception;
	
	//아이디 찾기
	public MemberVO idFind(MemberVO vo) throws Exception;
	
	//비밀번호 찾기
	public MemberVO passwordFind(MemberVO vo) throws Exception;
	
	//비밀번호 변경
	public void passwordModify(MemberVO vo) throws Exception;
}
