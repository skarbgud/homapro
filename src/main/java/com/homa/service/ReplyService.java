package com.homa.service;

import java.util.List;

import com.homa.domain.ReplyVO;

public interface ReplyService {
	//댓글작성
	public void  registReply(ReplyVO reply) throws Exception;
	
	//댓글리스트
	public List<ReplyVO> replyList(int fb_num) throws Exception;

	//댓글 삭제 
	public void deleteReply(ReplyVO replyVO) throws Exception;
	
	//아이디 체크
	public String idCheck(int c_num) throws Exception;
	
	//댓글 수정
	public void modifyReply(ReplyVO reply) throws Exception;
}
