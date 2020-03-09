package com.kuzuro.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.kuzuro.domain.ReplyVO;
import com.kuzuro.persistence.ReplyDAO;

@Repository
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO dao;
	
	//댓글 조회
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.readReply(bno);
	}

	//댓글 작성
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.writeReply(vo);
	}

	//특정 댓글 조회
	@Override
	public ReplyVO readReplySelect(int rno) throws Exception {
		// TODO Auto-generated method stub
		return dao.readReplySelect(rno);
	}
	
	//댓글 수정
	@Override
	public void replyUpdate(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.replyUpdate(vo);
	}

	//댓글 삭제
	@Override
	public void replyDelete(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.replyDelete(vo);;
	}
	

	

}
