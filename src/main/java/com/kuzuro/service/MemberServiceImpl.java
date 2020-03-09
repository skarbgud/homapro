package com.kuzuro.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kuzuro.domain.MemberVO;
import com.kuzuro.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	 
	//회원가입
	@Override
	public void register(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.register(vo);
	}
	
	//로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}
	
	//회원정보 수정
	@Override
	public void modify(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify(vo);
	}
	
	//회원정보 탈퇴
	@Override
	public void delete(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(vo);
	}
	
	@Override
	public MemberVO idCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		return dao.idCheck(userId);
	}
}
