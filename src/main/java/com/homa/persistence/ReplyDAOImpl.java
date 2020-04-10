package com.homa.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.homa.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	//마이바티스
	@Inject
	private SqlSession sql;
	
	//매퍼
	private static String namespace = "com.homa.mappers.replyMapper";
	
	
	//댓글작성
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace+".registReply",reply);
	}

	//댓글리스트
	@Override
	public List<ReplyVO> replyList(int fb_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".replyList", fb_num);
	}
	
	//댓글 삭제
	@Override
	public void deleteReply(ReplyVO replyVO) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace+".deleteReply",replyVO);
	}

	//아이디 체크
	@Override
	public String idCheck(int c_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".replyUserIdCheck",c_num);
	}

	//댓글 수정
	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace+".modifyReply",reply);
	}

	//해당 게시물 조회
	@Override
	public int getFb_num(int c_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".getfb_num",c_num);
	}

	

}
