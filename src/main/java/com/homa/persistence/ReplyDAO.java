package com.homa.persistence;

import java.util.List;

import com.homa.domain.ReplyVO;

public interface ReplyDAO {
	//댓글 작성
	public void registReply(ReplyVO reply) throws Exception;
	
	//댓글 리스트
	public List<ReplyVO> replyList(int fb_num) throws Exception;
	
	//댓글 삭제
	public void deleteReply(ReplyVO replyVO) throws Exception;
	
	//아이디 체크
	public String idCheck(int c_num) throws Exception;
	
	//댓글 수정
	public void modifyReply(ReplyVO reply) throws Exception;
	
	//해당 게시물 조회
	public int getFb_num(int c_num) throws Exception;
}
