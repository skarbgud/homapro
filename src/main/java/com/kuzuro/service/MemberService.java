package com.kuzuro.service;

import com.kuzuro.domain.MemberVO;

public interface MemberService {
	
	//회원가입
	public void register(MemberVO vo)throws Exception;
	
	//로그인
	public MemberVO login(MemberVO vo)throws Exception;
	
	//회원정보 수정
	public void modify(MemberVO vo) throws Exception;
	
	//회원정보 탈퇴
	public void delete(MemberVO vo) throws Exception;
	
	//아이디 중복
	public MemberVO idCheck(String userId)throws Exception;
}
