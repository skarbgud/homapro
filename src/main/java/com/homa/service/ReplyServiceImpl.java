package com.homa.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.homa.domain.ReplyVO;
import com.homa.persistence.FreeBoardDAO;
import com.homa.persistence.ReplyDAO;
@Repository
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;
	@Inject
	private FreeBoardDAO freeboardDAO;
	
	//댓글 등록
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		dao.registReply(reply);
		freeboardDAO.updateCommentCnt(reply.getFb_num(), 1);	//댓글 개수 증가
	}

	//댓글리스트
	@Override
	public List<ReplyVO> replyList(int fb_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.replyList(fb_num);
	}
	
	//댓글 삭제
	@Override
	public void deleteReply(ReplyVO replyVO) throws Exception {
		// TODO Auto-generated method stub
		int fb_num = dao.getFb_num(replyVO.getC_num());
		dao.deleteReply(replyVO);
		freeboardDAO.updateCommentCnt(fb_num, -1);	//댓글 개수 감소
	}

	//아이디조회
	@Override
	public String idCheck(int c_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.idCheck(c_num);
	}

	//댓글 수정
	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		dao.modifyReply(reply);
	}
	
	
	

}
