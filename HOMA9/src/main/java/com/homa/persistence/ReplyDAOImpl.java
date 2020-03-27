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
	
	//댓글 조회
	@Override
	public List<ReplyVO> readReply(int fb_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".readReply",fb_num);
	}

	//댓글 작성
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace+".writeReply",vo);
	}
	
	//특정 댓글 조회
	public ReplyVO readReplySelect(int c_num) throws Exception{
		return sql.selectOne(namespace+".readReplySelect",c_num);
	}

	//댓글 수정
	@Override
	public void replyUpdate(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace+".updateReply",vo);
	}
	
	//댓글 삭제
	@Override
	public void replyDelete(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace+".deleteReply",vo);
	}
	

}
