package com.homa.service;

import javax.servlet.http.HttpSession;

import com.homa.domain.MemberVO;

public interface MemberService {
	//회원가입
	public void join(MemberVO vo) throws Exception;

	//로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	//로그아웃
	public void logout(HttpSession session) throws Exception;
	
	//회원정보 수정
	public void modify(MemberVO vo)throws Exception;
		
	//회원정보 삭제
	public void remove(MemberVO vo)throws Exception;
	
	//아이디 중복
	public MemberVO idCheck(String userId) throws Exception;

	//패스워드 체크
	public MemberVO passCheck(MemberVO vo);
}
