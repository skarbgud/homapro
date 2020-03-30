package com.homa.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.homa.domain.MemberVO;
import com.homa.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;

	// 회원가입
	@Override
	public void join(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.join(vo);
	}

	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}

	// 로그아웃
	@Override
	public void logout(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		session.invalidate();
	}

	// 회원정보 수정
	@Override
	public void modify(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify(vo);
	}

	// 회원정보 삭제
	@Override
	public void remove(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.remove(vo);
	}

	// 아이디 중복
	@Override
	public MemberVO idCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		return dao.idCheck(userId);
	}

	// 패스워드체크(마이페이지)
	@Override
	public MemberVO passCheck(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.passCheck(vo);
	}

	// 아이디 찾기
	@Override
	public MemberVO idFind(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.idFind(vo);
	}

	// 비밀번호 찾기
	@Override
	public MemberVO passwordFind(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.passwordFind(vo);
	}

	// 비밀번호 변경
	@Override
	public void passwordModify(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.passwordModify(vo);
	}
}
