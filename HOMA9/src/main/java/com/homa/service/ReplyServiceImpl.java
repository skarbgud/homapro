package com.homa.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.homa.domain.ReplyVO;
import com.homa.persistence.ReplyDAO;
@Repository
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;
	
	//댓글 조회
	@Override
	public List<ReplyVO> readReply(int fb_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.readReply(fb_num);
	}

	//댓글 작성
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.writeReply(vo);
	}

	//특정 댓글 조회
	public ReplyVO readReplySelect(int c_num) throws Exception{
		return dao.readReplySelect(c_num);
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
		dao.replyDelete(vo);
	}

	
}
